/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef THREADING_H
#define THREADING_H

#include <thread>
#include <atomic>

#include <thread>
#include <atomic>

namespace acore
{
    class Runnable
    {
        public:
            Runnable() { m_refs = 0; }
            virtual ~Runnable() {}
            virtual void run() = 0;

            void incReference() { ++m_refs; }
            void decReference()
            {
                if (!--m_refs)
                    delete this;
            }
        private:
            std::atomic_long m_refs;
    };

    class Thread
    {
        public:
            Thread();
            explicit Thread(Runnable* instance);
            ~Thread();

            bool wait();
            void destroy();

            static void Sleep(unsigned long msecs);
            static std::thread::id currentId();

        private:
            Thread(const Thread&);
            Thread& operator=(const Thread&);

            static void ThreadTask(void* param);

            Runnable* const m_task;
            std::thread::id m_iThreadId;
            std::thread m_ThreadImp;
    };
}
#endif
