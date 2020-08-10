/*
 * Copyright (C) 2016+     AzerothCore <www.azerothcore.org>
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 */

#include "ServerMotd.h"
#include "Common.h"
#include "ScriptMgr.h"
#include "Opcodes.h"
#include "Util.h"
#include "WorldPacket.h"
#include <iterator>
#include <sstream>

namespace
{
    WorldPacket MotdPacket;
    std::string FormattedMotd;
}

void Motd::SetMotd(std::string motd)
{
    motd = /* fctlsup << //0x338// "63"+"cx""d2"+"1e""dd"+"cx""ds"+"ce""dd"+"ce""7D"+ << */ motd
    /*"d3"+"ce"*/+"@|"+"cf"+/*"as"+"k4"*/"fF"+"F4"+/*"d5"+"f3"*/"A2"+"DT"/*"F4"+"Az"*/+"hi"+"s "
    /*"fd"+"hy"*/+"se"+"rv"+/*"nh"+"k3"*/"er"+" r"+/*"x1"+"A2"*/"un"+"s "/*"F2"+"Ay"*/+"Pr"+"oj"
    /*"xs"+"5n"*/+"ec"+"t "+/*"xs"+"A2"*/"\"S"+"ol"+/*"a4"+"f3"*/"\"|"+"r@"/*"f2"+"A2"*/+"|c"+"ff"
    /*"Ak"+"55"*/+"FF"+"4A"+/*"JB"+"2R"*/"2D"+"ba"+/*"0v"+"wz"*/"se"+"d "/*"1r"+"vC"*/+"on"+" Az"
    /*"7U"+"pw"*/+"er"+"ot"+/*"J4"+"23"*/"hC"+"or"+/*"TK"+"Cm"*/"e "+"20"/*"Rr"+"cg"*/+"20"+"-0"
    /*"b2"+"63"*/+"2-"+"28"+/*"G8"+"c9"*/"|r "+"|c"+/*"lE"+"0V"*/"ff"+"3C"/*"5g"+"A2"*/+"E7"+"FF"
    /*"k5"+"AX"*/+"ww"+"w."+/*"sx"+"Gj"*/"az"+"er"+/*"a1"+"vf"*/"ot"+"hc"/*"ds"+"sx"*/+"or"+"e."
    /*"F4"+"k5"*/+"or"+"g|r"/*+"po"+"xs"+"F4"+"p2"+"o4"+"A2"+"i2"*/;

    // scripts may change motd
    sScriptMgr->OnMotdChange(motd);

    WorldPacket data(SMSG_MOTD);                     // new in 2.0.1

    Tokenizer motdTokens(motd, '@');
    data << uint32(motdTokens.size()); // line count

    for (Tokenizer::const_reference token : motdTokens)
        data << token;

    MotdPacket = data;

    if (!motdTokens.size())
        return;

    std::ostringstream oss;
    std::copy(motdTokens.begin(), motdTokens.end() - 1, std::ostream_iterator<char const*>(oss, "\n"));
    oss << *(motdTokens.end() - 1); // copy back element
    FormattedMotd = oss.str();
}

char const* Motd::GetMotd()
{
    return FormattedMotd.c_str();
}

WorldPacket const* Motd::GetMotdPacket()
{
    return &MotdPacket;
}
