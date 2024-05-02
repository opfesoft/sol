/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU AGPLv3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE.md
 * Originally written by Xinef - Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license: http://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
*/

#include "Creature.h"
#include "MapManager.h"
#include "RandomMovementGenerator.h"
#include "ObjectAccessor.h"
#include "Map.h"
#include "Util.h"
#include "CreatureGroups.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "Spell.h"
#include "CreatureAI.h"

template<>
void RandomMovementGenerator<Creature>::_setRandomLocation(Creature* creature)
{
    if (creature->_moveState != MAP_OBJECT_CELL_MOVE_NONE)
        return;

    if (_validPointsVector[_currentPoint].empty())
    {
        if (_currentPoint == RANDOM_POINTS_NUMBER) // cant go anywhere from initial position, lets stay
            return;
        // go back to initial position and will never return to this point
        _currentPoint = RANDOM_POINTS_NUMBER;
        _currDestPosition.Relocate(_initialPosition);
        creature->AddUnitState(UNIT_STATE_ROAMING_MOVE);
        if (_minMoveTime && _minMoveTime <= _maxMoveTime)
            _nextMoveTime.Reset(urand(_minMoveTime, _maxMoveTime));
        else
        {
            ++_moveCount;
            if (roll_chance_i((int32)_moveCount * 25 + 10))
            {
                _moveCount = 0;
                _nextMoveTime.Reset(urand(4000, 8000));
            }
        }

        Movement::MoveSplineInit init(creature);
        init.MoveTo(_currDestPosition.GetPositionX(), _currDestPosition.GetPositionY(), _currDestPosition.GetPositionZ(), true);
        bool walk = true;
        if (CreatureAI* ai = creature->AI())
            walk = !ai->IsOverrideRandomRun();
        init.SetWalk(walk);
        init.Launch();
        if (creature->GetFormation() && creature->GetFormation()->getLeader() == creature)
            creature->GetFormation()->LeaderMoveTo(_currDestPosition.GetPositionX(), _currDestPosition.GetPositionY(), _currDestPosition.GetPositionZ(), !walk, true);
        return;
    }

    uint8 random = urand(0, _validPointsVector[_currentPoint].size()-1);
    std::vector<uint8>::iterator randomIter = _validPointsVector[_currentPoint].begin() + random;
    uint8 newPoint = *randomIter;
    uint16 pathIdx = uint16(_currentPoint*RANDOM_POINTS_NUMBER + newPoint);

    if (_validPointsVector[newPoint].empty() && _currentPoint != RANDOM_POINTS_NUMBER)
    {
        // can't go anywhere from new point, so don't go there to not be stuck
        _validPointsVector[_currentPoint].erase(randomIter);
        return;
    }

    Movement::PointsArray& finalPath = _preComputedPaths[pathIdx];
    if (finalPath.empty())
    {
        bool erase = true;

        for (float i = 4.f; i > 0.f; i -= 1.f)
        {
            Map* map = creature->GetMap();
            float x = _destinationPoints[newPoint].x, y = _destinationPoints[newPoint].y, z = _destinationPoints[newPoint].z;
            // invalid coordinates
            if (!acore::IsValidMapCoord(x, y))
            {
                _validPointsVector[_currentPoint].erase(randomIter);
                _preComputedPaths.erase(pathIdx);
                return;
            }

            float ground = INVALID_HEIGHT;
            float levelZ = map->GetWaterOrGroundLevel(creature->GetPhaseMask(), x, y, z+i, &ground);
            float currentGround = INVALID_HEIGHT;
            float currentLevelZ = map->GetWaterOrGroundLevel(creature->GetPhaseMask(), creature->GetPositionX(), creature->GetPositionY(), creature->GetPositionZ()+i, &currentGround);
            float newZ = INVALID_HEIGHT;

            // flying creature
            if (creature->CanFly())
                newZ = std::max<float>(levelZ, z + rand_norm()*_wanderDistance/2.0f);
            // point underwater
            else if (ground < levelZ)
            {
                if (!creature->CanSwim())
                {
                    if (ground < levelZ - 1.5f)
                    {
                        _validPointsVector[_currentPoint].erase(randomIter);
                        _preComputedPaths.erase(pathIdx);
                        return;
                    }
                    levelZ = ground;
                }
                else if (creature->isSwimming())
                {
                    if (levelZ > INVALID_HEIGHT)
                        newZ = std::min<float>(levelZ-2.0f, z + rand_norm()*_wanderDistance/2.0f);
                    newZ = std::max<float>(ground, newZ);
                }
                else
                    levelZ = ground;
            }
            // point on ground
            else
            {
                // prevent direct transition from deep water to land
                if (currentGround < currentLevelZ - 1.5f)
                {
                    _validPointsVector[_currentPoint].erase(randomIter);
                    _preComputedPaths.erase(pathIdx);
                    return;
                }
                if (levelZ <= INVALID_HEIGHT || !creature->CanWalk())
                {
                    _validPointsVector[_currentPoint].erase(randomIter);
                    _preComputedPaths.erase(pathIdx);
                    return;
                }
            }

            if (newZ > INVALID_HEIGHT)
            {
                // flying / swiming creature - dest not in los
                if (!creature->IsWithinLOS(x, y, newZ))
                    continue;

                finalPath.push_back(G3D::Vector3(creature->GetPositionX(), creature->GetPositionY(), creature->GetPositionZ()));
                finalPath.push_back(G3D::Vector3(x, y, newZ));
            }
            else // ground
            {
                if (!map->isInLineOfSight(creature->GetPositionX(), creature->GetPositionY(), creature->GetPositionZ()+0.3f, x, y, levelZ+0.1f, creature->GetPhaseMask(), LINEOFSIGHT_ALL_CHECKS))
                    continue;
                else
                {
                    float x1, y1, z1, x2, y2, z2;
                    Position::GetNearPoint2D(creature->GetPositionX(), creature->GetPositionY(), x1, y1, 1.f, creature->GetAngle(x, y) + M_PI / 2.f);
                    Position::GetNearPoint2D(creature->GetPositionX(), creature->GetPositionY(), x2, y2, 1.5f, creature->GetAngle(x, y) + M_PI / 4.f);
                    x2 = x - creature->GetPositionX() + x2;
                    y2 = y - creature->GetPositionY() + y2;
                    map->GetWaterOrGroundLevel(creature->GetPhaseMask(), x1, y1, creature->GetPositionZ() + i, &z1);
                    map->GetWaterOrGroundLevel(creature->GetPhaseMask(), x2, y2, levelZ + i, &z2);

                    if (z1 <= INVALID_HEIGHT || z2 <= INVALID_HEIGHT || !map->isInLineOfSight(x1, y1, z1 + 0.3f, x2, y2, z2 + 0.1f, creature->GetPhaseMask(), LINEOFSIGHT_ALL_CHECKS))
                        continue;
                    else
                    {
                        Position::GetNearPoint2D(creature->GetPositionX(), creature->GetPositionY(), x1, y1, 1.f, creature->GetAngle(x, y) - M_PI / 2.f);
                        Position::GetNearPoint2D(creature->GetPositionX(), creature->GetPositionY(), x2, y2, 1.5f, creature->GetAngle(x, y) - M_PI / 4.f);
                        x2 = x - creature->GetPositionX() + x2;
                        y2 = y - creature->GetPositionY() + y2;
                        map->GetWaterOrGroundLevel(creature->GetPhaseMask(), x1, y1, creature->GetPositionZ() + i, &z1);
                        map->GetWaterOrGroundLevel(creature->GetPhaseMask(), x2, y2, levelZ + i, &z2);

                        if (z1 <= INVALID_HEIGHT || z2 <= INVALID_HEIGHT || !map->isInLineOfSight(x1, y1, z1 + 0.3f, x2, y2, z2 + 0.1f, creature->GetPhaseMask(), LINEOFSIGHT_ALL_CHECKS))
                            continue;
                        else
                        {
                            Position::GetNearPoint2D(creature->GetPositionX(), creature->GetPositionY(), x2, y2, 1.5f, creature->GetAngle(x, y));
                            x2 = x - creature->GetPositionX() + x2;
                            y2 = y - creature->GetPositionY() + y2;
                            map->GetWaterOrGroundLevel(creature->GetPhaseMask(), x2, y2, levelZ + i, &z2);

                            if (z2 <= INVALID_HEIGHT || !map->isInLineOfSight(creature->GetPositionX(), creature->GetPositionY(), creature->GetPositionZ() + 0.3f, x2, y2, z2 + 0.1f, creature->GetPhaseMask(), LINEOFSIGHT_ALL_CHECKS))
                                continue;
                        }
                    }
                }

                bool result = _pathGenerator->CalculatePath(x, y, levelZ, false);
                if (result && !(_pathGenerator->GetPathType() & PATHFIND_NOPATH))
                {
                    // generated path is too long
                    float pathLen = _pathGenerator->getPathLength();
                    if (pathLen*pathLen > creature->GetExactDistSq(x, y, levelZ) * MAX_PATH_LENGHT_FACTOR*MAX_PATH_LENGHT_FACTOR)
                        continue;

                    finalPath = _pathGenerator->GetPath();
                    Movement::PointsArray::iterator itr = finalPath.begin();
                    Movement::PointsArray::iterator itrNext = finalPath.begin()+1;
                    float zDiff, zDiffPre, distDiff, distX, distY, zCurrent, zNext, zNextPre, zNextPost, xNextPost, yNextPost;

                    for (; itrNext != finalPath.end(); ++itr, ++itrNext)
                    {
                        zCurrent = zNext = zNextPre = zNextPost = INVALID_HEIGHT;
                        distX = (*itrNext).x - (*itr).x;
                        distY = (*itrNext).y - (*itr).y;
                        if (distX == 0.f && distY == 0.f)
                            goto nextLoop;

                        map->GetWaterOrGroundLevel(creature->GetPhaseMask(), (*itr).x, (*itr).y, (*itr).z + i, &zCurrent);
                        map->GetWaterOrGroundLevel(creature->GetPhaseMask(), (*itrNext).x, (*itrNext).y, (*itrNext).z + i, &zNext);
                        distDiff = sqrt(distX * distX + distY * distY);
                        xNextPost = (*itrNext).x - distX / -distDiff;
                        yNextPost = (*itrNext).y - distY / -distDiff;
                        map->GetWaterOrGroundLevel(creature->GetPhaseMask(), xNextPost, yNextPost, (*itrNext).z + i, &zNextPost);
                        if (distDiff > 1.0f)
                        {
                            map->GetWaterOrGroundLevel(creature->GetPhaseMask(), (*itrNext).x - distX / distDiff, (*itrNext).y - distY / distDiff, (*itrNext).z + i, &zNextPre);
                            zDiffPre = fabs(zNext - zNextPre);
                        }
                        else
                            zDiffPre = 0.f;

                        zDiff = fabs(zCurrent - zNext);

                        // Xinef: tree climbing, cut as much as we can
                        if (zDiff > 2.0f || zDiffPre > 0.5f ||
                            (G3D::fuzzyNe(zDiff, 0.0f) && distDiff / zDiff < 2.15f)) // ~25˚
                            goto nextLoop;

                        if (zCurrent <= INVALID_HEIGHT || zNextPost <= INVALID_HEIGHT || !map->isInLineOfSight((*itr).x, (*itr).y, zCurrent + 0.3f, xNextPost, yNextPost, zNextPost + 0.1f, creature->GetPhaseMask(), LINEOFSIGHT_ALL_CHECKS))
                            goto nextLoop;
                        else
                        {
                            float x1, y1, z1, x2, y2, z2;
                            Position p = { (*itr).x, (*itr).y, 0.f, 0.f };
                            Position::GetNearPoint2D(p.GetPositionX(), p.GetPositionY(), x1, y1, 1.f, p.GetAngle(xNextPost, yNextPost) + M_PI / 2.f);
                            Position::GetNearPoint2D(p.GetPositionX(), p.GetPositionY(), x2, y2, 1.5f, p.GetAngle(xNextPost, yNextPost) + M_PI / 4.f);
                            x2 = xNextPost - p.GetPositionX() + x2;
                            y2 = yNextPost - p.GetPositionY() + y2;
                            map->GetWaterOrGroundLevel(creature->GetPhaseMask(), x1, y1, zCurrent + i, &z1);
                            map->GetWaterOrGroundLevel(creature->GetPhaseMask(), x2, y2, zNextPost + i, &z2);

                            if (z1 <= INVALID_HEIGHT || z2 <= INVALID_HEIGHT || !map->isInLineOfSight(x1, y1, z1 + 0.3f, x2, y2, z2 + 0.1f, creature->GetPhaseMask(), LINEOFSIGHT_ALL_CHECKS))
                                goto nextLoop;
                            else
                            {
                                Position::GetNearPoint2D(p.GetPositionX(), p.GetPositionY(), x1, y1, 1.f, p.GetAngle(xNextPost, yNextPost) - M_PI / 2.f);
                                Position::GetNearPoint2D(p.GetPositionX(), p.GetPositionY(), x2, y2, 1.5f, p.GetAngle(xNextPost, yNextPost) - M_PI / 4.f);
                                x2 = xNextPost - p.GetPositionX() + x2;
                                y2 = yNextPost - p.GetPositionY() + y2;
                                map->GetWaterOrGroundLevel(creature->GetPhaseMask(), x1, y1, zCurrent + i, &z1);
                                map->GetWaterOrGroundLevel(creature->GetPhaseMask(), x2, y2, zNextPost + i, &z2);

                                if (z1 <= INVALID_HEIGHT || z2 <= INVALID_HEIGHT || !map->isInLineOfSight(x1, y1, z1 + 0.3f, x2, y2, z2 + 0.1f, creature->GetPhaseMask(), LINEOFSIGHT_ALL_CHECKS))
                                    goto nextLoop;
                                else
                                {
                                    Position::GetNearPoint2D(p.GetPositionX(), p.GetPositionY(), x2, y2, 1.5f, p.GetAngle(xNextPost, yNextPost));
                                    x2 = x - creature->GetPositionX() + x2;
                                    y2 = y - creature->GetPositionY() + y2;
                                    map->GetWaterOrGroundLevel(creature->GetPhaseMask(), x2, y2, zNextPost + i, &z2);

                                    if (z2 <= INVALID_HEIGHT || !map->isInLineOfSight(p.GetPositionX(), p.GetPositionY(), zCurrent + 0.3f, x2, y2, z2 + 0.1f, creature->GetPhaseMask(), LINEOFSIGHT_ALL_CHECKS))
                                        goto nextLoop;
                                }
                            }
                        }
                    }

                    // no valid path
                    if (finalPath.size() < 2)
                        continue;
                }
                else
                    continue;
            }

            erase = false;
            break;

            nextLoop: ;
        }

        if (erase)
        {
            _validPointsVector[_currentPoint].erase(randomIter);
            _preComputedPaths.erase(pathIdx);
            return;
        }
    }

    _currentPoint = newPoint;
    G3D::Vector3& finalPoint = finalPath[finalPath.size()-1];
    _currDestPosition.Relocate(finalPoint.x, finalPoint.y, finalPoint.z);

    creature->AddUnitState(UNIT_STATE_ROAMING_MOVE);
    if (_minMoveTime && _minMoveTime <= _maxMoveTime)
        _nextMoveTime.Reset(urand(_minMoveTime, _maxMoveTime));
    else
    {
        ++_moveCount;
        if (roll_chance_i((int32)_moveCount * 25 + 10))
        {
            _moveCount = 0;
            _nextMoveTime.Reset(urand(4000, 8000));
        }
    }

    Movement::MoveSplineInit init(creature);
    init.MovebyPath(finalPath);
    bool walk = true;
    if (CreatureAI* ai = creature->AI())
        walk = !ai->IsOverrideRandomRun();
    init.SetWalk(walk);
    init.Launch();

    if (sWorld->getBoolConfig(CONFIG_DONT_CACHE_RANDOM_MOVEMENT_PATHS))
        _preComputedPaths.erase(pathIdx);

    //Call for creature group update
    if (creature->GetFormation() && creature->GetFormation()->getLeader() == creature)
        creature->GetFormation()->LeaderMoveTo(finalPoint.x, finalPoint.y, finalPoint.z, !walk, true);
}

template<>
void RandomMovementGenerator<Creature>::DoInitialize(Creature* creature)
{
    if (!creature->IsAlive())
        return;

    if (!_wanderDistance)
        _wanderDistance = creature->GetWanderDistance();

    if (!_wanderDistance)
        sLog->outError("Creature (Entry: %u GUID: %u) initialized random movement with wander distance 0", creature->GetEntry(), creature->GetGUIDLow());

    _nextMoveTime.Reset(creature->GetDBTableGUIDLow() && creature->GetWanderDistance() == _wanderDistance ? urand(1, 5000) : 0);

    if (G3D::fuzzyEq(_initialPosition.GetExactDist2d(0.0f, 0.0f), 0.0f))
    {
        _initialPosition.Relocate(creature);
        _destinationPoints.clear();
        float sectorSize = M_PI * 2.0f / RANDOM_POINTS_NUMBER;
        for (uint8 i = 0; i < RANDOM_POINTS_NUMBER; ++i)
        {
            float angle = sectorSize * i + frand(0.0f, sectorSize);
            float factor = 0.5f + rand_norm()*0.5f;
            _destinationPoints.push_back(G3D::Vector3(_initialPosition.GetPositionX() + _wanderDistance*cos(angle)*factor, _initialPosition.GetPositionY() + _wanderDistance*sin(angle)*factor, _initialPosition.GetPositionZ()));
        }
    }

    if (!_pathGenerator)
        _pathGenerator = new PathGenerator(creature);
    creature->AddUnitState(UNIT_STATE_ROAMING | UNIT_STATE_ROAMING_MOVE);
}

template<>
void RandomMovementGenerator<Creature>::DoReset(Creature* creature)
{
    DoInitialize(creature);
}

template<>
void RandomMovementGenerator<Creature>::DoFinalize(Creature* creature)
{
    creature->ClearUnitState(UNIT_STATE_ROAMING|UNIT_STATE_ROAMING_MOVE);
    creature->SetWalk(false);
}

template<>
bool RandomMovementGenerator<Creature>::DoUpdate(Creature* creature, const uint32 diff)
{
    if (creature->HasUnitState(UNIT_STATE_ROOT | UNIT_STATE_STUNNED | UNIT_STATE_DISTRACTED))
    {
        _nextMoveTime.Reset(0);  // Expire the timer
        creature->ClearUnitState(UNIT_STATE_ROAMING_MOVE);
        return true;
    }

    // xinef: if we got disable move flag, do not remove default generator - just prevent movement
    if (creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE))
    {
        _nextMoveTime.Reset(0);  // Expire the timer
        creature->ClearUnitState(UNIT_STATE_ROAMING_MOVE);
        return true;
    }

    // prevent movement while casting spells with cast time or channel time
    if (creature->HasUnitState(UNIT_STATE_CASTING))
    {
        bool stop = true;
        if (Spell* spell = creature->GetCurrentSpell(CURRENT_CHANNELED_SPELL))
            if (!(spell->GetSpellInfo()->ChannelInterruptFlags & (AURA_INTERRUPT_FLAG_MOVE | AURA_INTERRUPT_FLAG_TURNING)) && !(spell->GetSpellInfo()->InterruptFlags & SPELL_INTERRUPT_FLAG_MOVEMENT))
                stop = false;

        if (stop)
        {
            _nextMoveTime.Reset(1000);
            if (!creature->IsStopped())
                creature->StopMoving();

            return true;
        }
    }

    if (creature->GetLastPlayerInteraction() && getMSTimeDiff(creature->GetLastPlayerInteraction(), World::GetGameTimeMS()) < sWorld->getIntConfig(CONFIG_WAYPOINT_MOVEMENT_STOP_TIME_FOR_PLAYER) * IN_MILLISECONDS)
    {
        if (!creature->IsStopped())
            creature->StopMoving();
        return true;
    }
    else
        creature->SetLastPlayerInteraction(0);

    if (creature->movespline->Finalized())
    {
        _nextMoveTime.Update(diff);
        if (_nextMoveTime.Passed())
            _setRandomLocation(creature);
    }
    return true;
}

template<>
bool RandomMovementGenerator<Creature>::GetResetPosition(float& x, float& y, float& z)
{
    if (_currentPoint < RANDOM_POINTS_NUMBER)
        _currDestPosition.GetPosition(x, y, z);
    else if (G3D::fuzzyNe(_initialPosition.GetExactDist2d(0.0f, 0.0f), 0.0f)) // if initial position is not 0.0f, 0.0f
        _initialPosition.GetPosition(x, y, z);
    else
        return false;
    return true;
}
