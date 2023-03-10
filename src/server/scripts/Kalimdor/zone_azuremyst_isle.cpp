/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

/* ScriptData
SDName: Azuremyst_Isle
SD%Complete: 75
SDComment: Quest support: 9283, 9537, 9582, 9554, 9531, ? (special flight path, proper model for mount missing). Injured Draenei cosmetic only, 9582.
SDCategory: Azuremyst Isle
EndScriptData */

/* ContentData
npc_draenei_survivor
npc_engineer_spark_overgrind
npc_injured_draenei
npc_magwin
npc_geezle
go_ravager_cage
npc_death_ravager
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedEscortAI.h"
#include "ScriptedGossip.h"
#include "Cell.h"
#include "CellImpl.h"
#include "GridNotifiersImpl.h"
#include "GridNotifiers.h"

/*######
## npc_draenei_survivor
######*/

enum draeneiSurvivor
{
    SAY_HEAL            = 0,
    SAY_HELP            = 1,
    SPELL_IRRIDATION    = 35046,
    SPELL_STUNNED       = 28630,

    EVENT_SAY_HELP      = 1,
    EVENT_SAY_THANKS    = 2,
    EVENT_RUN_AWAY      = 3
};

class npc_draenei_survivor : public CreatureScript
{
public:
    npc_draenei_survivor() : CreatureScript("npc_draenei_survivor") { }

    struct npc_draenei_survivorAI : public ScriptedAI
    {
        npc_draenei_survivorAI(Creature* creature) : ScriptedAI(creature) { }

        uint64 pCaster;
        bool CanSayHelp;
        EventMap events;

        void Reset()
        {
            events.Reset();
            pCaster = 0;
            CanSayHelp = true;

            DoCast(me, SPELL_IRRIDATION, true);

            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE);
            me->SetRegeneratingHealth(false);
            me->SetHealth(me->CountPctFromMaxHealth(10));
            me->SetStandState(UNIT_STAND_STATE_SLEEP);
        }

        void EnterCombat(Unit* /*who*/) { }

        void MoveInLineOfSight(Unit* who)
        {
            if (CanSayHelp && who->GetTypeId() == TYPEID_PLAYER && me->IsFriendlyTo(who) && me->IsWithinDistInMap(who, 25.0f))
            {
                //Random switch between 4 texts
                Talk(SAY_HELP, who);
                CanSayHelp = false;
                events.ScheduleEvent(EVENT_SAY_HELP, 20000);
            }
        }

        void SpellHit(Unit* Caster, const SpellInfo* Spell)
        {
            if (Spell->SpellFamilyFlags[2] & 0x080000000)
            {
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE);
                me->SetStandState(UNIT_STAND_STATE_STAND);

                DoCast(me, SPELL_STUNNED, true);

                pCaster = Caster->GetGUID();

                CanSayHelp = false;
                events.CancelEvent(EVENT_SAY_HELP);
                events.ScheduleEvent(EVENT_SAY_THANKS, 5000);
            }
        }

        void UpdateAI(uint32 diff)
        {
            events.Update(diff);

            switch (events.ExecuteEvent())
            {
                case EVENT_SAY_HELP:
                    CanSayHelp = true;
                    events.ScheduleEvent(EVENT_SAY_HELP, 20000);
                    break;
                case EVENT_SAY_THANKS:
                    me->RemoveAurasDueToSpell(SPELL_IRRIDATION);

                    if (Player* player = ObjectAccessor::GetPlayer(*me, pCaster))
                    {
                        me->SetFacingToObject(player);
                        Talk(SAY_HEAL, player);
                        player->TalkedToCreature(me->GetEntry(), me->GetGUID());
                    }
                    events.ScheduleEvent(EVENT_RUN_AWAY, 3000);
                    break;
                case EVENT_RUN_AWAY:
                    me->DespawnOrUnsummon(2500);
                    me->RemoveAurasDueToSpell(SPELL_STUNNED);
                    me->GetMotionMaster()->Clear();
                    float x, y, z;
                    me->GetNearPoint(me, x, y, z, me->GetCombatReach(), 20.0f, me->GetAngle(-4115.053711f, -13754.831055f));
                    me->GetMotionMaster()->MovePoint(0, x, y, z);
                    break;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_draenei_survivorAI(creature);
    }
};

/*######
## npc_engineer_spark_overgrind
######*/

enum Overgrind
{
    SPARK_GUID           = 61966,

    SPARK_SAY_0          =     0,
    SPARK_SAY_1          =     1,
    SPARK_SAY_2          =     2,
    SPARK_SAY_3          =     3,
    SPARK_SAY_4          =     4,
    SPARK_SAY_5          =     5,
    SPARK_SAY_6          =     6,

    FACTION_HOSTILE      =    14,
    SPELL_DYNAMITE       =  7978,

    EVENT_SPARK_DYNAMITE =     1,
    EVENT_SPARK_STOP_WP  =     2,
    EVENT_SPARK_KNEEL    =     3,
    EVENT_SPARK_START_WP =     4,
    EVENT_SPARK_SAY_2    =     5,
    EVENT_SPARK_SAY_3    =     6,
    EVENT_SPARK_SAY_4    =     7,
    EVENT_SPARK_SAY_5    =     8,
    EVENT_SPARK_SAY_6    =     9
};

class npc_engineer_spark_overgrind : public CreatureScript
{
public:
    npc_engineer_spark_overgrind() : CreatureScript("npc_engineer_spark_overgrind") { }

    struct npc_engineer_spark_overgrindAI : public ScriptedAI
    {
        npc_engineer_spark_overgrindAI(Creature* creature) : ScriptedAI(creature)
        {
            if (creature->GetGUIDLow() == SPARK_GUID)
                IsTreeEvent = false;
            else
                IsTreeEvent = true;
        }

        void Reset()
        {
            if (IsTreeEvent)
                return;

            eventsOOC.Reset();
            eventsIC.Reset();
            me->GetMotionMaster()->InitDefault();
            me->setFaction(me->GetCreatureTemplate()->faction);
            me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            PlayerGUID = 0;
            eventsOOC.ScheduleEvent(EVENT_SPARK_STOP_WP, urand(120000, 150000));
            eventsIC.ScheduleEvent(EVENT_SPARK_DYNAMITE, urand(8000, 15000));
        }

        void sGossipSelect(Player* player, uint32 /*sender*/, uint32 /*action*/)
        {
            PlayerGUID = player->GetGUID();
            me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            eventsOOC.Reset();
            me->StopMovingOnCurrentPos();
            me->SetFacingToObject(player);
            CloseGossipMenuFor(player);
            eventsOOC.ScheduleEvent(EVENT_SPARK_SAY_2, 1000);
        }

        void UpdateAI(uint32 diff)
        {
            if (IsTreeEvent)
                return;

            if (!UpdateVictim())
            {
                eventsOOC.Update(diff);

                switch (eventsOOC.ExecuteEvent())
                {
                    case EVENT_SPARK_STOP_WP:
                        me->StopMovingOnCurrentPos();
                        me->HandleEmoteCommand(EMOTE_ONESHOT_KNEEL);
                        Talk(SPARK_SAY_0);
                        eventsOOC.ScheduleEvent(EVENT_SPARK_KNEEL, 2000);
                        break;
                    case EVENT_SPARK_KNEEL:
                        me->HandleEmoteCommand(EMOTE_ONESHOT_KNEEL);
                        eventsOOC.ScheduleEvent(EVENT_SPARK_START_WP, 3000);
                        break;
                    case EVENT_SPARK_START_WP:
                        Talk(SPARK_SAY_1);
                        me->GetMotionMaster()->ReinitializeMovement();
                        eventsOOC.ScheduleEvent(EVENT_SPARK_STOP_WP, urand(120000, 150000));
                        break;
                    case EVENT_SPARK_SAY_2:
                        if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID))
                            Talk(SPARK_SAY_2, player);
                        eventsOOC.ScheduleEvent(EVENT_SPARK_SAY_3, 3000);
                        break;
                    case EVENT_SPARK_SAY_3:
                        if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID))
                            Talk(SPARK_SAY_3, player);
                        eventsOOC.ScheduleEvent(EVENT_SPARK_SAY_4, 7000);
                        break;
                    case EVENT_SPARK_SAY_4:
                        if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID))
                            Talk(SPARK_SAY_4, player);
                        eventsOOC.ScheduleEvent(EVENT_SPARK_SAY_5, 4000);
                        break;
                    case EVENT_SPARK_SAY_5:
                        if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID))
                            Talk(SPARK_SAY_5, player);
                        eventsOOC.ScheduleEvent(EVENT_SPARK_SAY_6, 2000);
                        break;
                    case EVENT_SPARK_SAY_6:
                        if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID))
                        {
                            Talk(SPARK_SAY_6, player);
                            me->setFaction(FACTION_HOSTILE);
                            me->GetMotionMaster()->MoveChase(player);
                            me->Attack(player, true);
                        }
                        else
                            Reset();
                        break;
                }

                return;
            }

            eventsIC.Update(diff);

            switch (eventsIC.ExecuteEvent())
            {
                case EVENT_SPARK_DYNAMITE:
                    DoCastVictim(SPELL_DYNAMITE);
                    eventsIC.ScheduleEvent(EVENT_SPARK_DYNAMITE, urand(8000, 15000));
                    break;
            }

            DoMeleeAttackIfReady();
        }

    private:
        EventMap eventsOOC;
        EventMap eventsIC;
        uint64   PlayerGUID;
        bool     IsTreeEvent;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_engineer_spark_overgrindAI(creature);
    }
};

/*######
## npc_injured_draenei
######*/

class npc_injured_draenei : public CreatureScript
{
public:
    npc_injured_draenei() : CreatureScript("npc_injured_draenei") { }

    struct npc_injured_draeneiAI : public ScriptedAI
    {
        npc_injured_draeneiAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset()
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);
            me->SetHealth(me->CountPctFromMaxHealth(15));
            switch (urand(0, 1))
            {
                case 0:
                    me->SetStandState(UNIT_STAND_STATE_SIT);
                    break;

                case 1:
                    me->SetStandState(UNIT_STAND_STATE_SLEEP);
                    break;
            }
        }

        void EnterCombat(Unit* /*who*/) { }

        void MoveInLineOfSight(Unit* /*who*/) { }

        void UpdateAI(uint32 /*diff*/) { }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_injured_draeneiAI(creature);
    }
};

/*######
## npc_magwin
######*/

enum Magwin
{
    SAY_START                   = 0,
    SAY_AGGRO                   = 1,
    SAY_PROGRESS                = 2,
    SAY_END1                    = 3,
    SAY_END2                    = 4,
    EMOTE_HUG                   = 5,
    NPC_COWLEN                  = 17311,
    SAY_COWLEN                  = 0,
    EVENT_ACCEPT_QUEST          = 1,
    EVENT_START_ESCORT          = 2,
    EVENT_STAND                 = 3,
    EVENT_TALK_END              = 4,
    EVENT_COWLEN_TALK           = 5,
    QUEST_A_CRY_FOR_HELP        = 9528,
    FACTION_ESCORTEE            = 113
};

class npc_magwin : public CreatureScript
{
public:
    npc_magwin() : CreatureScript("npc_magwin") { }

    struct npc_magwinAI : public npc_escortAI
    {
        npc_magwinAI(Creature* creature) : npc_escortAI(creature) { }

        void Reset()
        {
            _events.Reset();
        }

        void EnterCombat(Unit* who)
        {
            Talk(SAY_AGGRO, who);
        }

        void sQuestAccept(Player* player, Quest const* quest)
        {
            if (quest->GetQuestId() == QUEST_A_CRY_FOR_HELP)
            {
                _player = player->GetGUID();
                _events.ScheduleEvent(EVENT_ACCEPT_QUEST, 2000);
            }
        }

        void WaypointReached(uint32 waypointId)
        {
            if (Player* player = GetPlayerForEscort())
            {
                switch (waypointId)
                {
                    case 45:
                        Talk(SAY_PROGRESS, player);
                        break;
                    case 71:
                        player->GroupEventHappens(QUEST_A_CRY_FOR_HELP, me);
                        _events.ScheduleEvent(EVENT_TALK_END, 2000);
                        SetRun(true);
                        break;
                    case 73:
                        if (Creature* cowlen = me->FindNearestCreature(NPC_COWLEN, 50.0f, true))
                        {
                            Talk(EMOTE_HUG, cowlen);
                            Talk(SAY_END2, player);
                        }
                        break;
                    case 74:
                        if (Creature* cowlen = me->FindNearestCreature(NPC_COWLEN, 50.0f, true))
                        {
                            cowlen->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP | UNIT_NPC_FLAG_QUESTGIVER);
                            cowlen->AI()->EnterEvadeMode();
                        }
                        break;
                }
            }
        }

        void UpdateEscortAI(uint32 diff)
        {
            _events.Update(diff);
            if (uint32 eventId = _events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_ACCEPT_QUEST:
                        if (Player* player = ObjectAccessor::GetPlayer(*me, _player))
                            Talk(SAY_START, player);
                        me->setActive(true);
                        me->setFaction(FACTION_ESCORTEE);
                        _events.ScheduleEvent(EVENT_START_ESCORT, 1000);
                        break;
                    case EVENT_START_ESCORT:
                        if (Player* player = ObjectAccessor::GetPlayer(*me, _player))
                            npc_escortAI::Start(true, false, player->GetGUID(), sObjectMgr->GetQuestTemplate(QUEST_A_CRY_FOR_HELP));
                        _events.ScheduleEvent(EVENT_STAND, 2000);
                        break;
                    case EVENT_STAND: // Remove kneel standstate. Using a separate delayed event because it causes unwanted delay before starting waypoint movement.
                        me->SetStandState(UNIT_STAND_STATE_STAND);
                        break;
                    case EVENT_TALK_END:
                        if (Player* player = ObjectAccessor::GetPlayer(*me, _player))
                            Talk(SAY_END1, player);
                        _events.ScheduleEvent(EVENT_COWLEN_TALK, 2000);
                        break;
                    case EVENT_COWLEN_TALK:
                        if (Creature* cowlen = me->FindNearestCreature(NPC_COWLEN, 50.0f, true))
                        {
                            cowlen->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP | UNIT_NPC_FLAG_QUESTGIVER);
                            cowlen->SetStandState(UNIT_STAND_STATE_STAND);
                            cowlen->AI()->Talk(SAY_COWLEN);
                            cowlen->GetMotionMaster()->MovePoint(0, -5355.42, -11173.2, 6.86411);
                        }
                        break;
                }
            }
            npc_escortAI::UpdateEscortAI(diff);
        }
    private:
        EventMap _events;
        uint64 _player;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_magwinAI(creature);
    }
};

/*######
## npc_geezle
######*/

enum Geezle
{
    QUEST_TREES_COMPANY = 9531,

    SPELL_TREE_DISGUISE = 30298,

    SPARK_SAY_7     = 7,
    GEEZLE_SAY_0    = 0,
    SPARK_SAY_8     = 8,
    SPARK_SAY_9     = 9,
    GEEZLE_SAY_1    = 1,
    SPARK_SAY_10    = 10,
    SPARK_SAY_11    = 11,
    GEEZLE_SAY_2    = 2,

    NPC_SPARK       = 17243,
    GO_NAGA_FLAG    = 181694
};

Position const SparkPos = {-5029.91f, -11291.79f, 8.096f, 0.0f};

class npc_geezle : public CreatureScript
{
public:
    npc_geezle() : CreatureScript("npc_geezle") { }

    struct npc_geezleAI : public ScriptedAI
    {
        npc_geezleAI(Creature* creature) : ScriptedAI(creature) { }

        uint64 SparkGUID;

        uint8 Step;
        uint32 SayTimer;

        bool EventStarted;

        void Reset()
        {
            SparkGUID = 0;
            Step = 0;
            StartEvent();
        }

        void EnterCombat(Unit* /*who*/) { }

        void StartEvent()
        {
            Step = 0;
            EventStarted = true;
            if (Creature* Spark = me->SummonCreature(NPC_SPARK, SparkPos, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 150000))
            {
                SparkGUID = Spark->GetGUID();
                Spark->setActive(true);
                Spark->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            }
            SayTimer = 8000;
        }

        uint32 NextStep(uint8 Step)
        {
            Creature* Spark = ObjectAccessor::GetCreature(*me, SparkGUID);
            if (!Spark)
            {
                me->DespawnOrUnsummon(1);
                return 5000;
            }

            switch (Step)
            {
                case 0:
                    Spark->GetMotionMaster()->MovePoint(0, -5080.70f, -11253.61f, 0.56f);
                    me->GetMotionMaster()->MovePoint(0, -5092.26f, -11252, 0.71f);
                    return 9000;
                case 1:
                    DespawnNagaFlag(true);
                    Spark->AI()->Talk(SPARK_SAY_7);
                    return 1000;
                case 2:
                    Talk(GEEZLE_SAY_0, Spark);
                    Spark->SetInFront(me);
                    me->SetInFront(Spark);
                    return 5000;
                case 3:
                    Spark->AI()->Talk(SPARK_SAY_8);
                    return 7000;
                case 4:
                    Spark->AI()->Talk(SPARK_SAY_9);
                    return 8000;
                case 5:
                    Talk(GEEZLE_SAY_1, Spark);
                    return 8000;
                case 6:
                    Spark->AI()->Talk(SPARK_SAY_10);
                    return 9000;
                case 7:
                    Spark->AI()->Talk(SPARK_SAY_11);
                    return 8000;
                case 8:
                    Talk(GEEZLE_SAY_2, Spark);
                    return 2000;
                case 9:
                    me->GetMotionMaster()->MoveTargetedHome();
                    Spark->GetMotionMaster()->MovePoint(0, SparkPos);
                    CompleteQuest();
                    return 9000;
                case 10:
                    Spark->DespawnOrUnsummon(1);
                    DespawnNagaFlag(false);
                    me->DespawnOrUnsummon(1);
                    return 5000;
                default: return 99999999;
            }
        }

        // will complete Tree's company quest for all nearby players that are disguised as trees
        void CompleteQuest()
        {
            float radius = 50.0f;
            std::list<Player*> players;
            acore::AnyPlayerInObjectRangeCheck checker(me, radius);
            acore::PlayerListSearcher<acore::AnyPlayerInObjectRangeCheck> searcher(me, players, checker);
            me->VisitNearbyWorldObject(radius, searcher);

            for (std::list<Player*>::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                if ((*itr)->GetQuestStatus(QUEST_TREES_COMPANY) == QUEST_STATUS_INCOMPLETE && (*itr)->HasAura(SPELL_TREE_DISGUISE))
                    (*itr)->KilledMonsterCredit(NPC_SPARK, 0);
        }

        void DespawnNagaFlag(bool despawn)
        {
            std::list<GameObject*> FlagList;
            me->GetGameObjectListWithEntryInGrid(FlagList, GO_NAGA_FLAG, 100.0f);

            if (!FlagList.empty())
            {
                for (std::list<GameObject*>::const_iterator itr = FlagList.begin(); itr != FlagList.end(); ++itr)
                {
                    if (despawn)
                        (*itr)->SetLootState(GO_JUST_DEACTIVATED);
                    else
                        (*itr)->Respawn();
                }
            }
            //else
            //    TC_LOG_ERROR("scripts", "SD2 ERROR: FlagList is empty!");
        }

        void UpdateAI(uint32 diff)
        {
            if (SayTimer <= diff)
            {
                if (EventStarted)
                    SayTimer = NextStep(Step++);
            }
            else
                SayTimer -= diff;
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_geezleAI(creature);
    }
};

enum RavegerCage
{
    NPC_DEATH_RAVAGER       = 17556,

    SPELL_REND              = 13443,
    SPELL_ENRAGING_BITE     = 30736,

    QUEST_STRENGTH_ONE      = 9582
};

class go_ravager_cage : public GameObjectScript
{
public:
    go_ravager_cage() : GameObjectScript("go_ravager_cage") { }

    bool OnGossipHello(Player* player, GameObject* go) override
    {
        go->UseDoorOrButton();
        if (player->GetQuestStatus(QUEST_STRENGTH_ONE) == QUEST_STATUS_INCOMPLETE)
        {
            if (Creature* ravager = go->FindNearestCreature(NPC_DEATH_RAVAGER, 5.0f, true))
            {
                ravager->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                ravager->SetReactState(REACT_AGGRESSIVE);
                ravager->AI()->AttackStart(player);
            }
        }
        return true;
    }
};

class npc_death_ravager : public CreatureScript
{
public:
    npc_death_ravager() : CreatureScript("npc_death_ravager") { }

    struct npc_death_ravagerAI : public ScriptedAI
    {
        npc_death_ravagerAI(Creature* creature) : ScriptedAI(creature){ }

        uint32 RendTimer;
        uint32 EnragingBiteTimer;

        void Reset()
        {
            RendTimer = 30000;
            EnragingBiteTimer = 20000;

            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SetReactState(REACT_PASSIVE);
        }

        void UpdateAI(uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (RendTimer <= diff)
            {
                DoCastVictim(SPELL_REND);
                RendTimer = 30000;
            }
            else RendTimer -= diff;

            if (EnragingBiteTimer <= diff)
            {
                DoCastVictim(SPELL_ENRAGING_BITE);
                EnragingBiteTimer = 15000;
            }
            else EnragingBiteTimer -= diff;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_death_ravagerAI(creature);
    }
};

/*########
## Quest: The Prophecy of Akida
########*/

enum BristlelimbCage
{
    QUEST_THE_PROPHECY_OF_AKIDA         = 9544,
    NPC_STILLPINE_CAPITIVE              = 17375,
    GO_BRISTELIMB_CAGE                  = 181714,

    CAPITIVE_SAY                        = 0,

    POINT_INIT                          = 1,
    EVENT_DESPAWN                       = 1,
};

class npc_stillpine_capitive : public CreatureScript
{
    public:
        npc_stillpine_capitive() : CreatureScript("npc_stillpine_capitive") { }

        struct npc_stillpine_capitiveAI : public ScriptedAI
        {
            npc_stillpine_capitiveAI(Creature* creature) : ScriptedAI(creature) { }

            void Reset()
            {
                if (GameObject* cage = me->FindNearestGameObject(GO_BRISTELIMB_CAGE, 5.0f))
                {
                    cage->SetLootState(GO_JUST_DEACTIVATED);
                    cage->SetGoState(GO_STATE_READY);
                }
                _events.Reset();
                _playerGUID = 0;
                _movementComplete = false;
            }

            void StartMoving(Player* owner)
            {
                if (owner)
                {
                    Talk(CAPITIVE_SAY, owner);
                    _playerGUID = owner->GetGUID();
                }
                Position pos;
                me->GetNearPosition(pos, 3.0f, 0.0f);
                me->GetMotionMaster()->MovePoint(POINT_INIT, pos);
            }

            void MovementInform(uint32 type, uint32 id)
            {
                if (type != POINT_MOTION_TYPE || id != POINT_INIT)
                    return;

                if (Player* player = ObjectAccessor::GetPlayer(*me, _playerGUID))
                    player->KilledMonsterCredit(me->GetEntry(), me->GetGUID());

                _movementComplete = true;
                _events.ScheduleEvent(EVENT_DESPAWN, 3500);
            }

            void UpdateAI(uint32 diff)
            {
                if (!_movementComplete)
                    return;

                _events.Update(diff);

                if (_events.ExecuteEvent() == EVENT_DESPAWN)
                    me->DespawnOrUnsummon();
            }

        private:
            uint64 _playerGUID;
            EventMap _events;
            bool _movementComplete;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_stillpine_capitiveAI(creature);
        }
};

class go_bristlelimb_cage : public GameObjectScript
{
public:
    go_bristlelimb_cage() : GameObjectScript("go_bristlelimb_cage") { }

    bool OnGossipHello(Player* player, GameObject* go) override
    {
        go->SetGoState(GO_STATE_READY);
        if (player->GetQuestStatus(QUEST_THE_PROPHECY_OF_AKIDA) == QUEST_STATUS_INCOMPLETE)
        {
            if (Creature* capitive = go->FindNearestCreature(NPC_STILLPINE_CAPITIVE, 5.0f, true))
            {
                go->ResetDoorOrButton();
                CAST_AI(npc_stillpine_capitive::npc_stillpine_capitiveAI, capitive->AI())->StartMoving(player);
                return false;
            }
        }
        return true;
    }
};

void AddSC_azuremyst_isle()
{
    new npc_draenei_survivor();
    new npc_engineer_spark_overgrind();
    new npc_injured_draenei();
    new npc_magwin();
    new npc_geezle();
    new npc_death_ravager();
    new go_ravager_cage();
    new npc_stillpine_capitive();
    new go_bristlelimb_cage();
}
