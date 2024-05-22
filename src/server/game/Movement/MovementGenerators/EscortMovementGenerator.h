/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU AGPLv3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE.md
 * Originally written by Xinef - Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
*/

#ifndef ACORE_ESCORTMOVEMENTGENERATOR_H
#define ACORE_ESCORTMOVEMENTGENERATOR_H

#include "MovementGenerator.h"

template<class T>
class EscortMovementGenerator : public MovementGeneratorMedium< T, EscortMovementGenerator<T> >
{
    public:
        EscortMovementGenerator(Movement::PointsArray* path = NULL, bool setSplineId = true) : i_recalculateSpeed(false), _splineId(0), _setSplineId(setSplineId)
        {
            if (path)
                m_precomputedPath = *path;
        }

        void DoInitialize(T*);
        void DoFinalize(T*);
        void DoReset(T*);
        bool DoUpdate(T*, uint32);

        void unitSpeedChanged() { i_recalculateSpeed = true; }

        MovementGeneratorType GetMovementGeneratorType() { return ESCORT_MOTION_TYPE; }

        uint32 GetSplineId() const { return _splineId; }

    private:
        bool i_recalculateSpeed;
        Movement::PointsArray m_precomputedPath;

        uint32 _splineId;
        bool _setSplineId;
};

#endif

