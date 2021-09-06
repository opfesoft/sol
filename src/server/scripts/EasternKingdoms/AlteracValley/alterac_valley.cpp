/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU AGPLv3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE.md
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"

enum Spells
{
    SPELL_CHARGE                                  = 22911,
    SPELL_CLEAVE                                  = 40504,
    SPELL_DEMORALIZING_SHOUT                      = 23511,
    SPELL_ENRAGE                                  = 8599,
    SPELL_WHIRLWIND                               = 13736,

    SPELL_NORTH_MARSHAL                           = 45828,
    SPELL_SOUTH_MARSHAL                           = 45829,
    SPELL_STONEHEARTH_MARSHAL                     = 45830,
    SPELL_ICEWING_MARSHAL                         = 45831,
    SPELL_ICEBLOOD_WARMASTER                      = 45822,
    SPELL_TOWER_POINT_WARMASTER                   = 45823,
    SPELL_WEST_FROSTWOLF_WARMASTER                = 45824,
    SPELL_EAST_FROSTWOLF_WARMASTER                = 45826
};

enum Creatures
{
    NPC_NORTH_MARSHAL                             = 14762,
    NPC_SOUTH_MARSHAL                             = 14763,
    NPC_ICEWING_MARSHAL                           = 14764,
    NPC_STONEHEARTH_MARSHAL                       = 14765,
    NPC_EAST_FROSTWOLF_WARMASTER                  = 14772,
    NPC_ICEBLOOD_WARMASTER                        = 14773,
    NPC_TOWER_POINT_WARMASTER                     = 14776,
    NPC_WEST_FROSTWOLF_WARMASTER                  = 14777
};

enum Events
{
    EVENT_CHARGE_TARGET        = 1,
    EVENT_CLEAVE               = 2,
    EVENT_DEMORALIZING_SHOUT   = 3,
    EVENT_WHIRLWIND            = 4,
    EVENT_ENRAGE               = 5,
    EVENT_CHECK_RESET          = 6
};

struct SpellPair
{
    uint32 npcEntry;
    uint32 spellId;
};

uint8 const MAX_SPELL_PAIRS = 8;
SpellPair const _auraPairs[MAX_SPELL_PAIRS] =
{
    { NPC_NORTH_MARSHAL,            SPELL_NORTH_MARSHAL },
    { NPC_SOUTH_MARSHAL,            SPELL_SOUTH_MARSHAL },
    { NPC_STONEHEARTH_MARSHAL,      SPELL_STONEHEARTH_MARSHAL },
    { NPC_ICEWING_MARSHAL,          SPELL_ICEWING_MARSHAL },
    { NPC_EAST_FROSTWOLF_WARMASTER, SPELL_EAST_FROSTWOLF_WARMASTER },
    { NPC_WEST_FROSTWOLF_WARMASTER, SPELL_WEST_FROSTWOLF_WARMASTER },
    { NPC_TOWER_POINT_WARMASTER,    SPELL_TOWER_POINT_WARMASTER },
    { NPC_ICEBLOOD_WARMASTER,       SPELL_ICEBLOOD_WARMASTER }
};

class npc_av_marshal_or_warmaster : public CreatureScript
{
    public:
        npc_av_marshal_or_warmaster() : CreatureScript("npc_av_marshal_or_warmaster") { }

        struct npc_av_marshal_or_warmasterAI : public ScriptedAI
        {
            npc_av_marshal_or_warmasterAI(Creature* creature) : ScriptedAI(creature) { }

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_CHARGE_TARGET, urand(2 * IN_MILLISECONDS, 12 * IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_CLEAVE, urand(1 * IN_MILLISECONDS, 11 * IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_DEMORALIZING_SHOUT, 2000);
                events.ScheduleEvent(EVENT_WHIRLWIND, urand(5 * IN_MILLISECONDS, 20 * IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_ENRAGE, urand(5 * IN_MILLISECONDS, 20 * IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_CHECK_RESET, 5000);

                _hasAura = false;
            }

            void JustRespawned()
            {
                Reset();
            }

            void UpdateAI(uint32 diff)
            {
                // I have a feeling this isn't blizzlike, but owell, I'm only passing by and cleaning up.
                if (!_hasAura)
                {
                    for (uint8 i = 0; i < MAX_SPELL_PAIRS; ++i)
                        if (_auraPairs[i].npcEntry == me->GetEntry())
                            DoCast(me, _auraPairs[i].spellId);

                    _hasAura = true;
                }

                if (!UpdateVictim())
                    return;

                events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_CHARGE_TARGET:
                            DoCastVictim(SPELL_CHARGE);
                            events.ScheduleEvent(EVENT_CHARGE, urand(10 * IN_MILLISECONDS, 25 * IN_MILLISECONDS));
                            break;
                        case EVENT_CLEAVE:
                            DoCastVictim(SPELL_CLEAVE);
                            events.ScheduleEvent(EVENT_CLEAVE, urand(10 * IN_MILLISECONDS, 16 * IN_MILLISECONDS));
                            break;
                        case EVENT_DEMORALIZING_SHOUT:
                            DoCast(me, SPELL_DEMORALIZING_SHOUT);
                            events.ScheduleEvent(EVENT_DEMORALIZING_SHOUT, urand(10 * IN_MILLISECONDS, 15 * IN_MILLISECONDS));
                            break;
                        case EVENT_WHIRLWIND:
                            DoCast(me, SPELL_WHIRLWIND);
                            events.ScheduleEvent(EVENT_WHIRLWIND, urand(10 * IN_MILLISECONDS, 25 * IN_MILLISECONDS));
                            break;
                        case EVENT_ENRAGE:
                            DoCast(me, SPELL_ENRAGE);
                            events.ScheduleEvent(EVENT_ENRAGE, urand(10 * IN_MILLISECONDS, 30 * IN_MILLISECONDS));
                            break;
                        case EVENT_CHECK_RESET:
                        {
                            Position const& _homePosition = me->GetHomePosition();
                            if (me->GetDistance2d(_homePosition.GetPositionX(), _homePosition.GetPositionY()) > 50.0f)
                            {
                                EnterEvadeMode();
                                return;
                            }
                            events.ScheduleEvent(EVENT_CHECK_RESET, 5000);
                            break;
                        }
                    }
                }

                DoMeleeAttackIfReady();
            }

        private:
            EventMap events;
            bool _hasAura;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_av_marshal_or_warmasterAI(creature);
        }
};

void AddSC_alterac_valley()
{
    new npc_av_marshal_or_warmaster();
}
