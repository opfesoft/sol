-- DB update 2021_11_13_00 -> 2021_11_13_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_13_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_13_00 2021_11_13_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1636839362239485476'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1636839362239485476');

UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `guid` IN (82485,82486,82489,82498,82503,82504,82493,82351);
UPDATE `creature` SET `position_x` = 7279.18, `position_y` = -6009.32, `position_z` = 18.982, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82484;
UPDATE `creature` SET `position_x` = 7189.18, `position_y` = -5938.4, `position_z` = 37.2109, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82494;
UPDATE `creature` SET `position_x` = 7198.93, `position_y` = -5973.24, `position_z` = 37.2118, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82496;
UPDATE `creature` SET `position_x` = 7177.64, `position_y` = -5960.08, `position_z` = 37.2111, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82497;
UPDATE `creature` SET `position_x` = 7193.77, `position_y` = -5956.09, `position_z` = 21.3249, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82495;
UPDATE `creature` SET `position_x` = 7267.78, `position_y` = -5933.41, `position_z` = 17.8591, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82491;
UPDATE `creature` SET `position_x` = 7313.32, `position_y` = -5868.28, `position_z` = 36.5572, `MovementType` = 1, `wander_distance` = 4 WHERE `guid` = 82349;
UPDATE `creature` SET `position_x` = 7295.61, `position_y` = -5863.51, `position_z` = 15.8822, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82350;
UPDATE `creature` SET `position_x` = 7213.94, `position_y` = -5950.48, `position_z` = 21.3398, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82492;
UPDATE `creature` SET `position_x` = 7218.67, `position_y` = -5978.39, `position_z` = 19.6536, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 82490;

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 82487;
DELETE FROM `creature_addon` WHERE `guid` = 82487;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(82487,824870,0,0,0,0,0,NULL);

DELETE FROM `waypoint_data` WHERE `id` = 824870;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(824870,1,7286.73,-5964.22,15.4202,0,0,0,0,100,0),
(824870,2,7293.21,-5959.94,15.1773,0,0,0,0,100,0),
(824870,3,7299.08,-5956.65,15.0248,0,0,0,0,100,0),
(824870,4,7304.33,-5953.7,14.6213,0,0,0,0,100,0),
(824870,5,7308.65,-5950.88,14.1004,0,0,0,0,100,0),
(824870,6,7310.65,-5948.25,13.8296,0,0,0,0,100,0),
(824870,7,7311.53,-5945.37,13.7021,0,0,0,0,100,0),
(824870,8,7311.24,-5941.79,13.6582,0,0,0,0,100,0),
(824870,9,7309.27,-5935.17,13.8332,0,0,0,0,100,0),
(824870,10,7307.3,-5928.76,14.1482,0,0,0,0,100,0),
(824870,11,7303.95,-5921.62,14.307,0,0,0,0,100,0),
(824870,12,7299.56,-5914.15,14.5982,0,0,0,0,100,0),
(824870,13,7294.26,-5905.56,14.3212,0,0,0,0,100,0),
(824870,14,7289.68,-5898.28,13.9821,0,0,0,0,100,0),
(824870,15,7287.58,-5895.17,13.8603,0,0,0,0,100,0),
(824870,16,7284.34,-5893.74,13.7864,0,0,0,0,100,0),
(824870,17,7279.11,-5893.12,13.8361,0,0,0,0,100,0),
(824870,18,7271.35,-5894.16,14.3568,0,0,0,0,100,0),
(824870,19,7263.86,-5896.11,14.8053,0,0,0,0,100,0),
(824870,20,7254.53,-5900.68,15.4498,0,0,0,0,100,0),
(824870,21,7249.57,-5904.94,15.823,0,0,0,0,100,0),
(824870,22,7246.04,-5910.05,16.2925,0,0,0,0,100,0),
(824870,23,7243.84,-5916.22,16.5462,0,0,0,0,100,0),
(824870,24,7241.87,-5926.04,16.998,0,0,0,0,100,0),
(824870,25,7241.01,-5933.38,17.3221,0,0,0,0,100,0),
(824870,26,7241.26,-5941.87,17.5516,0,0,0,0,100,0),
(824870,27,7243.9,-5950.12,17.8846,0,0,0,0,100,0),
(824870,28,7246.6,-5956.61,18.0386,0,0,0,0,100,0),
(824870,29,7251.13,-5962.84,17.9534,0,0,0,0,100,0),
(824870,30,7258.5,-5969.97,17.5446,0,0,0,0,100,0),
(824870,31,7264.38,-5973.02,17.1572,0,0,0,0,100,0),
(824870,32,7268.8,-5974.18,16.9677,0,0,0,0,100,0),
(824870,33,7273.13,-5973.39,16.5934,0,0,0,0,100,0),
(824870,34,7277.34,-5971.04,16.1648,0,0,0,0,100,0),
(824870,35,7282.69,-5967,15.6897,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
