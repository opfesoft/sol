/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

/* ScriptData
SDName: Azshara
SD%Complete: 90
SDComment: Quest support: 2744, 3141, 9364, 10994
SDCategory: Azshara
EndScriptData */

/* ContentData
npc_spitelashes
npc_rizzle_sprysprocket
npc_depth_charge
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "Player.h"
#include "SpellInfo.h"

/*######
## npc_spitelashes
######*/

enum Spitelashes
{
    SPELL_POLYMORPH_RANK1       = 118,
    SPELL_POLYMORPH_RANK2       = 12824,
    SPELL_POLYMORPH_RANK3       = 12825,
    SPELL_POLYMORPH_RANK4       = 12826,
    SPELL_POLYMORPH             = 29124,
    SPELL_POLYMORPH_BACKFIRE    = 28406,
    SPELL_REMOVE_POLYMORPH      = 6924
};

class npc_spitelashes : public CreatureScript
{
public:
    npc_spitelashes() : CreatureScript("npc_spitelashes") { }

    struct npc_spitelashesAI : public ScriptedAI
    {
        npc_spitelashesAI(Creature* creature) : ScriptedAI(creature) { }

        uint32 morphtimer;
        bool spellhit;

        void Reset()
        {
            morphtimer = 0;
            spellhit = false;
        }

        void EnterCombat(Unit* /*who*/) { }

        void SpellHit(Unit* unit, const SpellInfo* spell)
        {
            if (spellhit)
                return;

            switch (spell->Id)
            {
                case SPELL_POLYMORPH_RANK1:
                case SPELL_POLYMORPH_RANK2:
                case SPELL_POLYMORPH_RANK3:
                case SPELL_POLYMORPH_RANK4:
                    if (Player* player = unit->ToPlayer())
                        if (player->GetQuestStatus(9364) == QUEST_STATUS_INCOMPLETE)
                        {
                            spellhit = true;
                            DoCast(me, SPELL_POLYMORPH);
                        }
                    break;
                default:
                    break;
            }
        }

        void UpdateAI(uint32 diff)
        {
            // we mustn't remove the Creature in the same round in which we cast the summon spell, otherwise there will be no summons
            if (spellhit && morphtimer >= 5000)
            {
                me->DespawnOrUnsummon();
                return;
            }
            // walk 5 seconds before summoning
            if (spellhit && morphtimer<5000)
            {
                morphtimer+=diff;
                if (morphtimer >= 5000)
                {
                    DoCast(me, SPELL_POLYMORPH_BACKFIRE); // summon copies
                    DoCast(me, SPELL_REMOVE_POLYMORPH);   // visual explosion
                }
            }
            if (!UpdateVictim())
                return;

            /// @todo add abilities for the different creatures
            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_spitelashesAI(creature);
    }
};

/*####
# npc_rizzle_sprysprocket
####*/

enum RizzleSprysprocketData
{
    QUEST_CHASING_THE_MOONSTONE     = 10994,

    NPC_DEPTH_CHARGE                = 23025,

    SPELL_RIZZLE_BLACKJACK          = 39865,
    SPELL_RIZZLE_ESCAPE             = 39871,
    SPELL_RIZZLE_FROST_GRENADE      = 40525,
    SPELL_DEPTH_CHARGE_TRAP         = 38576,
    SPELL_PERIODIC_DEPTH_CHARGE     = 39912,
    SPELL_GIVE_SOUTHFURY_MOONSTONE  = 39886,
    SPELL_COSMETIC_EXPLOSION        = 46419,

    SAY_RIZZLE_START                = 0,
    SAY_RIZZLE_GRENADE              = 1,
    SAY_RIZZLE_FINAL                = 2,
    MSG_ESCAPE_NOTICE               = 3,

    RIZZLE_PATH_ID                  = 2300200,
};

class npc_rizzle_sprysprocket : public CreatureScript
{
public:
    npc_rizzle_sprysprocket() : CreatureScript("npc_rizzle_sprysprocket") { }

    struct npc_rizzle_sprysprocketAI : public ScriptedAI
    {
        npc_rizzle_sprysprocketAI(Creature* creature) : ScriptedAI(creature) { }

        void InitializeAI() override
        {
            SpellEscapeTimer = 1300;
            TeleportTimer = 3500;
            CheckTimer = 10000;
            GrenadeTimer = 30000;

            PlayerGUID = 0;

            Escape = false;
            Reached = false;

            me->setActive(true);
        }

        void EnterCombat(Unit* /*who*/) override { }

        void AttackStart(Unit* /*who*/) override { }

        void IsSummonedBy(Unit* summoner) override
        {
            if (Player* player = summoner->ToPlayer())
            {
                me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                PlayerGUID = player->GetGUID();
                Talk(SAY_RIZZLE_START);
            }
        }

        void sGossipSelect(Player* player, uint32 /*sender*/, uint32 /*action*/) override
        {
            CloseGossipMenuFor(player);
            me->CastSpell(player, SPELL_GIVE_SOUTHFURY_MOONSTONE, true);
            me->DespawnOrUnsummon(3000);
        }

        void MovementInform(uint32 type, uint32 id) override
        {
            if (type != WAYPOINT_MOTION_TYPE)
                return;

            if (id == 57)
            {
                me->DespawnOrUnsummon();
                return;
            }
        }

        void UpdateAI(uint32 diff) override
        {
            if (Reached)
                return;

            if (!Escape)
            {
                if (!PlayerGUID)
                    return;

                if (SpellEscapeTimer <= diff)
                {
                    DoCast(me, SPELL_RIZZLE_ESCAPE, false);
                    SpellEscapeTimer = 10000;
                } else SpellEscapeTimer -= diff;

                if (TeleportTimer <= diff)
                {
                    // temp solution - unit can't be teleported by core using spelleffect 5, only players
                    me->NearTeleportTo(3706.39f, -3969.15f, 35.9118f, me->GetOrientation());

                    //begin swimming and summon depth charges
                    Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID);
                    if (!player)
                        return;

                    me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                    Talk(MSG_ESCAPE_NOTICE, player);
                    DoCast(me, SPELL_PERIODIC_DEPTH_CHARGE);
                    me->SetSpeed(MOVE_RUN, 0.85f, true);
                    me->LoadPath(RIZZLE_PATH_ID);
                    me->SetDefaultMovementType(WAYPOINT_MOTION_TYPE);
                    me->GetMotionMaster()->Initialize();
                    Escape = true;
                } else TeleportTimer -= diff;

                return;
            }

            if (GrenadeTimer <= diff)
            {
                if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID); player && me->IsWithinDist(player, 40.f))
                {
                   Talk(SAY_RIZZLE_GRENADE, player);
                   DoCast(player, SPELL_RIZZLE_FROST_GRENADE, true);
                }
                GrenadeTimer = 30000;
            } else GrenadeTimer -= diff;

            if (CheckTimer <= diff)
            {
                Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID);
                if (!player)
                {
                    me->DespawnOrUnsummon();
                    return;
                }

                if (me->IsWithinDist(player, 10) && me->GetPositionX() > player->GetPositionX())
                {
                    Talk(SAY_RIZZLE_FINAL);
                    me->SetUInt32Value(UNIT_NPC_FLAGS, 1);
                    me->setFaction(35);
                    me->StopMovingOnCurrentPos();
                    me->LoadPath(0);
                    me->SetDefaultMovementType(IDLE_MOTION_TYPE);
                    me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
                    me->GetMotionMaster()->Initialize();
                    me->RemoveAurasDueToSpell(SPELL_PERIODIC_DEPTH_CHARGE);
                    me->DespawnOrUnsummon(60000);
                    me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_SWIM_IDLE);
                    Reached = true;
                }

                CheckTimer = 1000;
            } else CheckTimer -= diff;
        }

    private:
        uint64 PlayerGUID;
        uint32 SpellEscapeTimer;
        uint32 TeleportTimer;
        uint32 CheckTimer;
        uint32 GrenadeTimer;
        bool Escape;
        bool Reached;
    };

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (player->GetQuestStatus(QUEST_CHASING_THE_MOONSTONE) != QUEST_STATUS_INCOMPLETE)
            return true;

        AddGossipItemFor(player, Player::GetDefaultGossipMenuForSource(creature), 0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        SendGossipMenuFor(player, player->GetGossipTextId(creature), creature->GetGUID());
        
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_rizzle_sprysprocketAI(creature);
    }
};

/*####
# npc_depth_charge
####*/
class npc_depth_charge : public CreatureScript
{
public:
    npc_depth_charge() : CreatureScript("npc_depth_charge") { }

    struct npc_depth_chargeAI : public ScriptedAI
    {
        npc_depth_chargeAI(Creature* creature) : ScriptedAI(creature) { }

        bool WeMustDie;
        uint32 WeMustDieTimer;

        void Reset()
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            WeMustDie = false;
            WeMustDieTimer = 1000;
            me->GetMotionMaster()->MoveRandom(6.f);
            me->setActive(true);
        }

        void EnterCombat(Unit* /*who*/) { }

        void AttackStart(Unit* /*who*/) { }

        void MoveInLineOfSight(Unit* who)
        {
            if (!who)
                return;

            if (who->GetTypeId() == TYPEID_PLAYER && me->IsWithinDistInMap(who, 5))
            {
                me->SetFacingToObject(who);
                me->SetInFront(who);
                DoCast(me, SPELL_COSMETIC_EXPLOSION, true);
                DoCast(me, SPELL_DEPTH_CHARGE_TRAP, true);
                WeMustDie = true;
                return;
            }
        }

        void UpdateAI(uint32 diff)
        {
            if (WeMustDie)
            {
                if (WeMustDieTimer <= diff)
                    me->DespawnOrUnsummon();
                else
                    WeMustDieTimer -= diff;
            }
            return;
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_depth_chargeAI(creature);
    }
};

void AddSC_azshara()
{
    new npc_spitelashes();
    new npc_rizzle_sprysprocket();
    new npc_depth_charge();
}
