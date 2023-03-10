/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

/* ScriptData
SDName: Ashenvale
SD%Complete: 70
SDComment: Quest support: 6544, 6482
SDCategory: Ashenvale Forest
EndScriptData */

/* ContentData
npc_ruul_snowhoof
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedEscortAI.h"
#include "Player.h"

/*####
# npc_ruul_snowhoof
####*/

enum RuulSnowhoof
{
    NPC_THISTLEFUR_URSA             =   3921,
    NPC_THISTLEFUR_TOTEMIC          =   3922,
    NPC_THISTLEFUR_PATHFINDER       =   3926,
    QUEST_FREEDOM_TO_RUUL           =   6482,
    FACTION_QUEST_RUUL              =    250,
    FACTION_RUUL                    =    714,
    GO_CAGE                         = 178147,
    SAY_RUUL_SNOWHOOF_GO            =      0,
    SAY_RUUL_SNOWHOOF_FREE          =      1,
    MODEL_RUUL_SNOWHOOF_BEAR_FORM   =  29421,
    SPELL_RUUL_SNOWHOOF_SHAPECHANGE =  20514
};

Position const RuulSnowhoofSummonsCoord[6] =
{
    { 3449.218018f, -587.825073f, 174.978867f, 4.714445f },
    { 3446.384521f, -587.830872f, 175.186279f, 4.714445f },
    { 3444.218994f, -587.835327f, 175.380600f, 4.714445f },
    { 3508.344482f, -492.024261f, 186.929031f, 4.145029f },
    { 3506.265625f, -490.531006f, 186.740128f, 4.239277f },
    { 3503.682373f, -489.393799f, 186.629684f, 4.349232f }
};

class npc_ruul_snowhoof : public CreatureScript
{
public:
    npc_ruul_snowhoof() : CreatureScript("npc_ruul_snowhoof") { }

    struct npc_ruul_snowhoofAI : public npc_escortAI
    {
        npc_ruul_snowhoofAI(Creature* creature) : npc_escortAI(creature) { }

        void Reset()
        {
            if (GameObject* Cage = me->FindNearestGameObject(GO_CAGE, 20))
                Cage->SetGoState(GO_STATE_READY);
        }

        void JustRespawned()
        {
            npc_escortAI::JustRespawned();
            me->SetDisplayId(MODEL_RUUL_SNOWHOOF_BEAR_FORM);
        }

        void InitializeAI()
        {
            me->SetDisplayId(MODEL_RUUL_SNOWHOOF_BEAR_FORM);
        }

        void EnterCombat(Unit* /*who*/) { }

        void JustDied(Unit* /*killer*/)
        {
            me->SetDisplayId(me->GetNativeDisplayId());
        }

        void JustSummoned(Creature* summoned)
        {
            summoned->AI()->AttackStart(me);
        }

        void sQuestAccept(Player* player, Quest const* quest)
        {
            if (quest->GetQuestId() == QUEST_FREEDOM_TO_RUUL)
                npc_escortAI::Start(true, false, player->GetGUID());
        }

        void WaypointReached(uint32 waypointId)
        {
            Player* player = GetPlayerForEscort();
            if (!player)
                return;

            switch (waypointId)
            {
                case 0:
                    me->SetUInt32Value(UNIT_FIELD_BYTES_1, 0);
                    if (GameObject* Cage = me->FindNearestGameObject(GO_CAGE, 20))
                        Cage->SetGoState(GO_STATE_ACTIVE);
                    break;
                case 1:
                    me->setFaction(FACTION_QUEST_RUUL);
                    Talk(SAY_RUUL_SNOWHOOF_GO, player);
                    break;
                case 13:
                    me->SummonCreature(NPC_THISTLEFUR_TOTEMIC, RuulSnowhoofSummonsCoord[0], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                    me->SummonCreature(NPC_THISTLEFUR_URSA, RuulSnowhoofSummonsCoord[1], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                    me->SummonCreature(NPC_THISTLEFUR_PATHFINDER, RuulSnowhoofSummonsCoord[2], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                    break;
                case 19:
                    me->SummonCreature(NPC_THISTLEFUR_TOTEMIC, RuulSnowhoofSummonsCoord[3], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                    me->SummonCreature(NPC_THISTLEFUR_URSA, RuulSnowhoofSummonsCoord[4], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                    me->SummonCreature(NPC_THISTLEFUR_PATHFINDER, RuulSnowhoofSummonsCoord[5], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                    break;
                case 41:
                    player->GroupEventHappens(QUEST_FREEDOM_TO_RUUL, me);
                    me->setFaction(FACTION_RUUL);
                    me->SetDisplayId(me->GetNativeDisplayId());
                    break;
                case 42:
                    me->SetInFront(player);
                    break;
                case 43:
                    Talk(SAY_RUUL_SNOWHOOF_FREE, player);
                    break;
                case 44:
                    me->SetWalk(false);
                    DoCast(SPELL_RUUL_SNOWHOOF_SHAPECHANGE);
                    break;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_ruul_snowhoofAI(creature);
    }
};

enum Muglash
{
    SAY_MUG_START1          = 0,
    SAY_MUG_START2          = 1,
    SAY_MUG_BRAZIER         = 2,
    SAY_MUG_BRAZIER_WAIT    = 3,
    SAY_MUG_ON_GUARD        = 4,
    SAY_MUG_REST            = 5,
    SAY_MUG_DONE            = 6,
    SAY_MUG_GRATITUDE       = 7,
    SAY_MUG_PATROL          = 8,
    SAY_MUG_RETURN          = 9,

    QUEST_VORSHA            = 6641,
    FACTION_QUEST_MUG       = 113,

    GO_NAGA_BRAZIER         = 178247,

    NPC_WRATH_RIDER         = 3713,
    NPC_WRATH_SORCERESS     = 3717,
    NPC_WRATH_RAZORTAIL     = 3712,

    NPC_WRATH_PRIESTESS     = 3944,
    NPC_WRATH_MYRMIDON      = 3711,
    NPC_WRATH_SEAWITCH      = 3715,

    NPC_VORSHA              = 12940,
    NPC_MUGLASH             = 12717
};

Position const FirstNagaCoord[3] =
{
    { 3603.504150f, 1122.631104f,  1.635f, 0.0f },        // rider
    { 3589.293945f, 1148.664063f,  5.565f, 0.0f },        // sorceress
    { 3609.925537f, 1168.759521f, -1.168f, 0.0f }         // razortail
};

Position const SecondNagaCoord[3] =
{
    { 3609.925537f, 1168.759521f, -1.168f, 0.0f },        // witch
    { 3645.652100f, 1139.425415f, 1.322f,  0.0f },        // priest
    { 3583.602051f, 1128.405762f, 2.347f,  0.0f }         // myrmidon
};

Position const VorshaCoord = {3633.056885f, 1172.924072f, -5.388f, 0.0f};

class npc_muglash : public CreatureScript
{
public:
    npc_muglash() : CreatureScript("npc_muglash") { }

    struct npc_muglashAI : public npc_escortAI
    {
        npc_muglashAI(Creature* creature) : npc_escortAI(creature) { }

        void Reset()
        {
            eventTimer = 10000;
            waveId = 0;
            _isBrazierExtinguished = false;
        }

        void EnterCombat(Unit* /*who*/)
        {
            if (Player* player = GetPlayerForEscort())
                if (HasEscortState(STATE_ESCORT_PAUSED))
                {
                    if (urand(0, 1))
                        Talk(SAY_MUG_ON_GUARD, player);
                    return;
                }
        }

        void JustDied(Unit* /*killer*/)
        {
            if (HasEscortState(STATE_ESCORT_ESCORTING))
                if (Player* player = GetPlayerForEscort())
                    player->FailQuest(QUEST_VORSHA);
        }

        void JustSummoned(Creature* summoned)
        {
            summoned->AI()->AttackStart(me);
        }

        void sQuestAccept(Player* player, Quest const* quest)
        {
            if (quest->GetQuestId() == QUEST_VORSHA)
            {
                Talk(SAY_MUG_START1);
                me->setFaction(FACTION_QUEST_MUG);
                npc_escortAI::Start(true, false, player->GetGUID());
            }
        }

            void WaypointReached(uint32 waypointId)
            {
                if (Player* player = GetPlayerForEscort())
                {
                    switch (waypointId)
                    {
                        case 0:
                            Talk(SAY_MUG_START2, player);
                            break;
                        case 24:
                            Talk(SAY_MUG_BRAZIER, player);

                            if (GameObject* go = GetClosestGameObjectWithEntry(me, GO_NAGA_BRAZIER, INTERACTION_DISTANCE*2))
                            {
                                go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                                SetEscortPaused(true);
                            }
                            break;
                        case 25:
                            Talk(SAY_MUG_GRATITUDE);
                            player->GroupEventHappens(QUEST_VORSHA, me);
                            break;
                        case 26:
                            Talk(SAY_MUG_PATROL);
                            break;
                        case 27:
                            Talk(SAY_MUG_RETURN);
                            break;
                    }
                }
            }

            void DoWaveSummon()
            {
                switch (waveId)
                {
                    case 1:
                        me->SummonCreature(NPC_WRATH_RIDER,     FirstNagaCoord[0], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                        me->SummonCreature(NPC_WRATH_SORCERESS, FirstNagaCoord[1], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                        me->SummonCreature(NPC_WRATH_RAZORTAIL, FirstNagaCoord[2], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                        break;
                    case 2:
                        me->SummonCreature(NPC_WRATH_PRIESTESS, SecondNagaCoord[0], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                        me->SummonCreature(NPC_WRATH_MYRMIDON,  SecondNagaCoord[1], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                        me->SummonCreature(NPC_WRATH_SEAWITCH,  SecondNagaCoord[2], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                        break;
                    case 3:
                        me->SummonCreature(NPC_VORSHA, VorshaCoord, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                        break;
                    case 4:
                        SetEscortPaused(false);
                        Talk(SAY_MUG_DONE);
                        break;
                }
            }

            void UpdateAI(uint32 diff)
            {
                npc_escortAI::UpdateAI(diff);

                if (!me->GetVictim())
                {
                    if (HasEscortState(STATE_ESCORT_PAUSED) && _isBrazierExtinguished)
                    {
                        if (eventTimer < diff)
                        {
                            ++waveId;
                            DoWaveSummon();
                            eventTimer = 10000;
                        }
                        else
                            eventTimer -= diff;
                    }
                    return;
                }
                DoMeleeAttackIfReady();
            }

    private:
        uint32 eventTimer;
        uint8  waveId;
    public:
        bool   _isBrazierExtinguished;

    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_muglashAI(creature);
    }
};

class go_naga_brazier : public GameObjectScript
{
public:
    go_naga_brazier() : GameObjectScript("go_naga_brazier") { }

    bool OnGossipHello(Player* /*player*/, GameObject* go) override
    {
        if (Creature* creature = GetClosestCreatureWithEntry(go, NPC_MUGLASH, INTERACTION_DISTANCE*2))
        {
            if (npc_muglash::npc_muglashAI* pEscortAI = CAST_AI(npc_muglash::npc_muglashAI, creature->AI()))
            {
                creature->AI()->Talk(SAY_MUG_BRAZIER_WAIT);

                pEscortAI->_isBrazierExtinguished = true;
                return false;
            }
        }

        return true;
    }
};

void AddSC_ashenvale()
{
    new npc_ruul_snowhoof();
    new npc_muglash();
    new go_naga_brazier();
}
