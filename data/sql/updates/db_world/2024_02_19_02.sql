DELETE FROM `creature_text` WHERE `CreatureId` = 2307;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(2307,0,0,'Your undeath is not the end of your life, but the beginning. It is up to you to decide where your fate lies now.',12,33,100,0,0,0,583,0,'Caretaker Caice'),
(2307,0,1,'You are free of His control. And while you will be judged by lesser beings, at least you have chances that the Scourge do not!',12,33,100,0,0,0,584,0,'Caretaker Caice'),
(2307,0,2,'Terror, darkness, power? The Forsaken crave not these things; the Forsaken ARE these things.',12,33,100,0,0,0,585,0,'Caretaker Caice'),
(2307,0,3,'My bones are weak, my eyes see only darkness, and my body feels only pain; but these things are good because my will is my own.',12,33,100,0,0,0,586,0,'Caretaker Caice');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 2307;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 2307;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2307,0,0,0,10,0,100,0,1,10,30000,120000,1,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Caretaker Caice - OOC LOS - Say Line 0');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 2307;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,2307,0,0,16,0,16,0,0,0,0,0,'Creature ''Caretaker Caice'' - Group 0: Execute SAI ID 0 if invoker is Undead');
