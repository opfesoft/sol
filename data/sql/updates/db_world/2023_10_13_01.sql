DELETE FROM `spell_proc_event` WHERE `entry` = 37565;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`)
VALUES
(37565,0,6,4096,0,0,16384,16384,0,0,0);

DELETE FROM `spell_script_names` WHERE `spell_id` = 37565;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
(37565,'spell_pri_t4_4p_bonus');
