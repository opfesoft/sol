/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef SC_HYJAL_TRASH_AI_H
#define SC_HYJAL_TRASH_AI_H

#include "hyjal.h"
#include "ScriptedEscortAI.h"

#define MINRAIDDAMAGE  700000//minimal damage before trash can drop loot and reputation, resets if faction leader dies

struct hyjal_trashAI : public npc_escortAI
{
    hyjal_trashAI(Creature* creature);

    void UpdateAI(uint32 diff);

    void JustDied(Unit* /*killer*/);

    void DamageTaken(Unit* done_by, uint32 &damage, DamageEffectType, SpellSchoolMask);

    public:
        InstanceScript* instance;
        bool IsEvent;
        uint32 Delay;
        uint32 LastOverronPos;
        bool IsOverrun;
        bool SetupOverrun;
        uint32 OverrunType;
        uint8 faction;
        bool useFlyPath;
        uint32 damageTaken;
        float DummyTarget[3];

    //private:
};
#endif
