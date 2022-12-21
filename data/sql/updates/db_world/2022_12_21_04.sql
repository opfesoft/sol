DELETE FROM `gossip_menu_option` WHERE `MenuID` = 6529;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(6529,0,0,'Baristolth, I have lost my badge and require a replacement.',10679,1,1,0,0,0,0,'',0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 6529;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,6529,0,0,0,2,0,20402,1,1,1,0,0,'Creature ''Baristolth of the Shifting Sands'' - Group 0: Show gossip option 0 if item ''Agent of Nozdormu'' is not in the inventory or in the bank'),
(15,6529,0,0,0,47,0,8301,64,0,0,0,0,'Creature ''Baristolth of the Shifting Sands'' - Group 0: Show gossip option 0 if quest ''The Path of the Righteous'' is rewarded');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 15180;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 15180;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(15180,0,1,2,62,0,100,0,6529,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Baristolth of the Shifting Sands - On Gossip Option 0 Selected - Close Gossip'),
(15180,0,2,0,61,0,100,0,0,0,0,0,0,11,24727,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Baristolth of the Shifting Sands - On Link - Cast ''Lost Badge Agent of Nozdormu DND''');
