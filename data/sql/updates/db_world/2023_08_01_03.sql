UPDATE `spell_area` SET `quest_start_status` = 0, `quest_end_status` = 0 WHERE `spell` = 57940;
DELETE FROM `spell_area` WHERE `spell` = 57940 AND `area` IN (3456,4273,4493,4603,495,4809,4820);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`)
VALUES
(57940,495,0,0,0,0,2,1,0,0),
(57940,4809,0,0,0,0,2,1,0,0),
(57940,4820,0,0,0,0,2,1,0,0);
