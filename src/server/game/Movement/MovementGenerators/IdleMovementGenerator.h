/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef ACORE_IDLEMOVEMENTGENERATOR_H
#define ACORE_IDLEMOVEMENTGENERATOR_H

#include "MovementGenerator.h"

class IdleMovementGenerator : public MovementGenerator
{
    public:

        void Initialize(Unit*);
        void Finalize(Unit*) {  }
        void Reset(Unit*);
        bool Update(Unit*, uint32) { return true; }
        MovementGeneratorType GetMovementGeneratorType() { return IDLE_MOTION_TYPE; }
};

extern IdleMovementGenerator si_idleMovement;

class RotateMovementGenerator : public MovementGenerator
{
    public:
        explicit RotateMovementGenerator(uint32 time, RotateDirection direction) : m_duration(time), m_maxDuration(time), m_direction(direction) {}

        void Initialize(Unit*);
        void Finalize(Unit*);
        void Reset(Unit* owner) { Initialize(owner); }
        bool Update(Unit*, uint32);
        MovementGeneratorType GetMovementGeneratorType() { return ROTATE_MOTION_TYPE; }

    private:
        uint32 m_duration, m_maxDuration;
        RotateDirection m_direction;
};

class DistractMovementGenerator : public MovementGenerator
{
    public:
        explicit DistractMovementGenerator(uint32 timer) : m_timer(timer) {}

        void Initialize(Unit*);
        void Finalize(Unit*);
        void Reset(Unit* owner) { Initialize(owner); }
        bool Update(Unit*, uint32);
        MovementGeneratorType GetMovementGeneratorType() { return DISTRACT_MOTION_TYPE; }

    protected:
        uint32 m_timer;
};

class AssistanceDistractMovementGenerator : public DistractMovementGenerator
{
    public:
        AssistanceDistractMovementGenerator(uint32 timer) :
            DistractMovementGenerator(timer) {}

        MovementGeneratorType GetMovementGeneratorType() { return ASSISTANCE_DISTRACT_MOTION_TYPE; }
        bool Update(Unit*, uint32);
        void Finalize(Unit*);
};

#endif
