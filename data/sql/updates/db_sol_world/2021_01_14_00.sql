-- DB update 2021_01_12_01 -> 2021_01_14_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_12_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_12_01 2021_01_14_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610607663796269762'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610607663796269762');

UPDATE `creature_template` SET `InhabitType` = `InhabitType` | 4 WHERE `entry` = 17436;
UPDATE `creature` SET `position_x` = -3781.11, `position_y` = -11412.5, `position_z` = 309.38, `orientation` = 2.51982 WHERE `guid` = 85973;
UPDATE `creature` SET `position_x` = -3656.89, `position_y` = -11319.5, `position_z` = 210.467, `orientation` = 3.94533 WHERE `guid` = 85976;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
