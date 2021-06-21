-- DB update 2021_06_21_02 -> 2021_06_21_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_06_21_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_06_21_02 2021_06_21_03 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1623848244419594409'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1623848244419594409');

-- Changes Tunnel Rat Ear drop rate to 38% for Geomancers and Surveyors
UPDATE `creature_loot_template` SET `Chance` = 38 WHERE `entry` IN (1174, 1177) AND `item` = 3110;

-- Adds Tunnel Rat Ears to Scouts and Diggers with 38% drop rate
DELETE FROM `creature_loot_template` WHERE `Entry` IN (1173, 1175) AND `Item` = 3110;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(1173, 3110, 0, 38, 1, 1, 0, 1, 1, NULL),
(1175, 3110, 0, 38, 1, 1, 0, 1, 1, NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
