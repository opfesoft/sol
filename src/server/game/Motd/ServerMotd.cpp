/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU AGPLv3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE.md
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 */

#include "ServerMotd.h"
#include "Common.h"
#include "ScriptMgr.h"
#include "Opcodes.h"
#include "Util.h"
#include "WorldPacket.h"
#include "GitRevision.h"
#include <iterator>
#include <sstream>

namespace
{
    WorldPacket MotdPacket;
    std::string FormattedMotd;
}

void Motd::SetMotd(std::string motd)
{
    if (!motd.empty())
        motd += "@";
    std::stringstream ss;
    ss << GitRevision::GetDate();
    motd += "|cffFF4A2DThis server runs Project \"Sol\" " + ss.str() + "|r@|cffFF4A2Dbased on AzerothCore 2020-02-28|r |cff3CE7FFwww.azerothcore.org|r";

    // scripts may change motd
    sScriptMgr->OnMotdChange(motd);

    WorldPacket data(SMSG_MOTD);                     // new in 2.0.1

    Tokenizer motdTokens(motd, '@');
    data << uint32(motdTokens.size()); // line count

    for (Tokenizer::const_reference token : motdTokens)
        data << token;

    MotdPacket = data;

    if (!motdTokens.size())
        return;

    std::ostringstream oss;
    std::copy(motdTokens.begin(), motdTokens.end() - 1, std::ostream_iterator<char const*>(oss, "\n"));
    oss << *(motdTokens.end() - 1); // copy back element
    FormattedMotd = oss.str();
}

char const* Motd::GetMotd()
{
    return FormattedMotd.c_str();
}

WorldPacket const* Motd::GetMotdPacket()
{
    return &MotdPacket;
}
