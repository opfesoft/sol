/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef ACORE_TARGETEDMOVEMENTGENERATOR_H
#define ACORE_TARGETEDMOVEMENTGENERATOR_H

#include "MovementGenerator.h"
#include "FollowerReference.h"
#include "Timer.h"
#include "Unit.h"
#include "PathGenerator.h"

class TargetedMovementGeneratorBase
{
    public:
        TargetedMovementGeneratorBase(Unit* target) { i_target.link(target, this); }
        void stopFollowing() { }
    protected:
        FollowerReference i_target;
        Position lastTargetXYZ;
};

template<class T, typename D>
class TargetedMovementGeneratorMedium : public MovementGeneratorMedium< T, D >, public TargetedMovementGeneratorBase
{
    protected:
        TargetedMovementGeneratorMedium(Unit* target, float offset, float angle) :
            TargetedMovementGeneratorBase(target), i_path(NULL), lastPathingFailMSTime(0),
            i_recheckDistance(0), i_recheckDistanceForced(2500), i_offset(offset), i_angle(angle),
            i_recalculateTravel(false), i_targetReached(false), i_forceRecheckDistance(false)
        {
        }
        ~TargetedMovementGeneratorMedium() { delete i_path; }

    public:
        bool DoUpdate(T*, uint32);
        Unit* GetTarget() const { return i_target.getTarget(); }
        float GetOffset() const { return i_offset; }
        float GetAngle() const { return i_angle; }
        Position const* GetNextPos() const { return &i_nextPos; }

        void unitSpeedChanged() { i_recalculateTravel = true; }
        bool IsReachable() const { return (i_path) ? (i_path->GetPathType() & PATHFIND_NORMAL) : true; }

    protected:
        void _setTargetLocation(T* owner, bool initial);

        PathGenerator* i_path;
        uint32 lastPathingFailMSTime;
        TimeTrackerSmall i_recheckDistance;
        TimeTrackerSmall i_recheckDistanceForced;
        float i_offset;
        float i_angle;
        bool i_recalculateTravel;
        bool i_targetReached;
        bool i_forceRecheckDistance;
        Position i_nextPos;
};

template<class T>
class ChaseMovementGenerator : public TargetedMovementGeneratorMedium<T, ChaseMovementGenerator<T> >
{
    public:
        ChaseMovementGenerator(Unit* target)
            : TargetedMovementGeneratorMedium<T, ChaseMovementGenerator<T> >(target) {}
        ChaseMovementGenerator(Unit* target, float offset, float angle)
            : TargetedMovementGeneratorMedium<T, ChaseMovementGenerator<T> >(target, offset, angle) {}
        ~ChaseMovementGenerator() {}

        MovementGeneratorType GetMovementGeneratorType() { return CHASE_MOTION_TYPE; }

        void DoInitialize(T*);
        void DoFinalize(T*);
        void DoReset(T*);
        void MovementInform(T*);

        static void _clearUnitStateMove(T* u) { u->ClearUnitState(UNIT_STATE_CHASE_MOVE); }
        static void _addUnitStateMove(T* u)  { u->AddUnitState(UNIT_STATE_CHASE_MOVE); }
        bool EnableWalking() const { return false;}
        bool _lostTarget(T* u) const { return u->GetVictim() != this->GetTarget(); }
        void _reachTarget(T*);
};

template<class T>
class FollowMovementGenerator : public TargetedMovementGeneratorMedium<T, FollowMovementGenerator<T> >
{
    public:
        FollowMovementGenerator(Unit* target)
            : TargetedMovementGeneratorMedium<T, FollowMovementGenerator<T> >(target){}
        FollowMovementGenerator(Unit* target, float offset, float angle)
            : TargetedMovementGeneratorMedium<T, FollowMovementGenerator<T> >(target, offset, angle) {}
        ~FollowMovementGenerator() {}

        MovementGeneratorType GetMovementGeneratorType() { return FOLLOW_MOTION_TYPE; }

        void DoInitialize(T*);
        void DoFinalize(T*);
        void DoReset(T*);
        void MovementInform(T*);

        static void _clearUnitStateMove(T* u) { u->ClearUnitState(UNIT_STATE_FOLLOW_MOVE); }
        static void _addUnitStateMove(T* u)  { u->AddUnitState(UNIT_STATE_FOLLOW_MOVE); }
        bool EnableWalking() const;
        bool _lostTarget(T*) const { return false; }
        void _reachTarget(T*) {}
    private:
        void _updateSpeed(T* owner);
};

#endif
