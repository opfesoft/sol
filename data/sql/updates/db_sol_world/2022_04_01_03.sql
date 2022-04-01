-- DB update 2022_04_01_02 -> 2022_04_01_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_01_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_01_02 2022_04_01_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648832225706700752'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648832225706700752');

DELETE FROM `creature` WHERE `guid` IN (3008952,3008953,3008954);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3008952,14496,0,0,0,1,1,0,0,-8611.86,741.819,101.902,5.38743,180,0,42,0,2,0,0,0,0),
(3008953,14496,0,0,0,1,1,0,0,-8612.29,743.15,101.9,5.39528,180,0,42,0,0,0,0,0,0),
(3008954,14496,0,0,0,1,1,0,0,-8613.42,742.54,101.901,5.45026,180,0,42,0,0,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` = 3008952;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(3008952,30089520,0,0,0,0,0,NULL);

DELETE FROM `creature_formations` WHERE `leaderGUID` = 3008952;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`)
VALUES
(3008952,3008952,0,0,0),
(3008952,3008953,2,350,0),
(3008952,3008954,1,20,0);

DELETE FROM `creature_text` WHERE `CreatureId` = 14497;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(14497,0,0,'Now children stop that!  I mean it!',12,7,100,0,0,0,9690,0,'Shellene'),
(14497,1,0,'It''s so sad for you poor children.',12,7,100,0,0,0,9689,0,'Shellene'),
(14497,1,1,'All will be well children.  The Light shall see to that!',12,7,100,0,0,0,9691,0,'Shellene'),
(14497,1,2,'I believe you children are our future...',12,7,100,0,0,0,9692,0,'Shellene');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 14496;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = -3008952;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-3008952,0,0,0,34,0,20,0,2,25,0,0,0,1,0,0,0,0,0,0,19,14497,0,0,0,0,0,0,0,'Stormwind Orphan - On WP 26 Reached - Say Line 0 (Shellene)'),
(-3008952,0,1,0,34,0,20,0,2,58,0,0,0,1,1,0,0,0,0,0,19,14497,0,0,0,0,0,0,0,'Stormwind Orphan - On WP 59 Reached - Say Line 1 (Shellene)');

DELETE FROM `waypoint_data` WHERE `id` = 30089520;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(30089520,1,-8611.86,741.819,101.902,0,0,1,0,0,100,0),
(30089520,2,-8609.8,739.192,101.902,0,0,1,0,0,100,0),
(30089520,3,-8607.33,736.029,101.902,0,0,1,0,0,100,0),
(30089520,4,-8607.45,731.481,101.906,0,0,1,0,0,100,0),
(30089520,5,-8611.1,730.951,101.904,0,0,1,0,0,100,0),
(30089520,6,-8611.39,732.98,101.902,0,0,1,0,0,100,0),
(30089520,7,-8608.91,735.926,101.897,0,0,1,0,0,100,0),
(30089520,8,-8606.99,738.265,101.903,0,0,1,0,0,100,0),
(30089520,9,-8601.68,741.296,101.903,0,0,1,0,0,100,0),
(30089520,10,-8598.64,742.576,101.904,0,0,1,0,0,100,0),
(30089520,11,-8597.57,740.674,101.904,0,0,1,0,0,100,0),
(30089520,12,-8596.52,738.983,101.904,0,0,1,0,0,100,0),
(30089520,13,-8598.91,736.516,101.904,0,0,1,0,0,100,0),
(30089520,14,-8601.76,733.618,101.904,0,0,1,0,0,100,0),
(30089520,15,-8602.19,730.622,101.904,0,0,1,0,0,100,0),
(30089520,16,-8605.55,727.392,101.904,0,0,1,0,0,100,0),
(30089520,17,-8609.37,727.375,101.904,0,0,1,0,0,100,0),
(30089520,18,-8614.08,727.354,101.904,0,0,1,0,0,100,0),
(30089520,19,-8616.01,730.363,101.904,0,0,1,0,0,100,0),
(30089520,20,-8617.71,733.004,101.896,0,0,1,0,0,100,0),
(30089520,21,-8614.65,735.352,101.901,0,0,1,0,0,100,0),
(30089520,22,-8611.3,733.998,101.899,0,0,1,0,0,100,0),
(30089520,23,-8610.28,727.638,101.904,0,0,1,0,0,100,0),
(30089520,24,-8606.34,726.555,101.904,0,0,1,0,0,100,0),
(30089520,25,-8601.92,730.248,101.904,0,0,1,0,0,100,0),
(30089520,26,-8602.14,732.874,101.904,0,0,1,0,0,100,0),
(30089520,27,-8606.06,735.238,101.904,0,0,1,0,0,100,0),
(30089520,28,-8606.02,738.133,101.904,0,0,1,0,0,100,0),
(30089520,29,-8602.38,740.663,101.904,0,0,1,0,0,100,0),
(30089520,30,-8599.5,742.49,101.904,0,0,1,0,0,100,0),
(30089520,31,-8597.52,741.218,101.904,0,0,1,0,0,100,0),
(30089520,32,-8596.86,738.872,101.904,0,0,1,0,0,100,0),
(30089520,33,-8599.7,735.962,101.904,0,0,1,0,0,100,0),
(30089520,34,-8603.71,733.69,101.903,0,0,1,0,0,100,0),
(30089520,35,-8607.67,734.3,101.903,0,0,1,0,0,100,0),
(30089520,36,-8611.73,734.924,101.896,0,0,1,0,0,100,0),
(30089520,37,-8613.42,737.851,101.901,0,0,1,0,0,100,0),
(30089520,38,-8611.86,741.819,101.902,0,0,1,0,0,100,0),
(30089520,39,-8613.66,744.388,101.902,0,0,1,0,0,100,0),
(30089520,40,-8615.94,747.106,99.4982,0,0,1,0,0,100,0),
(30089520,41,-8618.11,749.692,96.723,0,0,1,0,0,100,0),
(30089520,42,-8615.26,754.488,96.688,0,0,1,0,0,100,0),
(30089520,43,-8610.97,756.185,96.77,0,0,1,0,0,100,0),
(30089520,44,-8604.83,754.705,96.784,0,0,1,0,0,100,0),
(30089520,45,-8599.9,756.884,96.792,0,0,1,0,0,100,0),
(30089520,46,-8601.77,761.891,96.723,0,0,1,0,0,100,0),
(30089520,47,-8607.01,764.106,96.718,0,0,1,0,0,100,0),
(30089520,48,-8610.5,760.02,96.736,0,0,1,0,0,100,0),
(30089520,49,-8612.11,753.82,96.729,0,0,1,0,0,100,0),
(30089520,50,-8609.29,752.037,96.765,0,0,1,0,0,100,0),
(30089520,51,-8607.3,752.856,96.786,0,0,1,0,0,100,0),
(30089520,52,-8605.81,756.485,96.769,0,0,1,0,0,100,0),
(30089520,53,-8607.55,759.231,96.745,0,0,1,0,0,100,0),
(30089520,54,-8612.13,758.924,96.751,0,0,1,0,0,100,0),
(30089520,55,-8616.76,757.048,96.684,0,0,1,0,0,100,0),
(30089520,56,-8625.06,751.401,96.777,0,0,1,0,0,100,0),
(30089520,57,-8623.74,744.051,96.771,0,0,1,0,0,100,0),
(30089520,58,-8624.98,739.424,96.777,0,0,1,0,0,100,0),
(30089520,59,-8630.46,736.526,96.835,0,0,1,0,0,100,0),
(30089520,60,-8634.49,736.914,96.768,0,0,1,0,0,100,0),
(30089520,61,-8635.06,740.133,96.936,0,0,1,0,0,100,0),
(30089520,62,-8632.45,744.383,96.891,0,0,1,0,0,100,0),
(30089520,63,-8627.87,747.073,96.806,0,0,1,0,0,100,0),
(30089520,64,-8624.17,748.017,96.793,0,0,1,0,0,100,0),
(30089520,65,-8618.11,749.692,96.723,0,0,1,0,0,100,0),
(30089520,66,-8615.94,747.106,99.4982,0,0,1,0,0,100,0),
(30089520,67,-8613.66,744.388,101.902,0,0,1,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;