/*
 * Copyright (C) 2016+     AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-GPL2
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "Creature.h"
#include "CreatureAI.h"
#include "MapManager.h"
#include "FleeingMovementGenerator.h"
#include "ObjectAccessor.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "Player.h"
#include "VMapFactory.h"

#define MIN_QUIET_DISTANCE 28.0f
#define MAX_QUIET_DISTANCE 43.0f

template<class T>
void FleeingMovementGenerator<T>::_setTargetLocation(T* owner)
{
    if (!owner)
        return;

    if (owner->HasUnitState(UNIT_STATE_ROOT | UNIT_STATE_STUNNED))
        return;

    owner->AddUnitState(UNIT_STATE_FLEEING_MOVE);

    float x, y, z;
    if (!_getPoint(owner, x, y, z))
    {
        i_distStep = i_distStep < 15.0f ? i_distStep + 1.0f : 0.0f;
        i_nextCheckTime.Reset(200);
        return;
    }

    // Add LOS check for target point
    bool isInLOS = VMAP::VMapFactory::createOrGetVMapManager()->isInLineOfSight(owner->GetMapId(),
        owner->GetPositionX(),
        owner->GetPositionY(),
        owner->GetPositionZ() + 2.0f,
        x, y, z + 2.0f);

    if (!isInLOS)
    {
        i_distStep = i_distStep < 15.0f ? i_distStep + 1.0f : 0.0f;
        i_nextCheckTime.Reset(200);
        return;
    }

    PathGenerator path(owner);
    path.SetPathLengthLimit(30.0f);
    bool result = path.CalculatePath(x, y, z);
    if (!result || (path.GetPathType() & PATHFIND_NOPATH))
    {
        i_distStep = i_distStep < 15.0f ? i_distStep + 1.0f : 0.0f;
        i_nextCheckTime.Reset(200);
        return;
    }

    Movement::MoveSplineInit init(owner);
    init.MovebyPath(path.GetPath());
    init.SetWalk(false);
    int32 traveltime = init.Launch();
    i_distStep = 0.0f;
    i_nextCheckTime.Reset(traveltime + urand(800, 1500));
}

template<class T>
bool FleeingMovementGenerator<T>::_getPoint(T* owner, float &x, float &y, float &z)
{
    x = owner->GetPositionX();
    y = owner->GetPositionY();
    z = owner->GetPositionZ();
    const Map* _map = owner->GetBaseMap();

    float dist_from_caster, angle_to_caster, temp_x, temp_y;
    if (Unit* fright = ObjectAccessor::GetUnit(*owner, i_frightGUID))
    {
        dist_from_caster = fright->GetDistance(owner);
        if (dist_from_caster > 0.2f)
            angle_to_caster = fright->GetAngle(owner);
        else
            angle_to_caster = frand(0.0f, 2.0f * float(M_PI));
    }
    else
    {
        dist_from_caster = 0.0f;
        angle_to_caster = frand(0.0f, 2.0f * float(M_PI));
    }

    float dist, angle;
    if (dist_from_caster < MIN_QUIET_DISTANCE)
    {
        dist = frand(0.4f, 1.3f) * (MIN_QUIET_DISTANCE - dist_from_caster);
        angle = angle_to_caster + frand(-float(M_PI) / 8.0f, float(M_PI) / 8.0f);
    }
    else if (dist_from_caster > MAX_QUIET_DISTANCE)
    {
        dist = frand(0.4f, 1.0f) * (MAX_QUIET_DISTANCE - MIN_QUIET_DISTANCE);
        angle = -angle_to_caster + frand(-float(M_PI) / 4.0f, float(M_PI) / 4.0f);
    }
    else // we are inside quiet range
    {
        dist = frand(0.6f, 1.2f) * (MAX_QUIET_DISTANCE - MIN_QUIET_DISTANCE);
        angle = frand(0.0f, 2.0f * float(M_PI));
    }

    dist *= pow(0.8f, i_distStep);

    Position pos;
    owner->GetFirstCollisionPosition(pos, dist, angle);

    if (owner->GetExactDist2d(pos.m_positionX, pos.m_positionY) < 1.0f)
        return false;

    temp_x = pos.m_positionX;
    temp_y = pos.m_positionY;

    bool is_water_now = _map->IsInWater(x, y, z);
    if (is_water_now && _map->IsInWater(temp_x, temp_y,z))
    {
        x = temp_x;
        y = temp_y;
        return true;
    }

    float new_z = _map->GetHeight(owner->GetPhaseMask(), temp_x, temp_y, z, true);
    if (new_z <= INVALID_HEIGHT || fabs(z-new_z) > 3.0f)
        return false;

    bool is_water_next = _map->IsInWater(temp_x, temp_y, new_z);
    if ((is_water_now && !is_water_next && !is_land_ok) || (!is_water_now && is_water_next && !is_water_ok))
        return false;

    float new_z_left  = _map->GetHeight(owner->GetPhaseMask(), temp_x + cos(angle + float(M_PI) / 2.0f), temp_y + sin(angle + float(M_PI) / 2.0f), z, true);
    float new_z_right = _map->GetHeight(owner->GetPhaseMask(), temp_x + cos(angle - float(M_PI) / 2.0f), temp_y + sin(angle - float(M_PI) / 2.0f), z, true);
    if (fabs(new_z_left - new_z) < 1.2f && fabs(new_z_right - new_z) < 1.2f)
    {
        x = pos.m_positionX;
        y = pos.m_positionY;
        z = pos.m_positionZ;
        return true;
    }

    return false;
}

template<class T>
void FleeingMovementGenerator<T>::DoInitialize(T* owner)
{
    if (!owner)
        return;

    owner->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_FLEEING);
    owner->AddUnitState(UNIT_STATE_FLEEING|UNIT_STATE_FLEEING_MOVE);
    _Init(owner);
    i_distStep = 0.0f;
    _setTargetLocation(owner);
}

template<>
void FleeingMovementGenerator<Creature>::_Init(Creature* owner)
{
    if (!owner)
        return;

    //owner->SetTargetGuid(ObjectGuid());
    is_water_ok = owner->CanSwim();
    is_land_ok  = owner->CanWalk();
}

template<>
void FleeingMovementGenerator<Player>::_Init(Player* )
{
    is_water_ok = true;
    is_land_ok  = true;
}

template<>
void FleeingMovementGenerator<Player>::DoFinalize(Player* owner)
{
    owner->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_FLEEING);
    owner->ClearUnitState(UNIT_STATE_FLEEING|UNIT_STATE_FLEEING_MOVE);
}

template<>
void FleeingMovementGenerator<Creature>::DoFinalize(Creature* owner)
{
    owner->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_FLEEING);
    owner->ClearUnitState(UNIT_STATE_FLEEING|UNIT_STATE_FLEEING_MOVE);
    if (owner->GetVictim())
        owner->SetTarget(owner->GetVictim()->GetGUID());
}

template<class T>
void FleeingMovementGenerator<T>::DoReset(T* owner)
{
    DoInitialize(owner);
}

template<class T>
bool FleeingMovementGenerator<T>::DoUpdate(T* owner, uint32 time_diff)
{
    if (!owner || !owner->IsAlive())
        return false;

    if (owner->HasUnitState(UNIT_STATE_ROOT | UNIT_STATE_STUNNED))
    {
        owner->ClearUnitState(UNIT_STATE_FLEEING_MOVE);
        return true;
    }

    i_nextCheckTime.Update(time_diff);
    if (i_nextCheckTime.Passed() && owner->movespline->Finalized())
        _setTargetLocation(owner);

    return true;
}

template void FleeingMovementGenerator<Player>::DoInitialize(Player*);
template void FleeingMovementGenerator<Creature>::DoInitialize(Creature*);
template bool FleeingMovementGenerator<Player>::_getPoint(Player*, float&, float&, float&);
template bool FleeingMovementGenerator<Creature>::_getPoint(Creature*, float&, float&, float&);
template void FleeingMovementGenerator<Player>::_setTargetLocation(Player*);
template void FleeingMovementGenerator<Creature>::_setTargetLocation(Creature*);
template void FleeingMovementGenerator<Player>::DoReset(Player*);
template void FleeingMovementGenerator<Creature>::DoReset(Creature*);
template bool FleeingMovementGenerator<Player>::DoUpdate(Player*, uint32);
template bool FleeingMovementGenerator<Creature>::DoUpdate(Creature*, uint32);

void TimedFleeingMovementGenerator::Finalize(Unit* owner)
{
    owner->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_FLEEING);
    owner->ClearUnitState(UNIT_STATE_FLEEING|UNIT_STATE_FLEEING_MOVE);
    if (owner->GetVictim())
        owner->SetTarget(owner->GetVictim()->GetGUID());
}

bool TimedFleeingMovementGenerator::Update(Unit* owner, uint32 time_diff)
{
    if (!owner->IsAlive())
        return false;

    if (owner->HasUnitState(UNIT_STATE_ROOT | UNIT_STATE_STUNNED))
    {
        owner->ClearUnitState(UNIT_STATE_FLEEING_MOVE);
        return true;
    }

    i_totalFleeTime.Update(time_diff);
    if (i_totalFleeTime.Passed())
        return false;

    // This calls grant-parent Update method hiden by FleeingMovementGenerator::Update(Creature &, uint32) version
    // This is done instead of casting Unit& to Creature& and call parent method, then we can use Unit directly
    return MovementGeneratorMedium< Creature, FleeingMovementGenerator<Creature> >::Update(owner, time_diff);
}
