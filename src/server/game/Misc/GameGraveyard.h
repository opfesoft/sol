#ifndef _GAMEGRAVEYARD_H_
#define _GAMEGRAVEYARD_H_

#include "Common.h"
#include "SharedDefines.h"
#include <ace/Singleton.h>

struct GraveyardStruct
{
    uint32 ID;
    uint32 Map;
    float x;
    float y;
    float z;
    std::string name;
    std::wstring wnameLow;
};

struct GraveyardData
{
    uint32 safeLocId;
    TeamId teamId;
    uint32 classMask;
    uint32 areaId;
};

typedef std::multimap<uint32, GraveyardData> WGGraveyardContainer;
typedef std::pair<WGGraveyardContainer::const_iterator, WGGraveyardContainer::const_iterator> GraveyardMapBounds;
typedef std::pair<WGGraveyardContainer::iterator, WGGraveyardContainer::iterator> GraveyardMapBoundsNonConst;

class Graveyard
{
    friend class ACE_Singleton<Graveyard, ACE_Null_Mutex>;

public:
    typedef std::unordered_map<uint32, GraveyardStruct> GraveyardContainer;    

    GraveyardStruct const* GetGraveyard(uint32 ID) const;
    GraveyardStruct const* GetGraveyard(const std::string& name) const;
    GraveyardStruct const* GetDefaultGraveyard(TeamId teamId);
    GraveyardStruct const* GetClosestGraveyard(float x, float y, float z, uint32 MapId, TeamId teamId, uint8 playerClass);
    GraveyardData const* FindGraveyardData(uint32 id, uint32 zone, uint32 area);
    GraveyardContainer const& GetGraveyardData() const { return _graveyardStore; }
    bool AddGraveyardLink(uint32 id, uint32 zoneId, TeamId teamId, bool persist = true, uint32 classMask = 0, uint32 areaId = 0);
    void RemoveGraveyardLink(uint32 id, uint32 zoneId, TeamId teamId, bool persist = false);
    void LoadGraveyardZones();
    void LoadGraveyardFromDB();

private:

    GraveyardContainer _graveyardStore;

    // for wintergrasp only
    WGGraveyardContainer GraveyardStore;
};

#define sGraveyard ACE_Singleton<Graveyard, ACE_Null_Mutex>::instance()

#endif // _GAMEGRAVEYARD_H_
