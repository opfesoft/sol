/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef _LFGPLAYERDATA_H
#define _LFGPLAYERDATA_H

#include "LFG.h"

namespace lfg
{

/**
    Stores all lfg data needed about the player.
*/

class LfgPlayerData
{
    public:
        LfgPlayerData();
        ~LfgPlayerData();

        // General
        void SetState(LfgState state);
        void RestoreState();
        void SetLockedDungeons(LfgLockMap const& lock);
        void SetTeam(TeamId teamId);
        void SetGroup(uint64 group);
        void SetRandomPlayersCount(uint8 count);

        // Queue
        void SetRoles(uint8 roles);
        void SetComment(std::string const& comment);
        void SetSelectedDungeons(const LfgDungeonSet& dungeons);

        // General
        LfgState GetState() const;
        LfgState GetOldState() const;
        LfgLockMap const& GetLockedDungeons() const;
        TeamId GetTeam() const;
        uint64 GetGroup() const;
        uint8 GetRandomPlayersCount() const;
        void SetCanOverrideRBState(bool val) { m_canOverrideRBState = val; }
        bool CanOverrideRBState() const { return m_canOverrideRBState; }

        // Queue
        uint8 GetRoles() const;
        std::string const& GetComment() const;
        LfgDungeonSet const& GetSelectedDungeons() const;

    private:
        // General
        LfgState m_State;                                  ///< State if group in LFG
        LfgState m_OldState;                               ///< Old State - Used to restore state after failed Rolecheck/Proposal
        bool m_canOverrideRBState;                         ///< pussywizard
        // Player
        LfgLockMap m_LockedDungeons;                       ///< Dungeons player can't do and reason
        TeamId m_TeamId;                                   ///< Player team - determines the queue to join
        uint64 m_Group;                                    ///< Original group of player when joined LFG
        uint8 m_randomPlayers;                             ///< Xinef: Amount of random players you raid with

        // Queue
        uint8 m_Roles;                                     ///< Roles the player selected when joined LFG
        std::string m_Comment;                             ///< Player comment used when joined LFG
        LfgDungeonSet m_SelectedDungeons;                  ///< Selected Dungeons when joined LFG
};

} // namespace lfg

#endif
