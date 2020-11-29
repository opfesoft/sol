-- DB update 2020_11_29_00 -> 2020_11_29_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_11_29_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_11_29_00 2020_11_29_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1606666750715354682'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1606666750715354682');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 2452 AND `source_type` = 0 AND `id` = 3;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2452,0,3,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skhowl - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 176000;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(176000,1,535.925,-97.0206,144.345,0,0,0,0,100,0),
(176000,2,540.165,-102.739,145.122,0,0,0,0,100,0),
(176000,3,544.855,-109.064,145.776,0,0,0,0,100,0),
(176000,4,552.361,-110.125,145.286,0,0,0,0,100,0),
(176000,5,559.353,-111.113,144.389,0,0,0,0,100,0),
(176000,6,567.191,-111.185,143.726,0,0,0,0,100,0),
(176000,7,573.709,-111.244,143.131,0,0,0,0,100,0),
(176000,8,579.899,-109.204,140.78,0,0,0,0,100,0),
(176000,9,583.224,-105.779,140.559,0,0,0,0,100,0),
(176000,10,587.161,-101.724,140.636,0,0,0,0,100,0),
(176000,11,585.653,-95.2473,140.568,0,0,0,0,100,0),
(176000,12,584.063,-88.4193,140.667,0,0,0,0,100,0),
(176000,13,581.812,-81.4225,140.564,0,0,0,0,100,0),
(176000,14,579.203,-73.3129,140.085,0,0,0,0,100,0),
(176000,15,576.465,-64.8036,139.386,0,0,0,0,100,0),
(176000,16,570.75,-60.5583,139.388,0,0,0,0,100,0),
(176000,17,564.979,-56.2708,139.489,0,0,0,0,100,0),
(176000,18,556.821,-51.0581,139.521,0,0,0,0,100,0),
(176000,19,547.933,-45.3787,139.523,0,0,0,0,100,0),
(176000,20,540.682,-41.3783,139.523,0,0,0,0,100,0),
(176000,21,531.93,-36.5493,139.523,0,0,0,0,100,0),
(176000,22,524.867,-32.9417,139.523,0,0,0,0,100,0),
(176000,23,517.698,-29.28,139.523,0,0,0,0,100,0),
(176000,24,510.112,-25.4052,139.523,0,0,0,0,100,0),
(176000,25,500.956,-22.2597,139.523,0,0,0,0,100,0),
(176000,26,491.139,-18.8867,139.523,0,0,0,0,100,0),
(176000,27,483.194,-16.1574,139.52,0,0,0,0,100,0),
(176000,28,474.183,-13.0615,139.506,0,0,0,0,100,0),
(176000,29,465.589,-16.7146,139.495,0,0,0,0,100,0),
(176000,30,457.375,-20.2063,139.397,0,0,0,0,100,0),
(176000,31,450.844,-23.0226,138.896,0,0,0,0,100,0),
(176000,32,442.987,-26.4111,138.47,0,0,0,0,100,0),
(176000,33,432.749,-32.1221,139.014,0,0,0,0,100,0),
(176000,34,425.577,-31.197,139.574,0,0,0,0,100,0),
(176000,35,418.559,-30.2917,140.373,0,0,0,0,100,0),
(176000,36,410.686,-29.2761,141.493,0,0,0,0,100,0),
(176000,37,404.681,-28.4459,142.073,0,0,0,0,100,0),
(176000,38,397.095,-27.397,141.724,0,0,0,0,100,0),
(176000,39,388.474,-26.9797,142.571,0,0,0,0,100,0),
(176000,40,381.48,-26.6411,143.363,0,0,0,0,100,0),
(176000,41,374.517,-25.9241,142.964,0,0,0,0,100,0),
(176000,42,367.15,-25.1656,142.464,0,0,0,0,100,0),
(176000,43,357.728,-25.8893,142.453,0,0,0,0,100,0),
(176000,44,346.972,-26.7154,142.453,0,0,0,0,100,0),
(176000,45,341.516,-31.6403,142.453,0,0,0,0,100,0),
(176000,46,336.232,-36.4105,142.453,0,0,0,0,100,0),
(176000,47,330.968,-41.1617,142.453,0,0,0,0,100,0),
(176000,48,324.862,-44.5856,142.452,0,0,0,0,100,0),
(176000,49,320.659,-48.1024,142.388,0,0,0,0,100,0),
(176000,50,315.198,-52.6704,141.896,0,0,0,0,100,0),
(176000,51,309.561,-57.3865,141.18,0,0,0,0,100,0),
(176000,52,304.352,-61.7442,140.856,0,0,0,0,100,0),
(176000,53,296.636,-65.1438,141.529,0,0,0,0,100,0),
(176000,54,291.834,-70.0722,142.47,0,0,0,0,100,0),
(176000,55,287.062,-74.97,143.051,0,0,0,0,100,0),
(176000,56,290.487,-68.3327,142.18,0,0,0,0,100,0),
(176000,57,294.545,-60.47,140.806,0,0,0,0,100,0),
(176000,58,300.733,-60.5209,140.521,0,0,0,0,100,0),
(176000,59,306.305,-60.5668,140.947,0,0,0,0,100,0),
(176000,60,310.022,-56.2298,141.312,0,0,0,0,100,0),
(176000,61,313.097,-52.6422,141.819,0,0,0,0,100,0),
(176000,62,316.667,-46.6229,142.392,0,0,0,0,100,0),
(176000,63,320.77,-39.7036,142.398,0,0,0,0,100,0),
(176000,64,327.054,-38.183,142.452,0,0,0,0,100,0),
(176000,65,333.286,-36.675,142.439,0,0,0,0,100,0),
(176000,66,340.439,-34.9442,142.453,0,0,0,0,100,0),
(176000,67,347.581,-33.1795,142.453,0,0,0,0,100,0),
(176000,68,354.153,-31.5559,142.453,0,0,0,0,100,0),
(176000,69,360.133,-30.0783,142.453,0,0,0,0,100,0),
(176000,70,367.754,-28.9317,142.495,0,0,0,0,100,0),
(176000,71,375.544,-27.7597,143.167,0,0,0,0,100,0),
(176000,72,382.549,-27.9233,143.349,0,0,0,0,100,0),
(176000,73,389.897,-28.095,142.369,0,0,0,0,100,0),
(176000,74,397.598,-28.3903,141.751,0,0,0,0,100,0),
(176000,75,402.621,-28.5828,141.925,0,0,0,0,100,0),
(176000,76,408.158,-28.7951,141.805,0,0,0,0,100,0),
(176000,77,414.927,-28.7752,141.021,0,0,0,0,100,0),
(176000,78,423.096,-28.7513,139.84,0,0,0,0,100,0),
(176000,79,431.676,-28.7261,139.195,0,0,0,0,100,0),
(176000,80,437.52,-25.5535,138.841,0,0,0,0,100,0),
(176000,81,444.268,-21.8907,138.845,0,0,0,0,100,0),
(176000,82,452.576,-19.9759,139.395,0,0,0,0,100,0),
(176000,83,459.345,-18.7014,139.475,0,0,0,0,100,0),
(176000,84,467.834,-17.1032,139.504,0,0,0,0,100,0),
(176000,85,474.438,-15.8598,139.515,0,0,0,0,100,0),
(176000,86,480.07,-16.8528,139.518,0,0,0,0,100,0),
(176000,87,486.736,-18.0282,139.52,0,0,0,0,100,0),
(176000,88,495.042,-19.4926,139.521,0,0,0,0,100,0),
(176000,89,499.321,-26.729,139.521,0,0,0,0,100,0),
(176000,90,504.367,-35.2613,139.521,0,0,0,0,100,0),
(176000,91,511.543,-38.0343,139.521,0,0,0,0,100,0),
(176000,92,520.147,-41.3593,139.521,0,0,0,0,100,0),
(176000,93,522.071,-48.0898,139.521,0,0,0,0,100,0),
(176000,94,524.067,-55.0748,139.521,0,0,0,0,100,0),
(176000,95,526.158,-62.6017,139.521,0,0,0,0,100,0),
(176000,96,528.563,-71.2586,139.843,0,0,0,0,100,0),
(176000,97,530.658,-78.7983,140.939,0,0,0,0,100,0),
(176000,98,529.359,-83.7693,142.677,0,0,0,0,100,0),
(176000,99,528.123,-88.4964,143.864,0,0,0,0,100,0),
(176000,100,531.824,-92.5395,144.448,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
