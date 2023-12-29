/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

/* ScriptData
SDName: Hinterlands
SD%Complete: 100
SDComment: Quest support: 863, 2742
SDCategory: The Hinterlands
EndScriptData */

/* ContentData
npc_rinji
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedEscortAI.h"
#include "Player.h"

/*######
## npc_rinji
######*/

enum Rinji
{
    SAY_RIN_BY_OUTRUNNER    = 0,
    SAY_RIN_FREE            = 0, // from here
    SAY_RIN_HELP            = 1,
    SAY_RIN_COMPLETE        = 2,
    SAY_RIN_PROGRESS_1      = 3,
    SAY_RIN_PROGRESS_2      = 4,
    QUEST_RINJI_TRAPPED     = 2742,
    NPC_RANGER              = 2694,
    NPC_OUTRUNNER           = 2691,
    GO_RINJI_CAGE           = 142036
};

struct Location
{
    float posX, posY, posZ;
};

Location AmbushSpawn[] =
{
    { 191.296f, -2839.33f, 107.389f },
    { 190.944f, -2842.48f, 106.592f },
    { 194.007f, -2840.77f, 107.238f },
    { 70.9725f, -2848.67f, 109.460f },
    { 72.2378f, -2846.40f, 109.721f },
    { 68.5215f, -2846.45f, 109.407f }
};

Location AmbushMoveTo[] =
{
    { 166.630f, -2824.78f, 108.153f },
    { 165.848f, -2827.86f, 107.401f },
    { 169.901f, -2826.39f, 108.019f },
    { 70.8866f, -2874.34f, 116.676f },
    { 72.1135f, -2871.84f, 116.192f },
    { 67.7536f, -2873.28f, 116.410f }
};

class npc_rinji : public CreatureScript
{
public:
    npc_rinji() : CreatureScript("npc_rinji") { }

    struct npc_rinjiAI : public npc_escortAI
    {
        npc_rinjiAI(Creature* creature) : npc_escortAI(creature)
        {
            _IsByOutrunner = false;
            spawnId = 0;
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
        }

        void Reset()
        {
            postEventCount = 0;
            postEventTimer = 6000;
        }

        void JustRespawned()
        {
            _IsByOutrunner = false;
            spawnId = 0;
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);

            npc_escortAI::JustRespawned();
        }

        void EnterCombat(Unit* who)
        {
            if (HasEscortState(STATE_ESCORT_ESCORTING))
            {
                if (who->GetEntry() == NPC_OUTRUNNER && !_IsByOutrunner)
                {
                    if (Creature* talker = who->ToCreature())
                        talker->AI()->Talk(SAY_RIN_BY_OUTRUNNER);
                    _IsByOutrunner = true;
                }

                if (rand()%4)
                    return;

                //only if attacked and escorter is not in combat?
                Talk(SAY_RIN_HELP);
            }
        }

        void DoSpawnAmbush(bool _first)
        {
            if (!_first)
                spawnId = 1;

            uint32 posId = spawnId * 3;

            for (int i = 0; i < 3; ++i)
            {
                uint32 creatureId = (i == 0 ? NPC_RANGER : NPC_OUTRUNNER);

                if (Creature* summon = me->SummonCreature(creatureId, AmbushSpawn[posId].posX, AmbushSpawn[posId].posY, AmbushSpawn[posId].posZ, 0.0f,
                    TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 60000))
                {
                    summon->setActive(true);
                    summon->SetWalk(false);
                    summon->GetMotionMaster()->MovePoint(0, AmbushMoveTo[posId].posX, AmbushMoveTo[posId].posY, AmbushMoveTo[posId].posZ);
                }

                posId++;
            }
        }

        void sQuestAccept(Player* player, Quest const* quest)
        {
            if (quest->GetQuestId() == QUEST_RINJI_TRAPPED)
            {
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
                me->SetReactState(REACT_DEFENSIVE);
                me->setActive(true);

                if (GameObject* go = me->FindNearestGameObject(GO_RINJI_CAGE, INTERACTION_DISTANCE))
                    go->UseDoorOrButton();

                npc_escortAI::Start(false, false, player->GetGUID(), quest);
            }
        }

        void WaypointReached(uint32 waypointId)
        {
            Player* player = GetPlayerForEscort();
            if (!player)
                return;

            switch (waypointId)
            {
                case 1:
                    Talk(SAY_RIN_FREE, player);
                    break;
                case 7:
                    DoSpawnAmbush(true);
                    break;
                case 13:
                    DoSpawnAmbush(false);
                    break;
                case 17:
                    me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
                    Talk(SAY_RIN_COMPLETE, player);
                    player->GroupEventHappens(QUEST_RINJI_TRAPPED, me);
                    SetRun();
                    postEventCount = 1;
                    SetEscortPaused(true);
                    break;
            }
        }

        void UpdateEscortAI(uint32 diff)
        {
            //Check if we have a current target
            if (!UpdateVictim())
            {
                if (HasEscortState(STATE_ESCORT_ESCORTING) && postEventCount)
                {
                    if (postEventTimer <= diff)
                    {
                        postEventTimer = 6000;

                        if (Player* player = GetPlayerForEscort())
                        {
                            switch (postEventCount)
                            {
                                case 1:
                                    Talk(SAY_RIN_PROGRESS_1, player);
                                    ++postEventCount;
                                    break;
                                case 2:
                                    Talk(SAY_RIN_PROGRESS_2, player);
                                    postEventCount = 0;
                                    SetEscortPaused(false);
                                    break;
                            }
                        }
                        else
                        {
                            me->DespawnOrUnsummon();
                            return;
                        }
                    }
                    else
                        postEventTimer -= diff;
                }
                return;
            }
            DoMeleeAttackIfReady();
        }

    private:
        uint32 postEventCount;
        uint32 postEventTimer;
        uint32 spawnId;
        bool   _IsByOutrunner;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_rinjiAI(creature);
    }
};

void AddSC_hinterlands()
{
    new npc_rinji();
}
