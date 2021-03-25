#include "AccSecUtil.h"
#include "Database/DatabaseEnv.h"
#include "Util.h"
#include "SHA1.h"
#include "openssl/crypto.h"

const uint8 AccSecUtil::s_BYTE_SIZE = 32;
const char* AccSecUtil::N_HEX       = "894B645E89E1535BBDAD5B8B290650530801B18EBFBF5E8FAB3C82872A3E9BB7";
const uint8 AccSecUtil::generator   = 7;

std::string AccSecUtil::CalculateShaPassHash(const std::string& name, const std::string& password)
{
    SHA1Hash sha;
    sha.Initialize();
    sha.UpdateData(name);
    sha.UpdateData(":");
    sha.UpdateData(password);
    sha.Finalize();

    return ByteArrayToHexStr(sha.GetDigest(), sha.GetLength());
}

BigNumber AccSecUtil::CalculateVerifier(const std::string& name, const std::string& password, BigNumber& s)
{
    std::string rI = CalculateShaPassHash(name, password);
    BigNumber N, g;
    N.SetHexStr(N_HEX);
    g.SetDword(generator);

    BigNumber I;
    I.SetHexStr(rI.c_str());

    // In case of leading zeros in the rI hash, restore them
    uint8 mDigest[SHA_DIGEST_LENGTH];
    memset(mDigest, 0, SHA_DIGEST_LENGTH);
    if (I.GetNumBytes() <= SHA_DIGEST_LENGTH)
        memcpy(mDigest, I.AsByteArray().get(), I.GetNumBytes());

    std::reverse(mDigest, mDigest + SHA_DIGEST_LENGTH);

    SHA1Hash sha;
    sha.UpdateData(s.AsByteArray().get(), s.GetNumBytes());
    sha.UpdateData(mDigest, SHA_DIGEST_LENGTH);
    sha.Finalize();
    BigNumber x;
    x.SetBinary(sha.GetDigest(), sha.GetLength());
    return g.ModExp(x, N);
}

void AccSecUtil::SetVSFields(const std::string& name, const std::string& password)
{
    std::string rI = CalculateShaPassHash(name, password);
    BigNumber v, s, N, g;
    N.SetHexStr(N_HEX);
    g.SetDword(generator);

    s.SetRand(s_BYTE_SIZE * 8);

    v = CalculateVerifier(name, password, s);

    char *v_hex, *s_hex;
    v_hex = v.AsHexStr();
    s_hex = s.AsHexStr();

    PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_UPD_VS);
    stmt->setString(0, v_hex);
    stmt->setString(1, s_hex);
    stmt->setString(2, name);
    LoginDatabase.Execute(stmt);

    OPENSSL_free(v_hex);
    OPENSSL_free(s_hex);
}

bool AccSecUtil::CheckPassword(const std::string& name, const std::string& password)
{
    PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_SEL_CHECK_PASSWORD);
    stmt->setString(0, name);
    PreparedQueryResult result = LoginDatabase.Query(stmt);

    if (result)
    {
        Field* fields = result->Fetch();
        BigNumber v, s;

        std::string databaseV = fields[0].GetString();
        std::string databaseS = fields[1].GetString();
        v.SetHexStr(databaseV.c_str());
        s.SetHexStr(databaseS.c_str());

        BigNumber vCalc = CalculateVerifier(name, password, s);
        ASSERT(v.GetNumBytes() == 32 && vCalc.GetNumBytes() == 32);
        return memcmp(v.AsByteArray().get(), vCalc.AsByteArray().get(), 32) == 0;
    }
    else
        return false;
}
