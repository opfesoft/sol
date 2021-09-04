/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under GNU AGPL3 v3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef _GRIDREFMANAGER
#define _GRIDREFMANAGER

#include "RefManager.h"

template<class OBJECT>
class GridReference;

template<class OBJECT>
class GridRefManager : public RefManager<GridRefManager<OBJECT>, OBJECT>
{
    public:
        typedef LinkedListHead::Iterator< GridReference<OBJECT> > iterator;

        GridReference<OBJECT>* getFirst() { return (GridReference<OBJECT>*)RefManager<GridRefManager<OBJECT>, OBJECT>::getFirst(); }
        GridReference<OBJECT>* getLast() { return (GridReference<OBJECT>*)RefManager<GridRefManager<OBJECT>, OBJECT>::getLast(); }

        iterator begin() { return iterator(getFirst()); }
        iterator end() { return iterator(NULL); }
        iterator rbegin() { return iterator(getLast()); }
        iterator rend() { return iterator(NULL); }
};
#endif

