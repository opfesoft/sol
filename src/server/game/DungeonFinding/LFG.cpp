/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "LFG.h"
#include "Language.h"
#include "ObjectMgr.h"

namespace lfg
{

    std::string ConcatenateDungeons(LfgDungeonSet const& dungeons)
    {
        std::string dungeonstr = "";
        if (!dungeons.empty())
        {
            std::ostringstream o;
            LfgDungeonSet::const_iterator it = dungeons.begin();
            o << (*it);
            for (++it; it != dungeons.end(); ++it)
                o << ", " << uint32(*it);
            dungeonstr = o.str();
        }
        return dungeonstr;
    }

    std::string GetRolesString(uint8 roles)
    {
        std::string rolesstr = "";

        if (roles & PLAYER_ROLE_TANK)
            rolesstr.append(sObjectMgr->GetAcoreStringForDBCLocale(LANG_LFG_ROLE_TANK));

        if (roles & PLAYER_ROLE_HEALER)
        {
            if (!rolesstr.empty())
                rolesstr.append(", ");
            rolesstr.append(sObjectMgr->GetAcoreStringForDBCLocale(LANG_LFG_ROLE_HEALER));
        }

        if (roles & PLAYER_ROLE_DAMAGE)
        {
            if (!rolesstr.empty())
                rolesstr.append(", ");
            rolesstr.append(sObjectMgr->GetAcoreStringForDBCLocale(LANG_LFG_ROLE_DAMAGE));
        }

        if (roles & PLAYER_ROLE_LEADER)
        {
            if (!rolesstr.empty())
                rolesstr.append(", ");
            rolesstr.append(sObjectMgr->GetAcoreStringForDBCLocale(LANG_LFG_ROLE_LEADER));
        }

        if (rolesstr.empty())
            rolesstr.append(sObjectMgr->GetAcoreStringForDBCLocale(LANG_LFG_ROLE_NONE));

        return rolesstr;
    }

    std::string GetStateString(LfgState state)
    {
        int32 entry = LANG_LFG_ERROR;
        switch (state)
        {
        case LFG_STATE_NONE:
            entry = LANG_LFG_STATE_NONE;
            break;
        case LFG_STATE_ROLECHECK:
            entry = LANG_LFG_STATE_ROLECHECK;
            break;
        case LFG_STATE_QUEUED:
            entry = LANG_LFG_STATE_QUEUED;
            break;
        case LFG_STATE_PROPOSAL:
            entry = LANG_LFG_STATE_PROPOSAL;
            break;
        case LFG_STATE_DUNGEON:
            entry = LANG_LFG_STATE_DUNGEON;
            break;
        case LFG_STATE_BOOT:
            entry = LANG_LFG_STATE_BOOT;
            break;
        case LFG_STATE_FINISHED_DUNGEON:
            entry = LANG_LFG_STATE_FINISHED_DUNGEON;
            break;
        case LFG_STATE_RAIDBROWSER:
            entry = LANG_LFG_STATE_RAIDBROWSER;
            break;
        }

        return std::string(sObjectMgr->GetAcoreStringForDBCLocale(entry));
    }

} // namespace lfg

