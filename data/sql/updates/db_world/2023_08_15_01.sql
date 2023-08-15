UPDATE `spell_proc_event` SET `procFlags` = 1024 | 4096 | 16384 | 65536, `procEx` = 16384, `Cooldown` = 50000 WHERE `entry` IN (37655,38334,71585,64738,62114,49622,65002);
UPDATE `spell_proc_event` SET `procFlags` = 1024 | 4096 | 16384 | 65536, `procEx` = 16384 WHERE `entry` = 23688;
UPDATE `spell_proc_event` SET `procFlags` = 4 | 16 | 64 | 256, `ppmRate` = 10 WHERE `entry` = 26480;
UPDATE `spell_proc_event` SET `procFlags` = 4 | 16 WHERE `entry` = 23689;
UPDATE `spell_proc_event` SET `Cooldown` = 40000 WHERE `entry` = 37247;
UPDATE `spell_proc_event` SET `Cooldown` = 50000 WHERE `entry` IN (60066,64792,58901,65013,62115,67672,33648,60221,60519,63251,75474);
UPDATE `spell_proc_event` SET `Cooldown` = 3000 WHERE `entry` = 15600;
UPDATE `spell_proc_event` SET `CustomChance` = 45 WHERE `entry` = 71545;
UPDATE `spell_proc_event` SET `CustomChance` = 35 WHERE `entry` = 71562;

DELETE FROM `spell_proc_event` WHERE `entry` IN (38319,64764);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`)
VALUES
(38319,0,0,0,0,0,0,0,0,0,18000),
(64764,0,0,0,0,0,0,0,0,0,50000);

UPDATE `item_template` SET `spellppmRate_1` = 2 WHERE `entry` = 31193;
