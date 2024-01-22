/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

/* ScriptData
SDName: Sholazar_Basin
SD%Complete: 100
SDComment: Quest support: 11253, 11241.
SDCategory: howling_fjord
EndScriptData */

/* ContentData
npc_plaguehound_tracker
npc_apothecary_hanes
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "PassiveAI.h"
#include "Player.h"
#include "SpellInfo.h"

// Ours
class npc_attracted_reef_bull : public CreatureScript
{
public:
    npc_attracted_reef_bull() : CreatureScript("npc_attracted_reef_bull") { }

    struct npc_attracted_reef_bullAI : public NullCreatureAI
    {
        npc_attracted_reef_bullAI(Creature* creature) : NullCreatureAI(creature)
        {
            me->SetDisableGravity(true);
            if (me->IsSummon())
                if (Unit* owner = me->ToTempSummon()->GetSummoner())
                    me->GetMotionMaster()->MovePoint(0, *owner);
        }

        void MovementInform(uint32  /*type*/, uint32  /*id*/)
        {
            if (Creature* cow = me->FindNearestCreature(24797, 5.0f, true))
            {
                me->CastSpell(me, 44460, true);
                me->DespawnOrUnsummon(10000);
                cow->CastSpell(cow, 44460, true);
                cow->DespawnOrUnsummon(10000);
                if (me->IsSummon())
                    if (Unit* owner = me->ToTempSummon()->GetSummoner())
                        owner->CastSpell(owner, 44463, true);
            }
        }

        void SpellHit(Unit* caster, const SpellInfo* spellInfo)
        {
            if (caster && spellInfo->Id == 44454)
                me->GetMotionMaster()->MovePoint(0, *caster);
        }
    };

    CreatureAI *GetAI(Creature* creature) const
    {
        return new npc_attracted_reef_bullAI(creature);
    }
};

// The cleansing
enum TurmoilTexts
{
    SAY_TURMOIL_0                = 0,
    SAY_TURMOIL_1                = 1,
    SAY_TURMOIL_HALF_HP          = 2,
    SAY_TURMOIL_DEATH            = 3,
};

class npc_your_inner_turmoil : public CreatureScript
{
public:
    npc_your_inner_turmoil() : CreatureScript("npc_your_inner_turmoil") { }

    struct npc_your_inner_turmoilAI : public ScriptedAI
    {
        npc_your_inner_turmoilAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 timer;
        short phase;
        bool health50;

        void Reset()
        {
            timer = 0;
            phase = 0;
            health50 = false;
        }

        void UpdateAI(uint32 diff)
        {
            if (timer >= 6000 && phase < 2)
            {
                phase++;
                setphase(phase);
                timer = 0;
            }

            timer += diff;

            ScriptedAI::UpdateAI(diff);
        }

        void DamageTaken(Unit*, uint32& /*damage*/, DamageEffectType  /*damagetype*/, SpellSchoolMask  /*damageSchoolMask*/)
        {
            if (HealthBelowPct(50) && !health50)
            {
                Talk(SAY_TURMOIL_HALF_HP, me->ToTempSummon()->GetSummoner()->ToPlayer());
                health50 = true;
            }
        }

        void JustDied(Unit* /*killer*/)
        {
            Talk(SAY_TURMOIL_DEATH, me->ToTempSummon()->GetSummoner()->ToPlayer());
        }

        void setphase(short phase)
        {
            Unit* summoner = me->ToTempSummon() ? me->ToTempSummon()->GetSummoner() : NULL;
            if (!summoner || summoner->GetTypeId() != TYPEID_PLAYER)
                return;

            switch (phase)
            {
                case 1:
                    Talk(SAY_TURMOIL_0, summoner->ToPlayer());
                    return;
                case 2:
                    Talk(SAY_TURMOIL_1, summoner->ToPlayer());
                    me->SetLevel(summoner->getLevel());
                    me->setFaction(14);
                    if (me->GetExactDist(summoner) < 50.0f)
                    {
                        me->UpdatePosition(summoner->GetPositionX(), summoner->GetPositionY(), summoner->GetPositionZ(), 0.0f, true);
                        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                        summoner->CastSpell(me, 50218, true); // clone caster
                        AttackStart(summoner);
                    }
            }
        }
    };

    CreatureAI *GetAI(Creature* creature) const
    {
        return new npc_your_inner_turmoilAI(creature);
    }
};


// Theirs
/*######
## npc_apothecary_hanes
######*/
enum Entries
{
    NPC_APOTHECARY_HANES         = 23784,
    FACTION_ESCORTEE_A           = 774,
    FACTION_ESCORTEE_H           = 775,
    NPC_HANES_FIRE_TRIGGER       = 23968,
    QUEST_TRAIL_OF_FIRE          = 11241,
    SPELL_COSMETIC_LOW_POLY_FIRE = 56274,
    SPELL_HEALING_POTION         = 17534
};

class npc_apothecary_hanes : public CreatureScript
{
public:
    npc_apothecary_hanes() : CreatureScript("npc_apothecary_hanes") { }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == QUEST_TRAIL_OF_FIRE)
        {
            creature->setFaction(player->GetTeamId() == TEAM_ALLIANCE ? FACTION_ESCORTEE_A : FACTION_ESCORTEE_H);
            CAST_AI(npc_escortAI, (creature->AI()))->Start(true, false, player->GetGUID());
        }
        return true;
    }

    struct npc_Apothecary_HanesAI : public npc_escortAI
    {
        npc_Apothecary_HanesAI(Creature* creature) : npc_escortAI(creature){ }
        uint32 PotTimer;

        void Reset()
        {
            SetDespawnAtFar(false);
            PotTimer = 10000; //10 sec cooldown on potion
        }

        void JustDied(Unit* /*killer*/)
        {
            if (Player* player = GetPlayerForEscort())
                player->FailQuest(QUEST_TRAIL_OF_FIRE);
        }

        void UpdateEscortAI(uint32 diff)
        {
            if (HealthBelowPct(75))
            {
                if (PotTimer <= diff)
                {
                    DoCast(me, SPELL_HEALING_POTION, true);
                    PotTimer = 10000;
                } else PotTimer -= diff;
            }
            if (GetAttack() && UpdateVictim())
                DoMeleeAttackIfReady();
        }

        void WaypointReached(uint32 waypointId)
        {
            Player* player = GetPlayerForEscort();
            if (!player)
                return;

            switch (waypointId)
            {
                case 1:
                    me->SetReactState(REACT_AGGRESSIVE);
                    SetRun(true);
                    break;
                case 23:
                    player->GroupEventHappens(QUEST_TRAIL_OF_FIRE, me);
                    me->DespawnOrUnsummon();
                    break;
                case 5:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER, 10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    SetRun(false);
                    break;
                case 6:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER, 10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    SetRun(true);
                    break;
                case 8:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER, 10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    SetRun(false);
                    break;
                case 9:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER, 10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    break;
                case 10:
                    SetRun(true);
                    break;
                case 13:
                    SetRun(false);
                    break;
                case 14:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER, 10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    SetRun(true);
                    break;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_Apothecary_HanesAI(creature);
    }
};

/*######
## npc_plaguehound_tracker
######*/

enum Plaguehound
{
    QUEST_SNIFF_OUT_ENEMY        = 11253
};

class npc_plaguehound_tracker : public CreatureScript
{
public:
    npc_plaguehound_tracker() : CreatureScript("npc_plaguehound_tracker") { }

    struct npc_plaguehound_trackerAI : public npc_escortAI
    {
        npc_plaguehound_trackerAI(Creature* creature) : npc_escortAI(creature) { }

        void Reset()
        {
            uint64 summonerGUID = 0;

            if (me->IsSummon())
                if (Unit* summoner = me->ToTempSummon()->GetSummoner())
                    if (summoner->GetTypeId() == TYPEID_PLAYER)
                        summonerGUID = summoner->GetGUID();

            if (!summonerGUID)
                return;

            me->SetWalk(true);
            Start(false, false, summonerGUID);
        }

        void WaypointReached(uint32 waypointId)
        {
            if (waypointId != 26)
                return;

            me->DespawnOrUnsummon();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_plaguehound_trackerAI(creature);
    }
};

enum SummonSpells
{
    SPELL_SUMMON_BABY_RIVEN_WIDOWS        = 43275,
    SPELL_SUMMON_DARKCLAW_BAT             = 43276,
    SPELL_SUMMON_FANGGORE_WORG            = 43277,
    SPELL_SUMMON_GJALERBRON_RUNECASTER    = 43278,
    SPELL_SUMMON_GJALERBRON_SLEEPWATCHER  = 43279,
    SPELL_SUMMON_GJALERBRON_WARRIOR       = 43280,
    SPELL_SUMMON_PUTRID_HORROR            = 43281,
    SPELL_SUMMON_WINTERSKORN_BERSERKER    = 43282,
    SPELL_SUMMON_WINTERSKORN_WOODSMAN     = 43283,
    SPELL_SUMMON_WINTERSKORN_TRIBESMAN    = 43284,
    SPELL_SUMMON_WINTERSKORN_ORACLE       = 43285,
    SPELL_SUMMON_FREED_MIST_WHISPER_SCOUT = 43289,
    NPC_MIST_WHISPER_SCOUT                = 24211
};

const uint32 rivenWidowCocoonVictims[11] =
{
    SPELL_SUMMON_BABY_RIVEN_WIDOWS,
    SPELL_SUMMON_DARKCLAW_BAT,
    SPELL_SUMMON_FANGGORE_WORG,
    SPELL_SUMMON_GJALERBRON_RUNECASTER,
    SPELL_SUMMON_GJALERBRON_SLEEPWATCHER,
    SPELL_SUMMON_GJALERBRON_WARRIOR,
    SPELL_SUMMON_PUTRID_HORROR,
    SPELL_SUMMON_WINTERSKORN_BERSERKER,
    SPELL_SUMMON_WINTERSKORN_WOODSMAN,
    SPELL_SUMMON_WINTERSKORN_TRIBESMAN,
    SPELL_SUMMON_WINTERSKORN_ORACLE
};

class npc_riven_widow_cocoon : public CreatureScript
{
public:
    npc_riven_widow_cocoon() : CreatureScript("npc_riven_widow_cocoon") { }

    struct npc_riven_widow_cocoonAI : public ScriptedAI
    {
        npc_riven_widow_cocoonAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset() override { }
        void EnterCombat(Unit* /*who*/) override { }
        void MoveInLineOfSight(Unit* /*who*/) override { }
        void UpdateAI(uint32 /*diff*/) override { }

        void JustDied(Unit* killer) override
        {
            if (!killer || killer->GetTypeId() != TYPEID_PLAYER)
                return;

            Player* player = killer->ToPlayer();

            if (roll_chance_i(25))
            {
                player->CastSpell(me, SPELL_SUMMON_FREED_MIST_WHISPER_SCOUT, true);
                player->KilledMonsterCredit(NPC_MIST_WHISPER_SCOUT, 0);
            }
            else
                player->CastSpell(me, rivenWidowCocoonVictims[urand(0, 10)], true);
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_riven_widow_cocoonAI(creature);
    }
};

void AddSC_howling_fjord()
{
    // Ours
    new npc_attracted_reef_bull();
    new npc_your_inner_turmoil();

    // Theirs
    new npc_apothecary_hanes();
    new npc_plaguehound_tracker();
    new npc_riven_widow_cocoon();
 }
