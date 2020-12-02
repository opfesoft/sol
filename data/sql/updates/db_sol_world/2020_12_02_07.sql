-- DB update 2020_12_02_06 -> 2020_12_02_07
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_02_06';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_02_06 2020_12_02_07 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1606945480408772789'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1606945480408772789');

UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 14275;

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 90783;

DELETE FROM `creature_addon` WHERE `guid` = 90783;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(90783,907830,0,0,1,0,0,NULL);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 14275;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 14275 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14275,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tamra Stormpike - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 907830;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(907830,1,-1334.4,-1227.01,49.9033,0,0,0,0,100,0),
(907830,2,-1328.3,-1222,49.9033,0,0,0,0,100,0),
(907830,3,-1322.53,-1217.27,49.9033,0,0,0,0,100,0),
(907830,4,-1316.82,-1212.59,49.9032,0,0,0,0,100,0),
(907830,5,-1322.53,-1217.27,49.9033,0,0,0,0,100,0),
(907830,6,-1328.3,-1222,49.9033,0,0,0,0,100,0),
(907830,7,-1334.4,-1227.01,49.9033,0,0,0,0,100,0),
(907830,8,-1340.21,-1231.89,49.9033,0,0,0,0,100,0),
(907830,9,-1347.45,-1237.98,49.9033,0,0,0,0,100,0),
(907830,10,-1353.08,-1242.71,49.9048,0,0,0,0,100,0),
(907830,11,-1357.24,-1246.72,49.9025,0,0,0,0,100,0),
(907830,12,-1357.06,-1248.49,49.9033,0,0,0,0,100,0),
(907830,13,-1350.61,-1256.02,49.9018,0,0,0,0,100,0),
(907830,14,-1343.55,-1264.26,49.9018,0,0,0,0,100,0),
(907830,15,-1336.26,-1272.77,49.9018,0,0,0,0,100,0),
(907830,16,-1331.07,-1278.83,49.9017,0,0,0,0,100,0),
(907830,17,-1329.89,-1278.96,49.9017,0,0,0,0,100,0),
(907830,18,-1323.39,-1273.28,49.9023,0,0,0,0,100,0),
(907830,19,-1316.01,-1266.82,49.903,0,0,0,0,100,0),
(907830,20,-1308.37,-1260.13,49.9031,0,0,0,0,100,0),
(907830,21,-1301.06,-1253.74,49.9031,0,0,0,0,100,0),
(907830,22,-1295,-1248.44,49.9031,0,0,0,0,100,0),
(907830,23,-1289.34,-1243.49,49.9032,0,0,0,0,100,0),
(907830,24,-1295,-1248.44,49.9031,0,0,0,0,100,0),
(907830,25,-1301.06,-1253.74,49.9031,0,0,0,0,100,0),
(907830,26,-1308.37,-1260.13,49.9031,0,0,0,0,100,0),
(907830,27,-1316.01,-1266.82,49.903,0,0,0,0,100,0),
(907830,28,-1323.39,-1273.28,49.9023,0,0,0,0,100,0),
(907830,29,-1329.89,-1278.96,49.9017,0,0,0,0,100,0),
(907830,30,-1331.07,-1278.83,49.9017,0,0,0,0,100,0),
(907830,31,-1336.26,-1272.77,49.9018,0,0,0,0,100,0),
(907830,32,-1343.55,-1264.26,49.9018,0,0,0,0,100,0),
(907830,33,-1350.61,-1256.02,49.9018,0,0,0,0,100,0),
(907830,34,-1357.06,-1248.49,49.9033,0,0,0,0,100,0),
(907830,35,-1357.24,-1246.72,49.9025,0,0,0,0,100,0),
(907830,36,-1353.08,-1242.71,49.9048,0,0,0,0,100,0),
(907830,37,-1347.45,-1237.98,49.9033,0,0,0,0,100,0),
(907830,38,-1340.21,-1231.89,49.9033,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
