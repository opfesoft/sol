/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"

enum Spells
{
    SPELL_ARCANE_EXPLOSION                        = 46608,
    SPELL_CONE_OF_COLD                            = 38384,
    SPELL_FIREBALL                                = 46988,
    SPELL_FROSTBOLT                               = 46987
};

enum Yells
{
    YELL_AGGRO                                   = 0,
    YELL_EVADE                                   = 1,
    YELL_SALVATION                               = 2,
};

enum Creatures
{
    NPC_WATER_ELEMENTAL                           = 25040
};

enum WaterElementalSpells
{
    SPELL_WATERBOLT                               = 46983
};

class npc_water_elemental : public CreatureScript
{
public:
    npc_water_elemental() : CreatureScript("npc_water_elemental") { }

    struct npc_water_elementalAI : public ScriptedAI
    {
        npc_water_elementalAI(Creature* creature) : ScriptedAI(creature) { }

        uint32 waterBoltTimer;
        uint64 balindaGUID;
        uint32 resetTimer;

        void Reset()
        {
            waterBoltTimer            = 3 * IN_MILLISECONDS;
            resetTimer                = 5 * IN_MILLISECONDS;
            balindaGUID = 0;
        }

        void UpdateAI(uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (waterBoltTimer < diff)
            {
                DoCastVictim(SPELL_WATERBOLT);
                waterBoltTimer = 5 * IN_MILLISECONDS;
            } else waterBoltTimer -= diff;

            // check if creature is not outside of building
            if (resetTimer < diff)
            {
                if (Creature* pBalinda = ObjectAccessor::GetCreature(*me, balindaGUID))
                    if (me->GetDistance2d(pBalinda->GetHomePosition().GetPositionX(), pBalinda->GetHomePosition().GetPositionY()) > 50)
                        EnterEvadeMode();
                resetTimer = 5 * IN_MILLISECONDS;
            } else resetTimer -= diff;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_water_elementalAI(creature);
    }
};

class boss_balinda : public CreatureScript
{
public:
    boss_balinda() : CreatureScript("boss_balinda") { }

    struct boss_balindaAI : public ScriptedAI
    {
        boss_balindaAI(Creature* creature) : ScriptedAI(creature), summons(me) { }

        uint32 arcaneExplosionTimer;
        uint32 coneOfColdTimer;
        uint32 fireBoltTimer;
        uint32 frostboltTimer;
        uint32 resetTimer;
        uint32 waterElementalTimer;

        SummonList summons;

        void Reset()
        {
            arcaneExplosionTimer      = urand(5 * IN_MILLISECONDS, 15 * IN_MILLISECONDS);
            coneOfColdTimer           = 8 * IN_MILLISECONDS;
            fireBoltTimer             = 1 * IN_MILLISECONDS;
            frostboltTimer            = 4 * IN_MILLISECONDS;
            resetTimer                = 5 * IN_MILLISECONDS;
            waterElementalTimer       = 0;

            summons.DespawnAll();
        }

        void EnterCombat(Unit* /*who*/)
        {
            Talk(YELL_AGGRO);
        }

        void JustRespawned()
        {
            Reset();
        }

        void JustSummoned(Creature* summoned)
        {
            CAST_AI(npc_water_elemental::npc_water_elementalAI, summoned->AI())->balindaGUID = me->GetGUID();
            summoned->AI()->AttackStart(SelectTarget(SELECT_TARGET_RANDOM, 0, 50, true));
            summoned->setFaction(me->getFaction());
            summons.Summon(summoned);
        }

        void JustDied(Unit* /*killer*/)
        {
            summons.DespawnAll();
        }

        void UpdateAI(uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (waterElementalTimer < diff)
            {
                if (summons.empty())
                    me->SummonCreature(NPC_WATER_ELEMENTAL, 0, 0, 0, 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 45 * IN_MILLISECONDS);
                waterElementalTimer = 50 * IN_MILLISECONDS;
            } else waterElementalTimer -= diff;

            if (arcaneExplosionTimer < diff)
            {
                DoCastVictim(SPELL_ARCANE_EXPLOSION);
                arcaneExplosionTimer =  urand(5 * IN_MILLISECONDS, 15 * IN_MILLISECONDS);
            } else arcaneExplosionTimer -= diff;

            if (coneOfColdTimer < diff)
            {
                DoCastVictim(SPELL_CONE_OF_COLD);
                coneOfColdTimer = urand(10 * IN_MILLISECONDS, 20 * IN_MILLISECONDS);
            } else coneOfColdTimer -= diff;

            if (fireBoltTimer < diff)
            {
                DoCastVictim(SPELL_FIREBALL);
                fireBoltTimer = urand(5 * IN_MILLISECONDS, 9 * IN_MILLISECONDS);
            } else fireBoltTimer -= diff;

            if (frostboltTimer < diff)
            {
                DoCastVictim(SPELL_FROSTBOLT);
                frostboltTimer = urand(4 * IN_MILLISECONDS, 12 * IN_MILLISECONDS);
            } else frostboltTimer -= diff;

            // check if creature is not outside of building
            if (resetTimer < diff)
            {
                if (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) > 50)
                {
                    EnterEvadeMode();
                    Talk(YELL_EVADE);
                }
                resetTimer = 5 * IN_MILLISECONDS;
            } else resetTimer -= diff;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_balindaAI(creature);
    }
};

void AddSC_boss_balinda()
{
    new boss_balinda;
    new npc_water_elemental;
};
