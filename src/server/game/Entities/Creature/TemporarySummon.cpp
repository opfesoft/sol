/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "Log.h"
#include "ObjectAccessor.h"
#include "CreatureAI.h"
#include "ObjectMgr.h"
#include "TemporarySummon.h"
#include "Pet.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "GameObjectAI.h"

TempSummon::TempSummon(SummonPropertiesEntry const* properties, uint64 owner, bool isWorldObject, uint64 summonerGO, uint8 overrideLevel) :
Creature(isWorldObject), m_Properties(properties), m_type(TEMPSUMMON_MANUAL_DESPAWN),
m_timer(0), m_lifetime(0), m_ownerDeathDespawn(true), m_ownerDeathSummonType(TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT), m_ownerDeathLifetime(5000)
{
    m_summonerGUID = owner;
    m_summonerGO_GUID = summonerGO;
    m_unitTypeMask |= UNIT_MASK_SUMMON;
    m_overrideLevel = overrideLevel;
}

Unit* TempSummon::GetSummoner() const
{ 
    return m_summonerGUID ? ObjectAccessor::GetUnit(*this, m_summonerGUID) : NULL;
}

GameObject* TempSummon::GetSummonerGameObject() const
{
    return m_summonerGO_GUID ? ObjectAccessor::GetGameObject(*this, m_summonerGO_GUID) : NULL;
}

void TempSummon::Update(uint32 diff)
{ 
    Creature::Update(diff);

    if (m_deathState == DEAD)
    {
        UnSummon();
        return;
    }
    switch (m_type)
    {
        case TEMPSUMMON_MANUAL_DESPAWN:
        case TEMPSUMMON_DESPAWNED:
            break;
        case TEMPSUMMON_TIMED_DESPAWN:
        {
            if (m_timer <= diff)
            {
                UnSummon();
                return;
            }

            m_timer -= diff;
            break;
        }
        case TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT:
        {
            if (!IsInCombat())
            {
                if (m_timer <= diff)
                {
                    UnSummon();
                    return;
                }

                m_timer -= diff;
            }
            else if (m_timer != m_lifetime)
                m_timer = m_lifetime;

            break;
        }

        case TEMPSUMMON_CORPSE_TIMED_DESPAWN:
        {
            if (m_deathState == CORPSE)
            {
                if (m_timer <= diff)
                {
                    UnSummon();
                    return;
                }

                m_timer -= diff;
            }
            break;
        }
        case TEMPSUMMON_CORPSE_DESPAWN:
        {
            // if m_deathState is DEAD, CORPSE was skipped
            if (m_deathState == CORPSE)
            {
                UnSummon();
                return;
            }

            break;
        }
        case TEMPSUMMON_DEAD_DESPAWN:
        {
            break;
        }
        case TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN:
        {
            // if m_deathState is DEAD, CORPSE was skipped
            if (m_deathState == CORPSE)
            {
                UnSummon();
                return;
            }

            if (!IsInCombat())
            {
                if (m_timer <= diff)
                {
                    UnSummon();
                    return;
                }
                else
                    m_timer -= diff;
            }
            else if (m_timer != m_lifetime)
                m_timer = m_lifetime;
            break;
        }
        case TEMPSUMMON_TIMED_OR_DEAD_DESPAWN:
        {
            if (!IsInCombat() && IsAlive())
            {
                if (m_timer <= diff)
                {
                    UnSummon();
                    return;
                }
                else
                    m_timer -= diff;
            }
            else if (m_timer != m_lifetime)
                m_timer = m_lifetime;
            break;
        }
        default:
            UnSummon();
            sLog->outError("Temporary summoned creature (entry: %u) have unknown type %u of ", GetEntry(), m_type);
            break;
    }
}

void TempSummon::InitStats(uint32 duration)
{ 
    ASSERT(!IsPet());

    Unit* owner = GetSummoner();
    if (owner)
        if (Player* player = owner->ToPlayer())
            sScriptMgr->OnBeforeTempSummonInitStats(player, this, duration);

    m_timer = duration;
    m_lifetime = duration;

    if (m_type == TEMPSUMMON_MANUAL_DESPAWN)
        m_type = (duration == 0) ? TEMPSUMMON_DEAD_DESPAWN : TEMPSUMMON_TIMED_DESPAWN;

    if (owner)
    {
        if (IsTrigger() && m_spells[0])
        {
            setFaction(owner->getFaction());
            SetLevel(m_overrideLevel ? m_overrideLevel : owner->getLevel());
            if (owner->GetTypeId() == TYPEID_PLAYER)
                m_ControlledByPlayer = true;
        }

        if (owner->GetTypeId() == TYPEID_PLAYER)
            m_CreatedByPlayer = true;
    }

    if (!m_Properties)
        return;

    if (owner)
    {
        if (uint32 slot = m_Properties->Slot)
        {
            if (owner->m_SummonSlot[slot] && owner->m_SummonSlot[slot] != GetGUID())
            {
                Creature* oldSummon = GetMap()->GetCreature(owner->m_SummonSlot[slot]);
                if (oldSummon && oldSummon->IsSummon())
                    oldSummon->ToTempSummon()->UnSummon();
            }
            owner->m_SummonSlot[slot] = GetGUID();
        }
    }

    if (m_Properties->Faction)
        setFaction(m_Properties->Faction);
    else if (IsVehicle() && owner) // properties should be vehicle
        setFaction(owner->getFaction());
}

void TempSummon::InitSummon()
{ 
    Unit* owner = GetSummoner();
    if (owner)
    {
        if (owner->GetTypeId() == TYPEID_UNIT && owner->ToCreature()->IsAIEnabled)
            owner->ToCreature()->AI()->JustSummoned(this);
    }
    else if (GameObject* summonerGO = GetSummonerGameObject())
        if (GameObjectAI* ai = summonerGO->ToGameObject()->AI())
            ai->JustSummoned(this);

    // Xinef: Allow to call this hook when npc is summoned by gameobject, in this case pass this as summoner to avoid possible null checks
    if (IsAIEnabled)
        AI()->IsSummonedBy(owner);
}

void TempSummon::SetTempSummonType(TempSummonType type)
{ 
    m_type = type;
}

void TempSummon::UnSummon(uint32 msTime)
{ 
    if (msTime)
    {
        ForcedUnsummonDelayEvent* pEvent = new ForcedUnsummonDelayEvent(*this);

        m_Events.AddEvent(pEvent, m_Events.CalculateTime(msTime));
        return;
    }

    // Dont allow to call this function twice (possible)
    if (m_type == TEMPSUMMON_DESPAWNED)
        return;
    SetTempSummonType(TEMPSUMMON_DESPAWNED);

    //ASSERT(!IsPet());
    if (IsPet())
    {
        ((Pet*)this)->Remove(PET_SAVE_NOT_IN_SLOT);
        ASSERT(!IsInWorld());
        return;
    }

    Unit* owner = GetSummoner();
    if (owner && owner->GetTypeId() == TYPEID_UNIT && owner->ToCreature()->IsAIEnabled)
        owner->ToCreature()->AI()->SummonedCreatureDespawn(this);

    AddObjectToRemoveList();
}

bool ForcedUnsummonDelayEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    m_owner.UnSummon();
    return true;
}

bool CastSpellDelayEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    m_owner.CastSpell(&m_owner, m_spellid, true);
    return true;
}

void TempSummon::RemoveFromWorld()
{ 
    if (!IsInWorld())
        return;

    if (m_Properties)
        if (uint32 slot = m_Properties->Slot)
            if (Unit* owner = GetSummoner())
                if (owner->m_SummonSlot[slot] == GetGUID())
                    owner->m_SummonSlot[slot] = 0;

    //if (GetOwnerGUID())
    //    sLog->outError("Unit %u has owner guid when removed from world", GetEntry());

    Creature::RemoveFromWorld();
}

Minion::Minion(SummonPropertiesEntry const* properties, uint64 owner, bool isWorldObject, uint8 overrideLevel) : TempSummon(properties, owner, isWorldObject, 0, overrideLevel)
, m_owner(owner)
{
    ASSERT(m_owner);
    m_unitTypeMask |= UNIT_MASK_MINION;
    m_followAngle = PET_FOLLOW_ANGLE;
}

void Minion::InitStats(uint32 duration)
{ 
    TempSummon::InitStats(duration);

    SetReactState(REACT_PASSIVE);

    Unit *m_owner = GetOwner();
    SetCreatorGUID(m_owner->GetGUID());
    setFaction(m_owner->getFaction());

    m_owner->SetMinion(this, true);
}

void Minion::RemoveFromWorld()
{ 
    if (!IsInWorld())
        return;

    if (Unit *owner = GetOwner())
        owner->SetMinion(this, false);

    TempSummon::RemoveFromWorld();
}

Unit* Minion::GetOwner() const
{
    return ObjectAccessor::GetUnit(*this, m_owner);
}

bool Minion::IsGuardianPet() const
{ 
    return IsPet() || (m_Properties && m_Properties->Category == SUMMON_CATEGORY_PET);
}

void Minion::setDeathState(DeathState s, bool despawn)
{ 
    Creature::setDeathState(s, despawn);
    if (s == JUST_DIED && IsGuardianPet())
        if (Unit* owner = GetOwner())
            if (owner->GetTypeId() == TYPEID_PLAYER && owner->GetMinionGUID() == GetGUID())
                for (Unit::ControlSet::const_iterator itr = owner->m_Controlled.begin(); itr != owner->m_Controlled.end(); ++itr)
                    if ((*itr)->IsAlive() && (*itr)->GetEntry() == GetEntry())
                    {
                        owner->SetMinionGUID((*itr)->GetGUID());
                        owner->SetPetGUID((*itr)->GetGUID());
                        owner->ToPlayer()->CharmSpellInitialize();
                    }
}

Guardian::Guardian(SummonPropertiesEntry const* properties, uint64 owner, bool isWorldObject, uint8 overrideLevel) : Minion(properties, owner, isWorldObject, overrideLevel)
{
    m_unitTypeMask |= UNIT_MASK_GUARDIAN;
    if (properties && properties->Type == SUMMON_TYPE_PET)
    {
        m_unitTypeMask |= UNIT_MASK_CONTROLABLE_GUARDIAN;
        InitCharmInfo();
    }
}

void Guardian::InitStats(uint32 duration)
{ 
    Minion::InitStats(duration);

    Unit *m_owner = GetOwner();
    InitStatsForLevel(m_overrideLevel ? m_overrideLevel : m_owner->getLevel());

    if (m_owner->GetTypeId() == TYPEID_PLAYER && HasUnitTypeMask(UNIT_MASK_CONTROLABLE_GUARDIAN))
        m_charmInfo->InitCharmCreateSpells();

    SetReactState(REACT_AGGRESSIVE);
}

void Guardian::InitSummon()
{ 
    TempSummon::InitSummon();

    Unit *m_owner = GetOwner();
    if (m_owner->GetTypeId() == TYPEID_PLAYER
        && m_owner->GetMinionGUID() == GetGUID()
        && !m_owner->GetCharmGUID())
        m_owner->ToPlayer()->CharmSpellInitialize();
}

Puppet::Puppet(SummonPropertiesEntry const* properties, uint64 owner, uint8 overrideLevel) : Minion(properties, owner, false, overrideLevel), m_owner(owner) //maybe true?
{
    ASSERT(IS_PLAYER_GUID(owner));
    m_unitTypeMask |= UNIT_MASK_PUPPET;
}

void Puppet::InitStats(uint32 duration)
{ 
    Minion::InitStats(duration);
    SetLevel(m_overrideLevel ? m_overrideLevel : GetOwner()->getLevel());
    SetReactState(REACT_PASSIVE);
}

void Puppet::InitSummon()
{ 
    Minion::InitSummon();
    if (!SetCharmedBy(GetOwner(), CHARM_TYPE_POSSESS))
    {
        if (Player* p = GetOwner())
            sLog->outMisc("Puppet::InitSummon (A1) - %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u", p->GetTypeId(), p->GetEntry(), p->GetUnitTypeMask(), p->GetGUIDLow(), p->GetMapId(), p->GetInstanceId(), p->FindMap()->GetId(), p->IsInWorld() ? 1 : 0, p->IsDuringRemoveFromWorld() ? 1 : 0, p->IsBeingTeleported() ? 1 : 0, p->isBeingLoaded() ? 1 : 0);
        else
        {
            sLog->outMisc("Puppet::InitSummon (B1)");
            //ABORT(); // ZOMG!
        }
    }
}

void Puppet::Update(uint32 time)
{ 
    Minion::Update(time);
    //check if caster is channelling?
    if (IsInWorld())
    {
        if (!IsAlive())
        {
            UnSummon();
            // TODO: why long distance .die does not remove it
        }
    }
}

void Puppet::RemoveFromWorld()
{ 
    if (!IsInWorld())
        return;

    RemoveCharmedBy(NULL);
    Minion::RemoveFromWorld();
}

Player* Puppet::GetOwner() const
{
    return ObjectAccessor::GetPlayer(*this, m_owner);
}
