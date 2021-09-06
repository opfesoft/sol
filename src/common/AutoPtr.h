/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU AGPLv3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE.md
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef _ACORE_AUTO_PTR_H
#define _ACORE_AUTO_PTR_H

#include <ace/Bound_Ptr.h>

namespace acore
{

template <class Pointer, class Lock>
class AutoPtr : public ACE_Strong_Bound_Ptr<Pointer, Lock>
{
    typedef ACE_Strong_Bound_Ptr<Pointer, Lock> Base;

public:
    AutoPtr()
        : Base()
    { }

    AutoPtr(Pointer* x)
        : Base(x)
    { }

    operator bool() const
    {
        return !Base::null();
    }

    bool operator !() const
    {
        return Base::null();
    }
};

} // namespace acore

#endif
