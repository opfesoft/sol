/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */
//Basic headers
#include "WaypointMovementGenerator.h"
//Extended headers
#include "ObjectMgr.h"
#include "World.h"
#include "Transport.h"
//Flightmaster grid preloading
#include "MapManager.h"
//Creature-specific headers
#include "Creature.h"
#include "CreatureAI.h"
#include "CreatureGroups.h"
//Player-specific
#include "Player.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "Spell.h"

void WaypointMovementGenerator<Creature>::LoadPath(Creature* creature)
{
    if (!path_id)
        path_id = creature->GetWaypointPath();

    i_path = sWaypointMgr->GetPath(path_id);

    if (!i_path)
    {
        // No movement found for entry
        sLog->outErrorDb("WaypointMovementGenerator::LoadPath: creature %s (Entry: %u GUID: %u) doesn't have waypoint path id: %u", creature->GetName().c_str(), creature->GetEntry(), creature->GetGUIDLow(), path_id);
        return;
    }

    StartMoveNow(creature);
}

void WaypointMovementGenerator<Creature>::DoInitialize(Creature* creature)
{
    LoadPath(creature);
    creature->AddUnitState(UNIT_STATE_ROAMING|UNIT_STATE_ROAMING_MOVE);
}

void WaypointMovementGenerator<Creature>::DoFinalize(Creature* creature)
{
    creature->ClearUnitState(UNIT_STATE_ROAMING|UNIT_STATE_ROAMING_MOVE);
    creature->SetWalk(false);
}

void WaypointMovementGenerator<Creature>::DoReset(Creature* creature)
{
    creature->AddUnitState(UNIT_STATE_ROAMING);
    if (!Stopped())
        creature->AddUnitState(UNIT_STATE_ROAMING_MOVE);
    StartMove(creature);
}

void WaypointMovementGenerator<Creature>::OnArrived(Creature* creature)
{
    if (!i_path || i_path->empty())
        return;
    if (m_isArrivalDone)
        return;

    m_isArrivalDone = true;

    if (i_path->at(i_currentNode)->event_id && urand(0, 99) < i_path->at(i_currentNode)->event_chance)
    {
#if defined(ENABLE_EXTRAS) && defined(ENABLE_EXTRA_LOGS)
        sLog->outDebug(LOG_FILTER_MAPSCRIPTS, "Creature movement start script %u at point %u for " UI64FMTD ".", i_path->at(i_currentNode)->event_id, i_currentNode, creature->GetGUID());
#endif
        creature->ClearUnitState(UNIT_STATE_ROAMING_MOVE);
        creature->GetMap()->ScriptsStart(sWaypointScripts, i_path->at(i_currentNode)->event_id, creature, NULL);
    }

    // Inform script
    MovementInform(creature);

    if (i_path->at(i_currentNode)->delay)
    {
        creature->ClearUnitState(UNIT_STATE_ROAMING_MOVE);
        Stop(i_path->at(i_currentNode)->delay);
    }
}

bool WaypointMovementGenerator<Creature>::StartMove(Creature* creature)
{
    if (!i_path || i_path->empty())
        return false;

    // Xinef: Dont allow dead creatures to move
    if (!creature->IsAlive())
        return false;

    if (Stopped())
        return true;

    if (creature->GetNextPathPoint())
    {
        i_currentNode = creature->GetNextPathPoint() % i_path->size();
        creature->SetNextPathPoint(0);
    }

    bool transportPath = creature->HasUnitMovementFlag(MOVEMENTFLAG_ONTRANSPORT) && creature->GetTransGUID();
    Movement::PointsArray intermediatePath;

    if (m_isArrivalDone)
    {
        // Xinef: not true... update this at every waypoint!
        //if ((i_currentNode == i_path->size() - 1) && !repeating) // If that's our last waypoint
        {
            float x = i_path->at(i_currentNode)->x;
            float y = i_path->at(i_currentNode)->y;
            float z = i_path->at(i_currentNode)->z;
            float o = creature->GetOrientation();

            if (!transportPath)
                creature->SetHomePosition(x, y, z, o);
            else
            {
                if (Transport* trans = (creature->GetTransport() ? creature->GetTransport()->ToMotionTransport() : NULL))
                {
                    o -= trans->GetOrientation();
                    creature->SetTransportHomePosition(x, y, z, o);
                    trans->CalculatePassengerPosition(x, y, z, &o);
                    creature->SetHomePosition(x, y, z, o);
                }
                else
                    transportPath = false;
                // else if (vehicle) - this should never happen, vehicle offsets are const
            }
        }

        // Xinef: moved the upper IF here
        if ((i_currentNode == i_path->size() - 1) && !repeating) // If that's our last waypoint
        {
            creature->GetMotionMaster()->Initialize();
            return false;
        }

        i_currentNode = (i_currentNode+1) % i_path->size();
    }

    // xinef: do not initialize motion if we got stunned in movementinform
    if (creature->HasUnitState(UNIT_STATE_NOT_MOVE))
        return true;

    WaypointData const* node = i_path->at(i_currentNode);
    Movement::Location formationDest(node->x, node->y, node->z, 0.0f);

    if (node->pathfinding == WAYPOINT_PATHFINDING_PATH)
    {
        if (transportPath)
            intermediatePath.emplace_back(creature->GetTransOffsetX(), creature->GetTransOffsetY(), creature->GetTransOffsetZ());
        else
            intermediatePath.emplace_back(creature->GetPositionX(), creature->GetPositionY(), creature->GetPositionZ());

        uint32 tmpCurrentNode = i_currentNode;

        while (node->pathfinding == WAYPOINT_PATHFINDING_PATH)
        {
            intermediatePath.emplace_back(node->x, node->y, node->z);

            if (intermediatePath.size() > 50)
            {
                sLog->outErrorDb("WaypointMovementGenerator::StartMove: creature %s (Entry: %u GUID: %u), path id %u, uses an intermediate path which which has more than 50 points", creature->GetName().c_str(), creature->GetEntry(), creature->GetGUIDLow(), path_id);
                creature->GetMotionMaster()->MoveIdle();
                return false;
            }

            tmpCurrentNode = (tmpCurrentNode + 1) % i_path->size();
            node = i_path->at(tmpCurrentNode);
        }

        intermediatePath.emplace_back(node->x, node->y, node->z);
    }

    m_isArrivalDone = false;

    creature->AddUnitState(UNIT_STATE_ROAMING_MOVE);

    Movement::MoveSplineInit init(creature);

    //! If creature is on transport, we assume waypoints set in DB are already transport offsets
    if (transportPath)
    {
        init.DisableTransportPathTransformations();
        if (TransportBase* trans = creature->GetDirectTransport())
            trans->CalculatePassengerPosition(formationDest.x, formationDest.y, formationDest.z, &formationDest.orientation);
    }

    if (!intermediatePath.empty())
        init.MovebyPath(intermediatePath);
    else
    {
        //! Do not use formationDest here, MoveTo requires transport offsets due to DisableTransportPathTransformations() call
        //! but formationDest contains global coordinates
        init.MoveTo(node->x, node->y, node->z, (node->pathfinding == WAYPOINT_PATHFINDING_NODE || node->pathfinding == WAYPOINT_PATHFINDING_ALL || node->pathfinding == WAYPOINT_PATHFINDING_PATH_ALL));
    }

    if (node->orientation >= 0.f && node->delay)
        init.SetFacing(node->orientation);

    switch (node->move_type)
    {
        case WAYPOINT_MOVE_TYPE_LAND:
            init.SetAnimation(Movement::ToGround);
            break;
        case WAYPOINT_MOVE_TYPE_TAKEOFF:
            init.SetAnimation(Movement::ToFly);
            break;
        case WAYPOINT_MOVE_TYPE_RUN:
            init.SetWalk(false);
            break;
        case WAYPOINT_MOVE_TYPE_WALK:
            init.SetWalk(true);
            break;
    }

    init.Launch();

    if (!intermediatePath.empty())
        splineId = creature->movespline->GetId();
    else
        splineId = 0;

    //Call for creature group update
    if (creature->GetFormation() && creature->GetFormation()->getLeader() == creature)
        creature->GetFormation()->LeaderMoveTo(formationDest.x, formationDest.y, formationDest.z, node->move_type == WAYPOINT_MOVE_TYPE_RUN,
            (node->pathfinding == WAYPOINT_PATHFINDING_FORMATION || node->pathfinding == WAYPOINT_PATHFINDING_ALL || node->pathfinding == WAYPOINT_PATHFINDING_PATH_ALL),
            node->pathfinding == WAYPOINT_PATHFINDING_PATH_ALL ? &intermediatePath : NULL);

    return true;
}

bool WaypointMovementGenerator<Creature>::DoUpdate(Creature* creature, uint32 diff)
{
    // Waypoint movement can be switched on/off
    // This is quite handy for escort quests and other stuff
    if (creature->HasUnitState(UNIT_STATE_NOT_MOVE))
    {
        creature->ClearUnitState(UNIT_STATE_ROAMING_MOVE);
        return true;
    }
    // prevent a crash at empty waypoint path.
    if (!i_path || i_path->empty())
        return false;

    // Xinef: Dont allow dead creatures to move
    if (!creature->IsAlive())
        return false;

    // prevent movement while casting spells with cast time or channel time
    if (creature->HasUnitState(UNIT_STATE_CASTING))
    {
        bool stop = true;
        if (Spell* spell = creature->GetCurrentSpell(CURRENT_CHANNELED_SPELL))
            if (!(spell->GetSpellInfo()->ChannelInterruptFlags & (AURA_INTERRUPT_FLAG_MOVE | AURA_INTERRUPT_FLAG_TURNING)) && !(spell->GetSpellInfo()->InterruptFlags & SPELL_INTERRUPT_FLAG_MOVEMENT))
                stop = false;

        if (stop)
        {
            if (!Stopped())
                Stop(1000);
            if (!creature->IsStopped())
                creature->StopMoving();
            return true;
        }
    }

    if (creature->GetLastPlayerInteraction() && getMSTimeDiff(creature->GetLastPlayerInteraction(), World::GetGameTimeMS()) < sWorld->getIntConfig(CONFIG_WAYPOINT_MOVEMENT_STOP_TIME_FOR_PLAYER) * IN_MILLISECONDS)
    {
        if (!Stopped())
        {
            Stop(1);
            if (!creature->IsStopped())
                creature->StopMoving();
        }
        return true;
    }
    else
        creature->SetLastPlayerInteraction(0);

    if (Stopped())
    {
        if (CanMove(diff))
            return StartMove(creature);
    }
    else
    {
        if (creature->IsStopped())
            Stop(1);
        else
        {
            // xinef: code to detect pre-empetively if we should start movement to next waypoint
            // xinef: do not start pre-empetive movement if current node has delay or we are ending waypoint movement
            bool finished = creature->movespline->Finalized();
            if (!finished && !i_path->at(i_currentNode)->delay && ((i_currentNode != i_path->size() - 1) || repeating))
                finished = (creature->movespline->timeElapsed()) < 200;

            if (finished)
            {
                OnArrived(creature);
                return StartMove(creature);
            }
        }
    }
     return true;
 }

void WaypointMovementGenerator<Creature>::MovementInform(Creature* creature)
{
    if (creature->AI())
        creature->AI()->MovementInform(WAYPOINT_MOTION_TYPE, i_currentNode + 1);
}

void WaypointMovementGenerator<Creature>::IntermediatePointReached()
{
    i_currentNode = (i_currentNode + 1) % i_path->size();
}

//----------------------------------------------------//

uint32 FlightPathMovementGenerator::GetPathAtMapEnd() const
{
    if (i_currentNode >= i_path.size())
        return i_path.size();

    uint32 curMapId = i_path[i_currentNode]->mapid;
    for (uint32 i = i_currentNode; i < i_path.size(); ++i)
        if (i_path[i]->mapid != curMapId)
            return i;

    return i_path.size();
}

#define SKIP_SPLINE_POINT_DISTANCE_SQ (40.0f * 40.0f)

bool IsNodeIncludedInShortenedPath(TaxiPathNodeEntry const* p1, TaxiPathNodeEntry const* p2)
{
    return p1->mapid != p2->mapid || std::pow(p1->x - p2->x, 2) + std::pow(p1->y - p2->y, 2) > SKIP_SPLINE_POINT_DISTANCE_SQ;
}

void FlightPathMovementGenerator::LoadPath(Player* player)
{
    _pointsForPathSwitch.clear();
    std::deque<uint32> const& taxi = player->m_taxi.GetPath();
    float discount = player->GetReputationPriceDiscount(player->m_taxi.GetFlightMasterFactionTemplate());
    for (uint32 src = 0, dst = 1; dst < taxi.size(); src = dst++)
    {
        uint32 path, cost;
        sObjectMgr->GetTaxiPath(taxi[src], taxi[dst], path, cost);
        if (path > sTaxiPathNodesByPath.size())
            return;

        TaxiPathNodeList const& nodes = sTaxiPathNodesByPath[path];
        if (!nodes.empty())
        {
            TaxiPathNodeEntry const* start = nodes[0];
            TaxiPathNodeEntry const* end = nodes[nodes.size() - 1];
            bool passedPreviousSegmentProximityCheck = false;
            for (uint32 i = 0; i < nodes.size(); ++i)
            {
                if (passedPreviousSegmentProximityCheck || !src || i_path.empty() || IsNodeIncludedInShortenedPath(i_path[i_path.size() - 1], nodes[i]))
                {
                    if ((!src || (IsNodeIncludedInShortenedPath(start, nodes[i]) && i >= 2)) &&
                        (dst == taxi.size() - 1 || (IsNodeIncludedInShortenedPath(end, nodes[i]) && i < nodes.size() - 1)))
                    {
                        passedPreviousSegmentProximityCheck = true;
                        i_path.push_back(nodes[i]);
                    }
                }
                else
                {
                    i_path.pop_back();
                    --_pointsForPathSwitch.back().PathIndex;
                }
            }
        }

        _pointsForPathSwitch.push_back({ uint32(i_path.size() - 1), int32(ceil(cost * discount)) });
    }
}

void FlightPathMovementGenerator::DoInitialize(Player* player)
{
    Reset(player);
    InitEndGridInfo();
}

void FlightPathMovementGenerator::DoFinalize(Player* player)
{
    // remove flag to prevent send object build movement packets for flight state and crash (movement generator already not at top of stack)
    player->ClearUnitState(UNIT_STATE_IN_FLIGHT);

    player->RemoveFlightSpell();
    player->m_taxi.ClearTaxiDestinations();
    player->Dismount();
    player->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_TAXI_FLIGHT);

    if (player->m_taxi.empty())
    {
        player->getHostileRefManager().setOnlineOfflineState(true);
        // update z position to ground and orientation for landing point
        // this prevent cheating with landing  point at lags
        // when client side flight end early in comparison server side
        player->StopMoving();

        // When the player reaches the last flight point, teleport to destination taxi node location
        player->SetFallInformation(time(NULL), i_path[GetCurrentNode()]->z);
        player->TeleportTo(i_path[GetCurrentNode()]->mapid, i_path[GetCurrentNode()]->x, i_path[GetCurrentNode()]->y, i_path[GetCurrentNode()]->z, player->GetOrientation());
    }

    player->RemoveFlag(PLAYER_FLAGS, PLAYER_FLAGS_TAXI_BENCHMARK);
}

#define PLAYER_FLIGHT_SPEED 32.0f

void FlightPathMovementGenerator::DoReset(Player* player)
{
    uint32 end = GetPathAtMapEnd();
    uint32 currentNodeId = GetCurrentNode();

    if (currentNodeId == end)
    {
        sLog->outDebug(LOG_FILTER_MAPSCRIPTS, "FlightPathMovementGenerator::DoReset: trying to start a flypath from the end point. %s", player->GetName().c_str());
        return;
    }

    player->getHostileRefManager().setOnlineOfflineState(false);
    player->AddUnitState(UNIT_STATE_IN_FLIGHT);
    player->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_TAXI_FLIGHT);

    Movement::MoveSplineInit init(player);

    // Providing a starting vertex since the taxi paths do not provide such
    init.Path().push_back(G3D::Vector3(player->GetPositionX(), player->GetPositionY(), player->GetPositionZ()));
    for (uint32 i = currentNodeId; i != end; ++i)
    {
        G3D::Vector3 vertice(i_path[i]->x, i_path[i]->y, i_path[i]->z);
        init.Path().push_back(vertice);
    }
    init.SetFirstPointId(GetCurrentNode());
    init.SetFly();
    init.SetVelocity(PLAYER_FLIGHT_SPEED);
    init.Launch();
}

bool FlightPathMovementGenerator::DoUpdate(Player* player, uint32 /*diff*/)
{
    if (!player)
        return false;

    // skipping the first spline path point because it's our starting point and not a taxi path point
    uint32 pointId = player->movespline->currentPathIdx() <= 0 ? 0 : player->movespline->currentPathIdx() - 1;
    if (pointId > i_currentNode && i_currentNode < i_path.size() - 1)
    {
        bool departureEvent = true;
        do
        {
            if (i_currentNode >= i_path.size())
            {
                sLog->outMisc("TAXI NODE WAS GREATER THAN PATH SIZE, GUID: %u, POINTID: %u, NODESIZE: %lu, CURRENT: %u", player->GetGUIDLow(), pointId, i_path.size(), i_currentNode);
                player->CleanupAfterTaxiFlight();
                return false;
            }

            if (i_path[i_currentNode]->mapid != player->GetMapId())
            {
                sLog->outMisc("Player on different map, curmap: %u, pointmap: %u, nodesize: %lu, currentnode: %u", player->GetMapId(), i_path[i_currentNode]->mapid, i_path.size(), i_currentNode);
                player->CleanupAfterTaxiFlight();
                return false;
            }

            DoEventIfAny(player, i_path[i_currentNode], departureEvent);

            while (!_pointsForPathSwitch.empty() && _pointsForPathSwitch.front().PathIndex <= i_currentNode)
            {
                _pointsForPathSwitch.pop_front();
                player->m_taxi.NextTaxiDestination();
                if (!_pointsForPathSwitch.empty())
                {
                    player->UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_GOLD_SPENT_FOR_TRAVELLING, _pointsForPathSwitch.front().Cost);
                    player->ModifyMoney(-_pointsForPathSwitch.front().Cost);
                }
            }

            if (pointId == i_currentNode)
                break;

            if (i_currentNode == _preloadTargetNode && player->GetMapId() == _endMapId)
                PreloadEndGrid();

            i_currentNode += departureEvent ? 1 : 0;
            departureEvent = !departureEvent;
        } while (i_currentNode < i_path.size() - 1);
    }

    return i_currentNode < (i_path.size() - 1);
}

void FlightPathMovementGenerator::SetCurrentNodeAfterTeleport()
{
    if (i_path.empty() || i_currentNode >= i_path.size())
        return;

    uint32 map0 = i_path[i_currentNode]->mapid;
    for (size_t i = i_currentNode + 1; i < i_path.size(); ++i)
    {
        if (i_path[i]->mapid != map0)
        {
            i_currentNode = i;
            return;
        }
    }
}

void FlightPathMovementGenerator::DoEventIfAny(Player* player, TaxiPathNodeEntry const* node, bool departure)
{
    if (uint32 eventid = departure ? node->departureEventID : node->arrivalEventID)
    {
#if defined(ENABLE_EXTRAS) && defined(ENABLE_EXTRA_LOGS)
        sLog->outDebug(LOG_FILTER_MAPSCRIPTS, "Taxi %s event %u of node %u of path %u for player %s", departure ? "departure" : "arrival", eventid, node->index, node->path, player->GetName().c_str());
#endif
        player->GetMap()->ScriptsStart(sEventScripts, eventid, player, player);
    }
}

void FlightPathMovementGenerator::InitEndGridInfo()
{
    /*! Storage to preload flightmaster grid at end of flight. For multi-stop flights, this will
       be reinitialized for each flightmaster at the end of each spline (or stop) in the flight. */
    uint32 nodeCount = i_path.size();        //! Number of nodes in path.
    _endMapId = i_path[nodeCount - 1]->mapid; //! MapId of last node

    // pussywizard:
    {
        _preloadTargetNode = nodeCount - 1;
        for (uint8 i = 3; i > 0; --i)
            if (nodeCount >= i && _endMapId == i_path[nodeCount - i]->mapid)
            {
                _preloadTargetNode = nodeCount - i;
                break;
            }
        //_preloadTargetNode = nodeCount - 3; // pussywizard: this can be on other map
    }

    _endGridX = i_path[nodeCount - 1]->x;
    _endGridY = i_path[nodeCount - 1]->y;
}

void FlightPathMovementGenerator::PreloadEndGrid()
{
    // used to preload the final grid where the flightmaster is
    Map* endMap = sMapMgr->FindBaseNonInstanceMap(_endMapId);

    // Load the grid
    if (endMap)
    {
#if defined(ENABLE_EXTRAS) && defined(ENABLE_EXTRA_LOGS)
        sLog->outDetail("Preloading grid (%f, %f) for map %u at node index %u/%u", _endGridX, _endGridY, _endMapId, _preloadTargetNode, (uint32)(i_path.size()-1));
#endif
        endMap->LoadGrid(_endGridX, _endGridY);
    }
    else {
#if defined(ENABLE_EXTRAS) && defined(ENABLE_EXTRA_LOGS)
        sLog->outDetail("Unable to determine map to preload flightmaster grid");
#endif
    }
}
