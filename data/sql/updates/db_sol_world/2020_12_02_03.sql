-- DB update 2020_12_02_02 -> 2020_12_02_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_02_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_02_02 2020_12_02_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1606907721485390901'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1606907721485390901');

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 42143;
UPDATE `creature_addon` SET `path_id` = 421430 WHERE `guid` = 42143;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 10358;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 10358 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10358,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fellicent''s Shade - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 421430;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(421430,1,2013.67,-353.764,35.4523,0,0,0,0,100,0),
(421430,2,2021.72,-353.722,35.4523,0,0,0,0,100,0),
(421430,3,2029.65,-353.68,35.4523,0,0,0,0,100,0),
(421430,4,2036.66,-353.643,35.4522,0,0,0,0,100,0),
(421430,5,2043.96,-354.653,35.4522,0,0,0,0,100,0),
(421430,6,2046.38,-360.966,35.4522,0,0,0,0,100,0),
(421430,7,2045.16,-368.575,35.4522,0,0,0,0,100,0),
(421430,8,2043.6,-378.258,35.4522,0,0,0,0,100,0),
(421430,9,2042.16,-387.225,35.4522,0,0,0,0,100,0),
(421430,10,2039.01,-397.608,35.4522,0,0,0,0,100,0),
(421430,11,2036.03,-407.443,35.4522,0,0,0,0,100,0),
(421430,12,2028.25,-410.914,35.4522,0,0,0,0,100,0),
(421430,13,2020.62,-414.319,35.4522,0,0,0,0,100,0),
(421430,14,2010.24,-415.932,35.4522,0,0,0,0,100,0),
(421430,15,1999.06,-417.671,35.4522,0,0,0,0,100,0),
(421430,16,1988.4,-419.329,35.4522,0,0,0,0,100,0),
(421430,17,1978.55,-418.18,35.4522,0,0,0,0,100,0),
(421430,18,1967.26,-416.863,35.4522,0,0,0,0,100,0),
(421430,19,1962.46,-408.135,35.4522,0,0,0,0,100,0),
(421430,20,1963.24,-399.533,35.4522,0,0,0,0,100,0),
(421430,21,1964.21,-388.965,35.4522,0,0,0,0,100,0),
(421430,22,1965.09,-379.317,35.4522,0,0,0,0,100,0),
(421430,23,1965.89,-370.955,35.4522,0,0,0,0,100,0),
(421430,24,1966.65,-363.054,35.4522,0,0,0,0,100,0),
(421430,25,1967.55,-353.692,35.4523,0,0,0,0,100,0),
(421430,26,1974.3,-347.861,35.4523,0,0,0,0,100,0),
(421430,27,1984.22,-349.348,35.4523,0,0,0,0,100,0),
(421430,28,1999.1,-351.58,35.4523,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
