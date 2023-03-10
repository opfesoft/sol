/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef _WARDENCHECKMGR_H
#define _WARDENCHECKMGR_H

#include <map>
#include "Cryptography/BigNumber.h"

enum WardenActions
{
    WARDEN_ACTION_LOG   = 0,
    WARDEN_ACTION_KICK  = 1,
    WARDEN_ACTION_BAN   = 2,
};

constexpr uint8 MAX_WARDEN_ACTION = 3;

enum WardenCheckTypes
{
    WARDEN_CHECK_MEM_TYPE   = 0,
    WARDEN_CHECK_LUA_TYPE   = 1,
    WARDEN_CHECK_OTHER_TYPE = 2,
};

constexpr uint8 MAX_WARDEN_CHECK_TYPES = 3;

struct WardenCheck
{
    uint8 Type;
    BigNumber Data;
    uint32 Address;                                         // PROC_CHECK, MEM_CHECK, PAGE_CHECK
    uint8 Length;                                           // PROC_CHECK, MEM_CHECK, PAGE_CHECK
    std::string Str;                                        // LUA, MPQ, DRIVER
    std::string Comment;
    uint16 CheckId;
    std::array<char, 4> IdStr = {};                         // LUA
    uint32 Action;
};

constexpr uint8 WARDEN_MAX_LUA_CHECK_LENGTH = 170;

struct WardenCheckResult
{
    BigNumber Result;                                       // MEM_CHECK
};

class WardenCheckMgr
{
    friend class ACE_Singleton<WardenCheckMgr, ACE_Null_Mutex>;
    WardenCheckMgr();
    ~WardenCheckMgr();

    public:
        uint16 GetMaxValidCheckId() const { return static_cast<uint16>(CheckStore.size()); }
        WardenCheck const* GetWardenDataById(uint16 Id);
        WardenCheckResult const* GetWardenResultById(uint16 Id);

        std::vector<uint16> CheckIdPool[MAX_WARDEN_CHECK_TYPES];

        void LoadWardenChecks();
        void LoadWardenOverrides();

        ACE_RW_Mutex _checkStoreLock;

    private:
        std::vector<WardenCheck> CheckStore;
        std::map<uint32, WardenCheckResult> CheckResultStore;
};

#define sWardenCheckMgr ACE_Singleton<WardenCheckMgr, ACE_Null_Mutex>::instance()

#endif
