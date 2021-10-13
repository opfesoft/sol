-- DB update 2021_10_13_05 -> 2021_10_13_06
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_13_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_13_05 2021_10_13_06 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1634147402664211824'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1634147402664211824');

DELETE FROM `pool_template` WHERE `entry` BETWEEN 2019 AND 2036 OR `entry` BETWEEN 11676 AND 11711;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(2019,1,'Master Mineral Pool - Redridge Mountains'),
(2020,1,'Master Mineral Pool - Stranglethorn Vale'),
(2021,1,'Master Mineral Pool - Thousand Needles'),
(2022,4,'Master Mineral Pool - Searing Gorge'),
(2023,1,'Master Mineral Pool - Uldaman'),
(2024,1,'Master Mineral Pool - Desolace'),
(2025,1,'Master Mineral Pool - Darkshore'),
(2026,1,'Master Mineral Pool - Silverpine Forest'),
(2027,1,'Master Mineral Pool - Blackfathom Deeps'),
(2028,1,'Master Mineral Pool - Tanaris'),
(2029,1,'Master Mineral Pool - Maraudon'),
(2030,1,'Master Mineral Pool - Winterspring'),
(2031,1,'Master Mineral Pool - Hellfire Peninsula'),
(2032,2,'Master Mineral Pool - Nagrand'),
(2033,1,'Master Mineral Pool - Terokkar Forest'),
(2034,1,'Master Mineral Pool - Mana-Tombs'),
(2035,1,'Master Mineral Pool - The Underbog'),
(2036,1,'Master Mineral Pool - Zangarmarsh'),
(11676,1,'Spawn Point 1 - Redridge Mountains - Zone 44'),
(11677,1,'Spawn Point 1 - Stranglethorn Vale - Zone 33'),
(11678,1,'Spawn Point 2 - Stranglethorn Vale - Zone 33'),
(11679,1,'Spawn Point 3 - Stranglethorn Vale - Zone 33'),
(11680,1,'Spawn Point 1 - Thousand Needles - Zone 400'),
(11681,1,'Spawn Point 1 - Searing Gorge - Zone 51'),
(11682,1,'Spawn Point 2 - Searing Gorge - Zone 51'),
(11683,1,'Spawn Point 3 - Searing Gorge - Zone 51'),
(11684,1,'Spawn Point 4 - Searing Gorge - Zone 51'),
(11685,1,'Spawn Point 5 - Searing Gorge - Zone 51'),
(11686,1,'Spawn Point 6 - Searing Gorge - Zone 51'),
(11687,1,'Spawn Point 7 - Searing Gorge - Zone 51'),
(11688,1,'Spawn Point 8 - Searing Gorge - Zone 51'),
(11689,1,'Spawn Point 1 - Uldaman - Zone 1337'),
(11690,1,'Spawn Point 1 - Desolace - Zone 405'),
(11691,1,'Spawn Point 1 - Darkshore - Zone 148'),
(11692,1,'Spawn Point 1 - Silverpine Forest - Zone 130'),
(11693,1,'Spawn Point 1 - Blackfathom Deeps - Zone 719'),
(11694,1,'Spawn Point 1 - Tanaris - Zone 440'),
(11695,1,'Spawn Point 1 - Maraudon - Zone 2100'),
(11696,1,'Spawn Point 2 - Maraudon - Zone 2100'),
(11697,1,'Spawn Point 3 - Maraudon - Zone 2100'),
(11698,1,'Spawn Point 1 - Winterspring - Zone 618'),
(11699,1,'Spawn Point 1 - Hellfire Peninsula - Zone 3483'),
(11700,1,'Spawn Point 2 - Hellfire Peninsula - Zone 3483'),
(11701,1,'Spawn Point 1 - Nagrand - Zone 3518'),
(11702,1,'Spawn Point 2 - Nagrand - Zone 3518'),
(11703,1,'Spawn Point 3 - Nagrand - Zone 3518'),
(11704,1,'Spawn Point 4 - Nagrand - Zone 3518'),
(11705,1,'Spawn Point 5 - Nagrand - Zone 3518'),
(11706,1,'Spawn Point 1 - Terokkar Forest - Zone 3519'),
(11707,1,'Spawn Point 2 - Terokkar Forest - Zone 3519'),
(11708,1,'Spawn Point 3 - Terokkar Forest - Zone 3519'),
(11709,1,'Spawn Point 1 - Mana-Tombs - Zone 3792'),
(11710,1,'Spawn Point 1 - The Underbog - Zone 3716'),
(11711,1,'Spawn Point 1 - Zangarmarsh - Zone 3521');

DELETE FROM `pool_pool` WHERE `mother_pool` BETWEEN 2019 AND 2036;
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`)
VALUES
(11676,2019,0,'Spawn Point 1 - Redridge Mountains - Zone 44'),
(11677,2020,0,'Spawn Point 1 - Stranglethorn Vale - Zone 33'),
(11678,2020,0,'Spawn Point 2 - Stranglethorn Vale - Zone 33'),
(11679,2020,0,'Spawn Point 3 - Stranglethorn Vale - Zone 33'),
(11680,2021,0,'Spawn Point 1 - Thousand Needles - Zone 400'),
(11681,2022,0,'Spawn Point 1 - Searing Gorge - Zone 51'),
(11682,2022,0,'Spawn Point 2 - Searing Gorge - Zone 51'),
(11683,2022,0,'Spawn Point 3 - Searing Gorge - Zone 51'),
(11684,2022,0,'Spawn Point 4 - Searing Gorge - Zone 51'),
(11685,2022,0,'Spawn Point 5 - Searing Gorge - Zone 51'),
(11686,2022,0,'Spawn Point 6 - Searing Gorge - Zone 51'),
(11687,2022,0,'Spawn Point 7 - Searing Gorge - Zone 51'),
(11688,2022,0,'Spawn Point 8 - Searing Gorge - Zone 51'),
(11689,2023,0,'Spawn Point 1 - Uldaman - Zone 1337'),
(11690,2024,0,'Spawn Point 1 - Desolace - Zone 405'),
(11691,2025,0,'Spawn Point 1 - Darkshore - Zone 148'),
(11692,2026,0,'Spawn Point 1 - Silverpine Forest - Zone 130'),
(11693,2027,0,'Spawn Point 1 - Blackfathom Deeps - Zone 719'),
(11694,2028,0,'Spawn Point 1 - Tanaris - Zone 440'),
(11695,2029,0,'Spawn Point 1 - Maraudon - Zone 2100'),
(11696,2029,0,'Spawn Point 2 - Maraudon - Zone 2100'),
(11697,2029,0,'Spawn Point 3 - Maraudon - Zone 2100'),
(11698,2030,0,'Spawn Point 1 - Winterspring - Zone 618'),
(11699,2031,0,'Spawn Point 1 - Hellfire Peninsula - Zone 3483'),
(11700,2031,0,'Spawn Point 2 - Hellfire Peninsula - Zone 3483'),
(11701,2032,0,'Spawn Point 1 - Nagrand - Zone 3518'),
(11702,2032,0,'Spawn Point 2 - Nagrand - Zone 3518'),
(11703,2032,0,'Spawn Point 3 - Nagrand - Zone 3518'),
(11704,2032,0,'Spawn Point 4 - Nagrand - Zone 3518'),
(11705,2032,0,'Spawn Point 5 - Nagrand - Zone 3518'),
(11706,2033,0,'Spawn Point 1 - Terokkar Forest - Zone 3519'),
(11707,2033,0,'Spawn Point 2 - Terokkar Forest - Zone 3519'),
(11708,2033,0,'Spawn Point 3 - Terokkar Forest - Zone 3519'),
(11709,2034,0,'Spawn Point 1 - Mana-Tombs - Zone 3792'),
(11710,2035,0,'Spawn Point 1 - The Underbog - Zone 3716'),
(11711,2036,0,'Spawn Point 1 - Zangarmarsh - Zone 3521');

DELETE FROM `pool_gameobject` WHERE `pool_entry` BETWEEN 11676 AND 11711;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(5656,11676,0,'Spawn Point 1 - Tin'),
(5749,11676,20,'Spawn Point 1 - Silver'),
(5879,11677,20,'Spawn Point 1 - Gold'),
(6470,11677,0,'Spawn Point 1 - Iron'),
(63539,11678,0,'Spawn Point 2 - Iron'),
(65223,11678,20,'Spawn Point 2 - Silver'),
(6187,11679,0,'Spawn Point 3 - Iron'),
(40019,11679,0,'Spawn Point 3 - Iron'),
(6524,11680,0,'Spawn Point 1 - Iron'),
(17159,11680,0,'Spawn Point 1 - Tin'),
(5850,11681,20,'Spawn Point 1 - Gold'),
(7234,11681,50,'Spawn Point 1 - Mithril'),
(9535,11681,20,'Spawn Point 1 - Truesilver'),
(58117,11681,10,'Spawn Point 1 - Dark Iron'),
(33606,11682,20,'Spawn Point 2 - Gold'),
(34816,11682,0,'Spawn Point 2 - Mithril'),
(10004,11683,0,'Spawn Point 3 - Mithril'),
(35299,11683,20,'Spawn Point 3 - Truesilver'),
(373,11684,80,'Spawn Point 4 - Small Thorium Vein'),
(10214,11684,0,'Spawn Point 4 - Dark Iron'),
(10007,11685,80,'Spawn Point 5 - Small Thorium Vein'),
(64842,11685,0,'Spawn Point 5 - Dark Iron'),
(10103,11686,80,'Spawn Point 6 - Small Thorium Vein'),
(56457,11686,0,'Spawn Point 6 - Dark Iron'),
(10165,11687,80,'Spawn Point 7 - Small Thorium Vein'),
(64838,11687,0,'Spawn Point 7 - Dark Iron'),
(258,11688,80,'Spawn Point 8 - Small Thorium Vein'),
(56819,11688,0,'Spawn Point 8 - Dark Iron'),
(13024,11689,20,'Spawn Point 1 - Silver'),
(33204,11689,0,'Spawn Point 1 - Iron'),
(29207,11690,50,'Spawn Point 1 - Truesilver'),
(63514,11690,50,'Spawn Point 1 - Gold'),
(30160,11691,20,'Spawn Point 1 - Silver'),
(48554,11691,0,'Spawn Point 1 - Tin'),
(35547,11692,0,'Spawn Point 1 - Tin'),
(42971,11692,20,'Spawn Point 1 - Silver'),
(48120,11693,0,'Spawn Point 1 - Tin'),
(63507,11693,20,'Spawn Point 1 - Silver'),
(5999,11694,20,'Spawn Point 1 - Gold'),
(65300,11694,0,'Spawn Point 1 - Mithril'),
(7232,11695,0,'Spawn Point 1 - Mithril'),
(9239,11695,20,'Spawn Point 1 - Truesilver'),
(7180,11696,0,'Spawn Point 2 - Mithril'),
(9406,11696,20,'Spawn Point 2 - Truesilver'),
(32922,11697,20,'Spawn Point 3 - Truesilver'),
(63965,11697,0,'Spawn Point 3 - Mithril'),
(9445,11698,0,'Spawn Point 1 - Truesilver'),
(18433,11698,30,'Spawn Point 1 - Rich Thorium'),
(42301,11699,0,'Spawn Point 1 - Fel Iron'),
(61963,11699,10,'Spawn Point 1 - Khorium'),
(64873,11700,0,'Spawn Point 2 - Fel Iron'),
(64885,11700,10,'Spawn Point 2 - Khorium'),
(21915,11701,10,'Spawn Point 1 - Khorium'),
(61931,11701,0,'Spawn Point 1 - Adamantite'),
(21924,11702,30,'Spawn Point 2 - Rich Adamantite'),
(61927,11702,0,'Spawn Point 2 - Adamantite'),
(40200,11703,30,'Spawn Point 3 - Rich Adamantite'),
(61919,11703,0,'Spawn Point 3 - Adamantite'),
(42414,11704,30,'Spawn Point 4 - Rich Adamantite'),
(42431,11704,0,'Spawn Point 4 - Adamantite'),
(61935,11705,0,'Spawn Point 5 - Adamantite'),
(63206,11705,30,'Spawn Point 5 - Rich Adamantite'),
(40271,11706,0,'Spawn Point 1 - Adamantite'),
(61962,11706,10,'Spawn Point 1 - Khorium'),
(14124,11707,0,'Spawn Point 2 - Adamantite'),
(61966,11707,10,'Spawn Point 2 - Khorium'),
(28489,11708,0,'Spawn Point 3 - Adamantite'),
(64887,11708,10,'Spawn Point 3 - Khorium'),
(43147,11709,0,'Spawn Point 1 - Adamantite'),
(63197,11709,30,'Spawn Point 1 - Rich Adamantite'),
(61906,11710,0,'Spawn Point 1 - Adamantite'),
(63200,11710,30,'Spawn Point 1 - Rich Adamantite'),
(34924,11711,0,'Spawn Point 1 - Adamantite'),
(64884,11711,30,'Spawn Point 1 - Khorium');

UPDATE `gameobject` SET `spawntimesecs` = 2700 WHERE `guid` IN (
6470,5879,5749,5656,63539,65223,40019,6187,6524,17159,5850,7234,9535,58117,33606,34816,
10004,35299,373,10214,10007,64842,10103,56457,10165,64838,258,56819,13024,33204,29207,63514,
30160,48554,35547,42971,48120,63507,5999,65300,7232,9239,7180,9406,9445,18433);

UPDATE `gameobject` SET `spawntimesecs` = 3600 WHERE `guid` IN (
42301,61963,64873,64885,21915,61931,21924,61927,40200,61919,42414,42431,61935,63206,40271,61962,
14124,61966,28489,64887,34924,64884);

UPDATE `gameobject` SET `spawntimesecs` = 604800 WHERE `guid` IN (63965,32922,43147,63197,61906,63200);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
