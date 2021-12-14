/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef ACORE_FACTORY_HOLDER
#define ACORE_FACTORY_HOLDER

#include "Define.h"
#include "Dynamic/TypeList.h"
#include "ObjectRegistry.h"

/*
 * FactoryHolder holds a factory object of a specific type
 */
template<class T, class Key = std::string>
class FactoryHolder
{
public:
    typedef ObjectRegistry<FactoryHolder<T, Key >, Key > FactoryHolderRegistry;
    friend class ACE_Singleton<FactoryHolderRegistry, ACE_Null_Mutex>;
    typedef ACE_Singleton<FactoryHolderRegistry, ACE_Null_Mutex> FactoryHolderRepository;

    FactoryHolder(Key k) : i_key(k) { }
    virtual ~FactoryHolder() { }
    inline Key key() const { return i_key; }

    void RegisterSelf(void) { FactoryHolderRepository::instance()->InsertItem(this, i_key); }
    void DeregisterSelf(void) { FactoryHolderRepository::instance()->RemoveItem(this, false); }

    /// Abstract Factory create method
    virtual T* Create(void* data = NULL) const = 0;
private:
    Key i_key;
};

/*
 * Permissible is a classic way of letting the object decide
 * whether how good they handle things.  This is not retricted
 * to factory selectors.
 */
template<class T>
class Permissible
{
    public:
        virtual ~Permissible() { }
        virtual int Permit(const T *) const = 0;
};

#endif
