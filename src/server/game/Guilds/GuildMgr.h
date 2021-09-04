/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under GNU AGPL3 v3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef _GUILDMGR_H
#define _GUILDMGR_H

#include "Guild.h"

class GuildMgr
{
    friend class ACE_Singleton<GuildMgr, ACE_Null_Mutex>;

private:
    GuildMgr();
    ~GuildMgr();

public:
    Guild* GetGuildByLeader(uint64 guid) const;
    Guild* GetGuildById(uint32 guildId) const;
    Guild* GetGuildByName(std::string const& guildName) const;
    std::string GetGuildNameById(uint32 guildId) const;

    void LoadGuilds();
    void AddGuild(Guild* guild);
    void RemoveGuild(uint32 guildId);

    uint32 GenerateGuildId();
    void SetNextGuildId(uint32 Id) { NextGuildId = Id; }

    void ResetTimes();
protected:
    typedef std::unordered_map<uint32, Guild*> GuildContainer;
    uint32 NextGuildId;
    GuildContainer GuildStore;
};

#define sGuildMgr ACE_Singleton<GuildMgr, ACE_Null_Mutex>::instance()

#endif
