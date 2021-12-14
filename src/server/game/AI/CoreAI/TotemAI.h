/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef ACORE_TOTEMAI_H
#define ACORE_TOTEMAI_H

#include "CreatureAI.h"
#include "Timer.h"

class Creature;
class Totem;

class TotemAI : public CreatureAI
{
    public:

        explicit TotemAI(Creature* c);

        void MoveInLineOfSight(Unit* who);
        void AttackStart(Unit* victim);
        void EnterEvadeMode();
        void SpellHit(Unit* /*caster*/, const SpellInfo* /*spellInfo*/);
        void DoAction(int32 param);

        void UpdateAI(uint32 diff);
        static int Permissible(Creature const* creature);

    private:
        uint64 i_victimGuid;
};

class KillMagnetEvent : public BasicEvent
{
    public:
        KillMagnetEvent(Unit& self) : _self(self) { }
        bool Execute(uint64 /*e_time*/, uint32 /*p_time*/)
        {
            _self.setDeathState(JUST_DIED);
            return true;
        }

    protected:
        Unit& _self;
};

#endif

