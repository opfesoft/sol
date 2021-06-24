-- DB update 2021_06_24_01 -> 2021_06_24_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_24_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_24_01 2021_06_24_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624533609261532105'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624533609261532105');

-- Wetlands --
-- Elder Razormaws
UPDATE `creature` SET `position_x` = -2615.9, `position_y` = -2021.24, `position_z` = 71.9424 WHERE `guid` = 9692;
UPDATE `creature` SET `position_x` = -2611, `position_y` = -1975.65, `position_z` = 56.1846, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 9720;
UPDATE `creature` SET `position_x` = -2593.12, `position_y` = -1960.33, `position_z` = 52.0793, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 9761;
UPDATE `creature` SET `position_x` = -2606.15, `position_y` = -1961.53, `position_z` = 51.5575, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 10226;

-- Dustwallow Marsh --
-- Bloodfen Lashtails
UPDATE `creature` SET `position_x` = -4341.58, `position_y` = -2610.43, `position_z` = 37.0798, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 31710;
UPDATE `creature` SET `position_x` = -4339.99, `position_y` = -2621.67, `position_z` = 37.4538, `orientation` = 1.8286, `MovementType` = 2 WHERE `guid` = 31706;

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 31708; -- Bloodfen Razormaw
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 31701; -- Goreclaw the Ravenous

UPDATE `creature_addon` SET `path_id` = 317010 WHERE `guid` = 31701;

DELETE FROM `creature_addon` WHERE `guid` IN (31706,31708);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(31706,317060,0,0,4097,0,0,''),
(31708,317080,0,0,4097,0,0,'');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` = 2 AND `entryorguid` = 23873;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23873,0,2,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Goreclaw the Ravenous - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` IN (317060,317080,317010);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
-- Bloodfen Lashtail
(317060,1,-4339.99,-2621.67,37.4538,0,11000,0,0,100,0),
(317060,2,-4339.17,-2626.3,36.8574,0,0,0,0,100,0),
(317060,3,-4338.09,-2632.38,36.9381,0,0,0,0,100,0),
(317060,4,-4337.38,-2636.38,38.1526,0,0,0,0,100,0),
(317060,5,-4336.97,-2638.71,38.1517,0,16000,0,0,100,0),
(317060,6,-4337.38,-2636.38,38.1526,0,0,0,0,100,0),
(317060,7,-4338.09,-2632.38,36.9381,0,0,0,0,100,0),
(317060,8,-4339.17,-2626.3,36.8574,0,0,0,0,100,0),
-- Bloodfen Razormaw
(317080,1,-4333.25,-2640.76,38.3002,0,12000,0,0,100,0),
(317080,2,-4334.31,-2634.67,38.2247,0,0,0,0,100,0),
(317080,3,-4336.56,-2626.44,37.158,0,15000,0,0,100,0),
(317080,4,-4334.31,-2634.67,38.2247,0,0,0,0,100,0),
-- Goreclaw the Ravenous
(317010,1,-4331.29,-2664.14,33.3124,0,0,0,0,100,0),
(317010,2,-4340.9,-2662.72,33.4292,0,17000,0,0,100,0),
(317010,3,-4333.94,-2655.34,34.4858,1.74228,13000,0,0,100,0),
(317010,4,-4325.08,-2657.3,33.9414,0,14000,0,0,100,0),
(317010,5,-4326.55,-2671.73,33.0748,5.1352,19000,0,0,100,0),
(317010,6,-4324.28,-2675.68,32.1276,0,0,0,0,100,0),
(317010,7,-4320.81,-2681.74,30.2342,0,0,0,0,100,0),
(317010,8,-4316.16,-2689.84,30.3675,0,0,0,0,100,0),
(317010,9,-4312.38,-2696.41,30.2122,0,21000,0,0,100,0),
(317010,10,-4308.75,-2690.29,30.3161,0,0,0,0,100,0),
(317010,11,-4304.78,-2683.59,30.6758,0,0,0,0,100,0),
(317010,12,-4301.9,-2678.75,32.232,0,0,0,0,100,0),
(317010,13,-4298.6,-2673.19,34.3584,0,0,0,0,100,0),
(317010,14,-4294.5,-2669.93,35.2477,0,0,0,0,100,0),
(317010,15,-4288.63,-2665.28,35.5931,0,20000,0,0,100,0),
(317010,16,-4294.5,-2669.93,35.2477,0,0,0,0,100,0),
(317010,17,-4298.6,-2673.19,34.3584,0,0,0,0,100,0),
(317010,18,-4301.9,-2678.75,32.232,0,0,0,0,100,0),
(317010,19,-4304.78,-2683.59,30.6758,0,0,0,0,100,0),
(317010,20,-4312.88,-2685.33,30.3348,0,0,0,0,100,0),
(317010,21,-4318.43,-2685.88,30.202,0,0,0,0,100,0),
(317010,22,-4320.81,-2681.74,30.2342,0,0,0,0,100,0),
(317010,23,-4324.28,-2675.68,32.1276,0,0,0,0,100,0),
(317010,24,-4326.55,-2671.73,33.0748,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
