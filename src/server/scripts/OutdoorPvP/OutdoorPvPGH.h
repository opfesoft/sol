/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under GNU AGPL3 v3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef OUTDOOR_PVP_GH_
#define OUTDOOR_PVP_GH_

#include "OutdoorPvP.h"

enum OutdoorPvPGHenum
{
    GH_ALLIANCE_DEFENSE_EVENT           = 65,
    GH_HORDE_DEFENSE_EVENT              = 66,

    GH_ZONE                             = 394,

    GH_UI_SLIDER_DISPLAY                = 3466,
    GH_UI_SLIDER_POS                    = 3467,
    GH_UI_SLIDER_N                      = 3468,
};

class Unit;
class Creature;
class OPvPCapturePointGH;

class OutdoorPvPGH : public OutdoorPvP
{
    public:
        OutdoorPvPGH();
        bool SetupOutdoorPvP();
        void SendRemoveWorldStates(Player* player);

    private:
        OPvPCapturePointGH* m_obj;
};

class OPvPCapturePointGH : public OPvPCapturePoint
{
    public:
        OPvPCapturePointGH(OutdoorPvP* pvp);

        void ChangeState();
        void SendChangePhase();

        void FillInitialWorldStates(WorldPacket & data);

        bool HandlePlayerEnter(Player* player);
        void HandlePlayerLeave(Player* player);
};

#endif
