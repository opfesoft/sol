/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef _TRANSACTION_H
#define _TRANSACTION_H

#include "SQLOperation.h"

//- Forward declare (don't include header to prevent circular includes)
class PreparedStatement;

/*! Transactions, high level class. */
class Transaction
{
    friend class TransactionTask;
    friend class MySQLConnection;

    template <typename T>
    friend class DatabaseWorkerPool;

    public:
        Transaction() : _cleanedUp(false) { }
        ~Transaction() { Cleanup(); }

        void Append(PreparedStatement* statement);
        void Append(const char* sql);
        void PAppend(const char* sql, ...);

        size_t GetSize() const { return m_queries.size(); }

    protected:
        void Cleanup();
        std::list<SQLElementData> m_queries;

    private:
        bool _cleanedUp;

};
typedef acore::AutoPtr<Transaction, ACE_Thread_Mutex> SQLTransaction;

/*! Low level class*/
class TransactionTask : public SQLOperation
{
    template <class T> friend class DatabaseWorkerPool;
    friend class DatabaseWorker;

    public:
        TransactionTask(SQLTransaction trans) : m_trans(trans) { } ;
        ~TransactionTask(){ };

    protected:
        bool Execute();

        SQLTransaction m_trans;
};

#endif
