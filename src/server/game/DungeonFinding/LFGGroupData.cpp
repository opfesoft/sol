/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "LFG.h"
#include "LFGGroupData.h"

namespace lfg
{

LfgGroupData::LfgGroupData(): m_State(LFG_STATE_NONE), m_OldState(LFG_STATE_NONE),
    m_Leader(0), m_Dungeon(0), m_KicksLeft(LFG_GROUP_MAX_KICKS)
{ }

LfgGroupData::~LfgGroupData()
{ }

bool LfgGroupData::IsLfgGroup()
{
    return m_OldState != LFG_STATE_NONE;
}

void LfgGroupData::SetState(LfgState state)
{
    switch (state)
    {
        case LFG_STATE_NONE:
            m_Dungeon = 0;
            m_KicksLeft = LFG_GROUP_MAX_KICKS;
            [[fallthrough]];
        case LFG_STATE_FINISHED_DUNGEON:
        case LFG_STATE_DUNGEON:
            m_OldState = state;
            [[fallthrough]];
        default:
            m_State = state;
    }
}

void LfgGroupData::RestoreState()
{
    m_State = m_OldState;
}

void LfgGroupData::AddPlayer(uint64 guid)
{
    m_Players.insert(guid);
}

uint8 LfgGroupData::RemovePlayer(uint64 guid)
{
    LfgGuidSet::iterator it = m_Players.find(guid);
    if (it != m_Players.end())
        m_Players.erase(it);
    return uint8(m_Players.size());
}

void LfgGroupData::RemoveAllPlayers()
{
    m_Players.clear();
}

void LfgGroupData::SetLeader(uint64 guid)
{
    m_Leader = guid;
}

void LfgGroupData::SetDungeon(uint32 dungeon)
{
    m_Dungeon = dungeon;
}

void LfgGroupData::DecreaseKicksLeft()
{
    if (m_KicksLeft)
      --m_KicksLeft;
}

LfgState LfgGroupData::GetState() const
{
    return m_State;
}

LfgState LfgGroupData::GetOldState() const
{
    return m_OldState;
}

LfgGuidSet const& LfgGroupData::GetPlayers() const
{
    return m_Players;
}

uint8 LfgGroupData::GetPlayerCount() const
{
    return m_Players.size();
}

uint64 LfgGroupData::GetLeader() const
{
    return m_Leader;
}

uint32 LfgGroupData::GetDungeon(bool asId /* = true */) const
{
    if (asId)
        return (m_Dungeon & 0x00FFFFFF);
    else
        return m_Dungeon;
}

uint8 LfgGroupData::GetKicksLeft() const
{
    return m_KicksLeft;
}

} // namespace lfg
