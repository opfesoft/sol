/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef ACORE_TYPECONTAINERVISITOR_H
#define ACORE_TYPECONTAINERVISITOR_H

/*
 * @class TypeContainerVisitor is implemented as a visitor pattern.  It is
 * a visitor to the TypeContainerList or TypeContainerMapList.  The visitor has
 * to overload its types as a visit method is called.
 */

#include "Define.h"
#include "Dynamic/TypeContainer.h"

// forward declaration
template<class T, class Y> class TypeContainerVisitor;

// visitor helper
template<class VISITOR, class TYPE_CONTAINER> void VisitorHelper(VISITOR &v, TYPE_CONTAINER &c)
{
    v.Visit(c);
}

// terminate condition for container list
template<class VISITOR> void VisitorHelper(VISITOR &/*v*/, ContainerList<TypeNull> &/*c*/) { }

template<class VISITOR, class T> void VisitorHelper(VISITOR &v, ContainerList<T> &c)
{
    v.Visit(c._element);
}

// recursion for container list
template<class VISITOR, class H, class T> void VisitorHelper(VISITOR &v, ContainerList<TypeList<H, T> > &c)
{
    VisitorHelper(v, c._elements);
    VisitorHelper(v, c._TailElements);
}

// terminate condition container map list
template<class VISITOR> void VisitorHelper(VISITOR &/*v*/, ContainerMapList<TypeNull> &/*c*/) { }

template<class VISITOR, class T> void VisitorHelper(VISITOR &v, ContainerMapList<T> &c)
{
    v.Visit(c._element);
}

// recursion container map list
template<class VISITOR, class H, class T> void VisitorHelper(VISITOR &v, ContainerMapList<TypeList<H, T> > &c)
{
    VisitorHelper(v, c._elements);
    VisitorHelper(v, c._TailElements);
}

// array list
template<class VISITOR, class T> void VisitorHelper(VISITOR &v, ContainerArrayList<T> &c)
{
    v.Visit(c._element);
}

template<class VISITOR> void VisitorHelper(VISITOR &/*v*/, ContainerArrayList<TypeNull> &/*c*/) { }

// recursion
template<class VISITOR, class H, class T> void VisitorHelper(VISITOR &v, ContainerArrayList<TypeList<H, T> > &c)
{
    VisitorHelper(v, c._elements);
    VisitorHelper(v, c._TailElements);
}

// for TypeMapContainer
template<class VISITOR, class OBJECT_TYPES> void VisitorHelper(VISITOR &v, TypeMapContainer<OBJECT_TYPES> &c)
{
    VisitorHelper(v, c.GetElements());
}

template<class VISITOR, class TYPE_CONTAINER>
class TypeContainerVisitor
{
    public:
        TypeContainerVisitor(VISITOR &v) : i_visitor(v) { }

        void Visit(TYPE_CONTAINER &c)
        {
            VisitorHelper(i_visitor, c);
        }

        void Visit(const TYPE_CONTAINER &c) const
        {
            VisitorHelper(i_visitor, c);
        }

    private:
        VISITOR &i_visitor;
};
#endif

