-- DB update 2021_10_22_03 -> 2021_10_22_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_10_22_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_10_22_03 2021_10_22_04 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1634315396844620743'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1634315396844620743');

-- Adjusts the loot of Crimson Hammersmith
DELETE FROM `creature_loot_template` WHERE `Entry` = 11120 AND (`Item` IN (18781, 12811, 13446, 8932, 8766) OR `Reference` IN (24016,24024));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(11120, 18781, 0, 64, 0, 1, 0, 1, 1, NULL),
(11120, 12811, 0, 4, 0, 1, 0, 1, 1, NULL),
(11120, 13446, 0, 1.1, 0, 1, 0, 1, 1, NULL),
(11120, 8932, 0, 4, 0, 1, 0, 1, 1, NULL),
(11120, 8766, 0, 1.8, 0, 1, 0, 1, 1, NULL),
(11120, 24024, 24024, 2, 0, 1, 0, 1, 1, NULL),
(11120, 24016, 24016, 1.5, 0, 1, 0, 1, 1, NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
