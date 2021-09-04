/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under GNU AGPL3 v3 license: https://gitlab.com/opfesoft/sol/-/blob/master/LICENSE
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
*/

#include "Chat.h"
#include "ScriptMgr.h"
#include "Language.h"
#include "Player.h"
#include "PlayerCommand.h"

bool PlayerCommand::Learn(ChatHandler* handler, Player* targetPlayer, uint32 spell, char const* all)
{
    if (!spell)
        return false;

    SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(spell);
    if (!spellInfo)
    {
        handler->PSendSysMessage(LANG_COMMAND_NOSPELLFOUND);
        handler->SetSentErrorMessage(true);
        return false;
    }

    if (!SpellMgr::IsSpellValid(spellInfo))
    {
        handler->PSendSysMessage(LANG_COMMAND_SPELL_BROKEN, spell);
        handler->SetSentErrorMessage(true);
        return false;
    }

    if (handler->GetSession())
    {
        SpellScriptsBounds bounds = sObjectMgr->GetSpellScriptsBounds(spell);
        uint32 spellDifficultyId = sSpellMgr->GetSpellDifficultyId(spell);
        if (handler->GetSession() && handler->GetSession()->GetSecurity() < SEC_ADMINISTRATOR && (bounds.first != bounds.second || spellDifficultyId))
        {
            handler->PSendSysMessage("Spell %u cannot be learnt using a command!", spell);
            handler->SetSentErrorMessage(true);
            return false;
        }
    }

    bool allRanks = all ? (strncmp(all, "all", 3) == 0) : false;

    if (!allRanks && targetPlayer->HasSpell(spell))
    {
        if (handler->GetSession() && targetPlayer == handler->GetSession()->GetPlayer())
            handler->SendSysMessage(LANG_YOU_KNOWN_SPELL);
        else
            handler->PSendSysMessage(LANG_TARGET_KNOWN_SPELL, handler->GetNameLink(targetPlayer).c_str());
        handler->SetSentErrorMessage(true);
        return false;
    }

    if (allRanks)
        targetPlayer->learnSpellHighRank(spell);
    else
        targetPlayer->learnSpell(spell);

    uint32 firstSpell = sSpellMgr->GetFirstSpellInChain(spell);
    if (GetTalentSpellCost(firstSpell))
        targetPlayer->SendTalentsInfoData(false);

    return true;
}

bool PlayerCommand::UnLearn(ChatHandler* handler, Player* target, uint32 spellId, char const* allStr)
{
    if (!spellId)
        return false;

    bool allRanks = allStr ? (strncmp(allStr, "all", 3) == 0) : false;

    if (allRanks)
        spellId = sSpellMgr->GetFirstSpellInChain (spellId);

    if (target->HasSpell(spellId))
        target->removeSpell(spellId, SPEC_MASK_ALL, false);
    else
        handler->SendSysMessage(LANG_FORGET_SPELL);

    if (GetTalentSpellCost(spellId))
        target->SendTalentsInfoData(false);

    return true;
}

bool PlayerCommand::SetSkill(ChatHandler* handler, Player* target, char const* skillStr, char const* levelStr, char const* maxPureSkill)
{
    if (!skillStr || !levelStr)
        return false;

    int32 skill = atoi(skillStr);
    if (skill <= 0)
    {
        handler->PSendSysMessage(LANG_INVALID_SKILL_ID, skill);
        handler->SetSentErrorMessage(true);
        return false;
    }

    int32 level = uint32(atol(levelStr));

    SkillLineEntry const* skillLine = sSkillLineStore.LookupEntry(skill);
    if (!skillLine)
    {
        handler->PSendSysMessage(LANG_INVALID_SKILL_ID, skill);
        handler->SetSentErrorMessage(true);
        return false;
    }

    bool targetHasSkill = target->GetSkillValue(skill);

    // If our target does not yet have the skill they are trying to add to them, the chosen level also becomes
    // the max level of the new profession.
    uint16 max = maxPureSkill ? atol (maxPureSkill) : targetHasSkill ? target->GetPureMaxSkillValue(skill) : uint16(level);

    if (level <= 0 || level > max || max <= 0)
        return false;

    // If the player has the skill, we get the current skill step. If they don't have the skill, we
    // add the skill to the player's book with step 1 (which is the first rank, in most cases something
    // like 'Apprentice <skill>'.
    target->SetSkill(skill, targetHasSkill ? target->GetSkillStep(skill) : 1, level, max);
    handler->PSendSysMessage(LANG_SET_SKILL, skill, skillLine->name[handler->GetSessionDbcLocale()], handler->GetNameLink(target).c_str(), level, max);
    return true;
}
