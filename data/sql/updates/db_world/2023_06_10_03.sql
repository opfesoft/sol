DELETE FROM `gossip_menu_option` WHERE `MenuID` = 30201;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(30201,0,0,'Greetings, ancient one. I have done all that has been asked of me. I now ask that you grant me Rhok''delar.',10784,1,1,0,0,0,0,'',0,0),
(30201,1,0,'Greetings, ancient one. I have done all that has been asked of me. I now ask that you grant me Lok''delar.',10785,1,1,0,0,0,0,'',0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 30201;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,30201,0,0,0,47,0,7635,64,0,0,0,0,'Creature ''Vartrus the Ancient'' - Group 0: Show gossip option 0 if quest ''A Proper String'' is rewarded'),
(15,30201,0,0,0,47,0,7636,64,0,0,0,0,'Creature ''Vartrus the Ancient'' - Group 0: Show gossip option 0 if quest ''Stave of the Ancients'' is rewarded'),
(15,30201,0,0,0,2,0,18713,1,1,1,0,0,'Creature ''Vartrus the Ancient'' - Group 0: Show gossip option 0 if item ''Rhok''delar, Longbow of the Ancient Keepers'' is not in the inventory or in the bank'),
(15,30201,0,0,0,2,0,18707,1,1,1,0,0,'Creature ''Vartrus the Ancient'' - Group 0: Show gossip option 0 if item ''Ancient Rune Etched Stave'' is not in the inventory or in the bank'),
(15,30201,0,0,0,2,0,18724,1,1,1,0,0,'Creature ''Vartrus the Ancient'' - Group 0: Show gossip option 0 if item ''Enchanted Black Dragon Sinew'' is not in the inventory or in the bank'),

(15,30201,1,0,0,47,0,7635,64,0,0,0,0,'Creature ''Vartrus the Ancient'' - Group 0: Show gossip option 1 if quest ''A Proper String'' is rewarded'),
(15,30201,1,0,0,47,0,7636,64,0,0,0,0,'Creature ''Vartrus the Ancient'' - Group 0: Show gossip option 1 if quest ''Stave of the Ancients'' is rewarded'),
(15,30201,1,0,0,2,0,18715,1,1,1,0,0,'Creature ''Vartrus the Ancient'' - Group 0: Show gossip option 1 if item ''Lok''delar, Stave of the Ancient Keepers'' is not in the inventory or in the bank'),
(15,30201,1,0,0,2,0,18707,1,1,1,0,0,'Creature ''Vartrus the Ancient'' - Group 0: Show gossip option 1 if item ''Ancient Rune Etched Stave'' is not in the inventory or in the bank'),
(15,30201,1,0,0,2,0,18724,1,1,1,0,0,'Creature ''Vartrus the Ancient'' - Group 0: Show gossip option 1 if item ''Enchanted Black Dragon Sinew'' is not in the inventory or in the bank');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 14524;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14524,0,0,2,62,0,100,0,30201,0,0,0,0,56,18713,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Vartrus the Ancient - On Gossip 0 Selected - Add Item ''Rhok''delar, Longbow of the Ancient Keepers'''),
(14524,0,1,2,62,0,100,0,30201,1,0,0,0,56,18715,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Vartrus the Ancient - On Gossip 1 Selected - Add Item ''Lok''delar, Stave of the Ancient Keepers'''),
(14524,0,2,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Vartrus the Ancient - Linked - Close Gossip');
