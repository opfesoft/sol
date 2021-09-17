-- DB update 2021_09_17_01 -> 2021_09_17_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_17_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_17_01 2021_09_17_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1631876091025425201'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1631876091025425201');

UPDATE `creature` SET `position_x` = -696.809, `position_y` = 1574.15, `position_z` = 18.6385, `MovementType` = 2 WHERE `guid` = 19150;
UPDATE `creature_addon` SET `path_id` = 191500 WHERE `guid` = 19150;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` = 1 AND `entryorguid` = 2332;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2332,0,1,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Valdred Moray - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 191500;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(191500,1,-696.809,1574.15,18.6385,0,0,0,0,100,0),
(191500,2,-697.589,1581.68,17.3765,1.19948,20000,0,0,100,0),
(191500,3,-692.521,1576.5,19.1314,0,0,0,0,100,0),
(191500,4,-687.836,1571.72,19.7447,0,0,0,0,100,0),
(191500,5,-684.16,1567.96,18.9675,0,0,0,0,100,0),
(191500,6,-687.644,1561.01,18.0411,0,0,0,0,100,0),
(191500,7,-691.55,1553.21,17.0013,0,0,0,0,100,0),
(191500,8,-695.579,1545.17,17.1952,0,0,0,0,100,0),
(191500,9,-699.665,1537.02,16.5535,0,0,0,0,100,0),
(191500,10,-703.993,1528.38,15.4682,0,0,0,0,100,0),
(191500,11,-708.19,1520.01,13.5875,0,0,0,0,100,0),
(191500,12,-714.482,1516.99,12.736,0,0,0,0,100,0),
(191500,13,-721.384,1513.68,12.4854,0,0,0,0,100,0),
(191500,14,-729.977,1509.55,13.4739,0,0,0,0,100,0),
(191500,15,-738.337,1505.54,15.3351,4.04091,20000,0,0,100,0),
(191500,16,-732.015,1501.75,14.7968,0,0,0,0,100,0),
(191500,17,-725.34,1497.74,13.8397,0,0,0,0,100,0),
(191500,18,-717.544,1493.06,12.4005,0,0,0,0,100,0),
(191500,19,-721.371,1487.07,13.5222,0,0,0,0,100,0),
(191500,20,-726.069,1479.72,14.8083,0,0,0,0,100,0),
(191500,21,-730.91,1472.14,16.1346,0,0,0,0,100,0),
(191500,22,-735.375,1465.15,17.1538,0,0,0,0,100,0),
(191500,23,-742.041,1467.22,18.0724,0,0,0,0,100,0),
(191500,24,-748.391,1469.19,18.112,2.94274,20000,0,0,100,0),
(191500,25,-744.177,1475.41,18.0754,0,0,0,0,100,0),
(191500,26,-739.815,1481.84,17.843,0,0,0,0,100,0),
(191500,27,-734.472,1489.73,16.3486,0,0,0,0,100,0),
(191500,28,-728.763,1498.15,14.5412,0,0,0,0,100,0),
(191500,29,-722.82,1506.92,12.6463,0,0,0,0,100,0),
(191500,30,-718.186,1512.67,12.0559,0,0,0,0,100,0),
(191500,31,-713.386,1518.62,13.2489,0,0,0,0,100,0),
(191500,32,-708.333,1524.89,15.0912,0,0,0,0,100,0),
(191500,33,-702.683,1531.89,16.0476,0,0,0,0,100,0),
(191500,34,-698.216,1537.43,16.3454,0,0,0,0,100,0),
(191500,35,-693.943,1542.73,16.3788,0,0,0,0,100,0),
(191500,36,-694.638,1550.35,17.5266,0,0,0,0,100,0),
(191500,37,-695.466,1559.42,18.0757,0,0,0,0,100,0),
(191500,38,-696.233,1567.84,18.9956,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
