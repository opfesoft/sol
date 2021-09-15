-- DB update 2021_09_15_01 -> 2021_09_15_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_15_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_15_01 2021_09_15_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1631718224712630728'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1631718224712630728');

UPDATE `creature` SET `position_x` = 2436.08, `position_y` = 2773.96, `position_z` = 134.164 WHERE `guid` = 71668;
UPDATE `creature` SET `position_x` = 2429, `position_y` = 2872.99, `position_z` = 131.289 WHERE `guid` = 71636;
UPDATE `creature` SET `position_x` = 2518.98, `position_y` = 2730.19, `position_z` = 132.161 WHERE `guid` = 71657;
UPDATE `creature` SET `position_x` = 2373.31, `position_y` = 2447.74, `position_z` = 144.055 WHERE `guid` = 71658;
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` IN (71647,71648,71651,71641,71642,71643,71646,71645,71644,71637,71640,71638,71639,71633,71655,71654);
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` IN (71632,71634);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
