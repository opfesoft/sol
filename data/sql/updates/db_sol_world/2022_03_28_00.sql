-- DB update 2022_03_27_00 -> 2022_03_28_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_27_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_27_00 2022_03_28_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648446209592780370'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648446209592780370');

UPDATE `creature` SET `position_x` = -8065.41, `position_y` = 978.324, `position_z` = 44.0707, `wander_distance` = 10 WHERE `guid` = 44365;
UPDATE `creature` SET `position_x` = -8053.19, `position_y` = 1004.17, `position_z` = 39.1656, `wander_distance` = 10 WHERE `guid` = 44366;
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` IN (44396,44397);

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 42921;
UPDATE `creature_addon` SET `path_id` = 429210, `auras` = '13299' WHERE `guid` = 42921;

DELETE FROM `creature_formations` WHERE `leaderGUID` = 42921;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`)
VALUES
(42921,42921,0,0,2),
(42921,44397,5,315,2),
(42921,44396,5,45,2);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 15196;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(15196,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deathclasp - On Respawn - Set Active On'),
(15196,0,1,0,0,0,100,0,8000,8000,15000,25000,0,11,3609,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Deathclasp - IC - Cast ''Paralyzing Poison'''),
(15196,0,2,0,0,0,100,0,15000,15000,10000,20000,0,11,18670,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Deathclasp - IC - Cast ''Knock Away''');

DELETE FROM `waypoint_data` WHERE `id` = 429210;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(429210,1,-8102.7,967.628,59.6615,0,0,0,0,0,100,0),
(429210,2,-8110.87,970.366,61.6437,0,0,0,0,0,100,0),
(429210,3,-8114.84,978.804,61.7247,0,0,0,0,0,100,0),
(429210,4,-8119.16,987.989,61.8124,0,27000,0,0,0,100,0),
(429210,5,-8114.84,978.804,61.7247,0,32000,0,0,0,100,0),
(429210,6,-8110.87,970.366,61.6437,0,0,0,0,0,100,0),
(429210,7,-8102.7,967.628,59.6615,0,0,0,0,0,100,0),
(429210,8,-8094.91,968.252,55.7528,0,0,0,0,0,100,0),
(429210,9,-8087.47,968.849,51.6412,0,0,0,0,0,100,0),
(429210,10,-8079.09,969.521,47.6974,0,0,0,0,0,100,0),
(429210,11,-8069.54,976.622,44.7186,0,0,0,0,0,100,0),
(429210,12,-8062.98,988.051,41.8031,0,0,0,0,0,100,0),
(429210,13,-8058.32,1001.5,39.6554,0,0,0,0,0,100,0),
(429210,14,-8053.46,1015.5,37.4672,0,0,0,0,0,100,0),
(429210,15,-8053.86,1024.3,33.6621,0,0,0,0,0,100,0),
(429210,16,-8054.38,1031.64,30.1735,0,0,0,0,0,100,0),
(429210,17,-8057.36,1039.01,26.5397,0,0,0,0,0,100,0),
(429210,18,-8060.12,1045.82,22.9068,0,0,0,0,0,100,0),
(429210,19,-8062.75,1052.32,17.6975,0,0,0,0,0,100,0),
(429210,20,-8065.12,1058.15,13.3331,0,0,0,0,0,100,0),
(429210,21,-8070.03,1063.46,9.7622,0,0,0,0,0,100,0),
(429210,22,-8072.64,1069.11,8.64528,0,37000,0,0,0,100,0),
(429210,23,-8070.03,1063.46,9.7622,0,0,0,0,0,100,0),
(429210,24,-8065.12,1058.15,13.3331,0,0,0,0,0,100,0),
(429210,25,-8062.75,1052.32,17.6975,0,0,0,0,0,100,0),
(429210,26,-8060.12,1045.82,22.9068,0,0,0,0,0,100,0),
(429210,27,-8057.36,1039.01,26.5397,0,0,0,0,0,100,0),
(429210,28,-8054.38,1031.64,30.1735,0,0,0,0,0,100,0),
(429210,29,-8053.86,1024.3,33.6621,0,0,0,0,0,100,0),
(429210,30,-8053.46,1015.5,37.4672,0,0,0,0,0,100,0),
(429210,31,-8058.32,1001.5,39.6554,0,0,0,0,0,100,0),
(429210,32,-8062.98,988.051,41.8031,0,0,0,0,0,100,0),
(429210,33,-8069.54,976.622,44.7186,0,0,0,0,0,100,0),
(429210,34,-8079.09,969.521,47.6974,0,0,0,0,0,100,0),
(429210,35,-8087.47,968.849,51.6412,0,0,0,0,0,100,0),
(429210,36,-8094.91,968.252,55.7528,0,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
