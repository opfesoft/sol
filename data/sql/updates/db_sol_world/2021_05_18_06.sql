-- DB update 2021_05_18_05 -> 2021_05_18_06
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_05_18_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_05_18_05 2021_05_18_06 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1621373517960992905'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1621373517960992905');

DELETE FROM `gameobject` WHERE `guid` = 8871;
DELETE FROM `pool_gameobject` WHERE `guid` = 8871;
UPDATE `gameobject` SET `position_x`= -581.555, `position_y` = -2028.71, `position_z` = 69.5669 WHERE `guid` = 4214;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;