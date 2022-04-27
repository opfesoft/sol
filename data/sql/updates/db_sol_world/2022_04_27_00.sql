-- DB update 2022_04_26_02 -> 2022_04_27_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_26_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_26_02 2022_04_27_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1651096105483741593'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1651096105483741593');

UPDATE `creature_template` SET `speed_walk` = 1 WHERE `entry` IN (20098,20100,20244);

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 71940;

DELETE FROM `creature_addon` WHERE `guid` = 71940;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(71940,719400,0,0,0,0,0,NULL);

DELETE FROM `creature_text` WHERE `CreatureId` IN (20098,20100,20244);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(20098,0,0,'I''m right here, daddy. You''ve been asleep all day long. You sure must be tired!',12,10,100,1,0,0,17598,0,'Jane'),
(20098,1,0,'%s resumes playing on the beach.',16,10,100,0,0,0,17599,0,'Jane'),

(20100,0,0,'%s wakes up, startled.',16,10,100,0,0,0,17595,0,'Jessel'),
(20100,1,0,'Was... Was it all a dream? Azuremyst, Bloodmyst, Zangarmarsh, Shadowmoon... even Zul''Aman... Jane! Jane where are you!',12,10,100,1,0,0,17596,0,'Jessel'),
(20100,2,0,'Ah, wonderful. It was all just a dream...',12,10,100,1,0,0,17597,0,'Jessel'),

(20244,0,0,'%s picks up a sea shell.',16,10,100,0,0,0,17922,0,'Nova'),
(20244,1,0,'%s shakes the dirt loose from the shell.',16,10,100,0,0,0,17924,0,'Nova'),
(20244,2,0,'Oooh! Look, a shiny one!',12,10,100,1,0,0,17920,0,'Nova'),
(20244,3,0,'Jane will love this one!',12,10,100,1,0,0,17921,0,'Nova'),
(20244,4,0,'%s holds a sea shell up to her ear.',16,10,100,0,0,0,17923,0,'Nova'),
(20244,5,0,'Can you really hear the ocean from one of these shells?',12,10,100,1,0,0,17919,0,'Nova'),
(20244,6,0,'I think I can see the Sunwell from here!',12,10,100,1,0,0,17918,0,'Nova');

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (71940,71601);
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`)
VALUES
(71940,71940,0,0,0),
(71940,71941,1,90,0),

(71601,71601,0,0,0),
(71601,71942,1,90,0);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 20244;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (20098,20100,20244);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2010000,2024400,2024401,2024402,2024403,2024404);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20098,0,0,0,11,0,100,0,0,0,0,0,0,89,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jane - On Respawn - Enable Random Movement'),
(20098,0,1,2,1,0,100,0,240000,360000,240000,360000,0,45,1,1,0,0,0,0,19,20100,0,0,0,0,0,0,0,'Jane - OOC - Set Data 1 1 (Jessel)'),
(20098,0,2,0,61,0,100,0,0,0,0,0,0,89,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jane - Linked - Disable Random Movement'),
(20098,0,3,0,38,0,100,0,1,1,0,0,0,66,0,0,0,0,0,0,19,20100,0,0,0,0,0,0,0,'Jane - On Data Set 1 1 - Set Orientation (Jessel)'),
(20098,0,4,5,38,0,100,0,2,2,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jane - On Data Set 2 2 - Set Run Off'),
(20098,0,5,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,10515.7,-6496.69,3.55295,0,'Jane - On Data Set 2 2 - Move To Point 1'),
(20098,0,6,0,34,0,100,0,8,1,0,0,0,89,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jane - On Point 1 Reached - Enable Random Movement'),

(20100,0,0,0,38,0,100,0,1,1,0,0,0,80,2010000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessel - On Data Set 1 1 - Call Timed Action List'),

(2010000,9,0,0,0,0,100,0,10000,10000,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessel - On Script - Clear Unit Stand State'),
(2010000,9,1,0,0,0,100,0,0,0,0,0,0,90,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessel - On Script -  Set ''UNIT_STAND_STATE_SIT'''),
(2010000,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessel - On Script - Say Line 0'),
(2010000,9,3,0,0,0,100,0,3000,3000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessel - On Script - Say Line 1'),
(2010000,9,4,0,0,0,100,0,9000,9000,0,0,0,45,1,1,0,0,0,0,19,20098,0,0,0,0,0,0,0,'Jessel - On Script - Set Data 1 1 (Jane)'),
(2010000,9,5,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,19,20098,0,0,0,0,0,0,0,'Jessel - On Script - Say Line 0 (Jane)'),
(2010000,9,6,0,0,0,100,0,6000,6000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessel - On Script - Say Line 2'),
(2010000,9,7,0,0,0,100,0,6000,6000,0,0,0,45,2,2,0,0,0,0,19,20098,0,0,0,0,0,0,0,'Jessel - On Script - Set Data 2 2 (Jane)'),
(2010000,9,8,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,19,20098,0,0,0,0,0,0,0,'Jessel - On Script - Say Line 1 (Jane)'),
(2010000,9,9,0,0,0,100,0,3000,3000,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessel - On Script - Clear Unit Stand State'),
(2010000,9,10,0,0,0,100,0,0,0,0,0,0,90,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessel - On Script -  Set ''UNIT_STAND_STATE_SLEEP'''),

(20244,0,0,0,34,0,100,0,2,2,0,0,0,80,2024400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nova - On WP 3 Reached - Call Timed Action List'),
(20244,0,1,0,34,0,100,0,2,7,0,0,0,80,2024400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nova - On WP 8 Reached - Call Timed Action List'),
(20244,0,2,0,34,0,100,0,2,3,0,0,0,87,2024401,2024401,2024401,2024401,2024402,2024403,1,0,0,0,0,0,0,0,0,'Nova - On WP 4 Reached - Call Random Timed Action List'),
(20244,0,3,0,34,0,100,0,2,4,0,0,0,87,2024401,2024401,2024401,2024401,2024402,2024403,1,0,0,0,0,0,0,0,0,'Nova - On WP 5 Reached - Call Random Timed Action List'),
(20244,0,4,0,34,0,100,0,2,10,0,0,0,87,2024401,2024401,2024401,2024401,2024402,2024403,1,0,0,0,0,0,0,0,0,'Nova - On WP 11 Reached - Call Random Timed Action List'),
(20244,0,5,0,34,0,100,0,2,18,0,0,0,87,2024401,2024401,2024401,2024401,2024402,2024403,1,0,0,0,0,0,0,0,0,'Nova - On WP 19 Reached - Call Random Timed Action List'),
(20244,0,6,0,34,0,100,0,2,19,0,0,0,87,2024401,2024401,2024401,2024401,2024402,2024403,1,0,0,0,0,0,0,0,0,'Nova - On WP 20 Reached - Call Random Timed Action List'),
(20244,0,7,0,34,0,100,0,2,22,0,0,0,80,2024400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nova - On WP 23 Reached - Call Timed Action List'),
(20244,0,8,0,34,0,100,0,2,26,0,0,0,87,2024401,2024401,2024401,2024401,2024402,2024403,1,0,0,0,0,0,0,0,0,'Nova - On WP 27 Reached - Call Random Timed Action List'),
(20244,0,9,0,34,0,100,0,2,27,0,0,0,80,2024404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nova - On WP 28 Reached - Call Timed Action List'),

(2024400,9,0,0,0,0,100,0,5000,10000,0,0,0,239,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nova - On Script - Resume WP Path After 5 Seconds'),

(2024401,9,0,0,0,0,100,0,5000,10000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nova - On Script - Say Line 0'),
(2024401,9,1,0,0,0,100,0,15000,30000,0,0,0,239,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nova - On Script - Resume WP Path After 5 Seconds'),

(2024402,9,0,0,0,0,100,0,5000,10000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nova - On Script - Say Line 0'),
(2024402,9,1,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nova - On Script - Say Line 1'),
(2024402,9,2,0,0,0,100,0,3000,3000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nova - On Script - Say Line 2'),
(2024402,9,3,0,0,0,100,0,3000,3000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nova - On Script - Say Line 3'),
(2024402,9,4,0,0,0,100,0,15000,30000,0,0,0,239,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nova - On Script - Resume WP Path After 5 Seconds'),

(2024403,9,0,0,0,0,100,0,5000,10000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nova - On Script - Say Line 4'),
(2024403,9,1,0,0,0,100,0,3000,3000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nova - On Script - Say Line 5'),
(2024403,9,2,0,0,0,100,0,15000,30000,0,0,0,239,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nova - On Script - Resume WP Path After 5 Seconds'),

(2024404,9,0,0,0,0,100,0,5000,10000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nova - On Script - Say Line 6'),
(2024404,9,1,0,0,0,100,0,15000,30000,0,0,0,239,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nova - On Script - Resume WP Path After 5 Seconds');

DELETE FROM `waypoint_data` WHERE `id` = 719400;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(719400,1,10531.1,-6494.48,1.16296,0,0,0,2,0,100,0),
(719400,2,10530.6,-6489.26,2.04983,0,0,0,2,0,100,0),
(719400,3,10531.9,-6485.03,2.14653,0,70000,0,2,0,100,0),
(719400,4,10536.2,-6481.79,1.24519,0,70000,0,2,0,100,0),
(719400,5,10535.1,-6488.11,0.995133,0,70000,0,2,0,100,0),
(719400,6,10531.2,-6487.53,2.10574,0,0,0,2,0,100,0),
(719400,7,10526.5,-6487.65,2.96771,0,0,0,2,0,100,0),
(719400,8,10523,-6489.92,3.282,0,70000,0,2,0,100,0),
(719400,9,10522.3,-6494.87,2.89422,0,0,0,2,0,100,0),
(719400,10,10525.3,-6497.42,1.95442,0,0,0,2,0,100,0),
(719400,11,10527.6,-6500.38,0.739692,0,70000,0,2,0,100,0),
(719400,12,10526.9,-6496.35,1.83127,0,0,0,2,0,100,0),
(719400,13,10523.4,-6493.16,2.93201,0,0,0,2,0,100,0),
(719400,14,10519.4,-6492.02,3.56931,0,0,0,2,0,100,0),
(719400,15,10514.9,-6493.32,4.0837,0,0,0,2,0,100,0),
(719400,16,10511.7,-6496.6,4.1223,0,0,0,2,0,100,0),
(719400,17,10511.3,-6501.71,3.37306,0,0,0,2,0,100,0),
(719400,18,10511.2,-6505.91,2.61817,0,0,0,2,0,100,0),
(719400,19,10511.5,-6509.86,1.38843,0,70000,0,2,0,100,0),
(719400,20,10506,-6513.16,1.52988,0,70000,0,2,0,100,0),
(719400,21,10503.2,-6511.23,2.74463,0,0,0,2,0,100,0),
(719400,22,10506.6,-6508.03,2.94937,0,0,0,2,0,100,0),
(719400,23,10514.1,-6506.4,1.93042,0,70000,0,2,0,100,0),
(719400,24,10516,-6501.36,2.81388,0,0,0,2,0,100,0),
(719400,25,10518.5,-6497.19,3.10124,0,0,0,2,0,100,0),
(719400,26,10522.6,-6498.26,2.33761,0,0,0,2,0,100,0),
(719400,27,10527.2,-6498.78,1.23314,0,70000,0,2,0,100,0),
(719400,28,10530.8,-6497.85,0.516348,5.91613,70000,0,2,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
