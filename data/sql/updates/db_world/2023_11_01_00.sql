UPDATE `creature_template` SET `InhabitType` = 7 WHERE `entry` = 8392;
UPDATE `gameobject` SET `spawntimesecs` = 0 WHERE `guid` IN (48450,48452,48453,48455);

DELETE FROM `creature_template_addon` WHERE `entry` = 8392;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(8392,0,22601,0,0,0,0,NULL);

DELETE FROM `event_scripts` WHERE `id` = 3084;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(3084,10,10,8392,0,8,2246.33,-7275.52,22.7463,1.37791);

DELETE FROM `creature_text` WHERE `CreatureId` = 8392;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(8392,0,0,'Been waitin'' for ya, $n. Glad to see you''ve come through. Do you have the shipment?',12,7,100,3,0,0,4406,0,'Pilot Xiggs Fuselighter'),
(8392,1,0,'I''ve been here long enough, $n. I''m sure we''ll meet again. Good luck!',12,7,100,3,0,0,4379,0,'Pilot Xiggs Fuselighter');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 8392;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 8392;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 839200;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8392,0,0,1,54,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Pilot Xiggs Fuselighter - On Just Summoned - Store Target 1 (Invoker)'),
(8392,0,1,2,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pilot Xiggs Fuselighter - Linked - Set Active On'),
(8392,0,2,3,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pilot Xiggs Fuselighter - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(8392,0,3,4,61,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pilot Xiggs Fuselighter - Linked - Remove NPC Flags'),
(8392,0,4,0,61,0,100,0,0,0,0,0,0,53,1,839200,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pilot Xiggs Fuselighter - Linked - Start WP Movement'),
(8392,0,5,0,58,0,100,0,0,839200,0,0,0,80,839200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pilot Xiggs Fuselighter - On WP Path Ended - Call Timed Action List'),

(839200,9,0,0,0,0,100,0,2000,2000,0,0,0,43,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pilot Xiggs Fuselighter - On Script - Dismount'),
(839200,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Pilot Xiggs Fuselighter - On Script - Set Orientation (Stored Target 1)'),
(839200,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Pilot Xiggs Fuselighter - On Script - Say Line 0'),
(839200,9,3,0,0,0,100,0,0,0,0,0,0,82,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pilot Xiggs Fuselighter - On Script - Restore NPC Flags'),
(839200,9,4,0,0,0,100,0,120000,120000,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Pilot Xiggs Fuselighter - On Script - Say Line 1'),
(839200,9,5,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pilot Xiggs Fuselighter - On Script - Remove NPC Flags'),
(839200,9,6,0,0,0,100,0,5000,5000,0,0,0,43,0,22601,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pilot Xiggs Fuselighter - On Script - Mount'),
(839200,9,7,0,0,0,100,0,2000,2000,0,0,0,53,1,839201,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pilot Xiggs Fuselighter - On Script - Start WP Movement'),
(839200,9,8,0,0,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pilot Xiggs Fuselighter - On Script - Force Despawn');

DELETE FROM `waypoints` WHERE `entry` IN (839200,839201);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(839200,1,2258.63,-7243,16.8632,'Pilot Xiggs Fuselighter (Arrival)'),
(839200,2,2253.77,-7222.4,14.1592,NULL),

(839201,1,2258.63,-7243,16.8632,'Pilot Xiggs Fuselighter (Departure)'),
(839201,2,2246.33,-7275.52,22.7463,NULL);
