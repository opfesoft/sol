/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef ACORE_PASSIVEAI_H
#define ACORE_PASSIVEAI_H

#include "CreatureAI.h"
//#include "CreatureAIImpl.h"

class PassiveAI : public CreatureAI
{
    public:
        explicit PassiveAI(Creature* c);

        void MoveInLineOfSight(Unit*) {}
        void AttackStart(Unit*) {}
        void UpdateAI(uint32);

        static int Permissible(const Creature*) { return PERMIT_BASE_IDLE;  }
};

class PossessedAI : public CreatureAI
{
    public:
        explicit PossessedAI(Creature* c);

        void MoveInLineOfSight(Unit*) {}
        void AttackStart(Unit* target);
        void UpdateAI(uint32);
        void EnterEvadeMode() {}

        void JustDied(Unit*);
        void KilledUnit(Unit* victim);

        static int Permissible(const Creature*) { return PERMIT_BASE_IDLE;  }
};

class NullCreatureAI : public CreatureAI
{
    public:
        explicit NullCreatureAI(Creature* c);

        void MoveInLineOfSight(Unit*) {}
        void AttackStart(Unit*) {}
        void UpdateAI(uint32) {}
        void EnterEvadeMode() {}
        void OnCharmed(bool /*apply*/) {}

        static int Permissible(const Creature*) { return PERMIT_BASE_IDLE;  }
};

class CritterAI : public PassiveAI
{
    public:
        explicit CritterAI(Creature* c) : PassiveAI(c) { _combatTimer = 0; }

        void DamageTaken(Unit* /*done_by*/, uint32& /*damage*/, DamageEffectType damagetype, SpellSchoolMask damageSchoolMask);
        void EnterEvadeMode();
        void UpdateAI(uint32);

    // Xinef: Added
    private:
        uint32 _combatTimer;
};

class TriggerAI : public NullCreatureAI
{
    public:
        explicit TriggerAI(Creature* c) : NullCreatureAI(c) {}
        void IsSummonedBy(Unit* summoner);
};

#endif

