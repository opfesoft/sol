/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "Player.h"
#include "WorldSession.h"

// Ours
enum eNaturalist
{
    SPELL_MARK_OF_BITE          = 34906,
    GO_CAGE_ENTRY               = 182094,
};

class npc_natrualist_bite : public CreatureScript
{
public:
    npc_natrualist_bite() : CreatureScript("npc_natrualist_bite") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        uint32 menuId = creature->AI()->GetData(1) ? 7540 : 7520;
        player->PrepareGossipMenu(creature, menuId, false);
        player->SendPreparedGossip(creature);
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32  /*action*/) override
    {
        ClearGossipMenuFor(player);
        CloseGossipMenuFor(player);
        if (creature->AI()->GetData(1))
        {
            creature->CastSpell(player, SPELL_MARK_OF_BITE, true);
            player->KilledMonsterCredit(creature->GetEntry(), 0);
            creature->DespawnOrUnsummon(1000);
        }
        else
        {
            creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC|UNIT_FLAG_IMMUNE_TO_NPC);
            Creature* cr;
            if ((cr = creature->SummonCreature(17957, -186, -790, 43.8f, 4.2f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000)))
                cr->AI()->AttackStart(creature);
            if ((cr = creature->SummonCreature(17960, -188, -783, 43.8f, 4.2f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000)))
                cr->AI()->AttackStart(player);
            if ((cr = creature->SummonCreature(17957, -196, -783, 43.8f, 4.4f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000)))
                cr->AI()->AttackStart(player);
            GameObject* cage = creature->FindNearestGameObject(GO_CAGE_ENTRY, 20.0f);
            if (cage)
                cage->SetGoState(GO_STATE_ACTIVE);
            creature->SetHomePosition(-195.39f, -795.91f, 43.8f, 1.0f);
            creature->AI()->Talk(1);
        }
        return true;
    }

    struct npc_natrualist_biteAI : public ScriptedAI
    {
        npc_natrualist_biteAI(Creature* creature) : ScriptedAI(creature)
        {
            _spoken = 0;
        }

        uint8 _spoken;

        void MoveInLineOfSight(Unit* who) override
        {
            if (!_spoken && !me->IsHostileTo(who))
            {
                _spoken = 1;
                Talk(0);
            }
            ScriptedAI::MoveInLineOfSight(who);
        }

        void EnterCombat(Unit*) override
        { 
            _spoken = 2; 
        }

        uint32 GetData(uint32) const override 
        { 
            return _spoken == 2; 
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_natrualist_biteAI (creature);
    }
};

/*######
## AddSC
######*/

void AddSC_zangarmarsh()
{
    // Ours
    new npc_natrualist_bite();
}
