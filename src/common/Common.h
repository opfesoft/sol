/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU AGPLv3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE.md
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef AZEROTHCORE_COMMON_H
#define AZEROTHCORE_COMMON_H

// config.h needs to be included 1st
/// @todo this thingy looks like hack, but its not, need to
// make separate header however, because It makes mess here.
#ifdef HAVE_CONFIG_H
// Remove Some things that we will define
// This is in case including another config.h
// before AzerothCore config.h
#ifdef PACKAGE
#undef PACKAGE
#endif //PACKAGE
#ifdef PACKAGE_BUGREPORT
#undef PACKAGE_BUGREPORT
#endif //PACKAGE_BUGREPORT
#ifdef PACKAGE_NAME
#undef PACKAGE_NAME
#endif //PACKAGE_NAME
#ifdef PACKAGE_STRING
#undef PACKAGE_STRING
#endif //PACKAGE_STRING
#ifdef PACKAGE_TARNAME
#undef PACKAGE_TARNAME
#endif //PACKAGE_TARNAME
#ifdef PACKAGE_VERSION
#undef PACKAGE_VERSION
#endif //PACKAGE_VERSION
#ifdef VERSION
#undef VERSION
#endif //VERSION

# include "Config.h"

#undef PACKAGE
#undef PACKAGE_BUGREPORT
#undef PACKAGE_NAME
#undef PACKAGE_STRING
#undef PACKAGE_TARNAME
#undef PACKAGE_VERSION
#undef VERSION
#endif //HAVE_CONFIG_H

#include "Define.h"

#include <unordered_map>
#include <unordered_set>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>
#include <errno.h>
#include <signal.h>
#include <assert.h>

#define STRCASECMP strcasecmp

#include <set>
#include <list>
#include <string>
#include <map>
#include <queue>
#include <sstream>
#include <fstream>
#include <algorithm>
#include <vector>

#include "Threading/LockedQueue.h"
#include "Threading/Threading.h"

#include <ace/Basic_Types.h>
#include <ace/Guard_T.h>
#include <ace/RW_Thread_Mutex.h>
#include <ace/Thread_Mutex.h>
#include <ace/OS_NS_time.h>
#include <ace/Stack_Trace.h>

#include <sys/types.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <netdb.h>

#define stricmp strcasecmp
#define strnicmp strncasecmp
#define I32FMT "%08X"
#define I64FMT "%016llX"

inline float finiteAlways(float f) { return isfinite(f) ? f : 0.0f; }

inline bool myisfinite(float f) { return isfinite(f) && !isnan(f); }

#define atol(a) strtoul( a, NULL, 10)

#define STRINGIZE(a) #a

#define MAX_NETCLIENT_PACKET_SIZE (32767 - 1)               // Client hardcap: int16 with trailing zero space otherwise crash on memory free

enum TimeConstants
{
    MINUTE          = 60,
    HOUR            = MINUTE*60,
    DAY             = HOUR*24,
    WEEK            = DAY*7,
    MONTH           = DAY*30,
    YEAR            = MONTH*12,
    IN_MILLISECONDS = 1000
};

enum AccountTypes
{
    SEC_PLAYER         = 0,
    SEC_MODERATOR      = 1,
    SEC_GAMEMASTER     = 2,
    SEC_ADMINISTRATOR  = 3,
    SEC_CONSOLE        = 4                                  // must be always last in list, accounts must have less security level always also
};

enum LocaleConstant
{
    LOCALE_enUS = 0,
    LOCALE_koKR = 1,
    LOCALE_frFR = 2,
    LOCALE_deDE = 3,
    LOCALE_zhCN = 4,
    LOCALE_zhTW = 5,
    LOCALE_esES = 6,
    LOCALE_esMX = 7,
    LOCALE_ruRU = 8
};

const uint8 TOTAL_LOCALES = 9;
#define DEFAULT_LOCALE LOCALE_enUS

#define MAX_LOCALES 8
#define MAX_ACCOUNT_TUTORIAL_VALUES 8

extern char const* localeNames[TOTAL_LOCALES];

LocaleConstant GetLocaleByName(const std::string& name);
void CleanStringForMysqlQuery(std::string& str);

typedef std::vector<std::string> StringVector;

// we always use stdlibc++ std::max/std::min, undefine some not C++ standard defines (Win API and some other platforms)
#ifdef max
#undef max
#endif

#ifdef min
#undef min
#endif

#ifndef M_PI
#define M_PI            3.14159265358979323846f
#endif

#define MAX_QUERY_LEN 32*1024

#define ACORE_GUARD(MUTEX, LOCK) \
  ACE_Guard< MUTEX > ACORE_GUARD_OBJECT (LOCK); \
    if (ACORE_GUARD_OBJECT.locked() == 0) ASSERT(false);

//! For proper implementation of multiple-read, single-write pattern, use
//! ACE_RW_Mutex as underlying @MUTEX
# define ACORE_WRITE_GUARD(MUTEX, LOCK) \
  ACE_Write_Guard< MUTEX > ACORE_GUARD_OBJECT (LOCK); \
    if (ACORE_GUARD_OBJECT.locked() == 0) ASSERT(false);

//! For proper implementation of multiple-read, single-write pattern, use
//! ACE_RW_Mutex as underlying @MUTEX
# define ACORE_READ_GUARD(MUTEX, LOCK) \
  ACE_Read_Guard< MUTEX > ACORE_GUARD_OBJECT (LOCK); \
    if (ACORE_GUARD_OBJECT.locked() == 0) ASSERT(false);

namespace acore
{
    template<class ArgumentType, class ResultType>
    struct unary_function
    {
        typedef ArgumentType argument_type;
        typedef ResultType result_type;
    };
}

#endif
