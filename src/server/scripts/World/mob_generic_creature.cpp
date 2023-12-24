/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "PassiveAI.h"

class trigger_periodic : public CreatureScript
{
public:
    trigger_periodic() : CreatureScript("trigger_periodic") { }

    struct trigger_periodicAI : public NullCreatureAI
    {
        trigger_periodicAI(Creature* creature) : NullCreatureAI(creature)
        {
            spell = me->m_spells[0] ? sSpellMgr->GetSpellInfo(me->m_spells[0]) : NULL;
            interval = me->GetAttackTime(BASE_ATTACK);
            timer = interval;
        }

        uint32 timer, interval;
        const SpellInfo* spell;

        void UpdateAI(uint32 diff)
        {
            if (timer <= diff)
            {
                if (spell)
                    me->CastSpell(me, spell, true);
                timer = interval;
            }
            else
                timer -= diff;
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new trigger_periodicAI(creature);
    }
};

void AddSC_generic_creature()
{
    new trigger_periodic;
}
