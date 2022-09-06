/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "HMACSHA1.h"
#include "BigNumber.h"
#include "Common.h"
#include <openssl/core_names.h>

HmacHash::HmacHash(uint32 len, uint8 *seed)
{
    OSSL_PARAM params[2];
    params[0] = OSSL_PARAM_construct_utf8_string(OSSL_MAC_PARAM_DIGEST, const_cast<char*>("SHA1"), 0);
    params[1] = OSSL_PARAM_construct_end();
    m_mac = EVP_MAC_fetch(NULL, const_cast<char*>("HMAC"), NULL);
    m_ctx = EVP_MAC_CTX_new(m_mac);
    EVP_MAC_init(m_ctx, seed, len, params);
    memset(m_digest, 0, sizeof(m_digest));
}

HmacHash::~HmacHash()
{
    EVP_MAC_free(m_mac);
    EVP_MAC_CTX_free(m_ctx);
}

void HmacHash::UpdateData(const std::string &str)
{
    EVP_MAC_update(m_ctx, reinterpret_cast<uint8 const*>(str.c_str()), str.length());
}

void HmacHash::UpdateData(const uint8* data, size_t len)
{
   EVP_MAC_update(m_ctx, data, len);
}

void HmacHash::Finalize()
{
    size_t length = 0;
    EVP_MAC_final(m_ctx, m_digest, &length, sizeof(m_digest));
    ASSERT(length == SHA_DIGEST_LENGTH);
}

uint8* HmacHash::ComputeHash(BigNumber* bn)
{
    EVP_MAC_update(m_ctx, bn->AsByteArray().get(), bn->GetNumBytes());
    Finalize();
    return m_digest;
}
