UPDATE `npc_text` SET `text0_0` = 'If you have not spoken to Magistrix Erona at the Sunspire, I recommend you do so immediately.  There are pressing matters to attend to, and she - as do we all - need your help!', `BroadcastTextID0` = 10999, `Probability0` = 1, `em0_0` = 1 WHERE `ID` = 7868;

DELETE FROM `gossip_menu` WHERE `MenuID` = 6570 AND `TextID` IN (7785,7868);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(6570,7785),
(6570,7868);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 6570;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,6570,7868,0,0,47,0,8327,74,0,1,0,0,'Lanthan Perilon - Group 0: Show gossip text 7868 if quest ''Report to Lanthan Perilon'' is not completed, in progress or rewarded'),
(14,6570,7868,0,0,47,0,8335,64,0,1,0,0,'Lanthan Perilon - Group 0: Show gossip text 7868 if quest ''Felendren the Banished'' is not rewarded'),

(14,6570,7785,0,0,47,0,8327,74,0,0,0,0,'Lanthan Perilon - Group 0: Show gossip text 7785 if quest ''Report to Lanthan Perilon'' is completed, in progress or rewarded'),
(14,6570,7785,0,0,47,0,8335,64,0,1,0,0,'Lanthan Perilon - Group 0: Show gossip text 7785 if quest ''Felendren the Banished'' is not rewarded'),

(14,6570,7869,0,0,47,0,8335,64,0,0,0,0,'Lanthan Perilon - Group 0: Show gossip text 7869 if quest ''Felendren the Banished'' is rewarded');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 15281;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(15281,0,0,0,0,0,100,0,0,0,3400,4800,0,11,20811,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lanthan Perilon - IC - Cast ''Fireball'''),
(15281,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Lanthan Perilon - Between 0-15% Health - Flee For Assist (No Repeat)');
