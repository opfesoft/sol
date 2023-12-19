UPDATE `gameobject` SET `position_x` = -281.944, `position_y` = 7238.6, `position_z` = 24.7725 WHERE `guid` = 99924;
UPDATE `creature_template` SET `unit_flags` = 768 WHERE `entry` = 18186;

DELETE FROM `event_scripts` WHERE `id` = 11413;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(11413,0,10,18185,60000,1,-301.42,7247.97,30.92,5.86),
(11413,0,10,18186,60000,1,-281.944,7238.6,24.7725,2.69317);

DELETE FROM `creature_text` WHERE `CreatureId` = 18185;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(18185,0,0,'The %s hisses loudly and prepares to attack.',16,0,100,0,0,0,14853,0,'Feralfen Serpent Spirit');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (18185,18186);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (18185,18186);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1818500;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18185,0,0,1,54,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Feralfen Serpent Spirit - On Just Summoned - Store Target 1 (Invoker)'),
(18185,0,1,0,61,0,100,0,0,0,0,0,0,80,1818500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feralfen Serpent Spirit - Linked - Call Timed Action List'),

(1818500,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feralfen Serpent Spirit - On Script - Set Active On'),
(1818500,9,1,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feralfen Serpent Spirit - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1818500,9,2,0,0,0,100,0,1500,1500,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feralfen Serpent Spirit - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1818500,9,3,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feralfen Serpent Spirit - On Script - Say Line 0'),
(1818500,9,4,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Feralfen Serpent Spirit - On Script - Start Attack (Stored Target 1)'),

(18186,0,0,0,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feralfen Totem - On Just Summoned - Set Active On');
