/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

/* ScriptData
Name: achievement_commandscript
%Complete: 100
Comment: All achievement related commands
Category: commandscripts
EndScriptData */

#include "Chat.h"
#include "Language.h"
#include "Player.h"
#include "ScriptMgr.h"

class achievement_commandscript : public CommandScript
{
public:
    achievement_commandscript() : CommandScript("achievement_commandscript") { }

    std::vector<ChatCommand> GetCommands() const override
    {
        static std::vector<ChatCommand> achievementCommandTable =
        {
            { "add",            SEC_GAMEMASTER,     false,  &HandleAchievementAddCommand,      "" },
            { "checkall",       SEC_ADMINISTRATOR,  false,  &HandleAchievementCheckAllCommand, "" }
        };
        static std::vector<ChatCommand> commandTable =
        {
            { "achievement",    SEC_GAMEMASTER,  false, nullptr,            "", achievementCommandTable }
        };
        return commandTable;
    }

    static bool HandleAchievementAddCommand(ChatHandler* handler, char const* args)
    {
        if (!*args)
            return false;

        uint32 achievementId = atoi((char*)args);
        if (!achievementId)
        {
            if (char* id = handler->extractKeyFromLink((char*)args, "Hachievement"))
                achievementId = atoi(id);
            if (!achievementId)
                return false;
        }

        Player* target = handler->getSelectedPlayer();
        if (!target)
        {
            handler->SendSysMessage(LANG_NO_CHAR_SELECTED);
            handler->SetSentErrorMessage(true);
            return false;
        }

        if (AchievementEntry const* achievementEntry = sAchievementStore.LookupEntry(achievementId))
            target->CompletedAchievement(achievementEntry);

        return true;
    }

    static bool HandleAchievementCheckAllCommand(ChatHandler* handler, char const*  /*args*/)
    {
        Player* target = handler->getSelectedPlayer();
        if (!target)
        {
            handler->SendSysMessage(LANG_NO_CHAR_SELECTED);
            handler->SetSentErrorMessage(true);
            return false;
        }

        target->CheckAllAchievementCriteria();
        return true;
    }
};

void AddSC_achievement_commandscript()
{
    new achievement_commandscript();
}
