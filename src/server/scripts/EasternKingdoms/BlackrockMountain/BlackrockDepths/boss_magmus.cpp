/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under GNU AGPL3 v3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"

enum Spells
{
    SPELL_FIERYBURST                                       = 13900,
    SPELL_WARSTOMP                                         = 24375
};

enum Misc
{
    DATA_THRONE_DOOR                                       = 24 // not id or guid of doors but number of enum in blackrock_depths.h
};

class boss_magmus : public CreatureScript
{
public:
    boss_magmus() : CreatureScript("boss_magmus") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_magmusAI(creature);
    }

    struct boss_magmusAI : public ScriptedAI
    {
        boss_magmusAI(Creature* creature) : ScriptedAI(creature) { }

        uint32 FieryBurst_Timer;
        uint32 WarStomp_Timer;

        void Reset()
        {
            FieryBurst_Timer = 5000;
            WarStomp_Timer =0;
        }

        void EnterCombat(Unit* /*who*/) { }

        void UpdateAI(uint32 diff)
        {
            //Return since we have no target
            if (!UpdateVictim())
                return;

            //FieryBurst_Timer
            if (FieryBurst_Timer <= diff)
            {
                DoCastVictim(SPELL_FIERYBURST);
                FieryBurst_Timer = 6000;
            } else FieryBurst_Timer -= diff;

            //WarStomp_Timer
            if (HealthBelowPct(51))
            {
                if (WarStomp_Timer <= diff)
                {
                    DoCastVictim(SPELL_WARSTOMP);
                    WarStomp_Timer = 8000;
                } else WarStomp_Timer -= diff;
            }

            DoMeleeAttackIfReady();
        }
        // When he die open door to last chamber
        void JustDied(Unit* killer)
        {
            if (InstanceScript* instance = killer->GetInstanceScript())
                instance->HandleGameObject(instance->GetData64(DATA_THRONE_DOOR), true);
        }
    };
};

void AddSC_boss_magmus()
{
    new boss_magmus();
}
