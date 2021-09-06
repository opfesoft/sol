/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU AGPLv3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE.md
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#include "Common.h"
#include "ObjectMgr.h"
#include "World.h"
#include "WorldSession.h"
#include "Configuration/Config.h"

#include "AccountMgr.h"
#include "Chat.h"
#include "CliRunnable.h"
#include "Language.h"
#include "Log.h"
#include "MapManager.h"
#include "Player.h"
#include "Util.h"

#include <readline/readline.h>
#include <readline/history.h>

char* command_finder(const char* text, int state)
{
    static size_t idx, len;
    const char* ret;
    std::vector<ChatCommand> const& cmd = ChatHandler::getCommandTable();

    if (!state)
    {
        idx = 0;
        len = strlen(text);
    }

    while (idx < cmd.size())
    {
        ret = cmd[idx].Name;
        if (!cmd[idx].AllowConsole)
        {
            ++idx;
            continue;
        }

        ++idx;
        //printf("Checking %s \n", cmd[idx].Name);
        if (strncmp(ret, text, len) == 0)
            return strdup(ret);
    }

    return ((char*)NULL);
}

char** cli_completion(const char* text, int start, int /*end*/)
{
    char** matches = NULL;

    if (start)
        rl_bind_key('\t', rl_abort);
    else
        matches = rl_completion_matches((char*)text, &command_finder);
    return matches;
}

int cli_hook_func()
{
       if (World::IsStopped())
           rl_done = 1;
       return 0;
}

void utf8print(void* /*arg*/, const char* str)
{
    printf("%s", str);
    fflush(stdout);
}

void commandFinished(void*, bool /*success*/)
{
    printf("AC> ");
    fflush(stdout);
}

#ifdef linux
// Non-blocking keypress detector, when return pressed, return 1, else always return 0
int kb_hit_return()
{
    struct timeval tv;
    fd_set fds;
    tv.tv_sec = 0;
    tv.tv_usec = 0;
    FD_ZERO(&fds);
    FD_SET(STDIN_FILENO, &fds);
    select(STDIN_FILENO+1, &fds, NULL, NULL, &tv);
    return FD_ISSET(STDIN_FILENO, &fds);
}
#endif

/// %Thread start
void CliRunnable::run()
{
    ///- Display the list of available CLI functions then beep
    //TC_LOG_INFO("server.worldserver", "");
    rl_attempted_completion_function = cli_completion;
    rl_event_hook = cli_hook_func;

    if (sConfigMgr->GetBoolDefault("BeepAtStart", true))
        printf("\a");                                       // \a = Alert

    // print this here the first time
    // later it will be printed after command queue updates
    printf("AC>");

    ///- As long as the World is running (no World::m_stopEvent), get the command line and handle it
    while (!World::IsStopped())
    {
        fflush(stdout);

        char *command_str ;             // = fgets(commandbuf, sizeof(commandbuf), stdin);

        command_str = readline("AC>");
        rl_bind_key('\t', rl_complete);

        if (command_str != NULL)
        {
            for (int x=0; command_str[x]; ++x)
                if (command_str[x] == '\r' || command_str[x] == '\n')
                {
                    command_str[x] = 0;
                    break;
                }

            if (!*command_str)
            {
                free(command_str);
                continue;
            }

            std::string command;
            if (!consoleToUtf8(command_str, command))         // convert from console encoding to utf8
            {
                free(command_str);
                continue;
            }

            fflush(stdout);
            sWorld->QueueCliCommand(new CliCommandHolder(NULL, command.c_str(), &utf8print, &commandFinished));
            add_history(command.c_str());
            free(command_str);
        }
        else if (feof(stdin))
        {
            World::StopNow(SHUTDOWN_EXIT_CODE);
        }
    }
}
