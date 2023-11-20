DELETE FROM `gossip_menu_option` WHERE `MenuID` = 10316 AND `OptionID` = 1;

UPDATE `creature` SET `id` = 33211 WHERE `guid` IN (72770,72771,72772,72774);
UPDATE `creature` SET `id` = 33224 WHERE `guid` IN (116051,116040,116038);

DELETE FROM `pool_creature` WHERE `pool_entry` = 60003;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(72773,60003,0,'Lake Frog (33224) - Spawn 1'),
(72775,60003,0,'Lake Frog (33224) - Spawn 2'),
(116038,60003,0,'Lake Frog (33224) - Spawn 3'),
(116040,60003,0,'Lake Frog (33224) - Spawn 4'),
(116051,60003,0,'Lake Frog (33224) - Spawn 5'),
(116063,60003,0,'Lake Frog (33224) - Spawn 6');
