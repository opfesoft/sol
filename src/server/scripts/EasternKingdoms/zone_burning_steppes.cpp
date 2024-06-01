/*
 * Copyright (C) 2022+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU AGPLv3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE.md
 */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "Player.h"

/*###
## npc_mathredis_firestar
###*/

enum MathredisFirestar
{
    ITEM_LIBRAM_OF_RUMINATION            = 11732,
    ITEM_LIBRAM_OF_CONSTITUTION          = 11733,
    ITEM_LIBRAM_OF_TENACITY              = 11734,
    ITEM_LIBRAM_OF_RESILIENCE            = 11736,
    ITEM_LIBRAM_OF_VORACITY              = 11737,

    GOSSIP_MENU_LIBRAM_OF_RUMINATION     =  2299,
    GOSSIP_MENU_LIBRAM_OF_CONSTITUTION   =  2300,
    GOSSIP_MENU_LIBRAM_OF_TENACITY       =  2301,
    GOSSIP_MENU_LIBRAM_OF_RESILIENCE     =  2302,
    GOSSIP_MENU_LIBRAM_OF_VORACITY       =  2303,

    GOSSIP_OPTION_LIBRAM_OF_RUMINATION   =     0,
    GOSSIP_OPTION_LIBRAM_OF_CONSTITUTION =     1,
    GOSSIP_OPTION_LIBRAM_OF_TENACITY     =     2,
    GOSSIP_OPTION_LIBRAM_OF_RESILIENCE   =     3,
    GOSSIP_OPTION_LIBRAM_OF_VORACITY     =     4,

    QUEST_LIBRAM_OF_RUMINATION           =  4463,
    QUEST_LIBRAM_OF_CONSTITUTION         =  4481,
    QUEST_LIBRAM_OF_TENACITY             =  4482,
    QUEST_LIBRAM_OF_RESILIENCE           =  4483,
    QUEST_LIBRAM_OF_VORACITY             =  4484,
};

class npc_mathredis_firestar : public CreatureScript
{
public:
    npc_mathredis_firestar() : CreatureScript("npc_mathredis_firestar") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (creature->IsQuestGiver())
        {
            if (player->HasItemCount(ITEM_LIBRAM_OF_RUMINATION))
                AddGossipItemFor(player, Player::GetDefaultGossipMenuForSource(creature), GOSSIP_OPTION_LIBRAM_OF_RUMINATION, GOSSIP_SENDER_MAIN,
                    static_cast<int>(GOSSIP_ACTION_INFO_DEF) + static_cast<int>(GOSSIP_OPTION_LIBRAM_OF_RUMINATION));
            if (player->HasItemCount(ITEM_LIBRAM_OF_CONSTITUTION))
                AddGossipItemFor(player, Player::GetDefaultGossipMenuForSource(creature), GOSSIP_OPTION_LIBRAM_OF_CONSTITUTION, GOSSIP_SENDER_MAIN,
                    static_cast<int>(GOSSIP_ACTION_INFO_DEF) + static_cast<int>(GOSSIP_OPTION_LIBRAM_OF_CONSTITUTION));
            if (player->HasItemCount(ITEM_LIBRAM_OF_TENACITY))
                AddGossipItemFor(player, Player::GetDefaultGossipMenuForSource(creature), GOSSIP_OPTION_LIBRAM_OF_TENACITY, GOSSIP_SENDER_MAIN,
                    static_cast<int>(GOSSIP_ACTION_INFO_DEF) + static_cast<int>(GOSSIP_OPTION_LIBRAM_OF_TENACITY));
            if (player->HasItemCount(ITEM_LIBRAM_OF_RESILIENCE))
                AddGossipItemFor(player, Player::GetDefaultGossipMenuForSource(creature), GOSSIP_OPTION_LIBRAM_OF_RESILIENCE, GOSSIP_SENDER_MAIN,
                    static_cast<int>(GOSSIP_ACTION_INFO_DEF) + static_cast<int>(GOSSIP_OPTION_LIBRAM_OF_RESILIENCE));
            if (player->HasItemCount(ITEM_LIBRAM_OF_VORACITY))
                AddGossipItemFor(player, Player::GetDefaultGossipMenuForSource(creature), GOSSIP_OPTION_LIBRAM_OF_VORACITY, GOSSIP_SENDER_MAIN,
                    static_cast<int>(GOSSIP_ACTION_INFO_DEF) + static_cast<int>(GOSSIP_OPTION_LIBRAM_OF_VORACITY));
        }

        SendGossipMenuFor(player, player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        ClearGossipMenuFor(player);
        if (!creature->IsQuestGiver())
            return true;

        QuestMenu& qm = player->PlayerTalkClass->GetQuestMenu();
        qm.ClearMenu();

        switch (action)
        {
            case static_cast<int>(GOSSIP_ACTION_INFO_DEF) + static_cast<int>(GOSSIP_OPTION_LIBRAM_OF_RUMINATION):
                qm.AddMenuItem(QUEST_LIBRAM_OF_RUMINATION, 4);
                SendGossipMenuFor(player, player->GetGossipTextId(GOSSIP_MENU_LIBRAM_OF_RUMINATION, creature), creature->GetGUID());
                break;
            case static_cast<int>(GOSSIP_ACTION_INFO_DEF) + static_cast<int>(GOSSIP_OPTION_LIBRAM_OF_CONSTITUTION):
                qm.AddMenuItem(QUEST_LIBRAM_OF_CONSTITUTION, 4);
                SendGossipMenuFor(player, player->GetGossipTextId(GOSSIP_MENU_LIBRAM_OF_CONSTITUTION, creature), creature->GetGUID());
                break;
            case static_cast<int>(GOSSIP_ACTION_INFO_DEF) + static_cast<int>(GOSSIP_OPTION_LIBRAM_OF_TENACITY):
                qm.AddMenuItem(QUEST_LIBRAM_OF_TENACITY, 4);
                SendGossipMenuFor(player, player->GetGossipTextId(GOSSIP_MENU_LIBRAM_OF_TENACITY, creature), creature->GetGUID());
                break;
            case static_cast<int>(GOSSIP_ACTION_INFO_DEF) + static_cast<int>(GOSSIP_OPTION_LIBRAM_OF_RESILIENCE):
                qm.AddMenuItem(QUEST_LIBRAM_OF_RESILIENCE, 4);
                SendGossipMenuFor(player, player->GetGossipTextId(GOSSIP_MENU_LIBRAM_OF_RESILIENCE, creature), creature->GetGUID());
                break;
            case static_cast<int>(GOSSIP_ACTION_INFO_DEF) + static_cast<int>(GOSSIP_OPTION_LIBRAM_OF_VORACITY):
                qm.AddMenuItem(QUEST_LIBRAM_OF_VORACITY, 4);
                SendGossipMenuFor(player, player->GetGossipTextId(GOSSIP_MENU_LIBRAM_OF_VORACITY, creature), creature->GetGUID());
                break;
        }

        return true;
    }

    uint32 GetDialogStatus(Player* player, Creature* /*creature*/) override
    {
        if (player->HasItemCount(ITEM_LIBRAM_OF_RUMINATION) ||
            player->HasItemCount(ITEM_LIBRAM_OF_CONSTITUTION) ||
            player->HasItemCount(ITEM_LIBRAM_OF_TENACITY) ||
            player->HasItemCount(ITEM_LIBRAM_OF_RESILIENCE) ||
            player->HasItemCount(ITEM_LIBRAM_OF_VORACITY))
            return DIALOG_STATUS_SCRIPTED_NO_STATUS;
        else
            return DIALOG_STATUS_NONE;
    }
};

void AddSC_burning_steppes()
{
    new npc_mathredis_firestar();
}
