/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license: http://github.com/azerothcore/azerothcore-wotlk/LICENSE-GPL2
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef WMO_H
#define WMO_H
#define TILESIZE (533.33333f)
#define CHUNKSIZE ((TILESIZE) / 16.0f)

#include <string>
#include <set>
#include <vector>
#include <memory>
#include <unordered_set>
#include "vec3d.h"
#include "loadlib/loadlib.h"

// MOPY flags
enum MopyFlags
{
    WHO_MATERIAL_UNK01            = 0x01,
    WMO_MATERIAL_NOCAMCOLLIDE     = 0x02,
    WMO_MATERIAL_DETAIL           = 0x04,
    WMO_MATERIAL_COLLISION        = 0x08,
    WMO_MATERIAL_HINT             = 0x10,
    WMO_MATERIAL_RENDER           = 0x20,
    WMO_MATERIAL_WALL_SURFACE     = 0x40, // Guessed
    WMO_MATERIAL_COLLIDE_HIT      = 0x80,
};

class WMOInstance;
class WMOManager;
class MPQFile;

namespace WMO
{
    struct MODS
    {
        char Name[20];
        uint32 StartIndex;     // index of first doodad instance in this set
        uint32 Count;          // number of doodad instances in this set
        char _pad[4];
    };

    struct MODD
    {
        uint32 NameIndex;
        uint32 Unused;
        Vec3D Position;
        Quaternion Rotation;
        float Scale;
        uint32 Color;
    };
}

/* for whatever reason a certain company just can't stick to one coordinate system... */
static inline Vec3D fixCoords(const Vec3D &v){ return Vec3D(v.z, v.x, v.y); }

struct WMODoodadData
{
    std::vector<WMO::MODS> Sets;
    std::unique_ptr<char[]> Paths;
    std::vector<WMO::MODD> Spawns;
    std::unordered_set<uint16> References;
};

class WMORoot
{
private:
    std::string filename;
public:
    unsigned int col;
    uint32 nTextures, nGroups, nP, nLights, nModels, nDoodads, nDoodadSets, RootWMOID, liquidType;
    float bbcorn1[3];
    float bbcorn2[3];

    WMODoodadData DoodadData;
    std::unordered_set<uint32> ValidDoodadNames;

    WMORoot(std::string& filename);

    bool open();
    bool ConvertToVMAPRootWmo(FILE* output);
};

struct WMOLiquidHeader
{
    int xverts, yverts, xtiles, ytiles;
    float pos_x;
    float pos_y;
    float pos_z;
    short type;
};

struct WMOLiquidVert
{
    uint16 unk1;
    uint16 unk2;
    float height;
};

class WMOGroup
{
private:
    std::string filename;
public:
    // MOGP

    char* MOPY;
    uint16* MOVI;
    uint16* MoviEx;
    float* MOVT;
    uint16* MOBA;
    int* MobaEx;
    WMOLiquidHeader* hlq;
    WMOLiquidVert* LiquEx;
    char* LiquBytes;
    int groupName, descGroupName;
    int mogpFlags;
    float bbcorn1[3];
    float bbcorn2[3];
    uint16 moprIdx;
    uint16 moprNItems;
    uint16 nBatchA;
    uint16 nBatchB;
    uint32 nBatchC, fogIdx, liquidType, groupWMOID;

    int mopy_size, moba_size;
    int LiquEx_size;
    unsigned int nVertices; // number when loaded
    int nTriangles; // number when loaded
    uint32 liquflags;

    std::vector<uint16> DoodadReferences;

    WMOGroup(std::string const& filename);
    ~WMOGroup();

    bool open();
    int ConvertToVMAPGroupWmo(FILE* output, WMORoot* rootWMO, bool preciseVectorData);
};

class WMOInstance
{
    static std::set<int> ids;
public:
    std::string MapName;
    int currx;
    int curry;
    WMOGroup* wmo;
    Vec3D pos, boundLo, boundHi, rot;
    uint32 id;
    uint16 flags, doodadSet, nameSet, scale;

    WMOInstance(MPQFile&f , char const* WmoInstName, uint32 mapID, uint32 tileX, uint32 tileY, FILE* pDirfile);
    void ExtractDoodadSet(WMODoodadData const& doodadData, uint32 mapID, uint32 tileX, uint32 tileY, FILE* pDirfile);

    static void reset();
};

#endif
