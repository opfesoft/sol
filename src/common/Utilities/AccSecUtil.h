#ifndef _ACCSECUTIL_H
#define _ACCSECUTIL_H

#include "BigNumber.h"

class AccSecUtil
{
public:
    static const uint8 s_BYTE_SIZE;
    static const char* N_HEX;
    static const uint8 generator;

    static BigNumber CalculateVerifier(const std::string& name, const std::string& password, BigNumber& s);
    static void SetVSFields(const std::string& name, const std::string& password);
    static bool CheckPassword(const std::string& name, const std::string& password);

private:
    static std::string CalculateShaPassHash(const std::string& name, const std::string& password);
};

#endif
