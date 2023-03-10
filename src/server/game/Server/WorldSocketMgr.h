/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

/** \addtogroup u2w User to World Communication
 *  @{
 *  \file WorldSocketMgr.h
 *  \author Derex <derex101@gmail.com>
 */

#ifndef __WORLDSOCKETMGR_H
#define __WORLDSOCKETMGR_H

#include <ace/Basic_Types.h>
#include <ace/Singleton.h>
#include <ace/Thread_Mutex.h>

class WorldSocket;
class ReactorRunnable;
class ACE_Event_Handler;

/// Manages all sockets connected to peers and network threads
class WorldSocketMgr
{
public:
    friend class WorldSocket;
    friend class ACE_Singleton<WorldSocketMgr, ACE_Thread_Mutex>;

    /// Start network, listen at address:port .
    int StartNetwork(ACE_UINT16 port, const char* address);

    /// Stops all network threads, It will wait for all running threads .
    void StopNetwork();

private:
    int OnSocketOpen(WorldSocket* sock);

    int StartReactiveIO(ACE_UINT16 port, const char* address);

private:
    WorldSocketMgr();
    virtual ~WorldSocketMgr();

    ReactorRunnable* m_NetThreads;
    size_t m_NetThreadsCount;

    int m_SockOutKBuff;
    int m_SockOutUBuff;
    bool m_UseNoDelay;

    class WorldSocketAcceptor* m_Acceptor;
};

#define sWorldSocketMgr ACE_Singleton<WorldSocketMgr, ACE_Thread_Mutex>::instance()

#endif
/// @}
