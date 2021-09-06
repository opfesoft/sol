/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU AGPLv3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE.md
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license: http://github.com/azerothcore/azerothcore-wotlk/LICENSE-GPL2
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "vmapexport.h"
#include "adtfile.h"

#include <algorithm>
#include <cstdio>

char const* GetPlainName(char const* FileName)
{
    const char * szTemp;

    if((szTemp = strrchr(FileName, '\\')) != NULL)
        FileName = szTemp + 1;
    return FileName;
}

char* GetPlainName(char* FileName)
{
    char * szTemp;

    if((szTemp = strrchr(FileName, '\\')) != NULL)
        FileName = szTemp + 1;
    return FileName;
}

void fixnamen(char* name, size_t len)
{
    if (len < 3)
        return;

    for (size_t i = 0; i < len - 3; i++)
    {
        if (i > 0 && name[i] >= 'A' && name[i] <= 'Z' && isalpha(name[i-1]))
            name[i] |= 0x20;
        else if ((i == 0 || !isalpha(name[i-1])) && name[i]>='a' && name[i]<='z')
            name[i] &= ~0x20;
    }
    //extension in lowercase
    for (size_t i = len - 3; i < len; i++)
        name[i] |= 0x20;
}

void fixname2(char* name, size_t len)
{
    if (len < 3)
        return;

    for (size_t i = 0; i < len - 3; i++)
        if (name[i] == ' ')
        name[i] = '_';
}

char* GetExtension(char* FileName)
{
    if (char* szTemp = strrchr(FileName, '.'))
        return szTemp;
    return NULL;
}

ADTFile::ADTFile(char* filename): ADT(filename) {}

bool ADTFile::init(uint32 map_num, uint32 tileX, uint32 tileY)
{
    if(ADT.isEof ())
        return false;

    uint32 size;
    std::string dirname = std::string(szWorkDirWmo) + "/dir_bin";
    FILE *dirfile;
    dirfile = fopen(dirname.c_str(), "ab");
    if(!dirfile)
    {
        printf("Can't open dirfile!'%s'\n", dirname.c_str());
        return false;
    }

    while (!ADT.isEof())
    {
        char fourcc[5];
        ADT.read(&fourcc,4);
        ADT.read(&size, 4);
        flipcc(fourcc);
        fourcc[4] = 0;

        size_t nextpos = ADT.getPos() + size;

        if (!strcmp(fourcc,"MCIN"))
        {
        }
        else if (!strcmp(fourcc,"MTEX"))
        {
        }
        else if (!strcmp(fourcc,"MMDX"))
        {
            if (size)
            {
                char* buf = new char[size];
                ADT.read(buf, size);
                char* p = buf;
                while (p < buf + size)
                {
                    std::string path(p);
                    char* s = GetPlainName(p);
                    fixnamen(s,strlen(s));
                    fixname2(s,strlen(s));

                    ModelInstanceNames.emplace_back(s);
                    ExtractSingleModel(path);

                    p += strlen(p) + 1;
                }
                delete[] buf;
            }
        }
        else if (!strcmp(fourcc,"MWMO"))
        {
            if (size)
            {
                char* buf = new char[size];
                ADT.read(buf, size);
                char* p = buf;
                while (p < buf + size)
                {
                    std::string path(p);
                    char* s = GetPlainName(p);
                    fixnamen(s, strlen(s));
                    fixname2(s, strlen(s));

                    WmoInstanceNames.emplace_back(s);
                    ExtractSingleWmo(path);

                    p += strlen(p) + 1;
                }
                delete[] buf;
            }
        }
        //======================
        else if (!strcmp(fourcc,"MDDF"))
        {
            if (size)
            {
                int nMDX = (int)size / 36;
                for (int i = 0; i < nMDX; ++i)
                {
                    uint32 id;
                    ADT.read(&id, 4);
                    ModelInstance inst(ADT,ModelInstanceNames[id].c_str(), map_num, tileX, tileY, dirfile);
                }
            }
        }
        else if (!strcmp(fourcc,"MODF"))
        {
            if (size)
            {
                int nWMO = (int)size / 64;
                for (int i = 0; i < nWMO; ++i)
                {
                    uint32 id;
                    ADT.read(&id, 4);
                    WMOInstance inst(ADT,WmoInstanceNames[id].c_str(), map_num, tileX, tileY, dirfile);
                    inst.ExtractDoodadSet(WmoDoodads[WmoInstanceNames[id]], map_num, tileX, tileY, dirfile);
                }
            }
        }
        //======================
        ADT.seek(nextpos);
    }
    ADT.close();
    fclose(dirfile);
    return true;
}

ADTFile::~ADTFile()
{
    ADT.close();
}
