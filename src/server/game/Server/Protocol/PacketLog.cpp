/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "PacketLog.h"
#include "Config.h"
#include "ByteBuffer.h"
#include "WorldPacket.h"
#include "Log.h"
#include "Opcodes.h"
#include <iomanip>

PacketLog::PacketLog() : _file(NULL)
{
    Initialize();
}

PacketLog::~PacketLog()
{
    if (_file)
        fclose(_file);

    _file = NULL;
}

void PacketLog::Initialize()
{
    std::string logsDir = sConfigMgr->GetStringDefault("LogsDir", "");

    if (!logsDir.empty())
        if ((logsDir.at(logsDir.length()-1) != '/') && (logsDir.at(logsDir.length()-1) != '\\'))
            logsDir.push_back('/');

    std::string logname = sConfigMgr->GetStringDefault("PacketLogFile", "");
    if (!logname.empty())
        _file = fopen((logsDir + logname).c_str(), "wb");
}

void PacketLog::LogPacket(WorldPacket const& packet, Direction direction)
{
    ByteBuffer data(4+4+4+1+packet.size());
    data << int32(packet.GetOpcode());
    data << int32(packet.size());
    data << uint32(time(NULL));
    data << uint8(direction);

    for (uint32 i = 0; i < packet.size(); i++)
        data << packet[i];

    fwrite(data.contents(), 1, data.size(), _file);
    fflush(_file);
}

void PacketLog::PacketToLog(WorldPacket const& packet, Direction direction, uint32 limit)
{
    std::ostringstream strm;

    for (uint32 i = 0; i < packet.size(); i++)
    {
        if (limit && i >= limit)
            break;
        strm << " " << std::right << std::hex << std::setw(2) << std::setfill('0') << (int)packet[i];
    }

    std::string content = strm.str();
    if (direction == CLIENT_TO_SERVER)
        sLog->outString("in  %s (%u)%s", LookupOpcodeName(packet.GetOpcode()), packet.GetOpcode(), content.c_str());
    else
        sLog->outString("out %s (%u)%s", LookupOpcodeName(packet.GetOpcode()), packet.GetOpcode(), content.c_str());
}
