/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

/* ScriptData
Name: wp_commandscript
%Complete: 100
Comment: All wp related commands
Category: commandscripts
EndScriptData */

#include "Chat.h"
#include "Language.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "WaypointManager.h"
#include "Transport.h"
#include "WaypointMovementGenerator.h"

class wp_commandscript : public CommandScript
{
public:
    wp_commandscript() : CommandScript("wp_commandscript") { }

    std::vector<ChatCommand> GetCommands() const override
    {
        static std::vector<ChatCommand> wpCommandTable =
        {
            { "add",            SEC_ADMINISTRATOR,     false, &HandleWpAddCommand,                "" },
            { "event",          SEC_ADMINISTRATOR,     false, &HandleWpEventCommand,              "" },
            { "load",           SEC_ADMINISTRATOR,     false, &HandleWpLoadCommand,               "" },
            { "modify",         SEC_ADMINISTRATOR,     false, &HandleWpModifyCommand,             "" },
            { "unload",         SEC_ADMINISTRATOR,     false, &HandleWpUnLoadCommand,             "" },
            { "reload",         SEC_ADMINISTRATOR,     false, &HandleWpReloadCommand,             "" },
            { "show",           SEC_ADMINISTRATOR,     false, &HandleWpShowCommand,               "" },
            { "go",             SEC_ADMINISTRATOR,     false, &HandleWpGoCommand,                 "" },
            { "stop",           SEC_ADMINISTRATOR,     false, &HandleWpStopCommand,               "" }
        };
        static std::vector<ChatCommand> commandTable =
        {
            { "wp",             SEC_ADMINISTRATOR,     false, nullptr,                            "", wpCommandTable }
        };
        return commandTable;
    }
    /**
    * Add a waypoint to a creature.
    *
    * The user can either select an npc or provide its GUID.
    *
    * The user can even select a visual waypoint - then the new waypoint
    * is placed *after* the selected one - this makes insertion of new
    * waypoints possible.
    *
    * eg:
    * .wp add 12345
    * -> adds a waypoint to the npc with the GUID 12345
    *
    * .wp add
    * -> adds a waypoint to the currently selected creature
    *
    *
    * @param args if the user did not provide a GUID, it is nullptr
    *
    * @return true - command did succeed, false - something went wrong
    */
    static bool HandleWpAddCommand(ChatHandler* handler, const char* args)
    {
        // optional
        char* path_number = nullptr;
        uint32 pathid = 0;
        uint32 point = 0;
        uint32 wpGuid = 0;

        if (*args)
            path_number = strtok((char*)args, " ");

        Creature* target = handler->getSelectedCreature();

        if (!findWaypoint(handler, pathid, point, wpGuid, false))
        {
            // no waypoint selected; add the new waypoint to the end of the path
            if (!path_number)
            {
                if (target)
                    pathid = target->GetWaypointPath();
                else
                {
                    PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_WAYPOINT_DATA_MAX_ID);

                    PreparedQueryResult result = WorldDatabase.Query(stmt);

                    uint32 maxpathid = result->Fetch()->GetInt32();
                    pathid = maxpathid+1;
                    handler->PSendSysMessage("%s%s|r", "|cff00ff00", "New path started.");
                }
            }
            else
                pathid = atoi(path_number);

            // path_id -> ID of the Path
            // point   -> number of the waypoint (if not 0)

            if (!pathid)
            {
                handler->PSendSysMessage("%s%s|r", "|cffff33ff", "Current creature haven't loaded path.");
                return false;
            }

            PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_WAYPOINT_DATA_MAX_POINT);
            stmt->setUInt32(0, pathid);
            PreparedQueryResult result = WorldDatabase.Query(stmt);

            if (result)
                point = (*result)[0].GetUInt32();
        }
        else if (!path_number)
        {
            // waypoint selected and no path number specified; shift the next waypoints up in
            // preparation of adding the new waypoint after the selected one
            PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_UPD_WAYPOINT_DATA_POINT_SHIFT_UP);

            stmt->setUInt32(0, pathid);
            stmt->setUInt32(1, point);

            WorldDatabase.DirectExecute(stmt);
            handler->PSendSysMessage("%s%s%u%s|r", "|cff00ff00", "Waypoints greater than |r|cff00ffff", point, "|r|cff00ff00 shifted up.");
        }
        else
        {
            pathid = atoi(path_number);

            PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_WAYPOINT_DATA_MAX_POINT);
            stmt->setUInt32(0, pathid);
            PreparedQueryResult result = WorldDatabase.Query(stmt);

            if (result)
                point = (*result)[0].GetUInt32();
        }

        Player* player = handler->GetSession()->GetPlayer();

        PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_INS_WAYPOINT_DATA);

        stmt->setUInt32(0, pathid);
        stmt->setUInt32(1, point + 1);

        if (player->HasUnitMovementFlag(MOVEMENTFLAG_ONTRANSPORT) && player->GetTransport())
        {
            stmt->setFloat(2, player->GetTransOffsetX());
            stmt->setFloat(3, player->GetTransOffsetY());
            stmt->setFloat(4, player->GetTransOffsetZ());
        }
        else
        {
            stmt->setFloat(2, player->GetPositionX());
            stmt->setFloat(3, player->GetPositionY());
            stmt->setFloat(4, player->GetPositionZ());
        }

        WorldDatabase.DirectExecute(stmt);

        handler->PSendSysMessage("%s%s%u%s%u%s|r", "|cff00ff00", "PathID: |r|cff00ffff", pathid, "|r|cff00ff00: Waypoint |r|cff00ffff", point+1, "|r|cff00ff00 created.");
        return true;
    }                                                           // HandleWpAddCommand

    static bool HandleWpLoadCommand(ChatHandler* handler, const char* args)
    {
        if (!*args)
            return false;

        // optional
        char* path_number = nullptr;

        if (*args)
            path_number = strtok((char*)args, " ");

        uint32 pathid = 0;
        uint32 guidLow = 0;
        Creature* target = handler->getSelectedCreature();

        // Did player provide a path_id?
        if (!path_number)
            return false;

        if (!target)
        {
            handler->SendSysMessage(LANG_SELECT_CREATURE);
            handler->SetSentErrorMessage(true);
            return false;
        }

        if (target->GetEntry() == 1)
        {
            handler->PSendSysMessage("%s%s|r", "|cffff33ff", "You want to load path to a waypoint? Aren't you?");
            handler->SetSentErrorMessage(true);
            return false;
        }

        pathid = atoi(path_number);

        if (!pathid)
        {
            handler->PSendSysMessage("%s%s|r", "|cffff33ff", "No valid path number provided.");
            return true;
        }

        guidLow = target->GetDBTableGUIDLow();

        PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_CREATURE_ADDON_BY_GUID);

        stmt->setUInt32(0, guidLow);

        PreparedQueryResult result = WorldDatabase.Query(stmt);

        if (result)
        {
            stmt = WorldDatabase.GetPreparedStatement(WORLD_UPD_CREATURE_ADDON_PATH);

            stmt->setUInt32(0, pathid);
            stmt->setUInt32(1, guidLow);
        }
        else
        {
            stmt = WorldDatabase.GetPreparedStatement(WORLD_INS_CREATURE_ADDON);

            stmt->setUInt32(0, guidLow);
            stmt->setUInt32(1, pathid);
        }

        WorldDatabase.Execute(stmt);

        stmt = WorldDatabase.GetPreparedStatement(WORLD_UPD_CREATURE_MOVEMENT_TYPE);

        stmt->setUInt8(0, uint8(WAYPOINT_MOTION_TYPE));
        stmt->setUInt32(1, guidLow);

        WorldDatabase.Execute(stmt);

        target->LoadPath(pathid);
        target->SetDefaultMovementType(WAYPOINT_MOTION_TYPE);
        target->GetMotionMaster()->Initialize();
        target->MonsterSay("Path loaded.", LANG_UNIVERSAL, nullptr);

        return true;
    }

    static bool HandleWpReloadCommand(ChatHandler* handler, const char* args)
    {
        if (!*args)
            return false;

        uint32 id = atoi(args);

        if (!id)
            return false;

        handler->PSendSysMessage("%s%s|r|cff00ffff%u|r", "|cff00ff00", "Loading Path: ", id);
        sWaypointMgr->ReloadPath(id);
        return true;
    }

    static bool HandleWpUnLoadCommand(ChatHandler* handler, const char* /*args*/)
    {

        Creature* target = handler->getSelectedCreature();

        if (!target)
        {
            handler->PSendSysMessage("%s%s|r", "|cff33ffff", "You must select target.");
            return true;
        }

        uint32 guildLow = target->GetDBTableGUIDLow();

        if (target->GetCreatureAddon())
        {
            if (target->GetCreatureAddon()->path_id != 0)
            {
                PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_DEL_CREATURE_ADDON);

                stmt->setUInt32(0, guildLow);

                WorldDatabase.Execute(stmt);

                target->UpdateWaypointID(0);

                stmt = WorldDatabase.GetPreparedStatement(WORLD_UPD_CREATURE_MOVEMENT_TYPE);

                stmt->setUInt8(0, uint8(IDLE_MOTION_TYPE));
                stmt->setUInt32(1, guildLow);

                WorldDatabase.Execute(stmt);

                target->LoadPath(0);
                target->SetDefaultMovementType(IDLE_MOTION_TYPE);
                target->GetMotionMaster()->MoveTargetedHome();
                target->GetMotionMaster()->Initialize();
                target->MonsterSay("Path unloaded.", LANG_UNIVERSAL, nullptr);
                return true;
            }
            handler->PSendSysMessage("%s%s|r", "|cffff33ff", "Target have no loaded path.");
        }
        return true;
    }

    static bool HandleWpEventCommand(ChatHandler* handler, const char* args)
    {
        if (!*args)
            return false;

        char* show_str = strtok((char*)args, " ");
        std::string show = show_str;

        // Check
        if ((show != "add") && (show != "mod") && (show != "del") && (show != "listid"))
            return false;

        char* arg_id = strtok(nullptr, " ");
        uint32 id = 0;

        if (show == "add")
        {
            if (arg_id)
                id = atoi(arg_id);

            if (id)
            {
                PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_WAYPOINT_SCRIPT_ID_BY_GUID);
                stmt->setUInt32(0, id);
                PreparedQueryResult result = WorldDatabase.Query(stmt);

                if (!result)
                {
                    PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_INS_WAYPOINT_SCRIPT);

                    stmt->setUInt32(0, id);

                    WorldDatabase.DirectExecute(stmt);

                    handler->PSendSysMessage("%s%s%u|r", "|cff00ff00", "Wp Event: New waypoint event added: ", id);
                }
                else
                    handler->PSendSysMessage("|cff00ff00Wp Event: You have choosed an existing waypoint script guid: %u|r", id);
            }
            else
            {
                PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_WAYPOINT_SCRIPTS_MAX_ID);

                PreparedQueryResult result = WorldDatabase.Query(stmt);

                id = result->Fetch()->GetUInt32();

                stmt = WorldDatabase.GetPreparedStatement(WORLD_INS_WAYPOINT_SCRIPT);

                stmt->setUInt32(0, id + 1);

                WorldDatabase.DirectExecute(stmt);

                handler->PSendSysMessage("%s%s%u|r", "|cff00ff00", "Wp Event: New waypoint event added: |r|cff00ffff", id+1);
            }

            return true;
        }

        if (show == "listid")
        {
            if (!arg_id)
            {
                handler->PSendSysMessage("%s%s|r", "|cff33ffff", "Wp Event: You must provide waypoint script id.");
                return true;
            }

            id = atoi(arg_id);

            uint32 a2, a3, a4, a5, a6;
            float a8, a9, a10, a11;
            char const* a7;

            PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_WAYPOINT_SCRIPT_BY_ID);
            stmt->setUInt32(0, id);
            PreparedQueryResult result = WorldDatabase.Query(stmt);

            if (!result)
            {
                handler->PSendSysMessage("%s%s%u|r", "|cff33ffff", "Wp Event: No waypoint scripts found on id: ", id);
                return true;
            }

            Field* fields;

            do
            {
                fields = result->Fetch();
                a2 = fields[0].GetUInt32();
                a3 = fields[1].GetUInt32();
                a4 = fields[2].GetUInt32();
                a5 = fields[3].GetUInt32();
                a6 = fields[4].GetUInt32();
                a7 = fields[5].GetCString();
                a8 = fields[6].GetFloat();
                a9 = fields[7].GetFloat();
                a10 = fields[8].GetFloat();
                a11 = fields[9].GetFloat();

                handler->PSendSysMessage("|cffff33ffid:|r|cff00ffff %u|r|cff00ff00, guid: |r|cff00ffff%u|r|cff00ff00, delay: |r|cff00ffff%u|r|cff00ff00, command: |r|cff00ffff%u|r|cff00ff00, datalong: |r|cff00ffff%u|r|cff00ff00, datalong2: |r|cff00ffff%u|r|cff00ff00, datatext: |r|cff00ffff%s|r|cff00ff00, posx: |r|cff00ffff%f|r|cff00ff00, posy: |r|cff00ffff%f|r|cff00ff00, posz: |r|cff00ffff%f|r|cff00ff00, orientation: |r|cff00ffff%f|r", id, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
            }
            while (result->NextRow());
        }

        if (show == "del")
        {
            if (!arg_id)
            {
                handler->SendSysMessage("|cffff33ffERROR: Waypoint script guid not present.|r");
                return true;
            }

            id = atoi(arg_id);

            PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_WAYPOINT_SCRIPT_ID_BY_GUID);

            stmt->setUInt32(0, id);

            PreparedQueryResult result = WorldDatabase.Query(stmt);

            if (result)
            {
                PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_DEL_WAYPOINT_SCRIPT);

                stmt->setUInt32(0, id);

                WorldDatabase.DirectExecute(stmt);

                handler->PSendSysMessage("%s%s%u|r", "|cff00ff00", "Wp Event: Waypoint script removed: ", id);
            }
            else
                handler->PSendSysMessage("|cffff33ffWp Event: ERROR: you have selected a non existing script: %u|r", id);

            return true;
        }

        if (show == "mod")
        {
            if (!arg_id)
            {
                handler->SendSysMessage("|cffff33ffERROR: Waypoint script guid not present.|r");
                return true;
            }

            id = atoi(arg_id);

            if (!id)
            {
                handler->SendSysMessage("|cffff33ffERROR: No vallid waypoint script id not present.|r");
                return true;
            }

            char* arg_2 = strtok(nullptr, " ");

            if (!arg_2)
            {
                handler->SendSysMessage("|cffff33ffERROR: No argument present.|r");
                return true;
            }

            std::string arg_string  = arg_2;

            if ((arg_string != "setid") && (arg_string != "delay") && (arg_string != "command")
                && (arg_string != "datalong") && (arg_string != "datalong2") && (arg_string != "dataint") && (arg_string != "posx")
                && (arg_string != "posy") && (arg_string != "posz") && (arg_string != "orientation"))
            {
                handler->SendSysMessage("|cffff33ffERROR: No valid argument present.|r");
                return true;
            }

            char* arg_3;
            std::string arg_str_2 = arg_2;
            arg_3 = strtok(nullptr, " ");

            if (!arg_3)
            {
                handler->SendSysMessage("|cffff33ffERROR: No additional argument present.|r");
                return true;
            }

            if (arg_str_2 == "setid")
            {
                uint32 newid = atoi(arg_3);
                handler->PSendSysMessage("%s%s|r|cff00ffff%u|r|cff00ff00%s|r|cff00ffff%u|r", "|cff00ff00", "Wp Event: Wypoint scipt guid: ", newid, " id changed: ", id);

                PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_UPD_WAYPOINT_SCRIPT_ID);

                stmt->setUInt32(0, newid);
                stmt->setUInt32(1, id);

                WorldDatabase.DirectExecute(stmt);

                return true;
            }
            else
            {
                PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_WAYPOINT_SCRIPT_ID_BY_GUID);
                stmt->setUInt32(0, id);
                PreparedQueryResult result = WorldDatabase.Query(stmt);

                if (!result)
                {
                    handler->SendSysMessage("|cffff33ffERROR: You have selected an non existing waypoint script guid.|r");
                    return true;
                }

                if (arg_str_2 == "posx")
                {
                    PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_UPD_WAYPOINT_SCRIPT_X);

                    stmt->setFloat(0, float(atof(arg_3)));
                    stmt->setUInt32(1, id);

                    WorldDatabase.DirectExecute(stmt);

                    handler->PSendSysMessage("|cff00ff00Waypoint script:|r|cff00ffff %u|r|cff00ff00 position_x updated.|r", id);
                    return true;
                }
                else if (arg_str_2 == "posy")
                {
                    PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_UPD_WAYPOINT_SCRIPT_Y);

                    stmt->setFloat(0, float(atof(arg_3)));
                    stmt->setUInt32(1, id);

                    WorldDatabase.DirectExecute(stmt);

                    handler->PSendSysMessage("|cff00ff00Waypoint script: %u position_y updated.|r", id);
                    return true;
                }
                else if (arg_str_2 == "posz")
                {
                    PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_UPD_WAYPOINT_SCRIPT_Z);

                    stmt->setFloat(0, float(atof(arg_3)));
                    stmt->setUInt32(1, id);

                    WorldDatabase.DirectExecute(stmt);

                    handler->PSendSysMessage("|cff00ff00Waypoint script: |r|cff00ffff%u|r|cff00ff00 position_z updated.|r", id);
                    return true;
                }
                else if (arg_str_2 == "orientation")
                {
                    PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_UPD_WAYPOINT_SCRIPT_O);

                    stmt->setFloat(0, float(atof(arg_3)));
                    stmt->setUInt32(1, id);

                    WorldDatabase.DirectExecute(stmt);

                    handler->PSendSysMessage("|cff00ff00Waypoint script: |r|cff00ffff%u|r|cff00ff00 orientation updated.|r", id);
                    return true;
                }
                else if (arg_str_2 == "dataint")
                {
                    WorldDatabase.PExecute("UPDATE waypoint_scripts SET %s='%u' WHERE guid='%u'", arg_2, atoi(arg_3), id); // Query can't be a prepared statement

                    handler->PSendSysMessage("|cff00ff00Waypoint script: |r|cff00ffff%u|r|cff00ff00 dataint updated.|r", id);
                    return true;
                }
                else
                {
                    std::string arg_str_3 = arg_3;
                    WorldDatabase.EscapeString(arg_str_3);
                    WorldDatabase.PExecute("UPDATE waypoint_scripts SET %s='%s' WHERE guid='%u'", arg_2, arg_str_3.c_str(), id); // Query can't be a prepared statement
                }
            }
            handler->PSendSysMessage("%s%s|r|cff00ffff%u:|r|cff00ff00 %s %s|r", "|cff00ff00", "Waypoint script:", id, arg_2, "updated.");
        }
        return true;
    }

    static bool HandleWpModifyCommand(ChatHandler* handler, const char* args)
    {
        if (!*args)
            return false;

        // first arg: add del text emote spell waittime move
        char* show_str = strtok((char*)args, " ");
        if (!show_str)
        {
            return false;
        }

        std::string show = show_str;
        // Check
        // Remember: "show" must also be the name of a column!
        if ((show != "delay") && (show != "action") && (show != "action_chance")
            && (show != "move_type") && (show != "del") && (show != "move") && (show != "orientation") && (show != "pathfinding")
            )
        {
            return false;
        }

        // Next arg is: <PATHID> <WPNUM> <ARGUMENT>
        char* arg_str = nullptr;

        // Did user provide a GUID
        // or did the user select a creature?
        // -> variable lowguid is filled with the GUID of the NPC
        uint32 pathid = 0;
        uint32 point = 0;
        uint32 wpGuid = 0;

        if (!findWaypoint(handler, pathid, point, wpGuid, true))
            return false;

        // We have the waypoint number and the GUID of the "master npc"
        // Text is enclosed in "<>", all other arguments not
        arg_str = strtok((char*)nullptr, " ");

        // Check for argument
        if (show != "del" && show != "move" && show != "orientation" && arg_str == nullptr)
        {
            handler->PSendSysMessage(LANG_WAYPOINT_ARGUMENTREQ, show_str);
            return false;
        }

        Player* player = handler->GetSession()->GetPlayer();
        bool isOnTransport = player->HasUnitMovementFlag(MOVEMENTFLAG_ONTRANSPORT) && player->GetTransport();

        if (show == "del")
        {
            handler->PSendSysMessage("|cff00ff00DEBUG: wp modify del, PathID: |r|cff00ffff%u|r", pathid);

            if (wpGuid != 0)
                if (Creature* wpCreature = player->GetMap()->GetCreature(MAKE_NEW_GUID(wpGuid, VISUAL_WAYPOINT, HIGHGUID_UNIT)))
                {
                    wpCreature->CombatStop();
                    wpCreature->DeleteFromDB();
                    wpCreature->AddObjectToRemoveList();
                }

            PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_DEL_WAYPOINT_DATA);

            stmt->setUInt32(0, pathid);
            stmt->setUInt32(1, point);

            WorldDatabase.DirectExecute(stmt);

            stmt = WorldDatabase.GetPreparedStatement(WORLD_UPD_WAYPOINT_DATA_POINT_SHIFT_DOWN);

            stmt->setUInt32(0, pathid);
            stmt->setUInt32(1, point);

            WorldDatabase.DirectExecute(stmt);

            handler->PSendSysMessage(LANG_WAYPOINT_REMOVED);
            return true;
        }                                                       // del

        if (show == "move")
        {
            handler->PSendSysMessage("|cff00ff00DEBUG: wp move, PathID: |r|cff00ffff%u|r", pathid);

            Map* map = player->GetMap();
            {
                // Move the visual waypoint
                if (wpGuid != 0)
                {
                    // remove old waypoint
                    if (Creature* wpCreature = map->GetCreature(MAKE_NEW_GUID(wpGuid, VISUAL_WAYPOINT, HIGHGUID_UNIT)))
                    {
                        wpCreature->CombatStop();
                        wpCreature->DeleteFromDB();
                        wpCreature->AddObjectToRemoveList();
                    }
                    // create new waypoint
                    Creature* wpCreature2 = new Creature;
                    if (!wpCreature2->Create(sObjectMgr->GenerateLowGuid(HIGHGUID_UNIT), map, player->GetPhaseMaskForSpawn(), VISUAL_WAYPOINT, 0, player->GetPositionX(), player->GetPositionY(), player->GetPositionZ(), player->GetOrientation()))
                    {
                        handler->PSendSysMessage(LANG_WAYPOINT_VP_NOTCREATED, VISUAL_WAYPOINT);
                        delete wpCreature2;
                        return false;
                    }

                    // Set "wpguid" column to the visual waypoint
                    PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_UPD_WAYPOINT_DATA_WPGUID);

                    stmt->setInt32(0, int32(wpCreature2->GetGUIDLow()));
                    stmt->setUInt32(1, pathid);
                    stmt->setUInt32(2, point);

                    WorldDatabase.DirectExecute(stmt);

                    wpCreature2->SaveToDB(map->GetId(), (1 << map->GetSpawnMode()), player->GetPhaseMaskForSpawn());
                    if (!map->AddToMap(wpCreature2, isOnTransport))
                    {
                        handler->PSendSysMessage(LANG_WAYPOINT_VP_NOTCREATED, VISUAL_WAYPOINT);
                        delete wpCreature2;
                        return false;
                    }

                    wpCreature2->SetObjectScale(0.5f);
                    wpCreature2->SetLevel(((point - 1) % STRONG_MAX_LEVEL) + 1);
                }

                PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_UPD_WAYPOINT_DATA_POSITION);

                if (isOnTransport)
                {
                    stmt->setFloat(0, player->GetTransOffsetX());
                    stmt->setFloat(1, player->GetTransOffsetY());
                    stmt->setFloat(2, player->GetTransOffsetZ());
                }
                else
                {
                    stmt->setFloat(0, player->GetPositionX());
                    stmt->setFloat(1, player->GetPositionY());
                    stmt->setFloat(2, player->GetPositionZ());
                }

                stmt->setUInt32(3, pathid);
                stmt->setUInt32(4, point);

                WorldDatabase.DirectExecute(stmt);

                handler->PSendSysMessage(LANG_WAYPOINT_CHANGED);
            }
            return true;
        }                                                       // move

        const char *text = arg_str;

        if (text == 0)
        {
            // show_str check for present in list of correct values, no sql injection possible
            WorldDatabase.PExecute("UPDATE waypoint_data SET %s=NULL WHERE id='%u' AND point='%u'", show_str, pathid, point); // Query can't be a prepared statement
        }
        else
        {
            std::string text2 = text;

            if (show == "orientation")
            {
                float o;
                if (text2 == "player")
                {
                    if (isOnTransport)
                        o = player->GetTransOffsetO();
                    else
                        o = player->GetOrientation();
                }
                else
                    o = float(atof(text));

                text2 = std::to_string(o);
            }
            else
                text2 = std::to_string(uint32(atoi(text)));

            // values are checked for correctness, no sql injection possible
            WorldDatabase.PExecute("UPDATE waypoint_data SET %s='%s' WHERE id='%u' AND point='%u'", show_str, text2.c_str(), pathid, point); // Query can't be a prepared statement
        }

        handler->PSendSysMessage(LANG_WAYPOINT_CHANGED_NO, show_str);
        return true;
    }

    static bool findWaypoint(ChatHandler* handler, uint32& pathid, uint32& point, uint32& wpGuid, bool showErrors)
    {
        Creature* target = handler->getSelectedCreature();

        if (!target || target->GetEntry() != VISUAL_WAYPOINT)
        {
            if (showErrors)
                handler->SendSysMessage("|cffff33ffERROR: You must select a waypoint.|r");
            return false;
        }

        // The visual waypoint
        wpGuid = target->GetGUIDLow();

        if (!wpGuid)
        {
            if (showErrors)
                handler->PSendSysMessage(LANG_WAYPOINT_NOTFOUNDDBPROBLEM, wpGuid);
            return false;
        }

        // Check the creature
        PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_WAYPOINT_DATA_BY_WPGUID);
        stmt->setUInt32(0, wpGuid);
        PreparedQueryResult result = WorldDatabase.Query(stmt);

        if (!result)
        {
            if (showErrors)
                handler->PSendSysMessage(LANG_WAYPOINT_NOTFOUNDDBPROBLEM, wpGuid);
            return false;
        }

        do
        {
            Field* fields = result->Fetch();
            pathid = fields[0].GetUInt32();
            point  = fields[1].GetUInt32();
        }
        while (result->NextRow());
        return true;
    }

    static bool HandleWpShowCommand(ChatHandler* handler, const char* args)
    {
        if (!*args)
            return false;

        // first arg: on, off, first, last
        char* show_str = strtok((char*)args, " ");
        if (!show_str)
            return false;

        std::string show = show_str;

        // second arg: GUID (optional, if a creature is selected)
        char* guid_str = strtok((char*)nullptr, " ");

        uint32 pathid = 0;
        Creature* target = handler->getSelectedCreature();

        // Did player provide a PathID?

        if (!guid_str)
        {
            // No PathID provided
            // -> Player must have selected a creature

            if (!target)
            {
                if (show != "off")
                {
                    handler->SendSysMessage(LANG_SELECT_CREATURE);
                    handler->SetSentErrorMessage(true);
                    return false;
                }
            }
            else
                pathid = target->GetWaypointPath();
        }
        else
        {
            // PathID provided
            // Warn if player also selected a creature
            // -> Creature selection is ignored <-
            if (target)
                handler->SendSysMessage(LANG_WAYPOINT_CREATSELECTED);

            pathid = atoi((char*)guid_str);
        }

        // Show info for the selected waypoint
        if (show == "info")
        {
            // Check if the user did specify a visual waypoint
            if (!target || target->GetEntry() != VISUAL_WAYPOINT)
            {
                handler->PSendSysMessage(LANG_WAYPOINT_VP_SELECT);
                handler->SetSentErrorMessage(true);
                return false;
            }

            PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_WAYPOINT_DATA_ALL_BY_WPGUID);

            stmt->setUInt32(0, target->GetGUIDLow());

            PreparedQueryResult result = WorldDatabase.Query(stmt);

            if (!result)
            {
                handler->PSendSysMessage(LANG_WAYPOINT_NOTFOUNDDBPROBLEM, target->GetGUIDLow());
                return true;
            }

            handler->SendSysMessage("|cff00ffffDEBUG: wp show info:|r");
            do
            {
                Field* fields = result->Fetch();
                pathid                  = fields[0].GetUInt32();
                uint32 point            = fields[1].GetUInt32();
                uint32 delay            = fields[2].GetUInt32();
                uint32 flag             = fields[3].GetUInt32();
                uint32 pathfinding      = fields[4].GetUInt8();
                uint32 ev_id            = fields[5].GetUInt32();
                uint32 ev_chance        = fields[6].GetInt16();
                float orientation       = -1.f;
                if (!fields[7].IsNull())
                    orientation         = fields[7].GetFloat();

                handler->PSendSysMessage("|cff00ff00Show info: for current point: |r|cff00ffff%u|r|cff00ff00, Path ID: |r|cff00ffff%u|r", point, pathid);
                handler->PSendSysMessage("|cff00ff00Show info: Delay: |r|cff00ffff%u|r", delay);
                handler->PSendSysMessage("|cff00ff00Show info: Move flag: |r|cff00ffff%u|r", flag);
                handler->PSendSysMessage("|cff00ff00Show info: Pathfinding: |r|cff00ffff%u|r", pathfinding);
                handler->PSendSysMessage("|cff00ff00Show info: Waypoint event: |r|cff00ffff%u|r", ev_id);
                handler->PSendSysMessage("|cff00ff00Show info: Event chance: |r|cff00ffff%i|r", ev_chance);
                if (orientation >= 0.f)
                    handler->PSendSysMessage("|cff00ff00Show info: Orientation: |r|cff00ffff%f|r", orientation);
                else
                    handler->PSendSysMessage("|cff00ff00Show info: Orientation: |r|cff00ffffnone|r");
            }
            while (result->NextRow());

            return true;
        }

        Player* player = handler->GetSession()->GetPlayer();
        bool isOnTransport = player->HasUnitMovementFlag(MOVEMENTFLAG_ONTRANSPORT) && player->GetTransport();

        if (show == "on")
        {
            PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_WAYPOINT_DATA_POS_BY_ID);

            stmt->setUInt32(0, pathid);

            PreparedQueryResult result = WorldDatabase.Query(stmt);

            if (!result)
            {
                handler->SendSysMessage("|cffff33ffPath no found.|r");
                handler->SetSentErrorMessage(true);
                return false;
            }

            handler->PSendSysMessage("|cff00ff00DEBUG: wp on, PathID: |cff00ffff%u|r", pathid);

            // Delete all visuals for this NPC
            stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_WAYPOINT_DATA_WPGUID_BY_ID);

            stmt->setUInt32(0, pathid);

            PreparedQueryResult result2 = WorldDatabase.Query(stmt);

            if (result2)
            {
                bool hasError = false;
                do
                {
                    Field* fields = result2->Fetch();
                    uint32 wpguid = fields[0].GetUInt32();
                    Creature* creature = player->GetMap()->GetCreature(MAKE_NEW_GUID(wpguid, VISUAL_WAYPOINT, HIGHGUID_UNIT));

                    if (!creature)
                    {
                        handler->PSendSysMessage(LANG_WAYPOINT_NOTREMOVED, wpguid);
                        hasError = true;

                        PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_DEL_CREATURE);

                        stmt->setUInt32(0, wpguid);

                        WorldDatabase.Execute(stmt);
                    }
                    else
                    {
                        creature->CombatStop();
                        creature->DeleteFromDB();
                        creature->AddObjectToRemoveList();
                    }

                }
                while (result2->NextRow());

                if (hasError)
                {
                    handler->PSendSysMessage(LANG_WAYPOINT_TOOFAR1);
                    handler->PSendSysMessage(LANG_WAYPOINT_TOOFAR2);
                    handler->PSendSysMessage(LANG_WAYPOINT_TOOFAR3);
                }
            }

            do
            {
                Field* fields = result->Fetch();
                uint32 point    = fields[0].GetUInt32();
                float x         = fields[1].GetFloat();
                float y         = fields[2].GetFloat();
                float z         = fields[3].GetFloat();

                uint32 id = VISUAL_WAYPOINT;

                if (isOnTransport)
                    player->GetTransport()->CalculatePassengerPosition(x, y, z);

                Map* map = player->GetMap();
                float o = player->GetOrientation();

                Creature* wpCreature = new Creature;
                if (!wpCreature->Create(sObjectMgr->GenerateLowGuid(HIGHGUID_UNIT), map, player->GetPhaseMaskForSpawn(), id, 0, x, y, z, o))
                {
                    handler->PSendSysMessage(LANG_WAYPOINT_VP_NOTCREATED, id);
                    delete wpCreature;
                    return false;
                }

                // Set "wpguid" column to the visual waypoint
                PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_UPD_WAYPOINT_DATA_WPGUID);

                stmt->setInt32(0, int32(wpCreature->GetGUIDLow()));
                stmt->setUInt32(1, pathid);
                stmt->setUInt32(2, point);

                WorldDatabase.DirectExecute(stmt);

                wpCreature->SaveToDB(map->GetId(), (1 << map->GetSpawnMode()), player->GetPhaseMaskForSpawn());
                if (!map->AddToMap(wpCreature, isOnTransport))
                {
                    handler->PSendSysMessage(LANG_WAYPOINT_VP_NOTCREATED, id);
                    delete wpCreature;
                    return false;
                }

                wpCreature->SetObjectScale(0.5f);
                wpCreature->SetLevel(((point - 1) % STRONG_MAX_LEVEL) + 1);
            }
            while (result->NextRow());

            handler->SendSysMessage("|cff00ff00Showing the current creature's path.|r");
            return true;
        }

        if (show == "first")
        {
            handler->PSendSysMessage("|cff00ff00DEBUG: wp first, GUID: %u|r", pathid);

            PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_WAYPOINT_DATA_POS_FIRST_BY_ID);
            stmt->setUInt32(0, pathid);
            PreparedQueryResult result = WorldDatabase.Query(stmt);

            if (!result)
            {
                handler->PSendSysMessage(LANG_WAYPOINT_NOTFOUND, pathid);
                handler->SetSentErrorMessage(true);
                return false;
            }

            Field* fields = result->Fetch();
            float x         = fields[0].GetFloat();
            float y         = fields[1].GetFloat();
            float z         = fields[2].GetFloat();
            uint32 id = VISUAL_WAYPOINT;

            if (isOnTransport)
                player->GetTransport()->CalculatePassengerPosition(x, y, z);

            float o = player->GetOrientation();
            Map* map = player->GetMap();

            Creature* creature = new Creature;
            if (!creature->Create(sObjectMgr->GenerateLowGuid(HIGHGUID_UNIT), map, player->GetPhaseMaskForSpawn(), id, 0, x, y, z, o))
            {
                handler->PSendSysMessage(LANG_WAYPOINT_VP_NOTCREATED, id);
                delete creature;
                return false;
            }

            creature->SaveToDB(map->GetId(), (1 << map->GetSpawnMode()), player->GetPhaseMaskForSpawn());
            if (!map->AddToMap(creature, isOnTransport))
            {
                handler->PSendSysMessage(LANG_WAYPOINT_VP_NOTCREATED, id);
                delete creature;
                return false;
            }

            if (target)
            {
                creature->SetDisplayId(target->GetDisplayId());
                creature->SetObjectScale(0.5f);
            }

            return true;
        }

        if (show == "last")
        {
            handler->PSendSysMessage("|cff00ff00DEBUG: wp last, PathID: |r|cff00ffff%u|r", pathid);

            PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_WAYPOINT_DATA_POS_LAST_BY_ID);
            stmt->setUInt32(0, pathid);
            PreparedQueryResult result = WorldDatabase.Query(stmt);

            if (!result)
            {
                handler->PSendSysMessage(LANG_WAYPOINT_NOTFOUNDLAST, pathid);
                handler->SetSentErrorMessage(true);
                return false;
            }
            Field* fields = result->Fetch();
            float x = fields[0].GetFloat();
            float y = fields[1].GetFloat();
            float z = fields[2].GetFloat();
            float o = fields[3].GetFloat();
            uint32 id = VISUAL_WAYPOINT;

            if (isOnTransport)
                player->GetTransport()->CalculatePassengerPosition(x, y, z);

            Map* map = player->GetMap();

            Creature* creature = new Creature;
            if (!creature->Create(sObjectMgr->GenerateLowGuid(HIGHGUID_UNIT), map, player->GetPhaseMaskForSpawn(), id, 0, x, y, z, o))
            {
                handler->PSendSysMessage(LANG_WAYPOINT_NOTCREATED, id);
                delete creature;
                return false;
            }

            creature->SaveToDB(map->GetId(), (1 << map->GetSpawnMode()), player->GetPhaseMaskForSpawn());
            if (!map->AddToMap(creature, isOnTransport))
            {
                handler->PSendSysMessage(LANG_WAYPOINT_NOTCREATED, id);
                delete creature;
                return false;
            }

            if (target)
            {
                creature->SetDisplayId(target->GetDisplayId());
                creature->SetObjectScale(0.5f);
            }

            return true;
        }

        if (show == "off")
        {
            PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_CREATURE_BY_ID);
            stmt->setUInt32(0, 1);
            PreparedQueryResult result = WorldDatabase.Query(stmt);

            if (!result)
            {
                handler->SendSysMessage(LANG_WAYPOINT_VP_NOTFOUND);
                handler->SetSentErrorMessage(true);
                return false;
            }
            bool hasError = false;
            do
            {
                Field* fields = result->Fetch();
                uint32 guid = fields[0].GetUInt32();
                Creature* creature = handler->GetSession()->GetPlayer()->GetMap()->GetCreature(MAKE_NEW_GUID(guid, VISUAL_WAYPOINT, HIGHGUID_UNIT));
                if (!creature)
                {
                    handler->PSendSysMessage(LANG_WAYPOINT_NOTREMOVED, guid);
                    hasError = true;

                    PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_DEL_CREATURE);

                    stmt->setUInt32(0, guid);

                    WorldDatabase.Execute(stmt);
                }
                else
                {
                    creature->CombatStop();
                    creature->DeleteFromDB();
                    creature->AddObjectToRemoveList();
                }
            }
            while (result->NextRow());
            // set "wpguid" column to "empty" - no visual waypoint spawned
            stmt = WorldDatabase.GetPreparedStatement(WORLD_UPD_WAYPOINT_DATA_ALL_WPGUID);

            WorldDatabase.DirectExecute(stmt);

            if (hasError)
            {
                handler->PSendSysMessage(LANG_WAYPOINT_TOOFAR1);
                handler->PSendSysMessage(LANG_WAYPOINT_TOOFAR2);
                handler->PSendSysMessage(LANG_WAYPOINT_TOOFAR3);
            }

            handler->SendSysMessage(LANG_WAYPOINT_VP_ALLREMOVED);
            return true;
        }

        handler->PSendSysMessage("|cffff33ffDEBUG: wpshow - no valid command found|r");
        return true;
    }

    static bool HandleWpGoCommand(ChatHandler* handler, const char* args)
    {
        if (!handler->GetSession())
            return false;

        if (!*args)
            return false;

        uint32 pathid = 0;
        uint32 point = 0;

        char* pathid_str = strtok((char*)args, " ");

        if (!pathid_str)
            return false;

        char* point_str = strtok((char*)nullptr, " ");

        if (!point_str)
            return false;

        pathid = atoi(pathid_str);
        point = atoi(point_str);

        PreparedStatement* stmt = WorldDatabase.GetPreparedStatement(WORLD_SEL_WAYPOINT_DATA_POS_BY_ID_AND_POINT);
        stmt->setUInt32(0, pathid);
        stmt->setUInt32(1, point);
        PreparedQueryResult result = WorldDatabase.Query(stmt);

        if (result)
        {
            Field* fields = result->Fetch();
            float posx = fields[0].GetFloat();
            float posy = fields[1].GetFloat();
            float posz = fields[2].GetFloat();

            Player* player = handler->GetSession()->GetPlayer();

            // stop flight if needed
            if (player->IsInFlight())
            {
                player->GetMotionMaster()->MovementExpired();
                player->CleanupAfterTaxiFlight();
            }
            // save only in non-flight case
            else
                player->SaveRecallPosition();

            player->TeleportTo(player->GetMapId(), posx, posy, posz, player->GetOrientation());
        }
        else
        {
            handler->SendSysMessage("|cffff33ffWaypoint not found.|r");
            handler->SetSentErrorMessage(true);
            return false;
        }

        return true;
    }

    static bool HandleWpStopCommand(ChatHandler* handler, const char* args)
    {
        if (!handler->GetSession())
            return false;

        if (!*args)
            return false;

        uint32 duration = 0;

        char* duration_str = strtok((char*)args, " ");

        if (!duration_str)
            return false;

        duration = atoi(duration_str);
        Creature* target = handler->getSelectedCreature();

        if (!target)
        {
            handler->SendSysMessage(LANG_SELECT_CREATURE);
            handler->SetSentErrorMessage(true);
            return false;
        }

        if (target->GetMotionMaster()->GetCurrentMovementGeneratorType() == WAYPOINT_MOTION_TYPE)
            static_cast<WaypointMovementGenerator<Creature>*>(target->GetMotionMaster()->top())->Stop(duration);
        else
            handler->PSendSysMessage(LANG_WAYPOINT_NOTFOUNDDBPROBLEM, target->GetGUIDLow());

        return true;
    }
};

void AddSC_wp_commandscript()
{
    new wp_commandscript();
}
