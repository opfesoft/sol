UPDATE `broadcast_text` SET `FemaleText` = (SELECT `text0_1` FROM `npc_text` WHERE `ID` = 12270) WHERE `ID` = 24118;
UPDATE `broadcast_text_locale` SET `FemaleText` = (SELECT `Text0_1` FROM `npc_text_locale` WHERE `ID` = 12270 AND `Locale` = 'deDE') WHERE `ID` = 24118 AND `locale` = 'deDE';
UPDATE `broadcast_text_locale` SET `FemaleText` = (SELECT `Text0_1` FROM `npc_text_locale` WHERE `ID` = 12270 AND `Locale` = 'frFR') WHERE `ID` = 24118 AND `locale` = 'frFR';
UPDATE `broadcast_text_locale` SET `FemaleText` = (SELECT `Text0_1` FROM `npc_text_locale` WHERE `ID` = 12270 AND `Locale` = 'zhCN') WHERE `ID` = 24118 AND `locale` = 'zhCN';
