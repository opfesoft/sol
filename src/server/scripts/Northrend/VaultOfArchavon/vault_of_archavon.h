/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef DEF_ARCHAVON_H
#define DEF_ARCHAVON_H

enum Creatures
{
    CREATURE_ARCHAVON                           = 31125,
    CREATURE_EMALON                             = 33993,
    CREATURE_KORALON                            = 35013,
    CREATURE_TORAVON                            = 38433,
};

enum Data
{
    EVENT_ARCHAVON          = 0,
    EVENT_EMALON            = 1,
    EVENT_KORALON           = 2,
    EVENT_TORAVON           = 3,
    MAX_ENCOUNTER           = 4,
    DATA_STONED             = 5,
};


enum AchievementCriteriaIds
{
    CRITERIA_EARTH_WIND_FIRE_10 = 12018,
    CRITERIA_EARTH_WIND_FIRE_25 = 12019,
};

enum AchievementSpells
{
    SPELL_EARTH_WIND_FIRE_ACHIEVEMENT_CHECK = 68308,
    SPELL_STONED_AURA                       = 63080,
};

#endif
