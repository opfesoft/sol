UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 68083;
DELETE FROM `creature_addon` WHERE `guid` = 68083;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(68083,680830,0,0,1,0,0,NULL);

DELETE FROM `creature_text` WHERE `CreatureId` = 18954;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(18954,0,0,'Foul deeds, these.',12,0,100,1,0,0,16102,0,'Sailor Melinan'),
(18954,0,1,'Luckily, I managed to salvage a few bottles.',12,0,100,1,0,0,16103,0,'Sailor Melinan'),
(18954,0,2,'Hic... What a calim... a culamu... uhh calamit... Err, what a disaster!',12,0,100,1,0,0,16105,0,'Sailor Melinan'),
(18954,0,3,'It''s enough to drive a man to drink.',12,0,100,1,0,0,16106,0,'Sailor Melinan');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 18954;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 18954;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1895400;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18954,0,0,0,34,0,100,0,2,10,0,0,0,80,1895400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sailor Melinan - On WP 11 Reached - Call Timed Action List'),

(1895400,9,0,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sailor Melinan - On Script - Say Line 0'),
(1895400,9,1,0,0,0,100,0,6000,6000,0,0,0,5,92,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sailor Melinan - On Script - Play Emote ''ONESHOT_EAT_NOSHEATHE''');

DELETE FROM `waypoint_data` WHERE `id` = 680830;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(680830,1,8843.81,-6286.78,9.2832,3.66519,240000,0,0,0,100,0),
(680830,2,8848.57,-6288.84,9.00608,NULL,0,0,0,0,100,0),
(680830,3,8853.23,-6290.86,8.56591,NULL,0,0,0,0,100,0),
(680830,4,8858.36,-6290.49,7.63317,NULL,0,0,0,0,100,0),
(680830,5,8862.21,-6290.21,6.79738,NULL,0,0,0,0,100,0),
(680830,6,8869.06,-6286.7,5.32811,NULL,0,0,0,0,100,0),
(680830,7,8875.48,-6283.41,3.87585,NULL,30000,0,0,0,100,0),
(680830,8,8868.76,-6286.59,5.39864,NULL,0,0,0,0,100,0),
(680830,9,8861.55,-6288.8,6.90305,NULL,0,0,0,0,100,0),
(680830,10,8858.57,-6287.77,7.50192,NULL,0,0,0,0,100,0),
(680830,11,8854.93,-6286.51,8.02256,1.69354,12000,0,0,0,100,0),
(680830,12,8849.55,-6286.64,8.65396,NULL,0,0,0,0,100,0);
