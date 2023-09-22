DELETE FROM `creature_text` WHERE `CreatureId` = 18302;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(18302,0,0,'Greatmother, please drink this water.',12,1,100,1,0,0,15139,0,'Matron Drakia'),
(18302,0,1,'Greatmother, is there anything I can do?',12,1,100,1,0,0,15142,0,'Matron Drakia'),
(18302,0,2,'Greatmother, Garrosh has lost his heart. We are lost without you.',12,1,100,1,0,0,15143,0,'Matron Drakia'),
(18302,0,3,'I will do my best to take care of the children, Greatmother.',12,1,100,1,0,0,15144,0,'Matron Drakia');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 18302;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 18302;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1830200,1830201,1830202);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18302,0,0,0,34,0,100,0,2,1,0,0,0,80,1830200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matron Drakia - On WP 2 Reached - Call Timed Action List'),
(18302,0,1,0,34,0,100,0,2,3,0,0,0,80,1830201,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matron Drakia - On WP 4 Reached - Call Timed Action List'),
(18302,0,2,0,34,0,100,0,2,8,0,0,0,80,1830201,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matron Drakia - On WP 9 Reached - Call Timed Action List'),
(18302,0,3,0,34,0,100,0,2,10,0,0,0,80,1830201,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matron Drakia - On WP 11 Reached - Call Timed Action List'),
(18302,0,4,0,34,0,100,0,2,13,0,0,0,80,1830201,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matron Drakia - On WP 14 Reached - Call Timed Action List'),
(18302,0,5,0,34,0,100,0,2,15,0,0,0,80,1830201,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matron Drakia - On WP 16 Reached - Call Timed Action List'),
(18302,0,6,0,34,0,100,0,2,17,0,0,0,80,1830201,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matron Drakia - On WP 18 Reached - Call Timed Action List'),
(18302,0,7,0,34,0,100,0,2,21,0,0,0,80,1830202,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matron Drakia - On WP 22 Reached - Call Timed Action List'),
(18302,0,8,0,34,0,100,0,2,25,0,0,0,80,1830202,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matron Drakia - On WP 26 Reached - Call Timed Action List'),
(18302,0,9,0,34,0,100,0,2,29,0,0,0,80,1830202,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matron Drakia - On WP 30 Reached - Call Timed Action List'),

(1830200,9,0,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matron Drakia - On Script - Say Line 0 (CONDITION_NEAR_UNIT)'),

(1830201,9,0,0,0,0,100,0,2000,2000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matron Drakia - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(1830201,9,1,0,0,0,100,0,11000,11000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matron Drakia - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),

(1830202,9,0,0,0,0,100,0,2000,2000,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matron Drakia - On Script - Set Emote State ''STATE_USESTANDING'''),
(1830202,9,1,0,0,0,100,0,11000,11000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matron Drakia - On Script - Set Emote State ''ONESHOT_NONE''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 1830200;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,1830200,9,0,29,1,19556,100,0,1,0,0,'Creature ''Matron Drakia'' - Group 0: Execute SAI ID 0 if not near creature ''Thrall''');

DELETE FROM `waypoint_scripts` WHERE `id` BETWEEN 74 AND 79;
DELETE FROM `waypoint_data` WHERE `id` = 656380;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(656380,1,-1213.86,7158.84,57.3901,NULL,0,0,0,0,100,0),
(656380,2,-1220.25,7164.88,57.2655,3.97197,30000,0,0,0,100,0),
(656380,3,-1221.41,7171.93,57.2655,NULL,0,0,0,0,100,0),
(656380,4,-1223.34,7183.68,57.2655,NULL,15000,0,0,0,100,0),
(656380,5,-1218.65,7176.43,57.2655,NULL,0,0,0,0,100,0),
(656380,6,-1213.08,7167.81,57.2655,NULL,0,0,0,0,100,0),
(656380,7,-1207.5,7159.19,57.2655,NULL,0,0,0,0,100,0),
(656380,8,-1203.7,7153.32,57.2655,NULL,0,0,0,0,100,0),
(656380,9,-1201.33,7149.65,57.2655,5.61886,15000,0,0,0,100,0),
(656380,10,-1207.93,7142.88,57.2655,NULL,0,0,0,0,100,0),
(656380,11,-1214.41,7136.23,57.2655,4.86472,15000,0,0,0,100,0),
(656380,12,-1222.29,7137.16,57.2655,NULL,0,0,0,0,100,0),
(656380,13,-1234.35,7138.59,57.2655,NULL,0,0,0,0,100,0),
(656380,14,-1242.03,7139.5,57.2655,3.89751,15000,0,0,0,100,0),
(656380,15,-1234.17,7143.58,57.2655,NULL,0,0,0,0,100,0),
(656380,16,-1228.82,7152.05,57.2655,NULL,15000,0,0,0,100,0),
(656380,17,-1219.64,7149.06,57.2655,NULL,0,0,0,0,100,0),
(656380,18,-1218.98,7153.91,57.2655,2.47082,15000,0,0,0,100,0),
(656380,19,-1211.92,7157.92,57.2654,NULL,0,0,0,0,100,0),
(656380,20,-1212.55,7165.6,57.2654,NULL,0,0,0,0,100,0),
(656380,21,-1213.23,7173.85,57.2654,NULL,0,0,0,0,100,0),
(656380,22,-1213.81,7180.82,57.2654,NULL,15000,0,0,0,100,0),
(656380,23,-1222.17,7176.18,57.2654,NULL,0,0,0,0,100,0),
(656380,24,-1229.81,7171.94,57.2654,NULL,0,0,0,0,100,0),
(656380,25,-1237.88,7167.47,57.2654,NULL,0,0,0,0,100,0),
(656380,26,-1249.71,7160.9,57.2654,NULL,15000,0,0,0,100,0),
(656380,27,-1244.26,7155.62,57.2654,NULL,0,0,0,0,100,0),
(656380,28,-1238.06,7149.61,57.2654,NULL,0,0,0,0,100,0),
(656380,29,-1230.35,7142.14,57.2654,NULL,0,0,0,0,100,0),
(656380,30,-1221.64,7133.69,57.2654,NULL,15000,0,0,0,100,0),
(656380,31,-1218.64,7143.39,57.2654,NULL,0,0,0,0,100,0),
(656380,32,-1215.78,7152.65,57.2654,NULL,0,0,0,0,100,0);
