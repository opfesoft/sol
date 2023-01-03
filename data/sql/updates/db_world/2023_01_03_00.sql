DELETE FROM `creature_text` WHERE `CreatureId` = 17000;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(17000,0,0,'Fools!  You seek to abjure my father''s presence?  Death awaits you, mortals!',12,0,100,0,0,0,13157,0,'Aggonis');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 17000;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 17000;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1700000;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17000,0,0,0,54,0,100,0,0,0,0,0,0,80,1700000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Aggonis - On Just Summoned - Call Timed Action List'),
(17000,0,1,0,0,0,100,0,9000,12000,27000,31000,0,11,21068,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Aggonis - IC - Cast ''Corruption'''),
(17000,0,2,0,0,0,100,0,17000,25000,17000,25000,0,11,22678,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Aggonis - IC - Cast ''Fear'''),

(1700000,9,0,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Aggonis - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1700000,9,1,0,0,0,100,0,0,0,0,0,0,11,24240,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Aggonis - On Script - Cast ''Spawn - Red Lightning'''),
(1700000,9,2,0,0,0,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Aggonis - On Script - Say Line 0'),
(1700000,9,3,0,0,0,100,0,4000,4000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Aggonis - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1700000,9,4,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Aggonis - On Script - Start Attack (Closest Player)');

UPDATE `creature` SET `position_x` = 414.73, `position_y` = 3462.97, `position_z` = 63.3927 WHERE `guid` = 59123;
