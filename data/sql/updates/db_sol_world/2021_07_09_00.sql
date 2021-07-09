-- DB update 2021_07_08_00 -> 2021_07_09_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_07_08_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_07_08_00 2021_07_09_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1625829193719136598'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1625829193719136598');

DELETE FROM `reference_loot_template` WHERE `Item` IN (899,1391,1440,1446,1469,1473,1929,1930,1936,1943,1944,1945,1951,2020,4290);

DELETE FROM `creature_loot_template` WHERE `Item` IN (899,1391,1440,1446,1469,1473,1929,1930,1936,1943,1944,1945,1951,2020,4290);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(217,899,0,1,0,1,0,1,1,NULL),
(453,1391,0,2,0,1,0,1,1,NULL),
(446,1440,0,2,0,1,0,1,1,NULL),
(440,1446,0,2,0,1,0,1,1,NULL),
(578,1469,0,1,0,1,0,1,1,NULL),
(14270,1469,0,1,0,1,0,1,1,NULL),
(545,1473,0,1,0,1,0,1,1,NULL),
(1729,1929,0,6,0,1,0,1,1,NULL),
(4418,1929,0,6,0,1,0,1,1,NULL),
(598,1930,0,3,0,1,0,1,1,NULL),
(622,1936,0,6,0,1,0,1,1,NULL),
(3947,1943,0,6,0,1,0,1,1,NULL),
(1731,1944,0,5,0,1,0,1,1,NULL),
(641,1945,0,7,0,1,0,1,1,NULL),
(657,1951,0,6,0,1,0,1,1,NULL),
(1732,1951,0,6,0,1,0,1,1,NULL),
(539,2020,0,1,0,1,0,1,1,NULL),
(832,4290,0,2,0,1,0,1,1,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
