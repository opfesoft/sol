/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under GNU AGPL3 v3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef _ADDONMGR_H
#define _ADDONMGR_H

#include "Define.h"
#include <string>
#include <list>

struct AddonInfo
{
    AddonInfo(const std::string& name, uint8 enabled, uint32 crc, uint8 state, bool crcOrPubKey)
        : Name(name), Enabled(enabled), CRC(crc), State(state), UsePublicKeyOrCRC(crcOrPubKey) {}

    std::string Name;
    uint8 Enabled;
    uint32 CRC;
    uint8 State;
    bool UsePublicKeyOrCRC;
};

struct SavedAddon
{
    SavedAddon(const std::string& name, uint32 crc) : Name(name)
    {
        CRC = crc;
    }

    std::string Name;
    uint32 CRC;
};

struct BannedAddon
{
    uint32 Id;
    uint8 NameMD5[16];
    uint8 VersionMD5[16];
    uint32 Timestamp;
};

#define STANDARD_ADDON_CRC 0x4c1c776d

namespace AddonMgr
{
    void LoadFromDB();
    void SaveAddon(AddonInfo const& addon);
    SavedAddon const* GetAddonInfo(const std::string& name);

    typedef std::list<BannedAddon> BannedAddonList;
    BannedAddonList const* GetBannedAddons();
}

#endif

