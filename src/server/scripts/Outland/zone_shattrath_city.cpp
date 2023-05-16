/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

/* ScriptData
SDName: Shattrath_City
SD%Complete: 100
SDComment: Quest support: 10004, 10009, 10211. Flask vendors, Teleport to Caverns of Time
SDCategory: Shattrath City
EndScriptData */

/* ContentData
npc_shattrathflaskvendors
npc_zephyr
npc_kservant
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "Player.h"
#include "WorldSession.h"

/*
##################################################
Shattrath City Flask Vendors provides flasks to people exalted with 3 fActions:
Haldor the Compulsive
Arcanist Xorith
Both sell special flasks for use in Outlands 25man raids only,
purchasable for one Mark of Illidari each
Purchase requires exalted reputation with Scryers/Aldor, Cenarion Expedition and The Sha'tar
##################################################
*/

class npc_shattrathflaskvendors : public CreatureScript
{
public:
    npc_shattrathflaskvendors() : CreatureScript("npc_shattrathflaskvendors") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        ClearGossipMenuFor(player);
        if (action == GOSSIP_ACTION_TRADE)
            player->GetSession()->SendListInventory(creature->GetGUID());

        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (creature->GetEntry() == 23484)
        {
            // Aldor vendor
            if (creature->IsVendor() && (player->GetReputationRank(932) == REP_EXALTED) && (player->GetReputationRank(935) == REP_EXALTED) && (player->GetReputationRank(942) == REP_EXALTED))
            {
                AddGossipItemFor(player, GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);
                SendGossipMenuFor(player, 11085, creature->GetGUID());
            }
            else
            {
                SendGossipMenuFor(player, 11083, creature->GetGUID());
            }
        }

        if (creature->GetEntry() == 23483)
        {
            // Scryers vendor
            if (creature->IsVendor() && (player->GetReputationRank(934) == REP_EXALTED) && (player->GetReputationRank(935) == REP_EXALTED) && (player->GetReputationRank(942) == REP_EXALTED))
            {
                AddGossipItemFor(player, GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);
                SendGossipMenuFor(player, 11085, creature->GetGUID());
            }
            else
            {
                SendGossipMenuFor(player, 11084, creature->GetGUID());
            }
        }

        return true;
    }
};

/*######
# npc_zephyr
######*/

#define GOSSIP_HZ "Take me to the Caverns of Time."

class npc_zephyr : public CreatureScript
{
public:
    npc_zephyr() : CreatureScript("npc_zephyr") { }

    bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 /*sender*/, uint32 action) override
    {
        ClearGossipMenuFor(player);
        if (action == GOSSIP_ACTION_INFO_DEF+1)
            player->CastSpell(player, 37778, false);

        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (player->GetReputationRank(989) >= REP_REVERED)
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, GOSSIP_HZ, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

        SendGossipMenuFor(player, player->GetGossipTextId(creature), creature->GetGUID());

        return true;
    }
};

/*######
# npc_kservant
######*/

enum KServant
{
    SAY1       = 0,
    WHISP1     = 1,
    WHISP2     = 2,
    WHISP3     = 3,
    WHISP4     = 4,
    WHISP5     = 5,
    WHISP6     = 6,
    WHISP7     = 7,
    WHISP8     = 8,
    WHISP9     = 9,
    WHISP10    = 10,
    WHISP11    = 11,
    WHISP12    = 12,
    WHISP13    = 13,
    WHISP14    = 14,
    WHISP15    = 15,
    WHISP16    = 16,
    WHISP17    = 17,
    WHISP18    = 18,
    WHISP19    = 19,
    WHISP20    = 20,
    WHISP21    = 21
};

class npc_kservant : public CreatureScript
{
public:
    npc_kservant() : CreatureScript("npc_kservant") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_kservantAI(creature);
    }

    struct npc_kservantAI : public npc_escortAI
    {
    public:
        npc_kservantAI(Creature* creature) : npc_escortAI(creature) { }

        void WaypointReached(uint32 waypointId)
        {
            Player* player = GetPlayerForEscort();
            if (!player)
                return;

            switch (waypointId)
            {
                case 0:
                    Talk(SAY1, player);
                    break;
                case 4:
                    Talk(WHISP1, player);
                    break;
                case 6:
                    Talk(WHISP2, player);
                    break;
                case 8:
                    Talk(WHISP3, player);
                    break;
                case 10:
                    Talk(WHISP4, player);
                    break;
                case 31:
                    Talk(WHISP5, player);
                    break;
                case 32:
                    Talk(WHISP6, player);
                    break;
                case 33:
                    Talk(WHISP7, player);
                    break;
                case 73:
                    Talk(WHISP8, player);
                    break;
                case 74:
                    Talk(WHISP9, player);
                    break;
                case 75:
                    Talk(WHISP10, player);
                    break;
                case 76:
                    Talk(WHISP11, player);
                    break;
                case 98:
                    Talk(WHISP12, player);
                    break;
                case 99:
                    Talk(WHISP13, player);
                    break;
                case 113:
                    Talk(WHISP14, player);
                    break;
                case 119:
                    Talk(WHISP15, player);
                    break;
                case 120:
                    Talk(WHISP16, player);
                    break;
                case 121:
                    Talk(WHISP17, player);
                    break;
                case 127:
                    Talk(WHISP18, player);
                    break;
                case 128:
                    Talk(WHISP19, player);
                    break;
                case 129:
                    Talk(WHISP20, player);
                    break;
                case 130:
                    Talk(WHISP21, player);
                    player->GroupEventHappens(10211, me);
                    break;
            }
        }

        void IsSummonedBy(Unit* summoner)
        {
            if (!summoner)
                return;

            Player* player = summoner->ToPlayer();
            if (player && player->GetQuestStatus(10211) == QUEST_STATUS_INCOMPLETE)
                Start(false, false, summoner->GetGUID());
        }

        void Reset() { }
    };
};

void AddSC_shattrath_city()
{
    new npc_shattrathflaskvendors();
    new npc_zephyr();
    new npc_kservant();
}
