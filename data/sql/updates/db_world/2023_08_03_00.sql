DELETE FROM `gossip_menu_option` WHERE `MenuID` = 8568 AND `OptionID` > 2;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 8568;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,8568,1,0,0,2,0,31880,1,1,1,0,0,'Creature ''Orphan Matron Mercy'' - Group 0: Show gossip option 1 if item ''Blood Elf Orphan Whistle'' is not in the inventory or in the bank'),
(15,8568,1,0,0,47,0,10942,64,0,0,0,0,'Creature ''Orphan Matron Mercy'' - Group 0: Show gossip option 1 if quest ''Children''s Week (Horde)'' is rewarded'),
(15,8568,1,0,0,12,0,10,0,0,0,0,0,'Creature ''Orphan Matron Mercy'' - Group 0: Show gossip option 1 if event ''Children''s Week'' is active'),

(15,8568,2,0,0,2,0,31881,1,1,1,0,0,'Creature ''Orphan Matron Mercy'' - Group 0: Show gossip option 2 if item ''Draenei Orphan Whistle'' is not in the inventory or in the bank'),
(15,8568,2,0,0,47,0,10943,64,0,0,0,0,'Creature ''Orphan Matron Mercy'' - Group 0: Show gossip option 2 if quest ''Children''s Week (Alliance)'' is rewarded'),
(15,8568,2,0,0,12,0,10,0,0,0,0,0,'Creature ''Orphan Matron Mercy'' - Group 0: Show gossip option 2 if event ''Children''s Week'' is active');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 22819;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(22819,0,0,2,62,0,100,0,8568,1,0,0,0,56,31880,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Orphan Matron Mercy - On Gossip Option 1 Selected - Add Item ''Blood Elf Orphan Whistle'' (Invoker)'),
(22819,0,1,2,62,0,100,0,8568,2,0,0,0,56,31881,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Orphan Matron Mercy - On Gossip Option 2 Selected - Add Item ''Draenei Orphan Whistle'' (Invoker)'),
(22819,0,2,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Orphan Matron Mercy - Linked - Close Gossip');
