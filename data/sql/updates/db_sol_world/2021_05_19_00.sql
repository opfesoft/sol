-- DB update 2021_05_18_07 -> 2021_05_19_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_05_18_07';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_05_18_07 2021_05_19_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1621404778015193280'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1621404778015193280');

UPDATE `creature` SET `position_x` = -11013, `position_y` = -1329.55, `position_z` = 52.6545, `wander_distance` = 4 WHERE `guid` = 5974;
UPDATE `creature` SET `position_x` = -11035.8, `position_y` = -1317.07, `position_z` = 53.4665, `wander_distance` = 5 WHERE `guid` = 5998;
UPDATE `creature` SET `wander_distance` = 5 WHERE `guid` IN (5968,5988,5993,5995);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
