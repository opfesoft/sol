UPDATE `creature_text` SET `Language` = 1, `Emote` = 1 WHERE `CreatureID` IN (16923,18926);
UPDATE `creature` SET `MovementType` = 0 WHERE `guid` IN (67954,58701);
UPDATE `creature_addon` SET `path_id` = 0 WHERE `guid` IN (67954,58701);
DELETE FROM `waypoint_data` WHERE `id` IN (679540,587010);
DELETE FROM `waypoint_scripts` WHERE `id` IN (160,70);

DELETE FROM `creature_text` WHERE `CreatureId` = 18929;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(18929,0,0,'If only I had some wine to go with my cheese...',12,1,100,18,0,0,16093,0,'Kyrenna'),
(18929,1,0,'The hours would pass so much more sweetly.',12,1,100,1,0,0,16096,0,'Kyrenna'),
(18929,2,0,'Ooh what a dreadful job!',12,1,100,1,0,0,16094,0,'Kyrenna'),
(18929,3,0,'All day, surrounded by the stench of bad feet.',12,1,100,1,0,0,16095,0,'Kyrenna'),
(18929,4,0,'Why couldn''t mother have chosen something else to dedicate herself to?',12,1,100,1,0,0,16097,0,'Kyrenna'),
(18929,5,0,'Cakes, pastries, even bread - anything but cheese!',12,1,100,1,0,0,16098,0,'Kyrenna');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (16923,18926);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (16923,18926,18929);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1892600,1892601,1892900,1892901,1892902);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16923,0,0,0,1,0,100,0,180000,360000,180000,360000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Novice Ranger - OOC - Say Line 0'),

(18926,0,0,0,1,0,100,0,180000,360000,180000,360000,0,87,1892600,1892601,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sleyin - OOC - Call Random Timed Action List'),

(1892600,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sleyin - On Script - Say Line 0'),
(1892600,9,1,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sleyin - On Script - Say Line 1'),

(1892601,9,0,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sleyin - On Script - Say Line 2'),
(1892601,9,1,0,0,0,100,0,4000,4000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sleyin - On Script - Say Line 3'),

(18929,0,0,0,1,0,100,0,180000,360000,180000,360000,0,88,1892900,1892902,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kyrenna - OOC - Call Random Range Timed Action List'),

(1892900,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kyrenna - On Script - Say Line 0'),
(1892900,9,1,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kyrenna - On Script - Say Line 1'),

(1892901,9,0,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kyrenna - On Script - Say Line 2'),
(1892901,9,1,0,0,0,100,0,3000,3000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kyrenna - On Script - Say Line 3'),

(1892902,9,0,0,0,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kyrenna - On Script - Say Line 4'),
(1892902,9,1,0,0,0,100,0,5000,5000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kyrenna - On Script - Say Line 5');
