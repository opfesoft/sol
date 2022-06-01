UPDATE `creature_template` SET `npcflag` = `npcflag` | 1 WHERE `entry` = 35068;

DELETE FROM `gossip_menu_option` WHERE `MenuID` IN (10630,10631);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(10630,0,0,'I lost my totems. Can you help?',35455,1,1,0,0,0,0,NULL,0,0),
(10631,0,0,'I lost my totems. Can you help?',35455,1,1,0,0,0,0,NULL,0,0);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (35068,35073);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (35068,35073);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(35068,0,0,1,62,0,100,0,10630,0,0,0,0,56,46978,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Gotura Fourwinds - On Gossip Option 0 Selected - Add Item ''Totem of the Earthen Ring'' (Invoker)'),
(35068,0,1,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Gotura Fourwinds - Linked - Close Gossip'),

(35073,0,0,1,62,0,100,0,10631,0,0,0,0,56,46978,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Farseer Eannu - On Gossip Option 0 Selected - Add Item ''Totem of the Earthen Ring'' (Invoker)'),
(35073,0,1,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Farseer Eannu - Linked - Close Gossip');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (10630,10631);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,10630,0,0,0,2,0,46978,1,1,1,0,0,'Gotura Fourwinds - Group 0: Show gossip option 0 if item ''Totem of the Earthen Ring'' is not in the inventory or in the bank'),
(15,10630,0,0,0,47,0,14100,64,0,0,0,0,'Gotura Fourwinds - Group 0: Show gossip option 0 if quest ''Relic of the Earthen Ring'' is rewarded'),

(15,10631,0,0,0,2,0,46978,1,1,1,0,0,'Farseer Eannu - Group 0: Show gossip option 0 if item ''Totem of the Earthen Ring'' is not in the inventory or in the bank'),
(15,10631,0,0,0,47,0,14111,64,0,0,0,0,'Farseer Eannu - Group 0: Show gossip option 0 if quest ''Relic of the Earthen Ring'' is rewarded');
