UPDATE `creature_text` SET `Language` = 7, `Emote` = 16 WHERE `CreatureID` = 6173 AND `GroupID` = 0 AND `ID` = 0;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (5489,6171,6173);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 6171;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (548900,617300);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6171,0,0,0,19,0,100,0,1781,0,0,0,0,80,548900,0,0,0,0,0,19,5489,0,0,0,0,0,0,0,'Duthorian Rall - On Quest ''The Tome of Divinity'' Accepted - Call Timed Action List (Brother Joshua)'),

(548900,9,0,0,0,0,100,0,0,0,0,0,0,11,8596,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brother Joshua - On Script - Cast ''Heal Visual (DND)'''),
(548900,9,1,0,0,0,100,0,4500,4500,0,0,0,80,617300,0,0,0,0,0,19,6173,0,0,0,0,0,0,0,'Brother Joshua - On Script - Call Timed Action List (Gazin Tenorm)'),

(617300,9,0,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,19,5489,0,0,0,0,0,0,0,'Gazin Tenorm - On Script - Set Orientation (Brother Joshua)'),
(617300,9,1,0,0,0,100,0,2000,2000,0,0,0,1,0,0,1,0,0,0,19,5489,0,0,0,0,0,0,0,'Gazin Tenorm - On Script - Say Line 0'),
(617300,9,2,0,0,0,100,0,3000,3000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gazin Tenorm - On Script - Reset Orientation');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 8596;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,8596,0,0,31,0,3,6173,0,0,0,0,'Spell ''Heal Visual (DND)'' - Group 0: Implicit target creature ''Gazin Tenorm''');
