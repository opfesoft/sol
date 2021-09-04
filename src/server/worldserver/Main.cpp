/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under GNU AGPL3 v3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include <openssl/opensslv.h>
#include <openssl/crypto.h>
#include <ace/Version.h>

#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "Configuration/Config.h"

#include "Log.h"
#include "Master.h"

#ifndef _ACORE_CORE_CONFIG
#define _ACORE_CORE_CONFIG "worldserver.conf"
#endif

WorldDatabaseWorkerPool WorldDatabase;                      ///< Accessor to the world database
CharacterDatabaseWorkerPool CharacterDatabase;              ///< Accessor to the character database
LoginDatabaseWorkerPool LoginDatabase;                      ///< Accessor to the realm/login database

uint32 realmID;                                             ///< Id of the realm

/// Print out the usage string for this program on the console.
void usage(const char* prog)
{
    printf("Usage:\n");
    printf(" %s [<options>]\n", prog);
    printf("    -c config_file           use config_file as configuration file\n");
}

/// Launch the AzerothCore server
extern int main(int argc, char** argv)
{
    ///- Command line parsing to get the configuration file name
    char const* configFile = _ACORE_CORE_CONFIG;
    int c = 1;
    while (c < argc)
    {
        if (!strcmp(argv[c], "-c"))
        {
            if (++c >= argc)
            {
                printf("Runtime-Error: -c option requires an input argument");
                usage(argv[0]);
                return 1;
            }
            else
                configFile = argv[c];
        }

        ++c;
    }

    sConfigMgr->SetConfigList(std::string(configFile), std::string(CONFIG_FILE_LIST));

    if (!sConfigMgr->LoadAppConfigs())
        return 1;

    sLog->outString("Using configuration file %s.", configFile);
    sLog->outString("Using SSL version: %s (library: %s)", OPENSSL_VERSION_TEXT, SSLeay_version(SSLEAY_VERSION));
    sLog->outString("Using ACE version: %s", ACE_VERSION);

    ///- and run the 'Master'
    /// @todo Why do we need this 'Master'? Can't all of this be in the Main as for Realmd?
    int ret = sMaster->Run();

    // at sMaster return function exist with codes
    // 0 - normal shutdown
    // 1 - shutdown at error
    // 2 - restart command used, this code can be used by restarter for restart AzerothCore

    return ret;
}

/// @}
