-- DB update 2021_10_15_00 -> 2021_10_15_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_15_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_15_00 2021_10_15_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1634293587249030236'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1634293587249030236');

UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` IN (42643,43629,42837,43612,43607);
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 43658;
UPDATE `creature` SET `orientation` = 3.1509 WHERE `guid` = 43610;
UPDATE `creature` SET `orientation` = 0.00930945 WHERE `guid` = 43613;
UPDATE `creature` SET `position_x` = -11063.2, `position_y` = -4112.17, `position_z` = -0.67185, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 38698;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;