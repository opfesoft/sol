-- DB update 2021_10_22_01 -> 2021_10_23_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_22_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_22_01 2021_10_23_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1635004242909019733'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1635004242909019733');

UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `guid` IN (82177,82186,82190,82193,82200,82205,82208,82254,82175,82179,82182,82191,82194,82195,82197,82207,82210);

UPDATE `creature` SET `position_x` = 7924.91, `position_y` = -6263.39, `position_z` = 23.9016, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82178;
UPDATE `creature` SET `position_x` = 7913.05, `position_y` = -6182.01, `position_z` = 20.2105, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82180;
UPDATE `creature` SET `position_x` = 7907.35, `position_y` = -6259.56, `position_z` = 39.9379, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82183;
UPDATE `creature` SET `position_x` = 7941.72, `position_y` = -6269.89, `position_z` = 39.7869, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82184;
UPDATE `creature` SET `position_x` = 7922.88, `position_y` = -6173.72, `position_z` = 40.8979, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82185;
UPDATE `creature` SET `position_x` = 7931.19, `position_y` = -6174.44, `position_z` = 30.1563, `MovementType` = 1, `wander_distance` = 4 WHERE `guid` = 82187;
UPDATE `creature` SET `position_x` = 7935.13, `position_y` = -6181.54, `position_z` = 40.8982, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82189;
UPDATE `creature` SET `position_x` = 7918.7, `position_y` = -6145.73, `position_z` = 30.2473, `MovementType` = 1, `wander_distance` = 4 WHERE `guid` = 82198;
UPDATE `creature` SET `position_x` = 7874.24, `position_y` = -6046.07, `position_z` = 15.0579, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82241;
UPDATE `creature` SET `position_x` = 7930.51, `position_y` = -6243.1, `position_z` = 23.9161, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82181;
UPDATE `creature` SET `position_x` = 7938.69, `position_y` = -6190.54, `position_z` = 28.1352, `MovementType` = 1, `wander_distance` = 4 WHERE `guid` = 82188;
UPDATE `creature` SET `position_x` = 7959.24, `position_y` = -6161.95, `position_z` = 40.8753, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82196;
UPDATE `creature` SET `position_x` = 7953.72, `position_y` = -6162.46, `position_z` = 40.8798, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82199;
UPDATE `creature` SET `position_x` = 7843.87, `position_y` = -6096.38, `position_z` = 19.1623, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82253;
UPDATE `creature` SET `position_x` = 7919.21, `position_y` = -6284.23, `position_z` = 39.7867, `MovementType` = 1, `wander_distance` = 4 WHERE `guid` = 82164;
UPDATE `creature` SET `position_x` = 7920.36, `position_y` = -6279.99, `position_z` = 39.7871, `MovementType` = 1, `wander_distance` = 4 WHERE `guid` = 82165;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
