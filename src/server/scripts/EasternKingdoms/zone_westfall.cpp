/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

/* ScriptData
SDName: Westfall
SD%Complete: 90
SDComment: Quest support: 155
SDCategory: Westfall
EndScriptData */

/* ContentData
npc_daphne_stilwell
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedEscortAI.h"
#include "Player.h"

/*######
## npc_daphne_stilwell
######*/

enum DaphneStilwell
{
    SAY_DS_START            =    0,
    SAY_DS_FIRST_ATTACK     =    1,
    SAY_DS_DOWN_1           =    2,
    SAY_DS_DOWN_2           =    3,
    SAY_DS_DOWN_3           =    4,
    SAY_DS_PROLOGUE         =    5,

    SAY_DEFIAS_FIRST_ATTACK =    0,

    SPELL_SHOOT             = 6660,
    QUEST_TOME_VALOR        = 1651,
    NPC_DEFIAS_RAIDER       = 6180,
    EQUIP_ID_RIFLE          = 2511,
    FACTION_ESCORTEE        =  250,
    EVENT_SHOOT             =    1,
    POINT_ID                =  999,
};

class npc_daphne_stilwell : public CreatureScript
{
public:
    npc_daphne_stilwell() : CreatureScript("npc_daphne_stilwell") { }

    bool OnQuestAccept(Player* player, Creature* creature, const Quest* quest)
    {
        if (quest->GetQuestId() == QUEST_TOME_VALOR)
        {
            Position pos = { -11463, 1525.24, 50.9379, 0.f };
            if (!creature->IsWithinDist2d(&pos, 15.f))
                creature->AI()->Talk(SAY_DS_START);
            creature->setFaction(FACTION_ESCORTEE);
            creature->setActive(true);
            creature->GetMotionMaster()->MovePoint(POINT_ID, pos);

            if (npc_daphne_stilwellAI* pEscortAI = CAST_AI(npc_daphne_stilwell::npc_daphne_stilwellAI, creature->AI()))
                pEscortAI->playerGUID = player->GetGUID();
        }

        return true;
    }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_daphne_stilwellAI(creature);
    }

    struct npc_daphne_stilwellAI : public npc_escortAI
    {
        npc_daphne_stilwellAI(Creature* creature) : npc_escortAI(creature), summons(me) { }

        SummonList summons;
        uint8 textCounter;
        EventMap events;
        bool hasGun;
        bool sayDefiasFirstAttack;
        bool sayFirstAttack;
        uint64 playerGUID;

        void JustRespawned()
        {
            summons.DespawnAll();
            playerGUID = 0;
            hasGun = false;
            sayDefiasFirstAttack = true;
            sayFirstAttack = true;
            me->SetSheath(SHEATH_STATE_UNARMED);
            npc_escortAI::JustRespawned();
        }

        void MovementInform(uint32 type, uint32 id)
        {
            if (type == POINT_MOTION_TYPE && id == POINT_ID)
            {
                if (Player* player = ObjectAccessor::GetPlayer(*me, playerGUID))
                {
                    if (Quest const* quest = sObjectMgr->GetQuestTemplate(QUEST_TOME_VALOR))
                        Start(true, true, player->GetGUID(), quest, true);
                }
                else
                    me->DespawnOrUnsummon(1);
            }
            else
                npc_escortAI::MovementInform(type, id);
        }

        void WaypointReached(uint32 waypointId)
        {
            Player* player = GetPlayerForEscort();

            if (!player)
                return;

            switch (waypointId)
            {
                case 2:
                    me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_USE_STANDING);
                    break;
                case 3:
                    me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_ONESHOT_NONE);
                    hasGun = true;
                    me->SetSheath(SHEATH_STATE_RANGED);
                    break;
                case 6:
                    SetRun(false);
                    SetEscortPaused(true);
                    textCounter = SAY_DS_DOWN_1;
                    me->SummonCreature(NPC_DEFIAS_RAIDER, -11435.52f, 1601.26f, 68.06f, 4.1f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                    me->SummonCreature(NPC_DEFIAS_RAIDER, -11440.96f, 1599.69f, 66.35f, 4.09f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                    me->SummonCreature(NPC_DEFIAS_RAIDER, -11433.44f, 1594.24f, 66.99f, 4.05f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                    break;
                case 7:
                    SetEscortPaused(true);
                    me->SummonCreature(NPC_DEFIAS_RAIDER, -11435.52f, 1601.26f, 68.06f, 4.1f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                    me->SummonCreature(NPC_DEFIAS_RAIDER, -11440.96f, 1599.69f, 66.35f, 4.09f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                    me->SummonCreature(NPC_DEFIAS_RAIDER, -11433.44f, 1594.24f, 66.99f, 4.05f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                    me->SummonCreature(NPC_DEFIAS_RAIDER, -11428.29f, 1598.37f, 70.90f, 3.9f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                    break;
                case 8:
                    SetEscortPaused(true);
                    me->SummonCreature(NPC_DEFIAS_RAIDER, -11435.52f, 1601.26f, 68.06f, 4.1f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                    me->SummonCreature(NPC_DEFIAS_RAIDER, -11440.96f, 1599.69f, 66.35f, 4.09f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                    me->SummonCreature(NPC_DEFIAS_RAIDER, -11433.44f, 1594.24f, 66.99f, 4.05f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                    me->SummonCreature(NPC_DEFIAS_RAIDER, -11428.29f, 1598.37f, 70.90f, 3.9f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                    me->SummonCreature(NPC_DEFIAS_RAIDER, -11438.14f, 1607.6f, 70.94f, 4.38f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                    break;
                case 10:
                    Talk(SAY_DS_PROLOGUE);
                    break;
                case 13:
                    me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_USE_STANDING);
                    break;
                case 14:
                    me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_ONESHOT_NONE);
                    hasGun = false;
                    me->SetSheath(SHEATH_STATE_UNARMED);
                    break;
                case 19:
                    player->GroupEventHappens(QUEST_TOME_VALOR, me);
                    break;
            }
        }

        void EnterCombat(Unit* who)
        {
            events.Reset();

            if (me->IsValidAttackTarget(who))
            {
                AttackStart(who);

                if (hasGun)
                {
                    events.ScheduleEvent(EVENT_SHOOT, 0);

                    if (sayFirstAttack)
                    {
                        sayFirstAttack = false;
                        Talk(SAY_DS_FIRST_ATTACK);
                    }
                }
            }
        }

        void AttackStart(Unit* who)
        {
            if (hasGun)
                SetCombatMovement(false);

            npc_escortAI::AttackStart(who);
        }

        void JustSummoned(Creature* creature)
        {
            if (sayDefiasFirstAttack)
            {
                sayDefiasFirstAttack = false;
                creature->AI()->Talk(SAY_DEFIAS_FIRST_ATTACK);
            }

            creature->SetHomePosition(me->GetHomePosition());
            creature->AI()->AttackStart(me);
            creature->AddThreat(me, 0.0f);
            summons.Summon(creature);
        }

        void SummonedCreatureDies(Creature* creature, Unit*)
        {
            summons.Despawn(creature);

            if (summons.empty() && me->IsAlive())
            {
                SetEscortPaused(false);
                Talk(textCounter++, GetPlayerForEscort());
            }
        }

        void UpdateEscortAI(uint32 diff)
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            switch(events.ExecuteEvent())
            {
                case EVENT_SHOOT:
                    DoCastVictim(SPELL_SHOOT, false);
                    events.ScheduleEvent(EVENT_SHOOT, urand(2300, 3900));
                    break;
            }

            DoMeleeAttackIfReady();
        }
    };
};

void AddSC_westfall()
{
    new npc_daphne_stilwell();
}
