/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license: http://github.com/azerothcore/azerothcore-wotlk/LICENSE-GPL2
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef LOAD_LIB_H
#define LOAD_LIB_H

#include <string>

#include <stdint.h>
#ifndef uint64_t
#ifdef __linux__
#include <linux/types.h>
#endif
typedef int64_t            int64;
typedef int32_t            int32;
typedef int16_t            int16;
typedef int8_t             int8;
typedef uint64_t           uint64;
typedef uint32_t           uint32;
typedef uint16_t           uint16;
typedef uint8_t            uint8;
#endif

#define FILE_FORMAT_VERSION    18

//
// File version chunk
//
struct file_MVER
{
    union{
        uint32 fcc;
        char   fcc_txt[4];
    };
    uint32 size;
    uint32 ver;
};

class FileLoader{
    uint8  *data;
    uint32  data_size;
public:
    virtual bool prepareLoadedData();
    uint8 *GetData()     {return data;}
    uint32 GetDataSize() {return data_size;}

    file_MVER *version;
    FileLoader();
    ~FileLoader();
    bool loadFile(std::string const& filename, bool log = true);
    virtual void free();
};
#endif
