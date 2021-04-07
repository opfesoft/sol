-- DB update 2021_04_07_00 -> 2021_04_07_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_04_07_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_04_07_00 2021_04_07_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1617831829474293243'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1617831829474293243');

UPDATE `creature` SET `position_x` = 6908.99, `position_y` = 1303.92, `position_z` = 397.735, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 123531;
UPDATE `creature` SET `position_x` = 6969.31, `position_y` = 1085.11, `position_z` = 404.6, `orientation` = 2.70226, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 123534;
UPDATE `creature` SET `position_x` = 6926.81, `position_y` = 980.863, `position_z` = 404.6, `orientation` = 3.00228, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 123525;
UPDATE `creature` SET `position_x` = 6404.65, `position_y` = 885.725, `position_z` = 327.467, `orientation` = 3.38071, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 123526;
UPDATE `creature` SET `position_x` = 6367.91, `position_y` = 1013, `position_z` = 327.467, `orientation` = 3.83073, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 123524;
UPDATE `creature` SET `position_x` = 6261.94, `position_y` = 1148.83, `position_z` = 327.467, `orientation` = 3.81109, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 123529;
UPDATE `creature_addon` SET `emote` = 333 WHERE `guid` IN (123531,123534,123525,123526,123524,123529);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
