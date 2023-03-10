/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef DEF_TEMPLE_OF_AHNQIRAJ_H
#define DEF_TEMPLE_OF_AHNQIRAJ_H

enum DataTypes
{
    DATA_SKERAM             = 1,
    DATA_KRI                = 2,
    DATA_VEM                = 3,
    DATA_VEMISDEAD          = 4,
    DATA_VEM_DEATH          = 5,
    DATA_VEKLOR             = 6,
    DATA_VEKLORISDEAD       = 7,
    DATA_VEKLOR_DEATH       = 8,
    DATA_VEKNILASH          = 9,
    DATA_VEKNILASHISDEAD    = 10,
    DATA_VEKNILASH_DEATH    = 11,
    DATA_BUG_TRIO_DEATH     = 14,
    DATA_CTHUN_PHASE        = 20,
    DATA_VISCIDUS           = 21
};

enum Creatures
{
    BOSS_EYE_OF_CTHUN       = 15589,
    NPC_CTHUN_PORTAL        = 15896,
    NPC_CLAW_TENTACLE       = 15725,
    NPC_EYE_TENTACLE        = 15726,
    NPC_SMALL_PORTAL        = 15904,
    NPC_BODY_OF_CTHUN       = 15809,
    NPC_GIANT_CLAW_TENTACLE = 15728,
    NPC_GIANT_EYE_TENTACLE  = 15334,
    NPC_FLESH_TENTACLE      = 15802,
    NPC_GIANT_PORTAL        = 15910,

    NPC_VISCIDUS            = 15299,
    NPC_GLOB_OF_VISCIDUS    = 15667,

    NPC_SKERAM              = 15263,
    NPC_VEM                 = 15544,
    NPC_KRI                 = 15511,
    NPC_VEKLOR              = 15276,
    NPC_VEKNILASH           = 15275
};
#endif

