-- DB update 2021_08_16_00 -> 2021_08_16_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_16_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_16_00 2021_08_16_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1629115971521666568'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1629115971521666568');

-- Talen: Sheath weapon
UPDATE `creature_addon` SET `bytes2` = `bytes2` & ~1 WHERE `guid` = 32329;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 3846 AND `id` = 1;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 3943 AND `id` = 3;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 384600;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3846,0,1,0,20,0,100,0,1007,0,0,0,0,80,384600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talen - On Quest ''The Ancient Statuette'' Rewarded - Call Timed Action List'),

(384600,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talen - On Script - Remove ''UNIT_NPC_FLAG_QUESTGIVER'''),
(384600,9,1,0,0,0,100,0,0,0,0,0,0,91,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talen - On Script - Remove ''UNIT_STAND_STATE_SIT'''),
(384600,9,2,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,6.16678,'Talen - On Script - Set Orientation'),
(384600,9,3,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talen - On Script - Say Line 0'),
(384600,9,4,0,0,0,100,0,4000,4000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talen - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(384600,9,5,0,0,0,100,0,1000,1000,0,0,0,50,18603,0,0,0,0,0,8,0,0,0,0,3471.69,846.893,5.39909,4.67058,'Talen - On Script - Summon GO ''Ancient Statuette'''),
(384600,9,6,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talen - On Script - Say Line 1'),
(384600,9,7,0,0,0,100,0,8000,8000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talen - On Script - Say Line 2'),
(384600,9,8,0,0,0,100,0,4000,4000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talen - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(384600,9,9,0,0,0,100,0,4000,4000,0,0,0,41,0,0,0,0,0,0,20,18603,50,0,0,0,0,0,0,'Talen - On Script - Delete GO ''Ancient Statuette'''),
(384600,9,10,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talen - On Script - Reset Orientation'),
(384600,9,11,0,0,0,100,0,0,0,0,0,0,1,3,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Talen - On Script - Say Line 3'),
(384600,9,12,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talen - On Script - Set ''UNIT_NPC_FLAG_QUESTGIVER'''),
(384600,9,13,0,0,0,100,0,20000,20000,0,0,0,90,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talen - On Script - Set ''UNIT_STAND_STATE_SIT'''),

(3943,0,3,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ruuzel - On Respawn - Set Active On');

-- Ruuzel creature formation
DELETE FROM `creature_formations` WHERE `leaderGUID` = 32617;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`)
VALUES
(32617,32617,0,0,2),
(32617,32762,3,30,2),  -- Wrathtail Sea Witch
(32617,32728,3,330,2); -- Wrathtail Myrmidon

-- Ruuzel WP path
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 32617;
UPDATE `creature_addon` SET `path_id` = 326170 WHERE `guid` = 32617;

DELETE FROM `waypoint_data` WHERE `id` = 326170;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(326170,1,4171.11,1283.63,3.31933,0,0,0,0,100,0),
(326170,2,4164.57,1278.36,3.25428,0,0,0,0,100,0),
(326170,3,4157.59,1272.73,3.22775,0,0,0,0,100,0),
(326170,4,4146.35,1271.43,3.34608,0,0,0,0,100,0),
(326170,5,4140.2,1270.72,3.73898,0,0,0,0,100,0),
(326170,6,4130.46,1269.59,2.70446,0,0,0,0,100,0),
(326170,7,4118.6,1268.22,1.93513,0,0,0,0,100,0),
(326170,8,4109.71,1272.89,1.93451,0,0,0,0,100,0),
(326170,9,4100.35,1277.8,1.42555,0,0,0,0,100,0),
(326170,10,4098.65,1284.23,2.08793,0,0,0,0,100,0),
(326170,11,4096.74,1291.44,2.58107,0,0,0,0,100,0),
(326170,12,4094.9,1298.41,2.49713,0,0,0,0,100,0),
(326170,13,4092.84,1306.2,2.58622,0,0,0,0,100,0),
(326170,14,4090.54,1314.88,2.11756,0,0,0,0,100,0),
(326170,15,4092.04,1321.84,2.21775,0,0,0,0,100,0),
(326170,16,4093.91,1330.51,2.41344,0,0,0,0,100,0),
(326170,17,4096.28,1341.46,2.58779,0,0,0,0,100,0),
(326170,18,4098.61,1352.27,2.58844,0,0,0,0,100,0),
(326170,19,4105.82,1360.33,2.53902,0,0,0,0,100,0),
(326170,20,4113.11,1364.26,1.44001,0,0,0,0,100,0),
(326170,21,4119.06,1367.47,1.40275,0,0,0,0,100,0),
(326170,22,4126.98,1371.74,2.63606,0,0,0,0,100,0),
(326170,23,4133.67,1375.35,2.18856,0,0,0,0,100,0),
(326170,24,4138.18,1377.78,1.40173,0,0,0,0,100,0),
(326170,25,4146.1,1376.37,1.5345,0,0,0,0,100,0),
(326170,26,4154.6,1374.85,1.94608,0,0,0,0,100,0),
(326170,27,4161.03,1373.7,2.40077,0,0,0,0,100,0),
(326170,28,4168.61,1372.35,2.58767,0,0,0,0,100,0),
(326170,29,4176.57,1370.93,2.58461,0,0,0,0,100,0),
(326170,30,4181.74,1367.32,2.51305,0,0,0,0,100,0),
(326170,31,4187.58,1363.25,2.41014,0,0,0,0,100,0),
(326170,32,4194.66,1358.31,2.67793,0,0,0,0,100,0),
(326170,33,4202.22,1353.03,2.58941,0,0,0,0,100,0),
(326170,34,4209.01,1348.3,2.73692,0,0,0,0,100,0),
(326170,35,4215.32,1343.89,2.67207,0,0,0,0,100,0),
(326170,36,4221.99,1339.24,2.22232,0,0,0,0,100,0),
(326170,37,4223.05,1332.56,2.28194,0,0,0,0,100,0),
(326170,38,4224.15,1325.65,2.37266,0,0,0,0,100,0),
(326170,39,4225.52,1317.01,1.90514,0,0,0,0,100,0),
(326170,40,4221.73,1310.71,1.91457,0,0,0,0,100,0),
(326170,41,4218.28,1304.97,1.44197,0,0,0,0,100,0),
(326170,42,4214.86,1299.28,1.95168,0,0,0,0,100,0),
(326170,43,4210.53,1292.09,2.03018,0,0,0,0,100,0),
(326170,44,4206.5,1285.38,1.3025,0,0,0,0,100,0),
(326170,45,4199.27,1283.12,2.05408,0,0,0,0,100,0),
(326170,46,4194.14,1281.52,2.22316,0,0,0,0,100,0),
(326170,47,4185.92,1278.95,1.27956,0,0,0,0,100,0),
(326170,48,4182.42,1280.06,1.91721,0,0,0,0,100,0),
(326170,49,4176.63,1281.89,2.50236,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
