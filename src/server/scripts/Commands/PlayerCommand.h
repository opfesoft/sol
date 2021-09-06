/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU AGPLv3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE.md
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
*/

class PlayerCommand
{
public:
    static bool Learn(ChatHandler* handler, Player* targetPlayer, uint32 spell, char const* all);
    static bool UnLearn(ChatHandler* handler, Player* targetPlayer, uint32 spell, char const* all);
    static bool SetSkill(ChatHandler* handler, Player* target, char const* skillStr, char const* levelStr, char const* maxPureSkill);
};
