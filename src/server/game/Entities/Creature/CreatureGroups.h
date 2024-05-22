/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef _FORMATIONS_H
#define _FORMATIONS_H

#include "Define.h"
#include <unordered_map>
#include <map>

class Creature;
class CreatureGroup;

struct FormationInfo
{
    uint32 leaderGUID;
    float follow_dist;
    float follow_dist_init;
    float follow_angle;
    float follow_angle_init;
    uint8 groupAI;
    uint8 groupAI_init;
};

typedef std::unordered_map<uint32/*memberDBGUID*/, FormationInfo*>   CreatureGroupInfoType;

class FormationMgr
{
    friend class ACE_Singleton<FormationMgr, ACE_Null_Mutex>;

    public:
        FormationMgr() { }
        ~FormationMgr();
        
        void AddCreatureToGroup(uint32 groupId, Creature* creature, float dist = 0.f, float angle = 0.f, uint32 groupAI = 0);
        void AddCreatureToGroup(Creature* leader, Creature* creature, float dist = 0.f, float angle = 0.f, uint32 groupAI = 0);
        void RemoveCreatureFromGroup(CreatureGroup* group, Creature* creature);
        void LoadCreatureFormations();
        void UpdateFormationInfo(Creature* member, float dist, float angle, uint32 groupAI);
        void ResetFormationInfo(Creature* member);
        CreatureGroupInfoType CreatureGroupMap;
};

class CreatureGroup
{
    public:
        // pussywizard: moved public to the top so it compiles and typedef is public
        typedef std::map<Creature*, FormationInfo*>  CreatureGroupMemberType;

        //Group cannot be created empty
        explicit CreatureGroup(uint32 id) : m_leader(NULL), m_groupID(id), m_Formed(false) {}
        ~CreatureGroup() {}

        Creature* getLeader() const { return m_leader; }
        uint32 GetId() const { return m_groupID; }
        bool isEmpty() const { return m_members.empty(); }
        bool isFormed() const { return m_Formed; }
        const CreatureGroupMemberType& GetMembers() const { return m_members; }

        void AddMember(Creature* member, float dist, float angle, uint32 groupAI);
        void RemoveMember(Creature* member);
        void FormationReset(bool dismiss);

        void LeaderMoveTo(float x, float y, float z, bool run, bool generatePath, Movement::PointsArray* intermediatePath = NULL);
        void MemberAttackStart(Creature* member, Unit* target);
        bool IsFollowing(Creature* member);

    private:
        Creature* m_leader; //Important do not forget sometimes to work with pointers instead synonims :D:D
        CreatureGroupMemberType m_members;

        uint32 m_groupID;
        bool m_Formed;
};

#define sFormationMgr ACE_Singleton<FormationMgr, ACE_Null_Mutex>::instance()

#endif
