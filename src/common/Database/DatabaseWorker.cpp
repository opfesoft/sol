/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "DatabaseEnv.h"
#include "DatabaseWorker.h"
#include "SQLOperation.h"
#include "MySQLConnection.h"
#include "MySQLThreading.h"

DatabaseWorker::DatabaseWorker(ACE_Activation_Queue* new_queue, MySQLConnection* con) :
m_queue(new_queue),
m_conn(con)
{
    /// Assign thread to task
    activate();
}

int DatabaseWorker::svc()
{
    if (!m_queue)
        return -1;

    SQLOperation *request = NULL;
    while (1)
    {
        request = (SQLOperation*)(m_queue->dequeue());
        if (!request)
            break;

        request->SetConnection(m_conn);
        request->call();

        delete request;
    }

    return 0;
}
