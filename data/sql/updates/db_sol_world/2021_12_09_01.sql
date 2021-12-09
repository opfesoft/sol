-- DB update 2021_12_09_00 -> 2021_12_09_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_09_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_09_00 2021_12_09_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1639064591916806518'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1639064591916806518');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 4444 AND `source_type` = 0;
UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 256 WHERE `entry` = 4444;
UPDATE `creature_addon` SET `auras` = '29266' WHERE `guid` = 16260;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
