/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef DEF_ZULGURUB_H
#define DEF_ZULGURUB_H

uint32 const EncounterCount = 13;

#define ZGScriptName "instance_zulgurub"

enum DataTypes
{
    DATA_JEKLIK             = 0,  // Main boss
    DATA_VENOXIS            = 1,  // Main boss
    DATA_MARLI              = 2,  // Main boss
    DATA_ARLOKK             = 3,  // Main boss
    DATA_THEKAL             = 4,  // Main boss
    DATA_HAKKAR             = 5,  // End boss
    DATA_MANDOKIR           = 6,  // Optional boss
    DATA_JINDO              = 7,  // Optional boss
    DATA_GAHZRANKA          = 8,  // Optional boss
    DATA_EDGE_OF_MADNESS    = 9,  // Optional Event Edge of Madness - one of: Gri'lek, Renataki, Hazza'rah, or Wushoolay
    DATA_LORKHAN            = 10, // Zealot Lor'Khan add to High priest Thekal!
    DATA_ZATH               = 11, // Zealot Zath add to High priest Thekal!
    DATA_OHGAN              = 12, // Bloodlord Mandokir's raptor mount
    TYPE_EDGE_OF_MADNESS    = 13  // Boss storage
};

enum CreatureIds
{
    NPC_ARLOKK              = 14515, // Arlokk Event
    NPC_PANTHER_TRIGGER     = 15091, // Arlokk Event
    NPC_ZULIAN_PROWLER      = 15101, // Arlokk Event
    NPC_ZEALOT_LORKHAN      = 11347,
    NPC_ZEALOT_ZATH         = 11348,
    NPC_HIGH_PRIEST_THEKAL  = 14509,
    NPC_JINDO_THE_HEXXER    = 11380,
    NPC_NIGHTMARE_ILLUSION  = 15163,
    NPC_SHADE_OF_JINDO      = 14986,
    NPC_SACRIFICED_TROLL    = 14826,
    NPC_MANDOKIR            = 11382, // Mandokir Event
    NPC_OHGAN               = 14988, // Mandokir Event
    NPC_VILEBRANCH_SPEAKER  = 11391, // Mandokir Event
    NPC_CHAINED_SPIRT       = 15117  // Mandokir Event

};

enum GameobjectIds
{
    GO_FORCEFIELD           = 180497, // Arlokk Event
    GO_GONG_OF_BETHEKK      = 180526  // Arlokk Event
};

template<class AI>
AI* GetZulGurubAI(Creature* creature)
{
    return GetInstanceAI<AI>(creature, ZGScriptName);
}

#endif
