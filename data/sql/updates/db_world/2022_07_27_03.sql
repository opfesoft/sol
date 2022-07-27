UPDATE `creature_template` SET `gossip_menu_id` = 3803 WHERE `entry` = 10684;

DELETE FROM `gossip_menu` WHERE `MenuID` = 3803;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(3803,4635),
(3803,4636);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 10684;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10684,0,0,1,20,0,100,0,5248,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Remorseful Highborne - On Quest ''Tormented by the Past'' Rewarded - Set Active On'),
(10684,0,1,2,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Remorseful Highborne - Linked - Say Line 0'),
(10684,0,2,0,61,0,100,0,0,0,0,0,0,80,1068400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Remorseful Highborne - Linked - Call Timed Action List');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 3803;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,3803,4635,0,0,47,0,5248,64,0,1,0,0,'Remorseful Highborne - Group 0: Show gossip menu text 4635 if quest ''Tormented by the Past'' is not rewarded'),
(14,3803,4636,0,0,47,0,5248,64,0,0,0,0,'Remorseful Highborne - Group 0: Show gossip menu text 4636 if quest ''Tormented by the Past'' is rewarded');
