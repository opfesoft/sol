/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef AZEROTHCORE_TOTEM_H
#define AZEROTHCORE_TOTEM_H

#include "TemporarySummon.h"

enum TotemType
{
    TOTEM_PASSIVE    = 0,
    TOTEM_ACTIVE     = 1,
    TOTEM_STATUE     = 2 // copied straight from moongose, may need more implementation to work
};
// Some Totems cast spells that are not in creature DB
#define SENTRY_TOTEM_SPELLID  6495

#define SENTRY_TOTEM_ENTRY    3968
#define EARTHBIND_TOTEM_ENTRY 2630

constexpr uint32 SPELL_CYCLONE = 33786;

class Totem : public Minion
{
    public:
        explicit Totem(SummonPropertiesEntry const *properties, uint64 owner, uint8 overrideLevel);
        virtual ~Totem(){};
        void Update(uint32 time);
        void InitStats(uint32 duration);
        void InitSummon();
        void UnSummon(uint32 msTime = 0);
        uint32 GetSpell(uint8 slot = 0) const { return m_spells[slot]; }
        uint32 GetTotemDuration() const { return m_duration; }
        void SetTotemDuration(uint32 duration) { m_duration = duration; }
        TotemType GetTotemType() const { return m_type; }

        bool UpdateStats(Stats /*stat*/) { return true; }
        bool UpdateAllStats() { return true; }
        void UpdateResistances(uint32 /*school*/) {}
        void UpdateArmor() {}
        void UpdateMaxHealth() {}
        void UpdateMaxPower(Powers /*power*/) {}
        void UpdateAttackPowerAndDamage(bool /*ranged*/) {}
        void UpdateDamagePhysical(WeaponAttackType /*attType*/) {}

        bool IsImmunedToSpellEffect(SpellInfo const* spellInfo, uint32 index) const;

    protected:
        TotemType m_type;
        uint32 m_duration;
};
#endif
