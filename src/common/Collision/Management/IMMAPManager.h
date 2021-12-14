/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef _IMMAPMANAGER_H
#define _IMMAPMANAGER_H

#include <string>
#include "Define.h"

// Interface for IMMapManger
namespace MMAP
{
    enum MMAP_LOAD_RESULT
    {
        MMAP_LOAD_RESULT_ERROR,
        MMAP_LOAD_RESULT_OK,
        MMAP_LOAD_RESULT_IGNORED,
    };

    class IMMapManager
    {
        private:
            bool iEnablePathFinding;

        public:
            IMMapManager() : iEnablePathFinding(true) {}
            virtual ~IMMapManager(void) {}

            //Enabled/Disabled Pathfinding
            void setEnablePathFinding(bool value) { iEnablePathFinding = value; }
            bool isEnablePathFinding() const { return (iEnablePathFinding); }
    };
}

#endif