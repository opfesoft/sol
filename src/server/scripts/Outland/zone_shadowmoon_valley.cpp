/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

/* ScriptData
SDName: Shadowmoon_Valley
SD%Complete: 100
SDComment: Quest support: 10519, 10583, 10601, 10804, 10854, 10458, 10481, 10480, 10781, 10451. Vendor Drake Dealer Hurlunk.
SDCategory: Shadowmoon Valley
EndScriptData */

/* ContentData
npc_mature_netherwing_drake
npc_enslaved_netherwing_drake
npc_drake_dealer_hurlunk
npcs_flanis_swiftwing_and_kagrosh
npc_karynaku
npc_oronok_tornheart
npc_earthmender_wilda
npc_torloth_the_magnificent
npc_illidari_spawn
npc_lord_illidan_stormrage
go_crystal_prison
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "Group.h"
#include "SpellScript.h"
#include "Player.h"
#include "WorldSession.h"

// Ours
class spell_q10612_10613_the_fel_and_the_furious : public SpellScriptLoader
{
    public:
        spell_q10612_10613_the_fel_and_the_furious() : SpellScriptLoader("spell_q10612_10613_the_fel_and_the_furious") { }

        class spell_q10612_10613_the_fel_and_the_furious_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_q10612_10613_the_fel_and_the_furious_SpellScript);

            void HandleScriptEffect(SpellEffIndex  /*effIndex*/)
            {
                Player* charmer = GetCaster()->GetCharmerOrOwnerPlayerOrPlayerItself();
                if (!charmer)
                    return;

                std::list<GameObject*> gList;
                GetCaster()->GetGameObjectListWithEntryInGrid(gList, 184979, 30.0f);
                uint8 counter = 0;
                for (std::list<GameObject*>::const_iterator itr = gList.begin(); itr != gList.end(); ++itr, ++counter)
                {
                    if (counter >= 10)
                        break;
                    GameObject* go = *itr;
                    if (!go->isSpawned())
                        continue;
                    Creature* cr2 = go->SummonTrigger(go->GetPositionX(), go->GetPositionY(), go->GetPositionZ()+2.0f, 0.0f, 100);
                    if (cr2)
                    {
                        cr2->setFaction(14);
                        cr2->SetUInt32Value(UNIT_FIELD_FLAGS, 0);
                        GetCaster()->CastSpell(cr2, 38083, true);
                    }

                    go->SetLootState(GO_JUST_DEACTIVATED);
                    charmer->KilledMonsterCredit(21959, 0);
                }
            }

            void Register()
            {
                OnEffectHitTarget += SpellEffectFn(spell_q10612_10613_the_fel_and_the_furious_SpellScript::HandleScriptEffect, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_q10612_10613_the_fel_and_the_furious_SpellScript();
        }
};

class spell_q10563_q10596_to_legion_hold : public SpellScriptLoader
{
public:
    spell_q10563_q10596_to_legion_hold() : SpellScriptLoader("spell_q10563_q10596_to_legion_hold") { }

    class spell_q10563_q10596_to_legion_hold_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_q10563_q10596_to_legion_hold_AuraScript)

        void HandleEffectRemove(AuraEffect const * /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            if (Player* player = GetTarget()->ToPlayer())
            {
                player->KilledMonsterCredit(21502, 0);
                player->SetControlled(false, UNIT_STATE_STUNNED);
            }
        }

        void HandleEffectApply(AuraEffect const * /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            if (Player* player = GetTarget()->ToPlayer())
            {
                player->SetControlled(true, UNIT_STATE_STUNNED);
                player->SummonCreature(21633, -3311.13f, 2946.15f, 171.1f, 4.86f, TEMPSUMMON_TIMED_DESPAWN, 64000);
            }
        }

        void Register()
        {
            OnEffectApply += AuraEffectApplyFn(spell_q10563_q10596_to_legion_hold_AuraScript::HandleEffectApply, EFFECT_0, SPELL_AURA_TRANSFORM, AURA_EFFECT_HANDLE_REAL);
            OnEffectRemove += AuraEffectRemoveFn(spell_q10563_q10596_to_legion_hold_AuraScript::HandleEffectRemove, EFFECT_0, SPELL_AURA_TRANSFORM, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const
    {
        return new spell_q10563_q10596_to_legion_hold_AuraScript();
    }
};


// Theirs
/*#####
# npc_invis_infernal_caster
#####*/

enum InvisInfernalCaster
{
    EVENT_CAST_SUMMON_INFERNAL = 1,
    NPC_INFERNAL_ATTACKER      = 21419,
    MODEL_INVISIBLE            = 20577,
    MODEL_INFERNAL             = 17312,
    SPELL_SUMMON_INFERNAL      = 37277,
    TYPE_INFERNAL              = 1,
    DATA_DIED                  = 1
};

class npc_invis_infernal_caster : public CreatureScript
{
public:
    npc_invis_infernal_caster() : CreatureScript("npc_invis_infernal_caster") { }

    struct npc_invis_infernal_casterAI : public ScriptedAI
    {
        npc_invis_infernal_casterAI(Creature* creature) : ScriptedAI(creature)
        {
            ground = 0.f;
        }

        void Reset()
        {
            ground = me->GetMap()->GetHeight(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ());
            SummonInfernal();
            events.ScheduleEvent(EVENT_CAST_SUMMON_INFERNAL, urand(1000, 3000));
        }

        void SetData(uint32 id, uint32 data)
        {
            if (id == TYPE_INFERNAL && data == DATA_DIED)
                SummonInfernal();
        }

        void SummonInfernal()
        {
            Creature* infernal = me->SummonCreature(NPC_INFERNAL_ATTACKER, me->GetPositionX(), me->GetPositionY(), ground + 0.05f, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000);
            infernalGUID = infernal->GetGUID();
        }

        void UpdateAI(uint32 diff)
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_CAST_SUMMON_INFERNAL:
                {
                    if (Unit* infernal = ObjectAccessor::GetUnit(*me, infernalGUID))
                        if (infernal->GetDisplayId() == MODEL_INVISIBLE)
                            me->CastSpell(infernal, SPELL_SUMMON_INFERNAL, true);
                    events.ScheduleEvent(EVENT_CAST_SUMMON_INFERNAL, 12000);
                    break;
                }
                default:
                    break;
                }
            }
        }

    private:
        EventMap events;
        uint64 infernalGUID;
        float ground;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_invis_infernal_casterAI(creature);
    }
};

/*#####
# npc_infernal_attacker
#####*/

class npc_infernal_attacker : public CreatureScript
{
public:
    npc_infernal_attacker() : CreatureScript("npc_infernal_attacker") { }

    struct npc_infernal_attackerAI : public ScriptedAI
    {
        npc_infernal_attackerAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset()
        {
            me->SetDisplayId(MODEL_INVISIBLE);
            me->GetMotionMaster()->MoveRandom(5.0f);
        }

        void IsSummonedBy(Unit* summoner)
        {
            if (!summoner)
                return;

            if (summoner->ToCreature())
                casterGUID = summoner->ToCreature()->GetGUID();;
        }

        void JustDied(Unit* /*killer*/)
        {
            if (Creature* caster = ObjectAccessor::GetCreature(*me, casterGUID))
                caster->AI()->SetData(TYPE_INFERNAL, DATA_DIED);
        }

        void SpellHit(Unit* /*caster*/, const SpellInfo* spell)
        {
            if (spell->Id == SPELL_SUMMON_INFERNAL)
            {
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_PACIFIED | UNIT_FLAG_NOT_SELECTABLE);
                me->SetDisplayId(MODEL_INFERNAL);
            }
        }

        void UpdateAI(uint32  /*diff*/)
        {
            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
        }

    private:
        uint64 casterGUID;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_infernal_attackerAI(creature);
    }
};

/*#####
# npc_mature_netherwing_drake
#####*/

enum MatureNetherwing
{
    SAY_JUST_EATEN              = 0,

    SPELL_PLACE_CARCASS         = 38439,
    SPELL_JUST_EATEN            = 38502,
    SPELL_NETHER_BREATH         = 38467,
    POINT_ID                    = 1,

    GO_CARCASS                  = 185155,

    QUEST_KINDNESS              = 10804,
    NPC_EVENT_PINGER            = 22131
};

class npc_mature_netherwing_drake : public CreatureScript
{
public:
    npc_mature_netherwing_drake() : CreatureScript("npc_mature_netherwing_drake") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_mature_netherwing_drakeAI(creature);
    }

    struct npc_mature_netherwing_drakeAI : public ScriptedAI
    {
        npc_mature_netherwing_drakeAI(Creature* creature) : ScriptedAI(creature) { }

        uint64 uiPlayerGUID;

        bool bCanEat;
        bool bIsEating;

        uint32 EatTimer;
        uint32 CastTimer;

        void Reset() override
        {
            uiPlayerGUID = 0;

            bCanEat = false;
            bIsEating = false;

            EatTimer = 5000;
            CastTimer = 5000;
        }

        void SpellHit(Unit* pCaster, SpellInfo const* spell) override
        {
            if (bCanEat || bIsEating)
                return;

            if (pCaster->GetTypeId() == TYPEID_PLAYER && spell->Id == SPELL_PLACE_CARCASS && !me->HasAura(SPELL_JUST_EATEN))
            {
                uiPlayerGUID = pCaster->GetGUID();
                bCanEat = true;
            }
        }

        void MovementInform(uint32 type, uint32 id) override
        {
            if (type != POINT_MOTION_TYPE)
                return;

            if (id == POINT_ID)
            {
                bIsEating = true;
                EatTimer = 7000;
                me->HandleEmoteCommand(EMOTE_ONESHOT_ATTACK_UNARMED);
            }
        }

        void JustReachedHome() override
        {
            me->GetMotionMaster()->InitDefault();
        }

        void UpdateAI(uint32 diff) override
        {
            if (bCanEat || bIsEating)
            {
                if (EatTimer <= diff)
                {
                    if (bCanEat && !bIsEating)
                    {
                        if (Unit* unit = ObjectAccessor::GetUnit(*me, uiPlayerGUID))
                        {
                            if (GameObject* go = unit->FindNearestGameObject(GO_CARCASS, 10))
                            {
                                if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == WAYPOINT_MOTION_TYPE)
                                    me->GetMotionMaster()->MovementExpired();

                                me->GetMotionMaster()->MoveIdle();
                                me->StopMoving();

                                me->GetMotionMaster()->MovePoint(POINT_ID, go->GetPositionX(), go->GetPositionY(), go->GetPositionZ());
                            }
                        }
                        bCanEat = false;
                    }
                    else if (bIsEating)
                    {
                        DoCast(me, SPELL_JUST_EATEN);
                        Talk(SAY_JUST_EATEN);

                        if (Player* player = ObjectAccessor::GetPlayer(*me, uiPlayerGUID))
                        {
                            player->KilledMonsterCredit(NPC_EVENT_PINGER, 0);

                            if (GameObject* go = player->FindNearestGameObject(GO_CARCASS, 10))
                                go->Delete();
                        }

                        Reset();
                        me->GetMotionMaster()->MoveTargetedHome();
                    }
                }
                else
                    EatTimer -= diff;

            return;
            }

            if (!UpdateVictim())
                return;

            if (CastTimer <= diff)
            {
                DoCastVictim(SPELL_NETHER_BREATH);
                CastTimer = 5000;
            } else CastTimer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

/*###
# npc_enslaved_netherwing_drake
####*/

enum EnshlavedNetherwingDrake
{
    // Factions
    FACTION_DEFAULT                 = 62,
    FACTION_FRIENDLY                = 1840, // Not sure if this is correct, it was taken off of Mordenai.

    // Spells
    SPELL_HIT_FORCE_OF_NELTHARAKU   = 38762,
    SPELL_FORCE_OF_NELTHARAKU       = 38775,

    // Creatures
    NPC_DRAGONMAW_SUBJUGATOR        = 21718,
    NPC_ESCAPE_DUMMY                = 22317,

    // Quests
    QUEST_FORCE_OF_NELTHARAKU       = 10854,

    // Events
    EVENT_CAST_FORCE_OF_NELTHARAKU  = 1,
    EVENT_FLY                       = 2
};

class npc_enslaved_netherwing_drake : public CreatureScript
{
public:
    npc_enslaved_netherwing_drake() : CreatureScript("npc_enslaved_netherwing_drake") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_enslaved_netherwing_drakeAI(creature);
    }

    struct npc_enslaved_netherwing_drakeAI : public ScriptedAI
    {
        npc_enslaved_netherwing_drakeAI(Creature* creature) : ScriptedAI(creature)
        {
            PlayerGUID = 0;
            Tapped = false;
            Reset();
        }

        uint64 PlayerGUID;
        EventMap events;
        bool Tapped;

        void JustRespawned() override
        {
            me->SetReactState(REACT_AGGRESSIVE);
            PlayerGUID = 0;
            Tapped = false;
            Reset();
        }

        void Reset() override
        {
            if (!Tapped)
            {
                me->setFaction(FACTION_DEFAULT);
                me->SetDisableGravity(false);
                events.Reset();
            }
        }

        void SpellHit(Unit* caster, const SpellInfo* spell) override
        {
            if (!caster)
                return;

            if (caster->GetTypeId() == TYPEID_PLAYER && spell->Id == SPELL_HIT_FORCE_OF_NELTHARAKU && !Tapped)
            {
                Tapped = true;
                PlayerGUID = caster->GetGUID();

                me->setFaction(FACTION_FRIENDLY);
                events.ScheduleEvent(EVENT_CAST_FORCE_OF_NELTHARAKU, 2000);

                Unit* Dragonmaw = me->FindNearestCreature(NPC_DRAGONMAW_SUBJUGATOR, 50);
                if (Dragonmaw)
                {
                    me->AddThreat(Dragonmaw, 100000.0f);
                    AttackStart(Dragonmaw);
                }

                HostileReference* ref = me->getThreatManager().getOnlineContainer().getReferenceByTarget(caster);
                if (ref)
                    ref->removeReference();
            }
        }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
            {
                events.Update(diff);

                switch (events.ExecuteEvent())
                {
                    case EVENT_CAST_FORCE_OF_NELTHARAKU:
                    {
                        Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID);
                        if (player && player->GetQuestStatus(QUEST_FORCE_OF_NELTHARAKU) == QUEST_STATUS_INCOMPLETE)
                            DoCast(player, SPELL_FORCE_OF_NELTHARAKU, true);
                        events.ScheduleEvent(EVENT_FLY, 2000);
                        me->SetReactState(REACT_PASSIVE);
                        me->DespawnOrUnsummon(6000);
                        break;
                    }
                    case EVENT_FLY:
                    {
                        Position pos;
                        if (Unit* EscapeDummy = me->FindNearestCreature(NPC_ESCAPE_DUMMY, 30))
                            EscapeDummy->GetPosition(&pos);
                        else
                        {
                            me->GetRandomNearPosition(pos, 20);
                            pos.m_positionZ += 25;
                        }
                        me->SetDisableGravity(true);
                        me->GetMotionMaster()->MovePoint(1, pos);
                        break;
                    }
                }
                return;
            }

            DoMeleeAttackIfReady();
        }
    };
};

/*#####
# npc_dragonmaw_peon
#####*/
enum DragonmawPeon
{
    SAY_1                      = 0,
    SAY_POISONED_1             = 1,

    SPELL_POISON               = 40468,
    SPELL_KICK                 = 15610,
    SPELL_SUNDER               = 15572,
    SPELL_VOMIT                = 43327,

    EVENT_KICK                 = 1,
    EVENT_SUNDER               = 2,
    EVENT_CHECK_POISON         = 3,
    EVENT_WALK_TO_MUTTON       = 4,
    EVENT_POISONED             = 5,
    EVENT_KILL                 = 6,

    DELICIOUS_MUTTON           = 185893,
    QUEST_A_SLOW_DEATH         = 11020,
    DRAGONMAW_PEON_KILL_CREDIT = 23209
};

class npc_dragonmaw_peon : public CreatureScript
{
public:
    npc_dragonmaw_peon() : CreatureScript("npc_dragonmaw_peon") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_dragonmaw_peonAI(creature);
    }

    struct npc_dragonmaw_peonAI : public ScriptedAI
    {
        npc_dragonmaw_peonAI(Creature* creature) : ScriptedAI(creature) { }

        EventMap events;
        uint64 PlayerGUID;
        bool Tapped;

        void Reset() override
        {
            events.Reset();
            PlayerGUID = 0;
            Tapped = false;
        }

        void EnterCombat(Unit* /*who*/) override
        {
            events.ScheduleEvent(EVENT_KICK, urand(5000, 10000));
            events.ScheduleEvent(EVENT_SUNDER, urand(5000, 10000));
        }

        void SpellHit(Unit* caster, const SpellInfo* spell) override
        {
            if (!caster)
                return;

            PlayerGUID = caster->GetGUID();

            if (caster->GetTypeId() == TYPEID_PLAYER && spell->Id == SPELL_POISON && !Tapped)
            {
                Tapped = true;
                caster->GetClosePoint(x, y, z, me->GetObjectSize());
                Talk(SAY_1);
                events.ScheduleEvent(EVENT_WALK_TO_MUTTON, 0);
            }
        }

        void MovementInform(uint32 /*type*/, uint32 id) override
        {
            if (id == 1)
            {
                if (GameObject* food = me->FindNearestGameObject(DELICIOUS_MUTTON, 5.0f))
                    me->SetFacingToObject(food);
                me->HandleEmoteCommand(EMOTE_ONESHOT_EAT);
                events.ScheduleEvent(EVENT_POISONED, 5000);
            }
        }

        void CreditPlayer()
        {
            if (PlayerGUID)
            {
                Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID);
                if (player && player->GetQuestStatus(QUEST_A_SLOW_DEATH) == QUEST_STATUS_INCOMPLETE)
                    player->KilledMonsterCredit(DRAGONMAW_PEON_KILL_CREDIT, 0);
            }
        }

        void UpdateAI(uint32 diff) override
        {
            events.Update(diff);

            if (!UpdateVictim())
            {
                switch (events.ExecuteEvent())
                {
                case EVENT_WALK_TO_MUTTON:
                    me->SetWalk(true);
                    me->GetMotionMaster()->MovePoint(1, x, y, z, true);
                    me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_NONE);
                    me->HandleEmoteCommand(EMOTE_ONESHOT_CHEER);
                    break;
                case EVENT_POISONED:
                    if (GameObject* food = me->FindNearestGameObject(DELICIOUS_MUTTON, 5.0f))
                        food->RemoveFromWorld();
                    if (roll_chance_i(20))
                        Talk(SAY_POISONED_1);
                    CreditPlayer();
                    me->CastSpell(me, SPELL_VOMIT);
                    events.ScheduleEvent(EVENT_KILL, 5000);
                    break;
                case EVENT_KILL:
                    Unit::DealDamage(me, me, me->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
                    break;
                }
                return;
            }

            switch (events.ExecuteEvent())
            {
            case EVENT_KICK:
                if (me->GetVictim()->HasUnitState(SPELL_STATE_CASTING))
                    DoCastVictim(SPELL_KICK);
                events.RepeatEvent(urand(5000, 10000));
                break;
            case EVENT_SUNDER:
                DoCastVictim(SPELL_SUNDER);
                events.RepeatEvent(urand(5000, 10000));
                break;
            }

            DoMeleeAttackIfReady();
        }
    private:
        float x, y, z;
    };
};

/*######
## npc_drake_dealer_hurlunk
######*/

class npc_drake_dealer_hurlunk : public CreatureScript
{
public:
    npc_drake_dealer_hurlunk() : CreatureScript("npc_drake_dealer_hurlunk") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        ClearGossipMenuFor(player);
        if (action == GOSSIP_ACTION_TRADE)
            player->GetSession()->SendListInventory(creature->GetGUID());

        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (creature->IsVendor() && player->GetReputationRank(1015) == REP_EXALTED)
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

        SendGossipMenuFor(player, player->GetGossipTextId(creature), creature->GetGUID());

        return true;
    }
};

/*######
## npc_flanis_swiftwing_and_kagrosh
######*/

#define GOSSIP_HSK1 "Take Flanis's Pack"
#define GOSSIP_HSK2 "Take Kagrosh's Pack"

class npcs_flanis_swiftwing_and_kagrosh : public CreatureScript
{
public:
    npcs_flanis_swiftwing_and_kagrosh() : CreatureScript("npcs_flanis_swiftwing_and_kagrosh") { }

    bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 /*sender*/, uint32 action) override
    {
        ClearGossipMenuFor(player);
        if (action == GOSSIP_ACTION_INFO_DEF+1)
        {
            ItemPosCountVec dest;
            uint8 msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, 30658, 1, NULL);
            if (msg == EQUIP_ERR_OK)
            {
                player->StoreNewItem(dest, 30658, true);
                ClearGossipMenuFor(player);
            }
        }
        if (action == GOSSIP_ACTION_INFO_DEF+2)
        {
            ItemPosCountVec dest;
            uint8 msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, 30659, 1, NULL);
            if (msg == EQUIP_ERR_OK)
            {
                player->StoreNewItem(dest, 30659, true);
                ClearGossipMenuFor(player);
            }
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (player->GetQuestStatus(10583) == QUEST_STATUS_INCOMPLETE && !player->HasItemCount(30658, 1, true))
            AddGossipItemFor(player, 0, GOSSIP_HSK1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        if (player->GetQuestStatus(10601) == QUEST_STATUS_INCOMPLETE && !player->HasItemCount(30659, 1, true))
            AddGossipItemFor(player, 0, GOSSIP_HSK2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);

        SendGossipMenuFor(player, player->GetGossipTextId(creature), creature->GetGUID());

        return true;
    }
};

/*####
# npc_karynaku
####*/

enum Karynaku
{
    QUEST_ALLY_OF_NETHER    = 10870,
    QUEST_ZUHULED_THE_WACK  = 10866,

    NPC_ZUHULED_THE_WACKED  = 11980,

    TAXI_PATH_ID            = 649,
};

class npc_karynaku : public CreatureScript
{
    public:
        npc_karynaku() : CreatureScript("npc_karynaku") { }

        bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
        {
            if (quest->GetQuestId() == QUEST_ALLY_OF_NETHER)
                player->ActivateTaxiPathTo(TAXI_PATH_ID);

            if (quest->GetQuestId() == QUEST_ZUHULED_THE_WACK)
                creature->SummonCreature(NPC_ZUHULED_THE_WACKED, -4204.94f, 316.397f, 122.508f, 1.309f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 300000);

            return true;
        }
};

/*####
# npc_earthmender_wilda
####*/

enum Earthmender
{
    SAY_WIL_FREE                = 0,
    SAY_WIL_START               = 1,
    SAY_WIL_CHAT1               = 2,
    SAY_WIL_CHAT2               = 3,
    SAY_WIL_FREE_WATER_SPIRITS  = 4,
    SAY_WIL_CHAT3               = 5,
    SAY_WIL_CHAT4               = 6,
    SAY_WIL_CHAT5               = 7,
    SAY_WIL_FIND_EXIT           = 8,
    SAY_WIL_JUST_AHEAD          = 9,
    SAY_WIL_END                 = 10,
    SAY_WIL_AGGRO               = 11,
    SAY_CAPTURED_WATER_SPIRIT   = 0,
    SAY_COILSKAR_ASSASSIN       = 0,

    SPELL_CHAIN_LIGHTNING       = 16006,
    SPELL_EARTHBIND_TOTEM       = 15786,
    SPELL_FROST_SHOCK           = 12548,
    SPELL_HEALING_WAVE          = 12491,
    SPELL_WATERY_PRISON         = 35928,
    SPELL_BREAK_WATER_PRISON    = 35933,
    SPELL_WATER_BUBBLE          = 35929,

    QUEST_ESCAPE_COILSCAR       = 10451,
    NPC_COILSKAR_ASSASSIN       = 21044,
    NPC_WIL_TRIGGER             = 21041,
    NPC_CAPTURED_WATER_SPIRIT   = 21029,

    FACTION_WIL_ESCORTEE        =   250,
    FACTION_WIL_FRIENDLY        =    35,

    POINT_ID_1                  =   998,
    POINT_ID_2                  =   999,

    EVENT_FREED1                =     1,
    EVENT_FREED2                =     2,
    EVENT_DESPAWN               =     3,
    EVENT_HEAL                  =     4,
    EVENT_CHAIN_LIGHTNING       =     5,
    EVENT_EARTHBIND_TOTEM       =     6,
    EVENT_FROST_SHOCK           =     7,
    EVENT_WATER_SPIRIT_TALK     =     8,
    EVENT_SPAWN_ASSASSIN1       =     9,
    EVENT_SPAWN_ASSASSIN2       =    10,
    EVENT_FREE_WATER_SPIRITS    =    11,
    EVENT_CONTINUE_ESCORT       =    12
};

class npc_earthmender_wilda : public CreatureScript
{
public:
    npc_earthmender_wilda() : CreatureScript("npc_earthmender_wilda") { }

    bool OnQuestAccept(Player* player, Creature* creature, const Quest* quest) override
    {
        if (quest->GetQuestId() == QUEST_ESCAPE_COILSCAR)
        {
            creature->AI()->Talk(SAY_WIL_START, player);
            creature->setFaction(FACTION_WIL_ESCORTEE);

            if (npc_earthmender_wildaAI* pEscortAI = CAST_AI(npc_earthmender_wilda::npc_earthmender_wildaAI, creature->AI()))
            {
                pEscortAI->CancelDespawn();
                pEscortAI->Start(false, false, player->GetGUID(), quest);
            }
        }
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_earthmender_wildaAI(creature);
    }

    struct npc_earthmender_wildaAI : public npc_escortAI
    {
        npc_earthmender_wildaAI(Creature* creature) : npc_escortAI(creature)
        {
            me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            freed = false;
        }

        constexpr static uint32 triggerGuids[6] = { 3008823, 3008824, 3008825, 3008826, 3008827, 3008828 };
        constexpr static uint32 capturedWaterSpiritGuids[5] = { 3008817, 3008818, 3008819, 3008820, 3008821 };
        EventMap events;
        EventMap eventsOOC;
        EventMap eventsIC;
        bool freed;
        bool followed;

        void JustRespawned() override
        {
            npc_escortAI::JustRespawned();
            me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            freed = false;
            followed = false;
            events.Reset();
            eventsOOC.Reset();
            eventsIC.Reset();
        }

        void Reset() override
        {
            me->SetSpeed(MOVE_RUN, me->GetCreatureTemplate()->speed_run);
            eventsIC.Reset();
        }

        void EnterEvadeMode() override
        {
            if (Spell* s = me->GetCurrentSpell(CURRENT_GENERIC_SPELL))
                if (s->m_spellInfo->Id == SPELL_BREAK_WATER_PRISON)
                    return;
            npc_escortAI::EnterEvadeMode();
        }

        void SetData(uint32 /*type*/, uint32 /*data*/) override
        {
            me->setActive(true);

            for (int i = 1; i < 6; i++)
                if (Creature* trigger = me->GetMap()->GetCreature(MAKE_NEW_GUID(triggerGuids[i], NPC_WIL_TRIGGER, HIGHGUID_UNIT)))
                    trigger->DespawnOrUnsummon(1);

            eventsOOC.ScheduleEvent(EVENT_DESPAWN, 180000);
            me->SetSpeed(MOVE_RUN, 0.3f);

            if (Creature* trigger = me->GetMap()->GetCreature(MAKE_NEW_GUID(triggerGuids[0], NPC_WIL_TRIGGER, HIGHGUID_UNIT)))
                trigger->CastSpell(me, SPELL_WATERY_PRISON);
            me->GetMotionMaster()->MovePoint(POINT_ID_1, -2635.57, 1360.89, 35.8221, false, true);
        }

        void CancelDespawn()
        {
            eventsOOC.CancelEvent(EVENT_DESPAWN);
        }

        void EscortStopped() override
        {
            if (followed)
            {
                for (int i = 0; i < 5; i++)
                    if (Creature* capturedWaterSpirit = me->GetMap()->GetCreature(MAKE_NEW_GUID(capturedWaterSpiritGuids[i], NPC_CAPTURED_WATER_SPIRIT, HIGHGUID_UNIT)))
                        capturedWaterSpirit->DespawnOrUnsummon(1);
                followed = false;
            }
        }

        void MovementInform(uint32 type, uint32 point) override
        {
            npc_escortAI::MovementInform(type, point);

            if (type == POINT_MOTION_TYPE)
                if (point == POINT_ID_1)
                {
                    if (Creature* trigger = me->GetMap()->GetCreature(MAKE_NEW_GUID(triggerGuids[0], NPC_WIL_TRIGGER, HIGHGUID_UNIT)))
                        trigger->DespawnOrUnsummon(1);
                    me->SetSpeed(MOVE_RUN, me->GetCreatureTemplate()->speed_run);
                    eventsOOC.ScheduleEvent(EVENT_FREED1, 3000);
                    freed = true;
                }
        }

        void WaypointReached(uint32 waypointId) override
        {
            Player* player = GetPlayerForEscort();
            if (!player)
                return;

            switch (waypointId)
            {
                case 2:
                    Talk(SAY_WIL_CHAT1);
                    break;
                case 9:
                    Talk(SAY_WIL_CHAT2);
                    break;
                case 12:
                    SetEscortPaused(true);
                    Talk(SAY_WIL_FREE_WATER_SPIRITS, player);
                    DoCast(me, SPELL_BREAK_WATER_PRISON);
                    events.ScheduleEvent(EVENT_SPAWN_ASSASSIN1, 5000);
                    events.ScheduleEvent(EVENT_SPAWN_ASSASSIN2, 10000);
                    events.ScheduleEvent(EVENT_FREE_WATER_SPIRITS, 17000);
                    break;
                case 13:
                    Talk(SAY_WIL_FIND_EXIT, player);
                    break;
                case 15:
                    DoSpawnAssassin();
                    break;
                case 18:
                    Talk(SAY_WIL_CHAT3);
                    break;
                case 20:
                    DoSpawnAssassin();
                    break;
                case 27:
                    DoSpawnAssassin();
                    break;
                case 28:
                    DoSpawnAssassin();
                    break;
                case 34:
                    Talk(SAY_WIL_CHAT4);
                    break;
                case 37:
                    DoSpawnAssassin();
                    break;
                case 42:
                    DoSpawnAssassin();
                    break;
                case 44:
                    Talk(SAY_WIL_JUST_AHEAD, player);
                    break;
                case 46:
                    Talk(SAY_WIL_CHAT5);
                    break;
                case 51:
                    DoSpawnAssassin();
                    break;
                case 58:
                    Talk(SAY_WIL_END, player);
                    player->GroupEventHappens(QUEST_ESCAPE_COILSCAR, me);
                    break;
            }
        }

        void DoSpawnAssassin()
        {
            if (Creature* assassin = DoSummon(NPC_COILSKAR_ASSASSIN, me, 15.0f, 5000, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT))
            {
                if (!(rand() % 5))
                    assassin->AI()->Talk(SAY_COILSKAR_ASSASSIN);
                if (!(rand() % 5))
                    Talk(SAY_WIL_AGGRO);
                assassin->AI()->AttackStart(me);
            }
        }

        void EnterCombat(Unit* /*who*/) override
        {
            eventsIC.Reset();
            eventsIC.ScheduleEvent(EVENT_HEAL, 15000);
            eventsIC.ScheduleEvent(EVENT_EARTHBIND_TOTEM, 0);
            eventsIC.ScheduleEvent(EVENT_CHAIN_LIGHTNING, 100);
            eventsIC.ScheduleEvent(EVENT_FROST_SHOCK, 6000);
        }

        void UpdateEscortAI(uint32 uiDiff) override
        {
            if (freed && me->HasUnitMovementFlag(MOVEMENTFLAG_CAN_FLY))
            {
                me->SetCanFly(false);
                me->SetDisableGravity(false);
            }
            else if (!freed && !me->HasUnitMovementFlag(MOVEMENTFLAG_CAN_FLY))
            {
                me->SetCanFly(true);
                me->SetDisableGravity(true);
            }

            events.Update(uiDiff);

            switch(events.ExecuteEvent())
            {
                case EVENT_SPAWN_ASSASSIN1:
                    DoSpawnAssassin();
                    break;
                case EVENT_SPAWN_ASSASSIN2:
                    DoSpawnAssassin();
                    break;
                case EVENT_FREE_WATER_SPIRITS:
                    for (int i = 0; i < 5; i++)
                        if (Creature* capturedWaterSpirit = me->GetMap()->GetCreature(MAKE_NEW_GUID(capturedWaterSpiritGuids[i], NPC_CAPTURED_WATER_SPIRIT, HIGHGUID_UNIT)))
                        {
                            capturedWaterSpirit->RemoveAurasDueToSpell(SPELL_WATER_BUBBLE);
                            capturedWaterSpirit->GetMotionMaster()->MoveFollow(me, 1.5f, 0.5f * M_PI + (1.0f / 6.0f) * (1.0f + i) * M_PI);
                        }
                    EnterEvadeMode();
                    followed = true;
                    events.ScheduleEvent(EVENT_WATER_SPIRIT_TALK, 10000);
                    break;
                case EVENT_WATER_SPIRIT_TALK:
                    for (int i = 0; i < 5; i++)
                        if (Creature* capturedWaterSpirit = me->GetMap()->GetCreature(MAKE_NEW_GUID(capturedWaterSpiritGuids[i], NPC_CAPTURED_WATER_SPIRIT, HIGHGUID_UNIT)))
                            capturedWaterSpirit->AI()->Talk(SAY_CAPTURED_WATER_SPIRIT);
                    eventsOOC.ScheduleEvent(EVENT_CONTINUE_ESCORT, 3000);
                    break;
            }

            if (!UpdateVictim())
            {
                eventsOOC.Update(uiDiff);

                switch(eventsOOC.ExecuteEvent())
                {
                    case EVENT_FREED1:
                        me->GetMotionMaster()->MovePoint(POINT_ID_2, -2638.89, 1358.96, 35.9606, false, true);
                        eventsOOC.ScheduleEvent(EVENT_FREED2, 2000);
                        break;
                    case EVENT_FREED2:
                        Talk(SAY_WIL_FREE);
                        me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                        break;
                    case EVENT_DESPAWN:
                        me->DespawnOrUnsummon(1);
                        break;
                    case EVENT_CONTINUE_ESCORT:
                        SetEscortPaused(false);
                        break;
                }

                return;
            }

            eventsIC.Update(uiDiff);

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            switch(eventsIC.ExecuteEvent())
            {
                case EVENT_HEAL:
                    if (!HealthAbovePct(30))
                    {
                        DoCast(me, SPELL_HEALING_WAVE);
                        eventsIC.ScheduleEvent(EVENT_HEAL, 15000);
                    }
                    else
                        eventsIC.ScheduleEvent(EVENT_HEAL, 5000);
                    break;
                case EVENT_EARTHBIND_TOTEM:
                    DoCast(me, SPELL_EARTHBIND_TOTEM);
                    break;
                case EVENT_CHAIN_LIGHTNING:
                    DoCast(me->GetVictim(), SPELL_CHAIN_LIGHTNING);
                    eventsIC.ScheduleEvent(EVENT_CHAIN_LIGHTNING, urand(10000, 15000));
                    break;
                case EVENT_FROST_SHOCK:
                    DoCast(me->GetVictim(), SPELL_FROST_SHOCK);
                    eventsIC.ScheduleEvent(EVENT_FROST_SHOCK, urand(10000, 15000));
                    break;
            }

            DoMeleeAttackIfReady();
        }
    };
};

/*#####
# Quest: Battle of the crimson watch
#####*/

/* ContentData
Battle of the crimson watch - creatures, gameobjects and defines
npc_illidari_spawn : Adds that are summoned in the Crimson Watch battle.
npc_torloth_the_magnificent : Final Creature that players have to face before quest is completed
npc_lord_illidan_stormrage : Creature that controls the event.
go_crystal_prison : GameObject that begins the event and hands out quest
EndContentData */

#define QUEST_BATTLE_OF_THE_CRIMSON_WATCH 10781
#define EVENT_AREA_RADIUS 65 //65yds
#define EVENT_COOLDOWN 30000 //in ms. appear after event completed or failed (should be = Adds despawn time)

struct TorlothCinematic
{
    uint32 creature, Timer;
};

// Creature 0 - Torloth, 1 - Illidan
static TorlothCinematic TorlothAnim[]=
{
    {0, 2000},
    {1, 7000},
    {0, 3000},
    {0, 2000}, // Torloth stand
    {0, 1000},
    {0, 3000},
    {0, 0}
};

struct Location
{
    float x, y, z, o;
};

//Cordinates for Spawns
static Location SpawnLocation[]=
{
    //Cords used for:
    {-4615.8556f, 1342.2532f, 139.9f, 1.612f}, //Illidari Soldier
    {-4598.9365f, 1377.3182f, 139.9f, 3.917f}, //Illidari Soldier
    {-4598.4697f, 1360.8999f, 139.9f, 2.427f}, //Illidari Soldier
    {-4589.3599f, 1369.1061f, 139.9f, 3.165f}, //Illidari Soldier
    {-4608.3477f, 1386.0076f, 139.9f, 4.108f}, //Illidari Soldier
    {-4633.1889f, 1359.8033f, 139.9f, 0.949f}, //Illidari Soldier
    {-4623.5791f, 1351.4574f, 139.9f, 0.971f}, //Illidari Soldier
    {-4607.2988f, 1351.6099f, 139.9f, 2.416f}, //Illidari Soldier
    {-4633.7764f, 1376.0417f, 139.9f, 5.608f}, //Illidari Soldier
    {-4600.2461f, 1369.1240f, 139.9f, 3.056f}, //Illidari Mind Breaker
    {-4631.7808f, 1367.9459f, 139.9f, 0.020f}, //Illidari Mind Breaker
    {-4600.2461f, 1369.1240f, 139.9f, 3.056f}, //Illidari Highlord
    {-4631.7808f, 1367.9459f, 139.9f, 0.020f}, //Illidari Highlord
    {-4615.5586f, 1353.0031f, 139.9f, 1.540f}, //Illidari Highlord
    {-4616.4736f, 1384.2170f, 139.9f, 4.971f}, //Illidari Highlord
    {-4627.1240f, 1378.8752f, 139.9f, 2.544f} //Torloth The Magnificent
};

struct WaveData
{
    uint8 SpawnCount, UsedSpawnPoint;
    uint32 CreatureId, SpawnTimer, YellTimer;
};

static WaveData WavesInfo[]=
{
    {9, 0, 22075, 10000, 7000},   //Illidari Soldier
    {2, 9, 22074, 10000, 7000},   //Illidari Mind Breaker
    {4, 11, 19797, 10000, 7000},  //Illidari Highlord
    {1, 15, 22076, 10000, 7000}   //Torloth The Magnificent
};

struct SpawnSpells
{
 uint32 Timer1, Timer2, SpellId;
};

static SpawnSpells SpawnCast[]=
{
    {10000, 15000, 35871},  // Illidari Soldier Cast - Spellbreaker
    {10000, 10000, 38985},  // Illidari Mind Breake Cast - Focused Bursts
    {35000, 35000, 22884},  // Illidari Mind Breake Cast - Psychic Scream
    {20000, 20000, 17194},  // Illidari Mind Breake Cast - Mind Blast
    {8000, 15000, 38010},   // Illidari Highlord Cast - Curse of Flames
    {12000, 20000, 16102},  // Illidari Highlord Cast - Flamestrike
    {10000, 15000, 15284},  // Torloth the Magnificent Cast - Cleave
    {18000, 20000, 39082},  // Torloth the Magnificent Cast - Shadowfury
    {25000, 28000, 33961}   // Torloth the Magnificent Cast - Spell Reflection
};

/*######
# npc_torloth_the_magnificent
#####*/

class npc_torloth_the_magnificent : public CreatureScript
{
public:
    npc_torloth_the_magnificent() : CreatureScript("npc_torloth_the_magnificent") { }

    CreatureAI* GetAI(Creature* c) const
    {
        return new npc_torloth_the_magnificentAI(c);
    }

    struct npc_torloth_the_magnificentAI : public ScriptedAI
    {
        npc_torloth_the_magnificentAI(Creature* creature) : ScriptedAI(creature) { }

        uint32 AnimationTimer, SpellTimer1, SpellTimer2, SpellTimer3;

        uint8 AnimationCount;

        uint64 LordIllidanGUID;
        uint64 AggroTargetGUID;

        bool Timers;

        void Reset()
        {
            AnimationTimer = 4000;
            AnimationCount = 0;
            LordIllidanGUID = 0;
            AggroTargetGUID = 0;
            Timers = false;

            me->AddUnitState(UNIT_STATE_ROOT);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SetTarget(0);
        }

        void EnterCombat(Unit* /*who*/) { }

        void HandleAnimation()
        {
            Creature* creature = me;

            if (TorlothAnim[AnimationCount].creature == 1)
            {
                creature = (ObjectAccessor::GetCreature(*me, LordIllidanGUID));

                if (!creature)
                    return;
            }

            AnimationTimer = TorlothAnim[AnimationCount].Timer;

            switch (AnimationCount)
            {
            case 0:
                me->SetUInt32Value(UNIT_FIELD_BYTES_1, 8);
                break;
            case 3:
                me->RemoveFlag(UNIT_FIELD_BYTES_1, 8);
                break;
            case 5:
                if (Player* AggroTarget = ObjectAccessor::GetPlayer(*me, AggroTargetGUID))
                {
                    me->SetTarget(AggroTarget->GetGUID());
                    me->AddThreat(AggroTarget, 1);
                    me->HandleEmoteCommand(EMOTE_ONESHOT_POINT);
                }
                break;
            case 6:
                if (Player* AggroTarget = ObjectAccessor::GetPlayer(*me, AggroTargetGUID))
                {
                    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                    me->ClearUnitState(UNIT_STATE_ROOT);

                    float x, y, z;
                    AggroTarget->GetPosition(x, y, z);
                    me->GetMotionMaster()->MovePoint(0, x, y, z);
                }
                break;
            }
            ++AnimationCount;
        }

        void UpdateAI(uint32 diff)
        {
            if (AnimationTimer)
            {
                if (AnimationTimer <= diff)
                {
                    HandleAnimation();
                } else AnimationTimer -= diff;
            }

            if (AnimationCount < 6)
            {
                me->CombatStop();
            } else if (!Timers)
            {
                SpellTimer1 = SpawnCast[6].Timer1;
                SpellTimer2 = SpawnCast[7].Timer1;
                SpellTimer3 = SpawnCast[8].Timer1;
                Timers = true;
            }

            if (Timers)
            {
                if (SpellTimer1 <= diff)
                {
                    DoCastVictim(SpawnCast[6].SpellId);//Cleave
                    SpellTimer1 = SpawnCast[6].Timer2 + (rand()%10 * 1000);
                } else SpellTimer1 -= diff;

                if (SpellTimer2 <= diff)
                {
                    DoCastVictim(SpawnCast[7].SpellId);//Shadowfury
                    SpellTimer2 = SpawnCast[7].Timer2 + (rand()%5 * 1000);
                } else SpellTimer2 -= diff;

                if (SpellTimer3 <= diff)
                {
                    DoCast(me, SpawnCast[8].SpellId);
                    SpellTimer3 = SpawnCast[8].Timer2 + (rand()%7 * 1000);//Spell Reflection
                } else SpellTimer3 -= diff;
            }

            DoMeleeAttackIfReady();
        }

        void JustDied(Unit* killer)
        {
            switch (killer->GetTypeId())
            {
                case TYPEID_UNIT:
                    if (Unit* owner = killer->GetOwner())
                        if (Player* player = owner->ToPlayer())
                            player->GroupEventHappens(QUEST_BATTLE_OF_THE_CRIMSON_WATCH, me);
                    break;
                case TYPEID_PLAYER:
                    if (Player* player = killer->ToPlayer())
                        player->GroupEventHappens(QUEST_BATTLE_OF_THE_CRIMSON_WATCH, me);
                    break;
                default:
                    break;
            }

            if (Creature* LordIllidan = (ObjectAccessor::GetCreature(*me, LordIllidanGUID)))
                LordIllidan->AI()->EnterEvadeMode();
        }
    };
};

/*#####
# npc_lord_illidan_stormrage
#####*/

class npc_lord_illidan_stormrage : public CreatureScript
{
public:
    npc_lord_illidan_stormrage() : CreatureScript("npc_lord_illidan_stormrage") { }

    CreatureAI* GetAI(Creature* c) const
    {
        return new npc_lord_illidan_stormrageAI(c);
    }

    struct npc_lord_illidan_stormrageAI : public ScriptedAI
    {
        npc_lord_illidan_stormrageAI(Creature* creature) : ScriptedAI(creature) { }

        uint64 PlayerGUID;

        uint32 WaveTimer;
        uint32 AnnounceTimer;

        int8 LiveCount;
        uint8 WaveCount;

        bool EventStarted;
        bool Announced;
        bool Failed;

        void Reset()
        {
            PlayerGUID = 0;

            WaveTimer = 10000;
            AnnounceTimer = 7000;
            LiveCount = 0;
            WaveCount = 0;

            EventStarted = false;
            Announced = false;
            Failed = false;

            me->SetVisible(false);
        }

        void EnterCombat(Unit* /*who*/) { }
        void MoveInLineOfSight(Unit* /*who*/) { }

        void AttackStart(Unit* /*who*/) { }

        void SummonNextWave();

        void CheckEventFail()
        {
            Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID);
            if (!player)
            {
                Failed = true;
                return;
            }

            if (Group* EventGroup = player->GetGroup())
            {
                uint8 GroupMemberCount = 0;
                uint8 DeadMemberCount = 0;
                uint8 FailedMemberCount = 0;

                Group::MemberSlotList const& members = EventGroup->GetMemberSlots();

                for (Group::member_citerator itr = members.begin(); itr!= members.end(); ++itr)
                {
                    Player* GroupMember = ObjectAccessor::GetPlayer(*me, itr->guid);
                    if (!GroupMember)
                        continue;
                    if (!GroupMember->IsWithinDistInMap(me, EVENT_AREA_RADIUS) && GroupMember->GetQuestStatus(QUEST_BATTLE_OF_THE_CRIMSON_WATCH) == QUEST_STATUS_INCOMPLETE)
                    {
                        GroupMember->FailQuest(QUEST_BATTLE_OF_THE_CRIMSON_WATCH);
                        ++FailedMemberCount;
                    }
                    ++GroupMemberCount;

                    if (GroupMember->isDead())
                        ++DeadMemberCount;
                }

                if (GroupMemberCount == FailedMemberCount)
                {
                    Failed = true;
                }

                if (GroupMemberCount == DeadMemberCount)
                {
                    for (Group::member_citerator itr = members.begin(); itr!= members.end(); ++itr)
                    {
                        if (Player* groupMember = ObjectAccessor::GetPlayer(*me, itr->guid))
                            if (groupMember->GetQuestStatus(QUEST_BATTLE_OF_THE_CRIMSON_WATCH) == QUEST_STATUS_INCOMPLETE)
                                groupMember->FailQuest(QUEST_BATTLE_OF_THE_CRIMSON_WATCH);
                    }
                    Failed = true;
                }
            } else if (player->isDead() || !player->IsWithinDistInMap(me, EVENT_AREA_RADIUS))
            {
                player->FailQuest(QUEST_BATTLE_OF_THE_CRIMSON_WATCH);
                Failed = true;
            }
        }

        void LiveCounter()
        {
            --LiveCount;
            if (!LiveCount)
                Announced = false;
        }

        void UpdateAI(uint32 diff)
        {
            if (!PlayerGUID || !EventStarted)
                return;

            if (!LiveCount && WaveCount < 4)
            {
                if (!Announced && AnnounceTimer <= diff)
                {
                    Announced = true;
                }
                else
                    AnnounceTimer -= diff;

                if (WaveTimer <= diff)
                {
                    SummonNextWave();
                }
                else
                    WaveTimer -= diff;
            }
            CheckEventFail();

            if (Failed)
                EnterEvadeMode();
        }
    };
};

/*######
# npc_illidari_spawn
######*/

class npc_illidari_spawn : public CreatureScript
{
public:
    npc_illidari_spawn() : CreatureScript("npc_illidari_spawn") { }

    CreatureAI* GetAI(Creature* c) const
    {
        return new npc_illidari_spawnAI(c);
    }

    struct npc_illidari_spawnAI : public ScriptedAI
    {
        npc_illidari_spawnAI(Creature* creature) : ScriptedAI(creature) { }

        uint64 LordIllidanGUID;
        uint32 SpellTimer1, SpellTimer2, SpellTimer3;
        bool Timers;

        void Reset()
        {
            LordIllidanGUID = 0;
            Timers = false;
        }

        void EnterCombat(Unit* /*who*/) { }

        void JustDied(Unit* /*killer*/)
        {
            me->RemoveCorpse();
            if (Creature* LordIllidan = (ObjectAccessor::GetCreature(*me, LordIllidanGUID)))
                if (LordIllidan)
                    CAST_AI(npc_lord_illidan_stormrage::npc_lord_illidan_stormrageAI, LordIllidan->AI())->LiveCounter();
        }

        void UpdateAI(uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (!Timers)
            {
                if (me->GetEntry() == 22075)//Illidari Soldier
                {
                    SpellTimer1 = SpawnCast[0].Timer1 + (rand()%4 * 1000);
                }
                if (me->GetEntry() == 22074)//Illidari Mind Breaker
                {
                    SpellTimer1 = SpawnCast[1].Timer1 + (rand()%10 * 1000);
                    SpellTimer2 = SpawnCast[2].Timer1 + (rand()%4 * 1000);
                    SpellTimer3 = SpawnCast[3].Timer1 + (rand()%4 * 1000);
                }
                if (me->GetEntry() == 19797)// Illidari Highlord
                {
                    SpellTimer1 = SpawnCast[4].Timer1 + (rand()%4 * 1000);
                    SpellTimer2 = SpawnCast[5].Timer1 + (rand()%4 * 1000);
                }
                Timers = true;
            }
            //Illidari Soldier
            if (me->GetEntry() == 22075)
            {
                if (SpellTimer1 <= diff)
                {
                    DoCastVictim(SpawnCast[0].SpellId);//Spellbreaker
                    SpellTimer1 = SpawnCast[0].Timer2 + (rand()%5 * 1000);
                } else SpellTimer1 -= diff;
            }
            //Illidari Mind Breaker
            if (me->GetEntry() == 22074)
            {
                if (SpellTimer1 <= diff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    {
                        if (target->GetTypeId() == TYPEID_PLAYER)
                        {
                            DoCast(target, SpawnCast[1].SpellId); //Focused Bursts
                            SpellTimer1 = SpawnCast[1].Timer2 + (rand()%5 * 1000);
                        } else SpellTimer1 = 2000;
                    }
                } else SpellTimer1 -= diff;

                if (SpellTimer2 <= diff)
                {
                    DoCastVictim(SpawnCast[2].SpellId);//Psychic Scream
                    SpellTimer2 = SpawnCast[2].Timer2 + (rand()%13 * 1000);
                } else SpellTimer2 -= diff;

                if (SpellTimer3 <= diff)
                {
                    DoCastVictim(SpawnCast[3].SpellId);//Mind Blast
                    SpellTimer3 = SpawnCast[3].Timer2 + (rand()%8 * 1000);
                } else SpellTimer3 -= diff;
            }
            //Illidari Highlord
            if (me->GetEntry() == 19797)
            {
                if (SpellTimer1 <= diff)
                {
                    DoCastVictim(SpawnCast[4].SpellId);//Curse Of Flames
                    SpellTimer1 = SpawnCast[4].Timer2 + (rand()%10 * 1000);
                } else SpellTimer1 -= diff;

                if (SpellTimer2 <= diff)
                {
                    DoCastVictim(SpawnCast[5].SpellId);//Flamestrike
                    SpellTimer2 = SpawnCast[5].Timer2 + (rand()%7 * 13000);
                } else SpellTimer2 -= diff;
            }

            DoMeleeAttackIfReady();
        }
    };
};

void npc_lord_illidan_stormrage::npc_lord_illidan_stormrageAI::SummonNextWave()
{
    uint8 count = WavesInfo[WaveCount].SpawnCount;
    uint8 locIndex = WavesInfo[WaveCount].UsedSpawnPoint;
    uint8 FelguardCount = 0;
    uint8 DreadlordCount = 0;

    for (uint8 i = 0; i < count; ++i)
    {
        Creature* Spawn = NULL;
        float X = SpawnLocation[locIndex + i].x;
        float Y = SpawnLocation[locIndex + i].y;
        float Z = SpawnLocation[locIndex + i].z;
        float O = SpawnLocation[locIndex + i].o;
        Spawn = me->SummonCreature(WavesInfo[WaveCount].CreatureId, X, Y, Z, O, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000);
        ++LiveCount;

        if (Spawn)
        {
            if (WaveCount == 0)//1 Wave
            {
                if (rand()%3 == 1 && FelguardCount<2)
                {
                    Spawn->SetDisplayId(18654);
                    ++FelguardCount;
                }
                else if (DreadlordCount < 3)
                {
                    Spawn->SetDisplayId(19991);
                    ++DreadlordCount;
                }
                else if (FelguardCount<2)
                {
                    Spawn->SetDisplayId(18654);
                    ++FelguardCount;
                }
            }

            if (WaveCount < 3)//1-3 Wave
            {
                if (PlayerGUID)
                {
                    if (Player* target = ObjectAccessor::GetPlayer(*me, PlayerGUID))
                    {
                        float x, y, z;
                        target->GetPosition(x, y, z);
                        Spawn->GetMotionMaster()->MovePoint(0, x, y, z);
                    }
                }
                CAST_AI(npc_illidari_spawn::npc_illidari_spawnAI, Spawn->AI())->LordIllidanGUID = me->GetGUID();
            }

            if (WavesInfo[WaveCount].CreatureId == 22076) // Torloth
            {
                CAST_AI(npc_torloth_the_magnificent::npc_torloth_the_magnificentAI, Spawn->AI())->LordIllidanGUID = me->GetGUID();
                if (PlayerGUID)
                    CAST_AI(npc_torloth_the_magnificent::npc_torloth_the_magnificentAI, Spawn->AI())->AggroTargetGUID = PlayerGUID;
            }
        }
    }
    ++WaveCount;
    WaveTimer = WavesInfo[WaveCount].SpawnTimer;
    AnnounceTimer = WavesInfo[WaveCount].YellTimer;
}

/*#####
# go_crystal_prison
######*/

class go_crystal_prison : public GameObjectScript
{
public:
    go_crystal_prison() : GameObjectScript("go_crystal_prison") { }

    bool OnQuestAccept(Player* player, GameObject* /*go*/, Quest const* quest)
    {
        if (quest->GetQuestId() == QUEST_BATTLE_OF_THE_CRIMSON_WATCH)
        {
            Creature* Illidan = player->FindNearestCreature(22083, 50);

            if (Illidan && !CAST_AI(npc_lord_illidan_stormrage::npc_lord_illidan_stormrageAI, Illidan->AI())->EventStarted)
            {
                CAST_AI(npc_lord_illidan_stormrage::npc_lord_illidan_stormrageAI, Illidan->AI())->PlayerGUID = player->GetGUID();
                CAST_AI(npc_lord_illidan_stormrage::npc_lord_illidan_stormrageAI, Illidan->AI())->LiveCount = 0;
                CAST_AI(npc_lord_illidan_stormrage::npc_lord_illidan_stormrageAI, Illidan->AI())->EventStarted=true;
            }
        }
     return true;
    }
};

void AddSC_shadowmoon_valley()
{
    // Ours
    new spell_q10612_10613_the_fel_and_the_furious();
    new spell_q10563_q10596_to_legion_hold();

    // Theirs
    new npc_invis_infernal_caster();
    new npc_infernal_attacker();
    new npc_mature_netherwing_drake();
    new npc_enslaved_netherwing_drake();
    new npc_dragonmaw_peon();
    new npc_drake_dealer_hurlunk();
    new npcs_flanis_swiftwing_and_kagrosh();
    new npc_karynaku();
    new npc_earthmender_wilda();
    new npc_lord_illidan_stormrage();
    new go_crystal_prison();
    new npc_illidari_spawn();
    new npc_torloth_the_magnificent();
}

