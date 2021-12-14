/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

/* ScriptData
SDName: Feralas
SD%Complete: 100
SDComment: Quest support: 3520, 2767, Special vendor Gregan Brewspewer
SDCategory: Feralas
EndScriptData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedEscortAI.h"
#include "ScriptedGossip.h"
#include "SpellScript.h"
#include "Player.h"
#include "WorldSession.h"

/*######
## npc_gregan_brewspewer
######*/

enum GreganBrewspewer
{
    GOSSIP_MENU_GREGAN_BREWSPEWER_INTRO        = 1802,
    GOSSIP_MENU_GREGAN_BREWSPEWER_EVOROOT_INFO = 1801,
    NPC_TEXT_GREGAN_BREWSPEWER_INTRO           = 2433,
    NPC_TEXT_GREGAN_BREWSPEWER_EVOROOT_INFO_1  = 2434,
    NPC_TEXT_GREGAN_BREWSPEWER_EVOROOT_INFO_2  = 2570,
    QUEST_THE_VIDERE_ELIXIR                    = 3909
};

class npc_gregan_brewspewer : public CreatureScript
{
public:
    npc_gregan_brewspewer() : CreatureScript("npc_gregan_brewspewer") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        ClearGossipMenuFor(player);

        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF + 1:
                AddGossipItemFor(player, GOSSIP_MENU_GREGAN_BREWSPEWER_EVOROOT_INFO, 0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                SendGossipMenuFor(player, NPC_TEXT_GREGAN_BREWSPEWER_EVOROOT_INFO_1, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF + 2:
                SendGossipMenuFor(player, NPC_TEXT_GREGAN_BREWSPEWER_EVOROOT_INFO_2, creature->GetGUID());
                break;
            case GOSSIP_ACTION_TRADE:
                player->GetSession()->SendListInventory(creature->GetGUID());
                break;
        }

        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(QUEST_THE_VIDERE_ELIXIR) == QUEST_STATUS_INCOMPLETE)
        {
            AddGossipItemFor(player, GOSSIP_MENU_GREGAN_BREWSPEWER_INTRO, 0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            AddGossipItemFor(player, GOSSIP_MENU_GREGAN_BREWSPEWER_INTRO, 1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);
        }

        SendGossipMenuFor(player, NPC_TEXT_GREGAN_BREWSPEWER_INTRO, creature->GetGUID());
        return true;
    }
};

enum GordunniTrap
{
    GO_GORDUNNI_DIRT_MOUND = 144064,
};

class spell_gordunni_trap : public SpellScriptLoader
{
    public:
        spell_gordunni_trap() : SpellScriptLoader("spell_gordunni_trap") { }

        class spell_gordunni_trap_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gordunni_trap_SpellScript);

            void HandleDummy()
            {
                if (Unit* caster = GetCaster())
                    if (GameObject* chest = caster->SummonGameObject(GO_GORDUNNI_DIRT_MOUND, caster->GetPositionX(), caster->GetPositionY(), caster->GetPositionZ(), 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0))
                    {
                        chest->SetSpellId(GetSpellInfo()->Id);
                        caster->RemoveGameObject(chest, false);
                    }
            }

            void Register()
            {
                OnCast += SpellCastFn(spell_gordunni_trap_SpellScript::HandleDummy);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gordunni_trap_SpellScript();
        }
};

/*######
## AddSC
######*/

void AddSC_feralas()
{
    new npc_gregan_brewspewer();
    new spell_gordunni_trap();
}
