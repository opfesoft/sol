-- DB update 2021_07_30_01 -> 2021_08_01_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_07_30_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_07_30_01 2021_08_01_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1627851440390906328'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1627851440390906328');

UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` IN (6417,6418,6422,6426,7334,7337,7900,7901,6420,6423,7339,7885,8429,7882,7884,7340,3198,3197,7338,8428);
UPDATE `creature` SET `wander_distance` = 3, `MovementType` = 1 WHERE `guid` IN (6425,7336);
UPDATE `creature` SET `wander_distance` = 4, `MovementType` = 1 WHERE `guid` IN (7335,6424);
UPDATE `creature` SET `wander_distance` = 3, `MovementType` = 1, `position_x` = 1415.93, `position_y` = -4750.82, `position_z` = 2.43449 WHERE `guid` = 7898;
UPDATE `creature` SET `wander_distance` = 4, `MovementType` = 1, `position_x` = 1479.92, `position_y` = -4857.16, `position_z` = 11.4161 WHERE `guid` = 7342;
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1, `position_x` = 1463.01, `position_y` = -4871.94, `position_z` = 12.7588 WHERE `guid` = 7333;
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1, `position_x` = 1523.92, `position_y` = -4694.52, `position_z` = 11.0897 WHERE `guid` = 7880;
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1, `position_x` = 1509.12, `position_y` = -4795.01, `position_z` = 9.12004 WHERE `guid` = 7883;
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1, `position_x` = 1546.64, `position_y` = -4770.09, `position_z` = 12.9122 WHERE `guid` = 7897;
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1, `position_x` = 1516.52, `position_y` = -4787.45, `position_z` = 10.4614 WHERE `guid` = 7899;
UPDATE `creature` SET `position_x` = 1469.23, `position_y` = -4704.16, `position_z` = 2.32152, `orientation` = 3.42755 WHERE `guid` = 6456;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
