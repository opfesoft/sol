/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef AZEROTHCORE_TEMPSUMMON_H
#define AZEROTHCORE_TEMPSUMMON_H

#include "Creature.h"

enum SummonerType
{
    SUMMONER_TYPE_CREATURE      = 0,
    SUMMONER_TYPE_GAMEOBJECT    = 1,
    SUMMONER_TYPE_MAP           = 2
};

/// Stores data for temp summons
struct TempSummonData
{
    uint32 entry;        ///< Entry of summoned creature
    Position pos;        ///< Position, where should be creature spawned
    TempSummonType type; ///< Summon type, see TempSummonType for available types
    uint32 time;         ///< Despawn time, usable only with certain temp summon types
};

class TempSummon : public Creature
{
    public:
        explicit TempSummon(SummonPropertiesEntry const* properties, uint64 owner, bool isWorldObject, uint64 summonerGO = 0);
        virtual ~TempSummon() {}
        void Update(uint32 time);
        virtual void InitStats(uint32 lifetime);
        virtual void InitSummon();
        virtual void UnSummon(uint32 msTime = 0);
        void RemoveFromWorld();
        void SetTempSummonType(TempSummonType type);
        void SaveToDB(uint32 /*mapid*/, uint8 /*spawnMask*/, uint32 /*phaseMask*/) {}
        Unit* GetSummoner() const;
        GameObject* GetSummonerGameObject() const;
        uint64 GetSummonerGUID() { return m_summonerGUID; }
        TempSummonType const& GetSummonType() { return m_type; }
        uint32 GetTimer() { return m_timer; }
        void SetTimer(uint32 t) { m_timer = t; }
        void SetOwnerDeathDespawn(bool ownerDeathDespawn) { m_ownerDeathDespawn = ownerDeathDespawn; }
        bool GetOwnerDeathDespawn() const { return m_ownerDeathDespawn; }
        void SetOwnerDeathSummonType(TempSummonType ownerDeathSummonType) { m_ownerDeathSummonType = ownerDeathSummonType; }
        void SetOwnerDeathLifetime(uint32 ownerDeathLifetime) { m_ownerDeathLifetime = ownerDeathLifetime; }
        void ActivateOwnerDeathSummonType() { m_timer = m_ownerDeathLifetime; m_lifetime = m_ownerDeathLifetime; m_type = m_ownerDeathSummonType; }

        const SummonPropertiesEntry* const m_Properties;
    private:
        TempSummonType m_type;
        uint32 m_timer;
        uint32 m_lifetime;
        uint64 m_summonerGUID;
        uint64 m_summonerGO_GUID;
        bool m_ownerDeathDespawn;
        TempSummonType m_ownerDeathSummonType;
        uint32 m_ownerDeathLifetime;
};

class Minion : public TempSummon
{
    public:
        Minion(SummonPropertiesEntry const* properties, uint64 owner, bool isWorldObject);
        void InitStats(uint32 duration);
        void RemoveFromWorld();
        Unit* GetOwner() const;
        float GetFollowAngle() const { return m_followAngle; }
        void SetFollowAngle(float angle) { m_followAngle = angle; }
        bool IsPetGhoul() const {return GetEntry() == 26125 /*normal ghoul*/ || GetEntry() == 30230 /*Raise Ally ghoul*/;} // Ghoul may be guardian or pet
        bool IsGuardianPet() const;
        void setDeathState(DeathState s, bool despawn = false);                   // override virtual Unit::setDeathState
    protected:
        const uint64 m_owner;
        float m_followAngle;
};

class Guardian : public Minion
{
    public:
        Guardian(SummonPropertiesEntry const* properties, uint64 owner, bool isWorldObject);
        void InitStats(uint32 duration);
        bool InitStatsForLevel(uint8 level);
        void InitSummon();

        bool UpdateStats(Stats stat);
        bool UpdateAllStats();
        void UpdateArmor();
        void UpdateMaxHealth();
        void UpdateMaxPower(Powers power);
        void UpdateAttackPowerAndDamage(bool ranged = false);
        void UpdateDamagePhysical(WeaponAttackType attType);
};

class Puppet : public Minion
{
    public:
        Puppet(SummonPropertiesEntry const* properties, uint64 owner);
        void InitStats(uint32 duration);
        void InitSummon();
        void Update(uint32 time);
        void RemoveFromWorld();
    protected:
        Player* GetOwner() const;
        const uint64 m_owner;
};

class ForcedUnsummonDelayEvent : public BasicEvent
{
public:
    ForcedUnsummonDelayEvent(TempSummon& owner) : BasicEvent(), m_owner(owner) { }
    bool Execute(uint64 e_time, uint32 p_time);

private:
    TempSummon& m_owner;
};
#endif
