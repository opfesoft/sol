/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license: http://github.com/azerothcore/azerothcore-wotlk/LICENSE-GPL2
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#define _CRT_SECURE_NO_DEPRECATE

#include "wdt.h"

u_map_fcc MWMOMagic = { {'O', 'M', 'W', 'M'} };
u_map_fcc MPHDMagic = { {'D', 'H', 'P', 'M'} };
u_map_fcc MAINMagic = { {'N', 'I', 'A', 'M'} };

bool wdt_MWMO::prepareLoadedData()
{
    if (fcc != MWMOMagic.fcc)
        return false;
    return true;
}

bool wdt_MPHD::prepareLoadedData()
{
    if (fcc != MPHDMagic.fcc)
        return false;
    return true;
}

bool wdt_MAIN::prepareLoadedData()
{
    if (fcc != MAINMagic.fcc)
        return false;
    return true;
}

WDT_file::WDT_file()
{
    mphd = 0;
    main = 0;
    wmo  = 0;
}

WDT_file::~WDT_file()
{
    free();
}

void WDT_file::free()
{
    mphd = 0;
    main = 0;
    wmo  = 0;
    FileLoader::free();
}

bool WDT_file::prepareLoadedData()
{
    // Check parent
    if (!FileLoader::prepareLoadedData())
        return false;

    mphd = (wdt_MPHD *)((uint8*)version+version->size+8);
    if (!mphd->prepareLoadedData())
        return false;
    main = (wdt_MAIN *)((uint8*)mphd + mphd->size+8);
    if (!main->prepareLoadedData())
        return false;
    wmo = (wdt_MWMO *)((uint8*)main+ main->size+8);
    if (!wmo->prepareLoadedData())
        return false;
    return true;
}
