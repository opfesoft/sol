/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "ByteBuffer.h"
#include "TargetedMovementGenerator.h"
#include "Errors.h"
#include "Creature.h"
#include "CreatureAI.h"
#include "World.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "Player.h"
#include "Spell.h"
#include "BattlegroundRV.h"
#include "VehicleDefines.h"
#include "Transport.h"
#include "MapManager.h"

#include <cmath>

template<class T, typename D>
void TargetedMovementGeneratorMedium<T,D>::_setTargetLocation(T* owner, bool initial)
{
    if (!i_target.isValid() || !i_target->IsInWorld() || !owner->IsInMap(i_target.getTarget())) 
        return;

    if (owner->HasUnitState(UNIT_STATE_NOT_MOVE))
    {
        D::_clearUnitStateMove(owner);
        return;
    }

    if (owner->HasUnitState(UNIT_STATE_CASTING) && !owner->CanMoveDuringChannel())
        return;

    float x, y, z;
    bool isPlayerPet = owner->IsPet() && IS_PLAYER_GUID(owner->GetOwnerGUID());
    bool sameTransport = owner->GetTransport() && owner->GetTransport() ==  i_target->GetTransport();
    if (owner->GetMapId() == 631 && owner->GetTransport() && owner->GetTransport()->IsMotionTransport() && i_target->GetTransport() && i_target->GetTransport()->IsMotionTransport()) // for ICC, if both on a motion transport => don't use mmaps
        sameTransport = owner->GetTypeId() == TYPEID_UNIT && i_target->isInAccessiblePlaceFor(owner->ToCreature());
    bool useMMaps = MMAP::MMapFactory::IsPathfindingEnabled(owner->FindMap()) && !sameTransport;
    bool forceDest = (owner->FindMap() && owner->FindMap()->IsDungeon() && !isPlayerPet) || // force in instances to prevent exploiting
                     (owner->GetTypeId() == TYPEID_UNIT && ((owner->IsPet() && owner->HasUnitState(UNIT_STATE_FOLLOW)) || // allow pets following their master to cheat while generating paths
                     ((Creature*)owner)->isWorldBoss() || ((Creature*)owner)->IsDungeonBoss())) || // force for all bosses, even not in instances
                     (owner->GetMapId() == 572 && (owner->GetPositionX() < 1275.0f || i_target->GetPositionX() < 1275.0f)) || // pussywizard: Ruins of Lordaeron - special case (acid)
                     sameTransport || // nothing to comment, can't find path on transports so allow it
                     (i_target->GetTypeId() == TYPEID_PLAYER && i_target->ToPlayer()->IsGameMaster()); // for .npc follow
    bool forcePoint = ((!isPlayerPet || owner->GetMapId() == 618) && (forceDest || !useMMaps)) || sameTransport;

    if (owner->GetTypeId() == TYPEID_UNIT && !i_target->isInAccessiblePlaceFor(owner->ToCreature()) && !sameTransport && !forceDest && !forcePoint)
        return;

    lastTargetXYZ.Relocate(i_target->GetPositionX(), i_target->GetPositionY(), i_target->GetPositionZ());

    if (!i_offset)
    {
        if (i_target->IsWithinDistInMap(owner, CONTACT_DISTANCE))
            return;

        float allowedRange = MELEE_RANGE;
        if ((!initial || (owner->movespline->Finalized() && this->GetMovementGeneratorType() == CHASE_MOTION_TYPE)) && i_target->IsWithinMeleeRange(owner, allowedRange) && i_target->IsWithinLOS(owner->GetPositionX(), owner->GetPositionY(), owner->GetPositionZ()))
            return;

        bool inRange = i_target->GetRandomContactPoint(owner, x, y, z, forcePoint);
        if (useMMaps && !inRange && (!isPlayerPet || i_target->GetPositionZ()-z > 50.0f))
        {
            //useMMaps = false;
            owner->m_targetsNotAcceptable[i_target->GetGUID()] = MMapTargetData(sWorld->GetGameTime()+DISALLOW_TIME_AFTER_FAIL, owner, i_target.getTarget());
            return;
        }

        // to nearest contact position
        i_target->GetContactPoint(owner, x, y, z);
    }
    else
    {
        float dist;
        float size;

        // Pets need special handling.
        // We need to subtract GetObjectSize() because it gets added back further down the chain
        //  and that makes pets too far away. Subtracting it allows pets to properly
        //  be (GetCombatReach() + i_offset) away.
        // Only applies when i_target is pet's owner otherwise pets and mobs end up
        //   doing a "dance" while fighting
        if (owner->IsPet() && i_target->GetTypeId() == TYPEID_PLAYER)
        {
            dist = i_target->GetCombatReach();
            size = i_target->GetCombatReach() - i_target->GetObjectSize();
        }
        else
        {
            dist = i_offset;
            size = owner->GetObjectSize();
        }

        if ((!initial || (owner->movespline->Finalized() && this->GetMovementGeneratorType() == CHASE_MOTION_TYPE)) && i_target->IsWithinDistInMap(owner, dist) && i_target->IsWithinLOS(owner->GetPositionX(), owner->GetPositionY(), owner->GetPositionZ()))
            return;

        float angle = i_angle;

        if (i_target->GetTypeId() == TYPEID_PLAYER && this->GetMovementGeneratorType() == FOLLOW_MOTION_TYPE)
        {
            Creature* creature = owner->ToCreature();

            if (creature && creature->GetCreatureType() == CREATURE_TYPE_NON_COMBAT_PET)
            {
                // fix distance and angle for vanity pets
                dist = 0.3f;
                angle = PET_FOLLOW_ANGLE + M_PI * 0.2f;
                size = i_target->GetCombatReach() - i_target->GetObjectSize();
            }

            owner->UpdateSpeed(MOVE_FLIGHT, true);
            owner->UpdateSpeed(MOVE_SWIM, true);
            owner->UpdateSpeed(MOVE_RUN, true);
        }

        // Xinef: Fix follow angle for hostile units
        if (angle == 0.0f && owner->GetVictim() && owner->GetVictim()->GetGUID() == i_target->GetGUID())
            angle = MapManager::NormalizeOrientation(i_target->GetAngle(owner)-i_target->GetOrientation());
        // to at i_offset distance from target and i_angle from target facing
        bool inRange = i_target->GetClosePoint(x, y, z, size, dist, angle, owner, forcePoint);
        if (!inRange && (forceDest || !useMMaps) && owner->HasUnitState(UNIT_STATE_FOLLOW) && fabs(i_target->GetPositionZ() - z) > 25.0f)
        {
            x = i_target->GetPositionX();
            y = i_target->GetPositionY();
            z = i_target->GetPositionZ();
        }
        else if (forceDest && owner->HasUnitState(UNIT_STATE_CHASE))
        {
            // chasing units with forced destination should still check if there exists a valid path to reach the destination, otherwise ignore the offset
            PathGenerator pathFinder(owner);
            bool result = pathFinder.CalculatePath(x, y, z, false);
            if (!result || (pathFinder.GetPathType() & (PATHFIND_NOPATH | PATHFIND_INCOMPLETE)))
            {
                x = i_target->GetPositionX();
                y = i_target->GetPositionY();
                z = i_target->GetPositionZ();
            }
        }
    }

    D::_addUnitStateMove(owner);
    i_targetReached = false;
    i_recalculateTravel = false;

    Movement::MoveSplineInit init(owner);

    if (useMMaps) // pussywizard
    {
        if (!i_path)
            i_path = new PathGenerator(owner);

        if (!forceDest)
        {
            if (owner->GetMapId() == 618) // pussywizard: 618 Ring of Valor
            {
                if (Map* map = owner->FindMap())
                    if (Battleground* bg = ((BattlegroundMap*)map)->GetBG())
                    {
                        Position dest = {x, y, z, 0.0f};
                        if (GameObject* pillar = ((BattlegroundRV*)bg)->GetPillarAtPosition(&dest))
                        {
                            if ((pillar->GetGoState() == GO_STATE_READY && pillar->ToTransport()->GetPathProgress() == 0) || owner->GetPositionZ() > 31.0f || owner->GetTransGUID() == pillar->GetGUID())
                            {
                                if (pillar->GetGoState() == GO_STATE_READY && pillar->ToTransport()->GetPathProgress() == 0)
                                    z = std::max(z, 28.28f);
                                else
                                    z = i_target->GetPositionZ();

                                init.MoveTo(x,y,z);
                                if (i_angle == 0.f)
                                    init.SetFacing(i_target.getTarget());
                                init.SetWalk(((D*)this)->EnableWalking());
                                init.Launch();
                                i_nextPos.Relocate(x, y, z);
                                return;
                            }
                            if (pillar->GetGoState() == GO_STATE_ACTIVE || (pillar->GetGoState() == GO_STATE_READY && pillar->ToTransport()->GetPathProgress() > 0))
                            {
                                Position pos;
                                owner->GetFirstCollisionPositionForTotem(pos, owner->GetExactDist2d(i_target.getTarget()), owner->GetAngle(i_target.getTarget())-owner->GetOrientation(), false);
                                x = pos.GetPositionX();
                                y = pos.GetPositionY();
                                z = 28.28f;
                            }
                        }
                    }
            }
        }

        if (!forceDest && getMSTimeDiff(lastPathingFailMSTime, World::GetGameTimeMS()) < 1000)
        {
            i_forceRecheckDistance = true;
            return;
        }

        bool result = i_path->CalculatePath(x, y, z, forceDest);
        if (result)
        {
            float maxDist = MELEE_RANGE + owner->GetMeleeReach() + i_target->GetMeleeReach();
            if (!forceDest && (i_path->GetPathType() & PATHFIND_NOPATH || (!i_offset && !isPlayerPet && i_target->GetExactDistSq(i_path->GetActualEndPosition().x, i_path->GetActualEndPosition().y, i_path->GetActualEndPosition().z) > maxDist*maxDist)))
            {
                lastPathingFailMSTime = World::GetGameTimeMS();
                owner->m_targetsNotAcceptable[i_target->GetGUID()] = MMapTargetData(sWorld->GetGameTime()+DISALLOW_TIME_AFTER_FAIL, owner, i_target.getTarget());
                return;
            }
            else
            {
                owner->m_targetsNotAcceptable.erase(i_target->GetGUID());
                owner->AddUnitState(UNIT_STATE_CHASE);

                init.MovebyPath(i_path->GetPath());
                if (i_angle == 0.f)
                    init.SetFacing(i_target.getTarget());
                init.SetWalk(((D*)this)->EnableWalking());
                init.Launch();
                i_nextPos.Relocate(x, y, z);
                return;
            }
        }

        // if failed to generate, just use normal MoveTo
    }

    owner->AddUnitState(UNIT_STATE_CHASE);

    init.MoveTo(x,y,z);
    // Using the same condition for facing target as the one that is used for SetInFront on movement end
    // - applies to ChaseMovementGenerator mostly
    if (i_angle == 0.f)
        init.SetFacing(i_target.getTarget());

    init.SetWalk(((D*)this)->EnableWalking());
    init.Launch();
    i_nextPos.Relocate(x, y, z);
}

template<class T, typename D>
bool TargetedMovementGeneratorMedium<T,D>::DoUpdate(T* owner, uint32 time_diff)
{
    if (!i_target.isValid() || !i_target->IsInWorld())
        return false;

    if (!owner || !owner->IsAlive())
        return false;

    if (owner->HasUnitState(UNIT_STATE_NOT_MOVE))
    {
        D::_clearUnitStateMove(owner);
        return true;
    }

    // prevent movement while casting spells with cast time or channel time
    if (owner->HasUnitState(UNIT_STATE_CASTING) && !owner->CanMoveDuringChannel())
    {
        bool stop = true;
        if (Spell* spell = owner->GetCurrentSpell(CURRENT_CHANNELED_SPELL))
            if (!(spell->GetSpellInfo()->ChannelInterruptFlags & (AURA_INTERRUPT_FLAG_MOVE | AURA_INTERRUPT_FLAG_TURNING)) && !(spell->GetSpellInfo()->InterruptFlags & SPELL_INTERRUPT_FLAG_MOVEMENT))
                stop = false;

        if (stop)
        {
            // Xinef: delay distance recheck in case of succeeding casts
            i_recheckDistance.Reset(300);
            if (!owner->IsStopped())
                owner->StopMoving();

            return true;
        }
    }

    // prevent crash after creature killed pet
    if (static_cast<D*>(this)->_lostTarget(owner))
    {
        D::_clearUnitStateMove(owner);
        return true;
    }

    i_recheckDistanceForced.Update(time_diff);
    if (i_recheckDistanceForced.Passed())
    {
        i_recheckDistanceForced.Reset(2500);
        i_forceRecheckDistance = true;
    }

    i_recheckDistance.Update(time_diff);
    if (i_recheckDistance.Passed())
    {
        i_recheckDistance.Reset(50);
        //More distance let have better performance, less distance let have more sensitive reaction at target move.
        float allowed_dist_sq = i_target->GetObjectSize() + owner->GetObjectSize() + MELEE_RANGE - 0.5f;

        // xinef: if offset is negative (follow distance is smaller than just object sizes), reduce minimum allowed distance which is based purely on object sizes
        if (i_offset < 0.0f)
        {
            allowed_dist_sq += i_offset;
            allowed_dist_sq = std::max<float>(0.0f, allowed_dist_sq);
        }

        allowed_dist_sq *= allowed_dist_sq;

        G3D::Vector3 dest = owner->movespline->FinalDestination();
        if (owner->movespline->onTransport)
            if (TransportBase* transport = owner->GetDirectTransport())
                transport->CalculatePassengerPosition(dest.x, dest.y, dest.z);

        float dist = (dest - G3D::Vector3(i_target->GetPositionX(),i_target->GetPositionY(),i_target->GetPositionZ())).squaredLength();
        float targetMoveDistSq = i_target->GetExactDistSq(&lastTargetXYZ);
        if (dist >= allowed_dist_sq || (!i_offset && targetMoveDistSq >= 1.5f*1.5f))
            if (i_forceRecheckDistance || targetMoveDistSq >= 0.1f*0.1f)
            {
                i_forceRecheckDistance = false;
                _setTargetLocation(owner, false);
            }
    }

    if (owner->movespline->Finalized())
    {
        static_cast<D*>(this)->MovementInform(owner);
        if (i_angle == 0.f && !owner->HasInArc(0.01f, i_target.getTarget()))
            owner->SetInFront(i_target.getTarget());

        if (!i_targetReached)
        {
            i_targetReached = true;
            static_cast<D*>(this)->_reachTarget(owner);
        }
    }
    else
    {
        if (i_recalculateTravel)
            _setTargetLocation(owner, false);
    }

    return true;
}

//-----------------------------------------------//
template<class T>
void ChaseMovementGenerator<T>::_reachTarget(T* owner)
{
    if (owner->IsWithinMeleeRange(this->i_target.getTarget()))
        owner->Attack(this->i_target.getTarget(),true);
}

template<>
void ChaseMovementGenerator<Player>::DoInitialize(Player* owner)
{
    owner->AddUnitState(UNIT_STATE_CHASE | UNIT_STATE_CHASE_MOVE);
    _setTargetLocation(owner, true);
}

template<>
void ChaseMovementGenerator<Creature>::DoInitialize(Creature* owner)
{
    owner->SetWalk(false);
    owner->AddUnitState(UNIT_STATE_CHASE | UNIT_STATE_CHASE_MOVE);
    _setTargetLocation(owner, true);
}

template<class T>
void ChaseMovementGenerator<T>::DoFinalize(T* owner)
{
    owner->ClearUnitState(UNIT_STATE_CHASE | UNIT_STATE_CHASE_MOVE);
}

template<class T>
void ChaseMovementGenerator<T>::DoReset(T* owner)
{
    DoInitialize(owner);
}

template<class T>
void ChaseMovementGenerator<T>::MovementInform(T* /*unit*/)
{
}

template<>
void ChaseMovementGenerator<Creature>::MovementInform(Creature* unit)
{
    // Pass back the GUIDLow of the target. If it is pet's owner then PetAI will handle
    if (unit->AI())
        unit->AI()->MovementInform(CHASE_MOTION_TYPE, i_target.getTarget()->GetGUIDLow());
}

//-----------------------------------------------//
template<>
bool FollowMovementGenerator<Creature>::EnableWalking() const
{
    return i_target.isValid() && (i_target->IsWalking() || i_target->movespline->isWalking());
}

template<>
bool FollowMovementGenerator<Player>::EnableWalking() const
{
    return false;
}

template<>
void FollowMovementGenerator<Player>::_updateSpeed(Player* /*owner*/)
{
    // nothing to do for Player
}

template<>
void FollowMovementGenerator<Creature>::_updateSpeed(Creature* owner)
{
    // pet only sync speed with owner
    /// Make sure we are not in the process of a map change (IsInWorld)
    if (!IS_PLAYER_GUID(owner->GetOwnerGUID()) || !owner->IsInWorld() || !i_target.isValid() || i_target->GetGUID() != owner->GetOwnerGUID())
        return;

    owner->UpdateSpeed(MOVE_RUN, true);
    owner->UpdateSpeed(MOVE_WALK, true);
    owner->UpdateSpeed(MOVE_SWIM, true);
}

template<>
void FollowMovementGenerator<Player>::DoInitialize(Player* owner)
{
    owner->AddUnitState(UNIT_STATE_FOLLOW | UNIT_STATE_FOLLOW_MOVE);
    _updateSpeed(owner);
    _setTargetLocation(owner, true);
}

template<>
void FollowMovementGenerator<Creature>::DoInitialize(Creature* owner)
{
    owner->AddUnitState(UNIT_STATE_FOLLOW | UNIT_STATE_FOLLOW_MOVE);
    _updateSpeed(owner);
    _setTargetLocation(owner, true);
}

template<class T>
void FollowMovementGenerator<T>::DoFinalize(T* owner)
{
    owner->ClearUnitState(UNIT_STATE_FOLLOW | UNIT_STATE_FOLLOW_MOVE);
    _updateSpeed(owner);
}

template<class T>
void FollowMovementGenerator<T>::DoReset(T* owner)
{
    DoInitialize(owner);
}

template<class T>
void FollowMovementGenerator<T>::MovementInform(T* /*unit*/)
{
}

template<>
void FollowMovementGenerator<Creature>::MovementInform(Creature* unit)
{
    // Pass back the GUIDLow of the target. If it is pet's owner then PetAI will handle
    if (unit->AI())
        unit->AI()->MovementInform(FOLLOW_MOTION_TYPE, i_target.getTarget()->GetGUIDLow());
}

//-----------------------------------------------//
template void TargetedMovementGeneratorMedium<Player,ChaseMovementGenerator<Player> >::_setTargetLocation(Player*, bool initial);
template void TargetedMovementGeneratorMedium<Player,FollowMovementGenerator<Player> >::_setTargetLocation(Player*, bool initial);
template void TargetedMovementGeneratorMedium<Creature,ChaseMovementGenerator<Creature> >::_setTargetLocation(Creature*, bool initial);
template void TargetedMovementGeneratorMedium<Creature,FollowMovementGenerator<Creature> >::_setTargetLocation(Creature*, bool initial);
template bool TargetedMovementGeneratorMedium<Player,ChaseMovementGenerator<Player> >::DoUpdate(Player*, uint32);
template bool TargetedMovementGeneratorMedium<Player,FollowMovementGenerator<Player> >::DoUpdate(Player*, uint32);
template bool TargetedMovementGeneratorMedium<Creature,ChaseMovementGenerator<Creature> >::DoUpdate(Creature*, uint32);
template bool TargetedMovementGeneratorMedium<Creature,FollowMovementGenerator<Creature> >::DoUpdate(Creature*, uint32);

template void ChaseMovementGenerator<Player>::_reachTarget(Player*);
template void ChaseMovementGenerator<Creature>::_reachTarget(Creature*);
template void ChaseMovementGenerator<Player>::DoFinalize(Player*);
template void ChaseMovementGenerator<Creature>::DoFinalize(Creature*);
template void ChaseMovementGenerator<Player>::DoReset(Player*);
template void ChaseMovementGenerator<Creature>::DoReset(Creature*);
template void ChaseMovementGenerator<Player>::MovementInform(Player*);

template void FollowMovementGenerator<Player>::DoFinalize(Player*);
template void FollowMovementGenerator<Creature>::DoFinalize(Creature*);
template void FollowMovementGenerator<Player>::DoReset(Player*);
template void FollowMovementGenerator<Creature>::DoReset(Creature*);
template void FollowMovementGenerator<Player>::MovementInform(Player*);
