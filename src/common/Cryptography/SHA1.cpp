/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "SHA1.h"
#include "BigNumber.h"
#include <stdarg.h>

SHA1Hash::SHA1Hash()
{
    SHA1_Init(&mC);
    memset(mDigest, 0, SHA_DIGEST_LENGTH * sizeof(uint8));
}

SHA1Hash::~SHA1Hash()
{
    SHA1_Init(&mC);
}

void SHA1Hash::UpdateData(const uint8 *dta, int len)
{
    SHA1_Update(&mC, dta, len);
}

void SHA1Hash::UpdateData(const std::string &str)
{
    UpdateData((uint8 const*)str.c_str(), str.length());
}

void SHA1Hash::UpdateBigNumbers(BigNumber* bn0, ...)
{
    va_list v;
    BigNumber* bn;

    va_start(v, bn0);
    bn = bn0;
    while (bn)
    {
        UpdateData(bn->AsByteArray().get(), bn->GetNumBytes());
        bn = va_arg(v, BigNumber*);
    }
    va_end(v);
}

void SHA1Hash::Initialize()
{
    SHA1_Init(&mC);
}

void SHA1Hash::Finalize(void)
{
    SHA1_Final(mDigest, &mC);
}

