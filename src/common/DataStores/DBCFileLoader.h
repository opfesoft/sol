/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef DBC_FILE_LOADER_H
#define DBC_FILE_LOADER_H
#include "Define.h"
#include "Utilities/ByteConverter.h"
#include <cassert>

enum DbcFieldFormat
{
    FT_NA='x',                                              //not used or unknown, 4 byte size
    FT_NA_BYTE='X',                                         //not used or unknown, byte
    FT_STRING='s',                                          //char*
    FT_FLOAT='f',                                           //float
    FT_INT='i',                                             //uint32
    FT_BYTE='b',                                            //uint8
    FT_SORT='d',                                            //sorted by this field, field is not included
    FT_IND='n',                                             //the same, but parsed to data
    FT_LOGIC='l',                                           //Logical (boolean)
    FT_SQL_PRESENT='p',                                     //Used in sql format to mark column present in sql dbc
    FT_SQL_ABSENT='a'                                       //Used in sql format to mark column absent in sql dbc
};

class DBCFileLoader
{
    public:
        DBCFileLoader();
        ~DBCFileLoader();

        bool Load(const char *filename, const char *fmt);

        class Record
        {
            public:
                float getFloat(size_t field) const
                {
                    assert(field < file.fieldCount);
                    float val = *reinterpret_cast<float*>(offset+file.GetOffset(field));
                    EndianConvert(val);
                    return val;
                }
                uint32 getUInt(size_t field) const
                {
                    assert(field < file.fieldCount);
                    uint32 val = *reinterpret_cast<uint32*>(offset+file.GetOffset(field));
                    EndianConvert(val);
                    return val;
                }
                uint8 getUInt8(size_t field) const
                {
                    assert(field < file.fieldCount);
                    return *reinterpret_cast<uint8*>(offset+file.GetOffset(field));
                }

                const char *getString(size_t field) const
                {
                    assert(field < file.fieldCount);
                    size_t stringOffset = getUInt(field);
                    assert(stringOffset < file.stringSize);
                    return reinterpret_cast<char*>(file.stringTable + stringOffset);
                }

            private:
                Record(DBCFileLoader &file_, unsigned char *offset_): offset(offset_), file(file_) { }
                unsigned char *offset;
                DBCFileLoader &file;

                friend class DBCFileLoader;

        };

        // Get record by id
        Record getRecord(size_t id);
        /// Get begin iterator over records

        uint32 GetNumRows() const { return recordCount; }
        uint32 GetRowSize() const { return recordSize; }
        uint32 GetCols() const { return fieldCount; }
        uint32 GetOffset(size_t id) const { return (fieldsOffset != NULL && id < fieldCount) ? fieldsOffset[id] : 0; }
        bool IsLoaded() const { return data != NULL; }
        char* AutoProduceData(const char* fmt, uint32& count, char**& indexTable, uint32 sqlRecordCount, uint32 sqlHighestIndex, char *& sqlDataTable);
        char* AutoProduceStrings(const char* fmt, char* dataTable);
        static uint32 GetFormatRecordSize(const char * format, int32 * index_pos = NULL);
    private:

        uint32 recordSize;
        uint32 recordCount;
        uint32 fieldCount;
        uint32 stringSize;
        uint32 *fieldsOffset;
        unsigned char *data;
        unsigned char *stringTable;
};
#endif
