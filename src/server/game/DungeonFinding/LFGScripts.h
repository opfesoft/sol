/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under GNU AGPL3 v3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

/*
 * Interaction between core and LFGScripts
 */

#include "Common.h"
#include "SharedDefines.h"
#include "ScriptMgr.h"

class Player;
class Group;

namespace lfg
{

class LFGPlayerScript : public PlayerScript
{
    public:
        LFGPlayerScript();

        // Player Hooks
        void OnLevelChanged(Player* player, uint8 oldLevel);
        void OnLogout(Player* player);
        void OnLogin(Player* player);
        void OnBindToInstance(Player* player, Difficulty difficulty, uint32 mapId, bool permanent);
        void OnMapChanged(Player* player);
};

class LFGGroupScript : public GroupScript
{
    public:
        LFGGroupScript();

        // Group Hooks
        void OnAddMember(Group* group, uint64 guid);
        void OnRemoveMember(Group* group, uint64 guid, RemoveMethod method, uint64 kicker, char const* reason);
        void OnDisband(Group* group);
        void OnChangeLeader(Group* group, uint64 newLeaderGuid, uint64 oldLeaderGuid);
        void OnInviteMember(Group* group, uint64 guid);
};

} // namespace lfg
