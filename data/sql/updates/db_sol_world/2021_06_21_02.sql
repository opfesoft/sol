-- DB update 2021_06_21_01 -> 2021_06_21_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_21_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_21_01 2021_06_21_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624259974182842933'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624259974182842933');

-- Theramore Sentry: Remove lantern
UPDATE `creature_equip_template` SET `ItemID2` = 0 WHERE `CreatureID` = 5184;

-- Theramore Sentry: Adjust position / orientation
UPDATE `creature` SET `position_x` = -2890.14, `position_y` = -3425.69, `position_z` = 39.3582, `orientation` = 1.15243 WHERE `guid` = 33895;
UPDATE `creature` SET `position_x` = -2896.95, `position_y` = -3430.99, `position_z` = 58.6747, `orientation` = 0.199432 WHERE `guid` = 31324;
UPDATE `creature` SET `position_x` = -2882.19, `position_y` = -3435.92, `position_z` = 53.0672, `orientation` = 2.3043 WHERE `guid` = 31323;
UPDATE `creature` SET `position_x` = -2882.64, `position_y` = -3418.22, `position_z` = 47.2423, `orientation` = 4.25602 WHERE `guid` = 31322;
UPDATE `creature` SET `position_x` = -2891.92, `position_y` = -3436.56, `position_z` = 74.4462, `orientation` = 4.32671 WHERE `guid` = 31327;
UPDATE `creature` SET `position_x` = -2892.19, `position_y` = -3419.14, `position_z` = 74.4462, `orientation` = 1.99408 WHERE `guid` = 31326;

-- Theramore Sentry: Enable random movement
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 34001;

-- Theramore Sentry: WP Movement
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 2 WHERE `guid` IN (33991,33988);
UPDATE `creature_addon` SET `path_id` = 339910 WHERE `guid` = 33991;
UPDATE `creature_addon` SET `path_id` = 339880 WHERE `guid` = 33988;

DELETE FROM `waypoint_data` WHERE `id` IN (339910,339880);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(339910,1,-2905.33,-3435.32,39.9603,0,0,0,0,100,0),
(339910,2,-2899.78,-3442.42,40.0815,0,0,0,0,100,0),
(339910,3,-2893.39,-3445.42,39.9894,0,0,0,0,100,0),
(339910,4,-2885.39,-3445.89,40.0582,0,0,0,0,100,0),
(339910,5,-2876.09,-3441.79,39.9866,0,0,0,0,100,0),
(339910,6,-2870.97,-3435.44,40.0388,0,0,0,0,100,0),
(339910,7,-2869.72,-3429.29,40.048,0,0,0,0,100,0),
(339910,8,-2871.23,-3419.87,40.048,0,0,0,0,100,0),
(339910,9,-2877.86,-3412.21,40.0421,0,0,0,0,100,0),
(339910,10,-2888.74,-3410.04,40.0411,0,0,0,0,100,0),
(339910,11,-2897.26,-3412.51,40.0645,0,0,0,0,100,0),
(339910,12,-2903.72,-3418.18,40.017,0,0,0,0,100,0),
(339910,13,-2906.33,-3425.31,40.0162,0,0,0,0,100,0),

(339880,1,-2894.83,-3434.18,39.5658,0,0,0,0,100,0),
(339880,2,-2896.95,-3430.56,41.4713,0,0,0,0,100,0),
(339880,3,-2897.34,-3426.63,43.0837,0,0,0,0,100,0),
(339880,4,-2896.93,-3423.7,44.1286,0,0,0,0,100,0),
(339880,5,-2894.7,-3419.86,44.1286,0,0,0,0,100,0),
(339880,6,-2892.04,-3418.66,45.6537,0,0,0,0,100,0),
(339880,7,-2888.93,-3417.69,46.7801,0,0,0,0,100,0),
(339880,8,-2887.1,-3418.43,47.2423,0,0,0,0,100,0),
(339880,9,-2882.74,-3420.08,47.2423,0,0,0,0,100,0),
(339880,10,-2880.15,-3422.92,48.9601,0,0,0,0,100,0),
(339880,11,-2879.14,-3426.74,50.7509,0,0,0,0,100,0),
(339880,12,-2880.6,-3431.36,53.0672,0,0,0,0,100,0),
(339880,13,-2883.9,-3434.84,53.0672,0,0,0,0,100,0),
(339880,14,-2886.84,-3436.08,54.2187,0,0,0,0,100,0),
(339880,15,-2890.08,-3435.96,56.1966,0,0,0,0,100,0),
(339880,16,-2893.73,-3433.65,58.6141,0,0,0,0,100,0),
(339880,17,-2894.57,-3431.59,58.673,0,0,0,0,100,0),
(339880,18,-2895.94,-3427.38,58.673,0,0,0,0,100,0),
(339880,19,-2895.51,-3424.74,59.7999,0,0,0,0,100,0),
(339880,20,-2893.4,-3422.1,61.9038,0,0,0,0,100,0),
(339880,21,-2891.43,-3420.99,63.2188,0,0,0,0,100,0),
(339880,22,-2889.69,-3420.92,63.3605,0,0,0,0,100,0),
(339880,23,-2885.6,-3421.07,63.3605,0,0,0,0,100,0),
(339880,24,-2882.44,-3423.44,64.6266,0,0,0,0,100,0),
(339880,25,-2881.59,-3426.95,66.5867,0,0,0,0,100,0),
(339880,26,-2882.23,-3430.26,68.0241,0,0,0,0,100,0),
(339880,27,-2883.85,-3432.1,68.8636,0,0,0,0,100,0),
(339880,28,-2886.52,-3431.58,68.8636,0,0,0,0,100,0),
(339880,29,-2888.31,-3427.66,71.5163,0,0,0,0,100,0),
(339880,30,-2890.09,-3423.76,74.4465,0,0,0,0,100,0),
(339880,31,-2887.55,-3421.51,74.4465,0,0,0,0,100,0),
(339880,32,-2883.44,-3423.86,74.4465,0,0,0,0,100,0),
(339880,33,-2881.56,-3429.51,74.4465,0,0,0,0,100,0),
(339880,34,-2885.76,-3433.85,74.4465,0,0,0,0,100,0),
(339880,35,-2891.47,-3433.62,74.4465,0,0,0,0,100,0),
(339880,36,-2894.94,-3427.6,74.4465,0,0,0,0,100,0),
(339880,37,-2892.45,-3423.53,74.4465,0,0,0,0,100,0),
(339880,38,-2890.09,-3423.76,74.4465,0,0,0,0,100,0),
(339880,39,-2888.31,-3427.66,71.5163,0,0,0,0,100,0),
(339880,40,-2886.52,-3431.58,68.8636,0,0,0,0,100,0),
(339880,41,-2883.85,-3432.1,68.8636,0,0,0,0,100,0),
(339880,42,-2882.23,-3430.26,68.0241,0,0,0,0,100,0),
(339880,43,-2881.59,-3426.95,66.5867,0,0,0,0,100,0),
(339880,44,-2882.44,-3423.44,64.6266,0,0,0,0,100,0),
(339880,45,-2885.6,-3421.07,63.3605,0,0,0,0,100,0),
(339880,46,-2889.69,-3420.92,63.3605,0,0,0,0,100,0),
(339880,47,-2891.43,-3420.99,63.2188,0,0,0,0,100,0),
(339880,48,-2893.4,-3422.1,61.9038,0,0,0,0,100,0),
(339880,49,-2895.51,-3424.74,59.7999,0,0,0,0,100,0),
(339880,50,-2895.94,-3427.38,58.673,0,0,0,0,100,0),
(339880,51,-2894.57,-3431.59,58.673,0,0,0,0,100,0),
(339880,52,-2893.73,-3433.65,58.6141,0,0,0,0,100,0),
(339880,53,-2890.08,-3435.96,56.1966,0,0,0,0,100,0),
(339880,54,-2886.84,-3436.08,54.2187,0,0,0,0,100,0),
(339880,55,-2883.9,-3434.84,53.0672,0,0,0,0,100,0),
(339880,56,-2880.6,-3431.36,53.0672,0,0,0,0,100,0),
(339880,57,-2879.14,-3426.74,50.7509,0,0,0,0,100,0),
(339880,58,-2880.15,-3422.92,48.9601,0,0,0,0,100,0),
(339880,59,-2882.74,-3420.08,47.2423,0,0,0,0,100,0),
(339880,60,-2887.1,-3418.43,47.2423,0,0,0,0,100,0),
(339880,61,-2888.93,-3417.69,46.7801,0,0,0,0,100,0),
(339880,62,-2892.04,-3418.66,45.6537,0,0,0,0,100,0),
(339880,63,-2894.7,-3419.86,44.1286,0,0,0,0,100,0),
(339880,64,-2896.93,-3423.7,44.1286,0,0,0,0,100,0),
(339880,65,-2897.34,-3426.63,43.0837,0,0,0,0,100,0),
(339880,66,-2896.95,-3430.56,41.4713,0,0,0,0,100,0),
(339880,67,-2894.83,-3434.18,39.5658,0,0,0,0,100,0),
(339880,68,-2890.92,-3434.86,39.3579,0,0,0,0,100,0),
(339880,69,-2884.16,-3430.72,39.3579,0,0,0,0,100,0),
(339880,70,-2874.95,-3425.08,39.3515,0,0,0,0,100,0),
(339880,71,-2863.26,-3422.62,39.3515,0,10000,0,0,100,0),
(339880,72,-2874.95,-3425.08,39.3515,0,0,0,0,100,0),
(339880,73,-2884.16,-3430.72,39.3579,0,0,0,0,100,0),
(339880,74,-2890.92,-3434.86,39.3579,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
