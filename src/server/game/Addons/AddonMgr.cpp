/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "AddonMgr.h"
#include "DatabaseEnv.h"
#include "Log.h"
#include "Timer.h"

#include <list>
#include <openssl/evp.h>

namespace AddonMgr
{

// Anonymous namespace ensures file scope of all the stuff inside it, even
// if you add something more to this namespace somewhere else.
namespace
{
    // List of saved addons (in DB).
    typedef std::list<SavedAddon> SavedAddonsList;

    SavedAddonsList m_knownAddons;
    BannedAddonList m_bannedAddons;
}

void LoadFromDB()
{
    uint32 oldMSTime = getMSTime();

    QueryResult result = CharacterDatabase.Query("SELECT name, crc FROM addons");
    if (!result)
    {
        sLog->outString(">> Loaded 0 known addons. DB table `addons` is empty!");
        sLog->outString();
        return;
    }

    uint32 count = 0;

    do
    {
        Field* fields = result->Fetch();

        std::string name = fields[0].GetString();
        uint32 crc = fields[1].GetUInt32();

        m_knownAddons.push_back(SavedAddon(name, crc));

        ++count;
    }
    while (result->NextRow());

    sLog->outString(">> Loaded %u known addons in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
    sLog->outString();

    oldMSTime = getMSTime();
    result = CharacterDatabase.Query("SELECT id, name, version, UNIX_TIMESTAMP(timestamp) FROM banned_addons");
    if (result)
    {
        uint32 count = 0;
        uint32 offset = 102;

        do
        {
            Field* fields = result->Fetch();

            BannedAddon addon;
            addon.Id = fields[0].GetUInt32() + offset;
            addon.Timestamp = uint32(fields[3].GetUInt64());

            std::string name = fields[1].GetString();
            std::string version = fields[2].GetString();

            EVP_Q_digest(NULL, (char*)"MD5", NULL, reinterpret_cast<uint8 const*>(name.c_str()), name.length(), addon.NameMD5, NULL);
            EVP_Q_digest(NULL, (char*)"MD5", NULL, reinterpret_cast<uint8 const*>(version.c_str()), version.length(), addon.VersionMD5, NULL);

            m_bannedAddons.push_back(addon);

            ++count;
        } while (result->NextRow());

        sLog->outString(">> Loaded %u banned addons in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
        sLog->outString();
    }
}

void SaveAddon(AddonInfo const& addon)
{
    std::string name = addon.Name;

    PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_INS_ADDON);

    stmt->setString(0, name);
    stmt->setUInt32(1, addon.CRC);

    CharacterDatabase.Execute(stmt);

    m_knownAddons.push_back(SavedAddon(addon.Name, addon.CRC));
}

SavedAddon const* GetAddonInfo(const std::string& name)
{
    for (SavedAddonsList::const_iterator it = m_knownAddons.begin(); it != m_knownAddons.end(); ++it)
    {
        SavedAddon const& addon = (*it);
        if (addon.Name == name)
            return &addon;
    }

    return NULL;
}

BannedAddonList const* GetBannedAddons()
{
    return &m_bannedAddons;
}

} // Namespace
