/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */
 
#ifndef TRINITYSERVER_PACKET_BUILDER_H
#define TRINITYSERVER_PACKET_BUILDER_H

#include "Define.h"

class ByteBuffer;
namespace G3D
{
    class Vector3;
}

namespace Movement
{
    using G3D::Vector3;

    class MoveSpline;
    class PacketBuilder
    {
        static void WriteCommonMonsterMovePart(const MoveSpline& mov, ByteBuffer& data);
    public:

        static void WriteMonsterMove(const MoveSpline& mov, ByteBuffer& data);
        static void WriteStopMovement(Vector3 const& loc, uint32 splineId, ByteBuffer& data);
        static void WriteCreate(const MoveSpline& mov, ByteBuffer& data);
        static void WriteSplineSync(MoveSpline const& mov, ByteBuffer& data);
    };
}
#endif // TRINITYSERVER_PACKET_BUILDER_H
