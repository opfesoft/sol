-- DB update 2020_11_30_01 -> 2020_11_30_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_11_30_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_11_30_01 2020_11_30_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1606739304920751547'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1606739304920751547');

UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 1885;

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 61634;

DELETE FROM `creature_addon` WHERE `guid` = 61634;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(61634,616340,0,0,1,0,0,NULL);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 1885;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 1885 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1885,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Smith - On Respawn - Set Active On');

DELETE FROM `waypoint_scripts` WHERE `id` = 616340;
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`)
VALUES
(616340,1,1,69,1,0,0,0,0,0,947),
(616340,18,1,0,1,0,0,0,0,0,948);

DELETE FROM `waypoint_data` WHERE `id` = 616340;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(616340,1,2990.86,-1458.58,146.273,0,0,0,0,100,0),
(616340,2,2985.1,-1454.81,146.288,0,0,0,0,100,0),
(616340,3,2978.03,-1450.18,145.989,0,0,0,0,100,0),
(616340,4,2970.77,-1451.33,146.19,0,0,0,0,100,0),
(616340,5,2962.46,-1452.65,145.716,0,0,0,0,100,0),
(616340,6,2962.87,-1458.35,145.453,0,0,0,0,100,0),
(616340,7,2963.32,-1464.52,145.592,0,0,0,0,100,0),
(616340,8,2968.22,-1466.71,145.752,0,0,0,0,100,0),
(616340,9,2973.34,-1468.99,145.754,0,0,0,0,100,0),
(616340,10,2974.3,-1475.57,145.509,0,0,0,0,100,0),
(616340,11,2974.42,-1478.37,146.18,0,0,0,0,100,0),
(616340,12,2974.54,-1481.51,146.99,0,0,0,0,100,0),
(616340,13,2974.67,-1484.54,146.999,0,0,0,0,100,0),
(616340,14,2975.15,-1490.23,147.022,0,0,0,0,100,0),
(616340,15,2984.02,-1491.19,147.042,6.18384,20000,0,616340,100,0),
(616340,16,2974.94,-1498.83,147.042,3.80251,20000,0,616340,100,0),
(616340,17,2978.95,-1500.69,146.999,0,0,0,0,100,0),
(616340,18,2979.24,-1503.36,146.989,0,0,0,0,100,0),
(616340,19,2979.73,-1507.85,145.28,0,0,0,0,100,0),
(616340,20,2979.92,-1509.63,145.319,0,0,0,0,100,0),
(616340,21,2985.62,-1509.11,145.772,0,0,0,0,100,0),
(616340,22,2992.01,-1508.54,146.285,0,0,0,0,100,0),
(616340,23,2996.73,-1508.11,146.204,0,0,0,0,100,0),
(616340,24,3000,-1510.75,145.786,0,0,0,0,100,0),
(616340,25,3004.9,-1514.71,145.967,0,0,0,0,100,0),
(616340,26,3006.9,-1518.76,146.429,0,0,0,0,100,0),
(616340,27,3005.29,-1522.01,146.069,0,0,0,0,100,0),
(616340,28,3000.44,-1520.01,145.84,0,0,0,0,100,0),
(616340,29,2996.23,-1518.28,146.014,0,0,0,0,100,0),
(616340,30,2992.68,-1516.82,146.041,0,0,0,0,100,0),
(616340,31,2994.65,-1511.83,146.336,0,0,0,0,100,0),
(616340,32,2996.49,-1507.15,146.152,0,0,0,0,100,0),
(616340,33,3000.18,-1502.19,146.097,0,0,0,0,100,0),
(616340,34,3004.37,-1496.56,146.397,0,0,0,0,100,0),
(616340,35,3004.69,-1491.43,146.136,0,0,0,0,100,0),
(616340,36,3004.99,-1486.54,146.184,0,0,0,0,100,0),
(616340,37,3005.32,-1481.19,145.908,0,0,0,0,100,0),
(616340,38,3006.64,-1476.47,145.845,0,0,0,0,100,0),
(616340,39,3008.27,-1470.62,146.531,0,0,0,0,100,0),
(616340,40,3005.26,-1465.89,146.713,0,0,0,0,100,0),
(616340,41,3002.19,-1461.06,146.273,0,0,0,0,100,0),
(616340,42,2998.02,-1460.04,145.81,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
