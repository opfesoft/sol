/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

/* ScriptData
SDName: Orgrimmar
SD%Complete: 100
SDComment: Quest support: 2460, 6566
SDCategory: Orgrimmar
EndScriptData */

/* ContentData
npc_shenthul
npc_thrall_warchief
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "Player.h"
#include "CreatureTextMgr.h"

/*######
## npc_shenthul
######*/

enum Shenthul
{
    QUEST_SHATTERED_SALUTE  = 2460
};

class npc_shenthul : public CreatureScript
{
public:
    npc_shenthul() : CreatureScript("npc_shenthul") { }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == QUEST_SHATTERED_SALUTE)
        {
            CAST_AI(npc_shenthul::npc_shenthulAI, creature->AI())->CanTalk = true;
            CAST_AI(npc_shenthul::npc_shenthulAI, creature->AI())->PlayerGUID = player->GetGUID();
        }
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_shenthulAI(creature);
    }

    struct npc_shenthulAI : public ScriptedAI
    {
        npc_shenthulAI(Creature* creature) : ScriptedAI(creature) { }

        bool CanTalk;
        bool CanEmote;
        uint32 SaluteTimer;
        uint32 ResetTimer;
        uint64 PlayerGUID;

        void Reset()
        {
            CanTalk = false;
            CanEmote = false;
            SaluteTimer = 6000;
            ResetTimer = 0;
            PlayerGUID = 0;
        }

        void EnterCombat(Unit* /*who*/) { }

        void UpdateAI(uint32 diff)
        {
            if (CanEmote)
            {
                if (ResetTimer <= diff)
                {
                    if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID))
                    {
                        if (player->GetTypeId() == TYPEID_PLAYER && player->GetQuestStatus(QUEST_SHATTERED_SALUTE) == QUEST_STATUS_INCOMPLETE)
                            player->FailQuest(QUEST_SHATTERED_SALUTE);
                    }
                    Reset();
                } else ResetTimer -= diff;
            }

            if (CanTalk && !CanEmote)
            {
                if (SaluteTimer <= diff)
                {
                    me->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);
                    CanEmote = true;
                    ResetTimer = 60000;
                } else SaluteTimer -= diff;
            }

            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
        }

        void ReceiveEmote(Player* player, uint32 emote)
        {
            if (emote == TEXT_EMOTE_SALUTE && player->GetQuestStatus(QUEST_SHATTERED_SALUTE) == QUEST_STATUS_INCOMPLETE)
            {
                if (CanEmote)
                {
                    player->AreaExploredOrEventHappens(QUEST_SHATTERED_SALUTE);
                    Reset();
                }
            }
        }
    };

};

/*######
## npc_thrall_warchief
######*/

enum ThrallWarchief
{
    QUEST_WHAT_THE_WIND_CARRIES =  6566,
    QUEST_FOR_THE_HORDE         =  4974,

    SPELL_CHAIN_LIGHTNING       = 16033,
    SPELL_SHOCK                 = 16034,

    GOSSIP_MENU_THRALL_STORY1   =  3665,
    GOSSIP_MENU_THRALL_STORY2   =  3666,
    GOSSIP_MENU_THRALL_STORY3   =  3667,
    GOSSIP_MENU_THRALL_STORY4   =  3668,
    GOSSIP_MENU_THRALL_STORY5   =  3669,
    GOSSIP_MENU_THRALL_STORY6   =  3670,
    GOSSIP_TEXT_THRALL_STORY1   =  5733,
    GOSSIP_TEXT_THRALL_STORY2   =  5734,
    GOSSIP_TEXT_THRALL_STORY3   =  5735,
    GOSSIP_TEXT_THRALL_STORY4   =  5736,
    GOSSIP_TEXT_THRALL_STORY5   =  5737,
    GOSSIP_TEXT_THRALL_STORY6   =  5738,

    FOR_THE_HORDE_YELL_COOLDOWN =  3600,

    HERALD_OF_THRALL_ID         = 10719,
    HERALD_OF_THRALL_GUID       = 3009704,
};

/// @todo verify abilities/timers
class npc_thrall_warchief : public CreatureScript
{
public:
    npc_thrall_warchief() : CreatureScript("npc_thrall_warchief"), lastTimeForTheHordeYell(0) { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        ClearGossipMenuFor(player);
        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                AddGossipItemFor(player, GOSSIP_MENU_THRALL_STORY1, 0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
                SendGossipMenuFor(player, GOSSIP_TEXT_THRALL_STORY1, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                AddGossipItemFor(player, GOSSIP_MENU_THRALL_STORY2, 0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3);
                SendGossipMenuFor(player, GOSSIP_TEXT_THRALL_STORY2, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+3:
                AddGossipItemFor(player, GOSSIP_MENU_THRALL_STORY3, 0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+4);
                SendGossipMenuFor(player, GOSSIP_TEXT_THRALL_STORY3, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+4:
                AddGossipItemFor(player, GOSSIP_MENU_THRALL_STORY4, 0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
                SendGossipMenuFor(player, GOSSIP_TEXT_THRALL_STORY4, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+5:
                AddGossipItemFor(player, GOSSIP_MENU_THRALL_STORY5, 0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+6);
                SendGossipMenuFor(player, GOSSIP_TEXT_THRALL_STORY5, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+6:
                AddGossipItemFor(player, GOSSIP_MENU_THRALL_STORY6, 0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7);
                SendGossipMenuFor(player, GOSSIP_TEXT_THRALL_STORY6, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+7:
                CloseGossipMenuFor(player);
                player->AreaExploredOrEventHappens(QUEST_WHAT_THE_WIND_CARRIES);
                break;
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (creature->IsQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(QUEST_WHAT_THE_WIND_CARRIES) == QUEST_STATUS_INCOMPLETE)
            AddGossipItemFor(player, Player::GetDefaultGossipMenuForSource(creature), 0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

        SendGossipMenuFor(player, player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnQuestReward(Player* /*player*/, Creature* creature, Quest const* quest, uint32 /*opt*/) override
    {
        if (quest->GetQuestId() == QUEST_FOR_THE_HORDE && lastTimeForTheHordeYell + FOR_THE_HORDE_YELL_COOLDOWN <= sWorld->GetGameTime())
        {
            CreatureData const* data = sObjectMgr->GetCreatureData(HERALD_OF_THRALL_GUID);
            if (data)
            {
                creature->GetMap()->LoadGrid(data->posX, data->posY);
                Creature* herald = ObjectAccessor::GetCreature(*creature, MAKE_NEW_GUID(HERALD_OF_THRALL_GUID, HERALD_OF_THRALL_ID, HIGHGUID_UNIT));
                if (herald)
                    sCreatureTextMgr->SendChat(herald, 0, nullptr);
            }

            lastTimeForTheHordeYell = sWorld->GetGameTime();
            sCreatureTextMgr->SendChat(creature, 0, nullptr);
        }
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_thrall_warchiefAI(creature);
    }

    struct npc_thrall_warchiefAI : public ScriptedAI
    {
        npc_thrall_warchiefAI(Creature* creature) : ScriptedAI(creature) { }

        uint32 ChainLightningTimer;
        uint32 ShockTimer;

        void Reset() override
        {
            ChainLightningTimer = 2000;
            ShockTimer = 8000;
        }

        void EnterCombat(Unit* /*who*/) override { }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
                return;

            if (ChainLightningTimer <= diff)
            {
                DoCastVictim(SPELL_CHAIN_LIGHTNING);
                ChainLightningTimer = 9000;
            } else ChainLightningTimer -= diff;

            if (ShockTimer <= diff)
            {
                DoCastVictim(SPELL_SHOCK);
                ShockTimer = 15000;
            } else ShockTimer -= diff;

            DoMeleeAttackIfReady();
        }
    };

private:
    uint32 lastTimeForTheHordeYell;
};

void AddSC_orgrimmar()
{
    new npc_shenthul();
    new npc_thrall_warchief();
}
