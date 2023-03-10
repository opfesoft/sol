/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedEscortAI.h"
#include "Player.h"

/*######
## npc_galen_goodward
######*/

enum Galen
{
    QUEST_GALENS_ESCAPE     = 1393,
    GO_GALENS_CAGE          = 37118,
    SAY_PERIODIC            = 0,
    SAY_QUEST_ACCEPTED      = 1,
    SAY_ATTACKED            = 2,
    SAY_QUEST_COMPLETE      = 3,
    EMOTE_WHISPER           = 4,
    EMOTE_DISAPPEAR         = 5,
    FACTION_FRIENDLY        = 35,
    FACTION_ESCORTEE        = 250
};

class npc_galen_goodward : public CreatureScript
{
public:
    npc_galen_goodward() : CreatureScript("npc_galen_goodward") { }

    struct npc_galen_goodwardAI : public npc_escortAI
    {
        npc_galen_goodwardAI(Creature* creature) : npc_escortAI(creature)
        {
            galensCageGUID = 0;
            Reset();
        }

        void Reset()
        {
            periodicSay = 6000;
            me->setFaction(FACTION_FRIENDLY);
        }

        void EnterCombat(Unit* who)
        {
            if (HasEscortState(STATE_ESCORT_ESCORTING))
                Talk(SAY_ATTACKED, who);
        }

        void sQuestAccept(Player* player, Quest const* quest)
        {
            if (quest->GetQuestId() == QUEST_GALENS_ESCAPE)
            {
                me->setActive(true);
                Talk(SAY_QUEST_ACCEPTED, player);
                npc_escortAI::Start(false, false, player->GetGUID(), quest);
            }
        }

        void WaypointStart(uint32 uiPointId)
        {
            switch (uiPointId)
            {
            case 0:
                {
                    GameObject* cage = NULL;
                    if (galensCageGUID)
                        cage = me->GetMap()->GetGameObject(galensCageGUID);
                    else
                        cage = GetClosestGameObjectWithEntry(me, GO_GALENS_CAGE, INTERACTION_DISTANCE);
                    if (cage)
                    {
                        cage->UseDoorOrButton();
                        galensCageGUID = cage->GetGUID();
                    }
                    break;
                }
            case 48:
                Talk(EMOTE_DISAPPEAR);
                break;
            }
        }

        void WaypointReached(uint32 waypointId)
        {
            switch (waypointId)
            {
                case 0:
                    if (GameObject* cage = me->GetMap()->GetGameObject(galensCageGUID))
                        cage->ResetDoorOrButton();
                    me->setFaction(FACTION_ESCORTEE);
                    break;
                case 47:
                    if (Player* player = GetPlayerForEscort())
                    {
                        me->SetFacingToObject(player);
                        Talk(SAY_QUEST_COMPLETE, player);
                        Talk(EMOTE_WHISPER, player);
                        player->GroupEventHappens(QUEST_GALENS_ESCAPE, me);
                    }
                    SetRun(true);
                    break;
            }
        }

        void UpdateAI(uint32 diff)
        {
            npc_escortAI::UpdateAI(diff);

            if (HasEscortState(STATE_ESCORT_NONE))
                return;

            if (periodicSay < diff)
            {
                if (!HasEscortState(STATE_ESCORT_ESCORTING))
                    Talk(SAY_PERIODIC);
                periodicSay = 15000;
            }
            else
                periodicSay -= diff;

            DoMeleeAttackIfReady();
        }

    private:
        uint64 galensCageGUID;
        uint32 periodicSay;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_galen_goodwardAI(creature);
    }
};

void AddSC_swamp_of_sorrows()
{
    new npc_galen_goodward();
}
