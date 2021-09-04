/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under GNU AGPL3 v3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef __WORLDRUNNABLE_H
#define __WORLDRUNNABLE_H

/// Heartbeat thread for the World
class WorldRunnable : public acore::Runnable
{
    public:
        void run();
};

class AuctionListingRunnable : public acore::Runnable
{
    public:
        void run();
};
#endif
/// @}
