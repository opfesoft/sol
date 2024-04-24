/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "DatabaseEnv.h"
#include "GridDefines.h"
#include "WaypointManager.h"
#include "MapManager.h"
#include "Log.h"

WaypointMgr::WaypointMgr()
{
}

WaypointMgr::~WaypointMgr()
{
    for (WaypointPathContainer::iterator itr = _waypointStore.begin(); itr != _waypointStore.end(); ++itr)
    {
        for (WaypointPath::const_iterator it = itr->second.begin(); it != itr->second.end(); ++it)
            delete *it;

        itr->second.clear();
    }

    _waypointStore.clear();
}

void WaypointMgr::Load()
{
    uint32 oldMSTime = getMSTime();

    //                                                0    1         2           3          4            5           6          7          8      9           10
    QueryResult result = WorldDatabase.Query("SELECT id, point, position_x, position_y, position_z, orientation, move_type, pathfinding, delay, action, action_chance FROM waypoint_data ORDER BY id, point");

    if (!result)
    {
        sLog->outErrorDb(">> Loaded 0 waypoints. DB table `waypoint_data` is empty!");
        sLog->outString();
        return;
    }

    uint32 count = 0;

    do
    {
        Field* fields = result->Fetch();
        WaypointData* wp = new WaypointData();

        uint32 pathId = fields[0].GetUInt32();
        WaypointPath& path = _waypointStore[pathId];

        wp->id = fields[1].GetUInt32();
        float x = fields[2].GetFloat();
        float y = fields[3].GetFloat();
        float z = fields[4].GetFloat();
        float o = -1.f;
        if (!fields[5].IsNull())
        {
            o = fields[5].GetFloat();
            if (o < 0.f || o > 6.28318f)
            {
                sLog->outErrorDb("Path %u point %u in waypoint_data has invalid orientation %f (must not be < 0 or > 6.28318), ignoring", pathId, wp->id, o);
                delete wp;
                continue;
            }
        }

        acore::NormalizeMapCoord(x);
        acore::NormalizeMapCoord(y);

        wp->x = x;
        wp->y = y;
        wp->z = z;
        wp->orientation = o;
        wp->move_type = fields[6].GetUInt32();

        if (wp->move_type >= WAYPOINT_MOVE_TYPE_MAX)
        {
            sLog->outErrorDb("Path %u waypoint %u in waypoint_data has invalid move_type %u, ignoring", pathId, wp->id, wp->move_type);
            delete wp;
            continue;
        }

        wp->pathfinding = fields[7].GetUInt8();

        if (wp->pathfinding >= WAYPOINT_PATHFINDING_MAX)
        {
            sLog->outErrorDb("Path %u waypoint %u in waypoint_data has invalid pathfinding %u, ignoring", pathId, wp->id, wp->pathfinding);
            delete wp;
            continue;
        }

        wp->delay = fields[8].GetUInt32();

        if (wp->orientation >= 0.f && wp->delay == 0)
        {
            sLog->outErrorDb("Path %u waypoint %u in waypoint_data has invalid delay %u (has to be > 0 if orientation is set), ignoring", pathId, wp->id, wp->delay);
            delete wp;
            continue;
        }

        if (wp->pathfinding == WAYPOINT_PATHFINDING_PATH && wp->delay > 0)
        {
            sLog->outErrorDb("Path %u waypoint %u in waypoint_data has invalid delay %u (has to be 0 if the waypoint is part of an intermediate path), ignoring", pathId, wp->id, wp->delay);
            delete wp;
            continue;
        }

        wp->event_id = fields[9].GetUInt32();
        wp->event_chance = fields[10].GetInt16();

        path.push_back(wp);
        ++count;
    }
    while (result->NextRow());

    sLog->outString(">> Loaded %u waypoints in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
    sLog->outString();
}

void WaypointMgr::ReloadPath(uint32 id)
{
    WaypointPathContainer::iterator itr = _waypointStore.find(id);
    if (itr != _waypointStore.end())
    {
        for (WaypointPath::const_iterator it = itr->second.begin(); it != itr->second.end(); ++it)
            delete *it;

        _waypointStore.erase(itr);
    }

    PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_WAYPOINT_DATA_BY_ID);

    stmt->setUInt32(0, id);

    PreparedQueryResult result = WorldDatabase.Query(stmt);

    if (!result)
        return;

    WaypointPath& path = _waypointStore[id];

    do
    {
        Field* fields = result->Fetch();
        WaypointData* wp = new WaypointData();

        wp->id = fields[0].GetUInt32();
        float x = fields[1].GetFloat();
        float y = fields[2].GetFloat();
        float z = fields[3].GetFloat();
        float o = -1.f;
        if (!fields[4].IsNull())
        {
            o = fields[4].GetFloat();
            if (o < 0.f || o > 6.28318f)
            {
                sLog->outErrorDb("Path %u point %u in waypoint_data has invalid orientation %f (must not be < 0 or > 6.28318), ignoring", id, wp->id, o);
                delete wp;
                continue;
            }
        }

        acore::NormalizeMapCoord(x);
        acore::NormalizeMapCoord(y);

        wp->x = x;
        wp->y = y;
        wp->z = z;
        wp->orientation = o;
        wp->move_type = fields[5].GetUInt32();
        
        if (wp->move_type >= WAYPOINT_MOVE_TYPE_MAX)
        {
            sLog->outErrorDb("Path %u waypoint %u in waypoint_data has invalid move_type %u, ignoring", id, wp->id, wp->move_type);
            delete wp;
            continue;
        }
        
        wp->pathfinding = fields[6].GetUInt8();

        if (wp->pathfinding >= WAYPOINT_PATHFINDING_MAX)
        {
            sLog->outErrorDb("Path %u waypoint %u in waypoint_data has invalid pathfinding %u, ignoring", id, wp->id, wp->pathfinding);
            delete wp;
            continue;
        }

        wp->delay = fields[7].GetUInt32();

        if (wp->orientation >= 0.f && wp->delay == 0.f)
        {
            sLog->outErrorDb("Path %u waypoint %u in waypoint_data has invalid delay %u (has to be > 0 if orientation is set), ignoring", id, wp->id, wp->delay);
            delete wp;
            continue;
        }

        wp->event_id = fields[8].GetUInt32();
        wp->event_chance = fields[9].GetUInt8();

        path.push_back(wp);

    }
    while (result->NextRow());
}
