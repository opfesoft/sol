/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under GNU AGPL3 v3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU AGPL3 v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
 */

#ifndef _BAN_MANAGER_H
#define _BAN_MANAGER_H

#include <ace/Singleton.h>
#include "Common.h"

 /// Ban function return codes
enum BanReturn
{
    BAN_SUCCESS,
    BAN_SYNTAX_ERROR,
    BAN_NOTFOUND,
    BAN_LONGER_EXISTS
};

class BanManager
{
    friend class ACE_Singleton<BanManager, ACE_Null_Mutex>;

public:
    BanReturn BanAccount(std::string const& AccountName, std::string const& Duration, std::string const& Reason, std::string const& Author);
    BanReturn BanAccountByPlayerName(std::string const& CharacterName, std::string const& Duration, std::string const& Reason, std::string const& Author);
    BanReturn BanIP(std::string const& IP, std::string const& Duration, std::string const& Reason, std::string const& Author);
    BanReturn BanCharacter(std::string const& CharacterName, std::string const& Duration, std::string const& Reason, std::string const& Author);

    bool RemoveBanAccount(std::string const& AccountName);
    bool RemoveBanAccountByPlayerName(std::string const& CharacterName);
    bool RemoveBanIP(std::string const& IP);
    bool RemoveBanCharacter(std::string const& CharacterName);
};

#define sBan ACE_Singleton<BanManager, ACE_Null_Mutex>::instance()

#endif // _BAN_MANAGER_H
