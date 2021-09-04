/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under GNU AGPL3 v3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

/* ScriptData
SDName: Silverpine_Forest
SD%Complete: 100
SDComment: Quest support: 435, 452
SDCategory: Silverpine Forest
EndScriptData */

/* ContentData
npc_deathstalker_erland
pyrewood_ambush
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedEscortAI.h"
#include "Player.h"

/*######
## npc_deathstalker_erland
######*/

enum Erland
{
    SAY_QUESTACCEPT     = 0,
    SAY_START           = 1,
    SAY_AGGRO           = 2,
    SAY_PROGRESS        = 3,
    SAY_LAST            = 4,

    SAY_RANE            = 0,
    SAY_RANE_ANSWER     = 5,
    SAY_MOVE_QUINN      = 6,

    SAY_QUINN           = 7,
    SAY_QUINN_ANSWER    = 0,
    SAY_BYE             = 8,

    QUEST_ESCORTING     = 435,
    NPC_RANE            = 1950,
    NPC_QUINN           = 1951
};

class npc_deathstalker_erland : public CreatureScript
{
public:
    npc_deathstalker_erland() : CreatureScript("npc_deathstalker_erland") { }

    struct npc_deathstalker_erlandAI : public npc_escortAI
    {
        npc_deathstalker_erlandAI(Creature* creature) : npc_escortAI(creature) { }

        void WaypointReached(uint32 waypointId)
        {
            Player* player = GetPlayerForEscort();
            if (!player)
                return;

            switch (waypointId)
            {
                case 2:
                    Talk(SAY_START, player);
                    break;
                case 14:
                    Talk(SAY_PROGRESS);
                    break;
                case 18:
                    Talk(SAY_LAST, player);
                    player->GroupEventHappens(QUEST_ESCORTING, me);
                    break;
                case 23:
                    if (Creature* rane = me->FindNearestCreature(NPC_RANE, 20.0f))
                    {
                        me->SetOrientation(me->GetAngle(rane));
                        rane->AI()->Talk(SAY_RANE);
                    }
                    break;
                case 24:
                    Talk(SAY_RANE_ANSWER);
                    break;
                case 25:
                    Talk(SAY_MOVE_QUINN);
                    break;
                case 34:
                    Talk(SAY_QUINN);
                    break;
                case 35:
                    if (Creature* quinn = me->FindNearestCreature(NPC_QUINN, 20.0f))
                        quinn->AI()->Talk(SAY_QUINN_ANSWER);
                    break;
                case 36:
                    Talk(SAY_BYE);
                    break;
            }
        }

        void Reset() { }

        void EnterCombat(Unit* who)
        {
            Talk(SAY_AGGRO, who);
        }
    };

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == QUEST_ESCORTING)
        {
            creature->AI()->Talk(SAY_QUESTACCEPT, player);

            if (npc_escortAI* pEscortAI = CAST_AI(npc_deathstalker_erland::npc_deathstalker_erlandAI, creature->AI()))
                pEscortAI->Start(true, false, player->GetGUID());
        }

        return true;
    }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_deathstalker_erlandAI(creature);
    }
};

/*######
## pyrewood_ambush
#######*/

enum PyrewoodAmbush
{
    QUEST_PYREWOOD_AMBUSH    =  452,
    NPCSAY_INIT              =    0,
    NPCSAY_END               =    1,
    WAIT_MS                  = 6000,

    NPC_COUNCILMAN_SMITHERS  = 2060,
    NPC_COUNCILMAN_THATCHER  = 2061,
    NPC_COUNCILMAN_HENDRICKS = 2062,
    NPC_COUNCILMAN_WILHELM   = 2063,
    NPC_COUNCILMAN_HARTIN    = 2064,
    NPC_COUNCILMAN_COOPER    = 2065,
    NPC_COUNCILMAN_HIGARTH   = 2066,
    NPC_COUNCILMAN_BRUNSWICK = 2067,
    NPC_LORD_MAYOR_MORRISON  = 2068
};

static float PyrewoodPoints[6][3] =
{
    // spawn position
    {-400.850f, 1513.64f, 18.8690f},
    {-397.320f, 1514.12f, 18.8687f},
    {-397.440f, 1511.09f, 18.8688f},
    // move position
    {-397.063f, 1502.06f, 19.7708f},
    {-397.237f, 1499.73f, 19.7708f},
    {-397.239f, 1497.00f, 19.7708f}
};

class pyrewood_ambush : public CreatureScript
{
public:
    pyrewood_ambush() : CreatureScript("pyrewood_ambush") { }

    bool OnQuestAccept(Player* player, Creature* creature, const Quest *quest)
    {
        if (quest->GetQuestId() == QUEST_PYREWOOD_AMBUSH && !CAST_AI(pyrewood_ambush::pyrewood_ambushAI, creature->AI())->QuestInProgress)
        {
            CAST_AI(pyrewood_ambush::pyrewood_ambushAI, creature->AI())->QuestInProgress = true;
            CAST_AI(pyrewood_ambush::pyrewood_ambushAI, creature->AI())->Phase = 0;
            CAST_AI(pyrewood_ambush::pyrewood_ambushAI, creature->AI())->KillCount = 0;
            CAST_AI(pyrewood_ambush::pyrewood_ambushAI, creature->AI())->PlayerGUID = player->GetGUID();
        }

        return true;
    }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new pyrewood_ambushAI(creature);
    }

    struct pyrewood_ambushAI : public ScriptedAI
    {
        pyrewood_ambushAI(Creature* creature) : ScriptedAI(creature), Summons(me)
        {
           QuestInProgress = false;
        }

        uint32 Phase;
        int8 KillCount;
        uint32 WaitTimer;
        uint64 PlayerGUID;
        SummonList Summons;

        bool QuestInProgress;

        void Reset()
        {
            me->SetReactState(REACT_DEFENSIVE);
            WaitTimer = WAIT_MS;

            if (!QuestInProgress) //fix reset values (see UpdateVictim)
            {
                Phase = 0;
                KillCount = 0;
                PlayerGUID = 0;
                Summons.DespawnAll();
                me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            }
        }

        void JustSummoned(Creature* summoned)
        {
            Summons.Summon(summoned);
            ++KillCount;
        }

        void SummonedCreatureDespawn(Creature* summoned)
        {
            Summons.Despawn(summoned);
            --KillCount;
        }

        void SummonCouncilMember(uint32 creatureId, int position)
        {
            if (Creature* summoned = me->SummonCreature(creatureId, PyrewoodPoints[position][0], PyrewoodPoints[position][1], PyrewoodPoints[position][2], 0.f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
            {
                summoned->SetReactState(REACT_DEFENSIVE);
                summoned->GetMotionMaster()->MovePoint(1, PyrewoodPoints[position + 3][0], PyrewoodPoints[position + 3][1], PyrewoodPoints[position + 3][2]);
            }
        }

        void JustDied(Unit* /*killer*/)
        {
            QuestInProgress = false;
            if (PlayerGUID)
                if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID))
                    if (player->GetQuestStatus(QUEST_PYREWOOD_AMBUSH) == QUEST_STATUS_INCOMPLETE)
                        player->FailQuest(QUEST_PYREWOOD_AMBUSH);
        }

        void UpdateAI(uint32 diff)
        {
            if (!QuestInProgress)
                return;

            if (KillCount && Phase < 6)
            {
                if (!UpdateVictim()) //reset() on target Despawn...
                    return;

                DoMeleeAttackIfReady();
                return;
            }

            switch (Phase)
            {
                case 0:
                    if (WaitTimer == WAIT_MS)
                    {
                        me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                        if (PlayerGUID)
                            if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID))
                                me->AI()->Talk(NPCSAY_INIT, player);
                    }

                    if (WaitTimer >= diff)
                    {
                        WaitTimer -= diff;
                        return;
                    }
                    break;
                case 1:
                    SummonCouncilMember(NPC_COUNCILMAN_SMITHERS, 1);
                    break;
                case 2:
                    SummonCouncilMember(NPC_COUNCILMAN_THATCHER, 2);
                    SummonCouncilMember(NPC_COUNCILMAN_HENDRICKS, 0);
                    break;
                case 3:
                    SummonCouncilMember(NPC_COUNCILMAN_WILHELM, 1);
                    SummonCouncilMember(NPC_COUNCILMAN_HARTIN, 2);
                    SummonCouncilMember(NPC_COUNCILMAN_COOPER, 0);
                    break;
                case 4:
                    SummonCouncilMember(NPC_COUNCILMAN_HIGARTH, 1);
                    SummonCouncilMember(NPC_COUNCILMAN_BRUNSWICK, 0);
                    SummonCouncilMember(NPC_LORD_MAYOR_MORRISON, 2);
                    break;
                case 5: //end
                    if (PlayerGUID)
                    {
                        if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID))
                        {
                            me->AI()->Talk(NPCSAY_END, player);
                            player->GroupEventHappens(QUEST_PYREWOOD_AMBUSH, me);
                        }
                    }
                    QuestInProgress = false;
                    Reset();
                    break;
            }
            ++Phase; //prepare next phase
        }
    };
};

/*######
## AddSC
######*/

void AddSC_silverpine_forest()
{
    new npc_deathstalker_erland();
    new pyrewood_ambush();
}
