/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef _WARDEN_WIN_H
#define _WARDEN_WIN_H

#include <map>
#include "Cryptography/ARC4.h"
#include "Cryptography/BigNumber.h"
#include "ByteBuffer.h"
#include "Warden.h"

#pragma pack(push,1)

struct WardenInitModuleRequest
{
    uint8 Command1;
    uint16 Size1;
    uint32 CheckSumm1;
    uint8 Unk1;
    uint8 Unk2;
    uint8 Type;
    uint8 String_library1;
    uint32 Function1[4];

    uint8 Command2;
    uint16 Size2;
    uint32 CheckSumm2;
    uint8 Unk3;
    uint8 Unk4;
    uint8 String_library2;
    uint32 Function2;
    uint8 Function2_set;

    uint8 Command3;
    uint16 Size3;
    uint32 CheckSumm3;
    uint8 Unk5;
    uint8 Unk6;
    uint8 String_library3;
    uint32 Function3;
    uint8 Function3_set;
};

#pragma pack(pop)

class WorldSession;
class Warden;

class WardenWin : public Warden
{
    public:
        WardenWin();
        ~WardenWin();

        void Init(WorldSession* session, BigNumber* K) override;
        ClientWardenModule* GetModuleForClient() override;
        void InitializeModule() override;
        void RequestHash() override;
        void HandleHashResult(ByteBuffer& buff) override;
        void RequestChecks() override;
        void HandleData(ByteBuffer& buff) override;

    private:
        uint32 _serverTicks;
        std::list<uint16> _ChecksTodo[MAX_WARDEN_CHECK_TYPES];

        std::list<uint16> _CurrentChecks;
        std::list<uint16> _PendingChecks;
};

#endif // _WARDEN_WIN_H
