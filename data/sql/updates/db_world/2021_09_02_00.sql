-- DB update 2021_09_01_00 -> 2021_09_02_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_09_01_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_09_01_00 2021_09_02_00 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1629919057423789312'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1629919057423789312');

-- Change the race to blood elf for this quests on Sunstrider isle (Flags: Orc 2, Undead 16, Tauren 32, Troll 128)
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces`&~(2|16|32|128) WHERE (`ID` IN (8325, 9393, 9676, 8328, 8563, 8564, 9392, 8326, 8327, 8334, 8335, 8347, 8338, 8336, 8330, 8345, 10068, 10069, 10070, 10071, 10072, 10073));


--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
