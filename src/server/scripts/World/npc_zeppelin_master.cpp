#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "Player.h"
#include "MapManager.h"
#include "Transport.h"

enum ZeppelinGUIDs
{
    GUID_THE_PURPLE_PRINCESS =  1, // Undercity, Tirisfal Glades and Grom'gol Base Camp, Stranglethorn Vale
    GUID_THE_IRON_EAGLE      =  5, // Orgrimmar, Durotar and Grom'gol Base Camp, Stranglethorn Vale
    GUID_THE_THUNDERCALLER   =  6, // Orgrimmar, Durotar and Undercity, Tirisfal Glades
    GUID_CLOUDKISSER         = 11, // Undercity, Tirisfal Glades and Vengeance Landing, Howling Fjord
    GUID_THE_MIGHTY_WIND     = 12  // Orgrimmar, Durotar and Warsong Hold, Borean Tundra
};

enum ZeppelinMaps
{
    MAP_EASTERN_KINGDOMS    =   0,
    MAP_KALIMDOR            =   1,
    MAP_NORTHREND           = 571
};

enum ZeppelinAreas
{
    AREA_DUROTAR            =   14,
    AREA_TIRISFAL_GLADES    =   85,
    AREA_GROM_GOL           =  117,
    AREA_VENGEANCE_LANDING  = 4000,
    AREA_WARSONG_HOLD       = 4129
};

enum ZeppelinNpcs
{
    NPC_NEZ_RAZ            =  3149, // Durotar Zeppelin Master            (Stranglethorn Vale)
    NPC_HIN_DENBURG        =  3150, // Stranglethorn Vale Zeppelin Master (Tirisfal Glades)
    NPC_FREZZA             =  9564, // Tirisfal Glades Zeppelin Master    (Durotar)
    NPC_ZAPETTA            =  9566, // Durotar Zeppelin Master            (Tirisfal Glades)
    NPC_SNURK_BUCKSQUICK   = 12136, // Stranglethorn Vale Zeppelin Master (Durotar)
    NPC_SQUIBBY_OVERSPECK  = 12137, // Tirisfal Glades Zeppelin Master    (Stranglethorn Vale)
    NPC_GREEB_RAMROCKET    = 26537, // Borean Tundra Zeppelin Master      (Durotar)
    NPC_NARGO_SCREWBORE    = 26538, // Durotar Zeppelin Master            (Borean Tundra)
    NPC_MEEFI_FARTHROTTLE  = 26539, // Howling Fjord Zeppelin Master      (Tirisfal Glades)
    NPC_DRENK_SPANNERSPARK = 26540, // Tirisfal Glades Zeppelin Master    (Howling Fjord)
    NPC_KRIXX              = 23635, // Zeppelin Engineer                  (Orgrimmar)
    NPC_KRAXX              = 23713  // Zeppelin Engineer                  (Undercity)
};

enum ZeppelinNpcTexts
{
    NPC_TEXT_UNKNOWN            = 11163,
    NPC_TEXT_ORGRIMMAR_ARRIVED  = 11169,
    NPC_TEXT_ORGRIMMAR_DEPARTED = 11170,
    NPC_TEXT_GROM_GOL_ARRIVED   = 11167,
    NPC_TEXT_GROM_GOL_DEPARTED  = 11172,
    NPC_TEXT_UNDERCITY_ARRIVED  = 11173,
    NPC_TEXT_UNDERCITY_DEPARTED = 11175,

    GOSSIP_OPTION_1_ENGINEER    =     0,
    GOSSIP_OPTION_2_ENGINEER    =     1,
    GOSSIP_OPTION_1_MASTER      =     0,

    GOSSIP_ACTION_1_ENGINEER    =   101,
    GOSSIP_ACTION_2_ENGINEER    =   102,
    GOSSIP_ACTION_1_MASTER      =   103,

    ZEPPELIN_ANNOUNCE           =     0,
};

class npc_zeppelin_master : public CreatureScript
{
public:
    npc_zeppelin_master() : CreatureScript("npc_zeppelin_master") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        switch (creature->GetEntry())
        {
            case NPC_GREEB_RAMROCKET:
            case NPC_NARGO_SCREWBORE:
            case NPC_MEEFI_FARTHROTTLE:
            case NPC_DRENK_SPANNERSPARK:
                break;
            case NPC_KRIXX:
            case NPC_KRAXX:
                AddGossipItemFor(player, Player::GetDefaultGossipMenuForSource(creature), GOSSIP_OPTION_1_ENGINEER, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_1_ENGINEER);
                AddGossipItemFor(player, Player::GetDefaultGossipMenuForSource(creature), GOSSIP_OPTION_2_ENGINEER, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_2_ENGINEER);
                break;
            default:
                bool arrived = false;
                uint32 lastArea = 0;
                CheckZeppelinMaster(creature, arrived, lastArea);

                if (!(arrived && creature->GetAreaId() == lastArea))
                    AddGossipItemFor(player, Player::GetDefaultGossipMenuForSource(creature), GOSSIP_OPTION_1_MASTER, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_1_MASTER);
        }

        SendGossipMenuFor(player, player->GetGossipTextId(creature), creature->GetGUID());

        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        ClearGossipMenuFor(player);

        switch (action)
        {
            case GOSSIP_ACTION_1_ENGINEER:
                SendZeppelinGossipMenu(player, creature, GUID_THE_THUNDERCALLER);
                break;
            case GOSSIP_ACTION_2_ENGINEER:
                if (creature->GetEntry() == NPC_KRIXX)
                    SendZeppelinGossipMenu(player, creature, GUID_THE_IRON_EAGLE);
                else if (creature->GetEntry() == NPC_KRAXX)
                    SendZeppelinGossipMenu(player, creature, GUID_THE_PURPLE_PRINCESS);
                break;
            case GOSSIP_ACTION_1_MASTER:
                switch (creature->GetEntry())
                {
                    case NPC_NEZ_RAZ:
                    case NPC_SNURK_BUCKSQUICK:
                        SendZeppelinGossipMenu(player, creature, GUID_THE_IRON_EAGLE);
                        break;
                    case NPC_HIN_DENBURG:
                    case NPC_SQUIBBY_OVERSPECK:
                        SendZeppelinGossipMenu(player, creature, GUID_THE_PURPLE_PRINCESS);
                        break;
                    case NPC_FREZZA:
                    case NPC_ZAPETTA:
                        SendZeppelinGossipMenu(player, creature, GUID_THE_THUNDERCALLER);
                        break;
                }
                break;
            default:
                return false;
        }

        return true;
    }

    void SendZeppelinGossipMenu(Player* player, Creature* creature, uint32 zeppelinGuid)
    {
        bool arrived = false;
        uint32 lastArea = 0;

        switch (zeppelinGuid)
        {
            case GUID_THE_PURPLE_PRINCESS:
                CheckZeppelinMaps(MAP_EASTERN_KINGDOMS, MAP_EASTERN_KINGDOMS, zeppelinGuid, arrived, lastArea);
                if (lastArea == AREA_TIRISFAL_GLADES)
                    SendZeppelinGossipMenu(player, creature, arrived, NPC_TEXT_UNDERCITY_ARRIVED, NPC_TEXT_UNDERCITY_DEPARTED);
                else if (lastArea == AREA_GROM_GOL)
                    SendZeppelinGossipMenu(player, creature, arrived, NPC_TEXT_GROM_GOL_ARRIVED, NPC_TEXT_GROM_GOL_DEPARTED);
                break;
            case GUID_THE_IRON_EAGLE:
                CheckZeppelinMaps(MAP_KALIMDOR, MAP_EASTERN_KINGDOMS, zeppelinGuid, arrived, lastArea);
                if (lastArea == AREA_DUROTAR)
                    SendZeppelinGossipMenu(player, creature, arrived, NPC_TEXT_ORGRIMMAR_ARRIVED, NPC_TEXT_ORGRIMMAR_DEPARTED);
                else if (lastArea == AREA_GROM_GOL)
                    SendZeppelinGossipMenu(player, creature, arrived, NPC_TEXT_GROM_GOL_ARRIVED, NPC_TEXT_GROM_GOL_DEPARTED);
                break;
            case GUID_THE_THUNDERCALLER:
                CheckZeppelinMaps(MAP_EASTERN_KINGDOMS, MAP_KALIMDOR, zeppelinGuid, arrived, lastArea);
                if (lastArea == AREA_TIRISFAL_GLADES)
                    SendZeppelinGossipMenu(player, creature, arrived, NPC_TEXT_UNDERCITY_ARRIVED, NPC_TEXT_UNDERCITY_DEPARTED);
                else if (lastArea == AREA_DUROTAR)
                    SendZeppelinGossipMenu(player, creature, arrived, NPC_TEXT_ORGRIMMAR_ARRIVED, NPC_TEXT_ORGRIMMAR_DEPARTED);
                break;
        }

        if (lastArea == 0)
            SendGossipMenuFor(player, NPC_TEXT_UNKNOWN, creature->GetGUID());
    }

    void CheckZeppelinMaps(uint32 mapId1, uint32 mapId2, uint32 zeppelinGuid, bool& arrived, uint32& lastArea)
    {
        CheckZeppelin(mapId1, zeppelinGuid, arrived, lastArea);
        if (lastArea == 0)
            CheckZeppelin(mapId2, zeppelinGuid, arrived, lastArea);
    }

    void SendZeppelinGossipMenu(Player* player, Creature* creature, bool arrived, uint32 arrivedText, uint32 departedText)
    {
        if (arrived)
            SendGossipMenuFor(player, arrivedText, creature->GetGUID());
        else
            SendGossipMenuFor(player, departedText, creature->GetGUID());
    }

    static void CheckZeppelin(uint32 mapId, uint32 zeppelinGuid, bool& arrived, uint32& lastArea)
    {
        if (Map* map = sMapMgr->FindBaseNonInstanceMap(mapId))
            if (Transport* transport = map->GetTransport(MAKE_NEW_GUID(zeppelinGuid, 0, HIGHGUID_MO_TRANSPORT)))
                if (MotionTransport* motionTransport = transport->ToMotionTransport())
                {
                    arrived = motionTransport->HasArrived();
                    lastArea = motionTransport->GetLastArea();
                }
    }

    static void CheckZeppelinMaster(Creature* creature, bool& arrived, uint32& lastArea)
    {
        switch (creature->GetEntry())
        {
            case NPC_NEZ_RAZ:
            case NPC_SNURK_BUCKSQUICK:
                CheckZeppelin(creature->GetMapId(), GUID_THE_IRON_EAGLE, arrived, lastArea);
                break;
            case NPC_HIN_DENBURG:
            case NPC_SQUIBBY_OVERSPECK:
                CheckZeppelin(creature->GetMapId(), GUID_THE_PURPLE_PRINCESS, arrived, lastArea);
                break;
            case NPC_FREZZA:
            case NPC_ZAPETTA:
                CheckZeppelin(creature->GetMapId(), GUID_THE_THUNDERCALLER, arrived, lastArea);
                break;
            case NPC_GREEB_RAMROCKET:
            case NPC_NARGO_SCREWBORE:
                CheckZeppelin(creature->GetMapId(), GUID_THE_MIGHTY_WIND, arrived, lastArea);
                break;
            case NPC_MEEFI_FARTHROTTLE:
            case NPC_DRENK_SPANNERSPARK:
                CheckZeppelin(creature->GetMapId(), GUID_CLOUDKISSER, arrived, lastArea);
                break;
        }
    }

    struct npc_zeppelin_masterAI : public ScriptedAI
    {
        npc_zeppelin_masterAI(Creature* creature) : ScriptedAI(creature) { }

        void SetData(uint32 /*id*/, uint32 /*value*/) override
        {
            Talk(ZEPPELIN_ANNOUNCE);
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_zeppelin_masterAI(creature);
    }
};

void AddSC_npc_zeppelin_master()
{
    new npc_zeppelin_master;
}
