/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "IdleMovementGenerator.h"
#include "CreatureAI.h"
#include "Creature.h"

IdleMovementGenerator si_idleMovement;

// StopMoving is needed to make unit stop if its last movement generator expires
// But it should not be sent otherwise there are many redundent packets
void IdleMovementGenerator::Initialize(Unit* owner)
{
    Reset(owner);
}

void IdleMovementGenerator::Reset(Unit* owner)
{
    if (!owner->IsStopped())
        owner->StopMoving();
}

void RotateMovementGenerator::Initialize(Unit* owner)
{
    if (!owner->IsStopped())
        owner->StopMoving();

    if (owner->GetVictim())
        owner->SetInFront(owner->GetVictim());

    owner->AddUnitState(UNIT_STATE_ROTATING);

    owner->AttackStop();
}

bool RotateMovementGenerator::Update(Unit* owner, uint32 diff)
{
    float angle = owner->GetOrientation();
    if (m_direction == ROTATE_DIRECTION_LEFT)
    {
        angle += (float)diff * static_cast<float>(M_PI * 2) / m_maxDuration;
        while (angle >= static_cast<float>(M_PI * 2)) angle -= static_cast<float>(M_PI * 2);
    }
    else
    {
        angle -= (float)diff * static_cast<float>(M_PI * 2) / m_maxDuration;
        while (angle < 0) angle += static_cast<float>(M_PI * 2);
    }

    owner->SetFacingTo(angle);

    if (m_duration > diff)
        m_duration -= diff;
    else
        return false;

    return true;
}

void RotateMovementGenerator::Finalize(Unit* unit)
{
    unit->ClearUnitState(UNIT_STATE_ROTATING);
    if (unit->GetTypeId() == TYPEID_UNIT)
      unit->ToCreature()->AI()->MovementInform(ROTATE_MOTION_TYPE, 0);
}

void DistractMovementGenerator::Initialize(Unit* owner)
{
    // Distracted creatures stand up if not standing
    if (!owner->IsStandState())
        owner->SetStandState(UNIT_STAND_STATE_STAND);

    owner->AddUnitState(UNIT_STATE_DISTRACTED);
}

void DistractMovementGenerator::Finalize(Unit* owner)
{
    owner->ClearUnitState(UNIT_STATE_DISTRACTED);

    // If this is a creature, then return orientation to original position (for idle movement creatures)
    if (owner->GetTypeId() == TYPEID_UNIT && owner->ToCreature())
    {
        float angle = owner->ToCreature()->GetHomePosition().GetOrientation();
        owner->SetFacingTo(angle);
    }
}

bool DistractMovementGenerator::Update(Unit* owner, uint32 time_diff)
{
    if (owner->IsInCombat() || time_diff > m_timer)
        return false;

    m_timer -= time_diff;
    return true;
}

void AssistanceDistractMovementGenerator::Finalize(Unit* unit)
{
    unit->ClearUnitState(UNIT_STATE_DISTRACTED);
    unit->ToCreature()->SetReactState(REACT_AGGRESSIVE);
}
