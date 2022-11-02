UPDATE `quest_template_addon` SET `SpecialFlags` = `SpecialFlags` | 2 WHERE `ID` = 9978;

DELETE FROM `gossip_menu` WHERE `MenuID` = 7704 AND `TextID` = 9406;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(7704,9406);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 18483;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (18482,18483);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1848200,1848201,1848202);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18482,0,0,1,11,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Respawn - Remove ''UNIT_NPC_FLAG_QUESTGIVER'''),
(18482,0,1,0,61,0,100,0,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - Linked - Set Invincibility HP 1'),
(18482,0,2,0,1,0,100,0,0,0,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - OOC - Cast ''Lightning Shield'''),
(18482,0,3,5,62,0,100,0,7704,0,0,0,0,80,1848200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Gossip Option 0 Selected - Call Timed Action List'),
(18482,0,4,5,62,0,100,0,7704,1,0,0,0,80,1848202,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Gossip Option 1 Selected - Call Timed Action List'),
(18482,0,5,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Empoor - Linked - Close Gossip'),
(18482,0,6,0,2,0,100,1,0,1,0,0,0,80,1848201,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - Between 0-1% Health - Call Timed Action List'),
(18482,0,7,0,0,0,100,0,3000,5000,9000,12000,0,11,12548,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Empoor - IC - Cast ''Frost Shock'''),
(18482,0,8,9,7,0,100,0,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Evade - Set Faction ''Friendly'''),
(18482,0,9,0,61,0,100,0,0,0,0,0,0,82,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - Linked - Add ''UNIT_NPC_FLAG_GOSSIP'''),

(1848200,9,0,0,0,0,100,0,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Script - Remove ''UNIT_NPC_FLAG_GOSSIP'''),
(1848200,9,1,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Empoor - On Script - Store Target 1 (Invoker)'),
(1848200,9,2,0,0,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,19,18483,0,0,0,0,0,0,0,'Empoor - On Script - Send Target 1 (Empoor''s Bodyguard)'),
(1848200,9,3,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Script - Say Line 0'),
(1848200,9,4,0,0,0,100,0,2000,2000,0,0,0,2,1679,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Script - Set Faction ''Broken'''),
(1848200,9,5,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,18483,0,0,0,0,0,0,0,'Empoor - On Script - Set Data 1 1 (Empoor''s Bodyguard)'),
(1848200,9,6,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Empoor - On Script - Start Attack (Stored Target 1)'),

(1848201,9,0,0,0,0,100,0,0,0,0,0,0,239,600000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Script - Stop WP Movement'),
(1848201,9,1,0,0,0,100,0,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Script - Set Faction ''Friendly'''),
(1848201,9,2,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Script - Evade'),
(1848201,9,3,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,19,18483,0,0,0,0,0,0,0,'Empoor - On Script - Set Data 2 2 (Empoor''s Bodyguard)'),
(1848201,9,4,0,0,0,100,0,0,0,0,0,0,26,9978,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Empoor - On Script - Complete Quest ''By Any Means Necessary'' (Stored Target 1)'),
(1848201,9,5,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Script - Add ''UNIT_NPC_FLAG_QUESTGIVER'''),
(1848201,9,6,0,0,0,100,0,60000,60000,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Script - Remove ''UNIT_NPC_FLAG_QUESTGIVER'''),
(1848201,9,7,0,0,0,100,0,0,0,0,0,0,239,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Script - Resume WP Path'),
(1848201,9,8,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Script - Say Line 1'),

(1848202,9,0,0,0,0,100,0,0,0,0,0,0,239,600000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Script - Stop WP Movement'),
(1848202,9,1,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Script - Add ''UNIT_NPC_FLAG_QUESTGIVER'''),
(1848202,9,2,0,0,0,100,0,60000,60000,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Script - Remove ''UNIT_NPC_FLAG_QUESTGIVER'''),
(1848202,9,3,0,0,0,100,0,0,0,0,0,0,239,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Script - Resume WP Path'),
(1848202,9,4,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor - On Script - Say Line 1'),

(18483,0,0,1,38,0,100,0,1,1,0,0,0,2,1679,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor''s Bodyguard - On Data Set 1 1 - Set Faction ''Broken'''),
(18483,0,1,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Empoor''s Bodyguard - Linked - Start Attack (Stored Target 1)'),
(18483,0,2,3,38,0,100,0,2,2,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor''s Bodyguard - On Data Set 2 2 - Set Faction ''Friendly'''),
(18483,0,3,0,61,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor''s Bodyguard - Linked - Evade'),
(18483,0,4,0,0,0,100,0,3000,5000,10000,14000,0,11,11977,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Empoor''s Bodyguard - IC - Cast ''Rend'''),
(18483,0,5,0,0,0,100,0,5000,7000,15000,20000,0,11,13730,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor''s Bodyguard - IC - Cast ''Demoralizing Shout'''),
(18483,0,6,0,7,0,100,0,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Empoor''s Bodyguard - On Evade - Set Faction ''Friendly''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 7704;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,7704,9406,0,0,47,0,9978,2,0,0,0,0,'Empoor - Group 0: Show gossip text 9406 if quest ''By Any Means Necessary'' is completed'),
(14,7704,9425,0,0,47,0,9978,64,0,0,0,0,'Empoor - Group 0: Show gossip text 9425 if quest ''By Any Means Necessary'' is rewarded'),

(15,7704,0,0,0,47,0,9978,8,0,0,0,0,'Empoor - Group 0: Show gossip option 0 if quest ''By Any Means Necessary'' is in progress'),

(15,7704,1,0,0,47,0,9978,66,0,0,0,0,'Empoor - Group 0: Show gossip option 1 if quest ''By Any Means Necessary'' is completed or rewarded'),
(15,7704,1,0,0,47,0,9979,1,0,0,0,0,'Empoor - Group 0: Show gossip option 1 if quest ''Wind Trader Lathrai'' is not taken'),
(15,7704,1,0,0,153,1,2,2,0,1,0,0,'Empoor - Group 0: Show gossip option 1 if unit has no flag ''UNIT_NPC_FLAG_QUESTGIVER''');
