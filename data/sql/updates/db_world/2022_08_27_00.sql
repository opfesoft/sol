DELETE FROM `gossip_menu_option` WHERE `MenuID` = 2387;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(2387,0,0,'Um... sorry to bother you, but could I see Goodsteel''s ledger again... if you''re not using it.',5410,1,1,2386,0,0,0,'',0,0);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 9876;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 9876;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 173265;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 987600;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(173265,1,0,0,19,0,100,0,4450,0,0,0,0,70,60,0,0,0,0,0,14,47578,173266,0,0,0,0,0,0,'Wooden Outhouse - On Quest ''Ledger from Tanaris'' Accepted - Respawn GO ''Goodsteel Ledger'''),
(173265,1,1,0,62,0,100,0,2387,0,0,0,0,70,60,0,0,0,0,0,14,47578,173266,0,0,0,0,0,0,'Wooden Outhouse - On Gossip Option 0 Selected - Respawn GO ''Goodsteel Ledger'''),
(173265,1,2,3,20,0,100,0,4451,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Wooden Outhouse - On Quest ''The Key to Freedom'' Rewarded - Store Target 1 (Invoker)'),
(173265,1,3,0,61,0,100,0,0,0,0,0,0,12,9876,3,20000,0,0,0,8,0,0,0,0,-7026.11,-1784.73,265.782,2.11562,'Wooden Outhouse - Linked - Summon Creature ''Locheed'''),
(173265,1,4,5,17,0,100,0,9876,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Wooden Outhouse - On Summoned Unit ''Locheed'' - Send Target 1 (Invoker)'),
(173265,1,5,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Wooden Outhouse - Linked - Set Data 1 1 (Invoker)'),

(9876,0,0,0,38,0,100,0,1,1,0,0,0,80,987600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Locheed - On Data Set 1 1 - Call Timed Action List'),

(987600,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Locheed - On Script - Set Active On'),
(987600,9,1,0,0,0,100,0,1000,1000,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Locheed - On Script - Say Line 0'),
(987600,9,2,0,0,0,100,0,4000,4000,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Locheed - On Script - Say Line 1'),
(987600,9,3,0,0,0,100,0,6000,6000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-7165.31,-1802.59,272.783,0,'Locheed - On Script - Move To Position');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 2387;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,2387,0,0,0,2,0,11727,1,1,1,0,0,'Wooden Outhouse - Group 0: Show gossip option 0 if item ''Goodsteel Ledger'' is not in the inventory or in the bank'),
(15,2387,0,0,0,47,0,4450,8,0,0,0,0,'Wooden Outhouse - Group 0: Show gossip option 0 if quest ''Ledger from Tanaris'' is in progress');
