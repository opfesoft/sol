UPDATE `playercreateinfo_spell` SET `classmask` = 1179 WHERE `racemask` = 2 AND `classmask` = 1243 AND `Spell` = 21563;
DELETE FROM `playercreateinfo_spell` WHERE `racemask` = 2 AND `classmask` = 64 AND `Spell` = 65222;
INSERT INTO `playercreateinfo_spell` (`racemask`, `classmask`, `Spell`, `Note`)
VALUES
(2,64,65222,'Command');
