UPDATE `creature_loot_template` SET `QuestRequired` = 0 WHERE `Entry` IN (11698,11721,11722,11723,11724,11725,11726,11727,11728,11729,11730,11731,11732,11733,11734,13136,13301,15759) AND `Item` = 20384;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 1 AND `SourceGroup` IN (11698,11721,11722,11723,11724,11725,11726,11727,11728,11729,11730,11731,11732,11733,11734,13136,13301,15759) AND `SourceEntry` = 20384;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(1,11698,20384,0,0,2,0,20402,1,0,0,0,0,'Hive''Ashi Stinger - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory'),
(1,11721,20384,0,0,2,0,20402,1,0,0,0,0,'Hive''Ashi Worker - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory'),
(1,11722,20384,0,0,2,0,20402,1,0,0,0,0,'Hive''Ashi Defender - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory'),
(1,11723,20384,0,0,2,0,20402,1,0,0,0,0,'Hive''Ashi Sandstalker - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory'),
(1,11724,20384,0,0,2,0,20402,1,0,0,0,0,'Hive''Ashi Swarmer - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory'),
(1,11725,20384,0,0,2,0,20402,1,0,0,0,0,'Hive''Zora Waywatcher - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory'),
(1,11726,20384,0,0,2,0,20402,1,0,0,0,0,'Hive''Zora Tunneler - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory'),
(1,11727,20384,0,0,2,0,20402,1,0,0,0,0,'Hive''Zora Wasp - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory'),
(1,11728,20384,0,0,2,0,20402,1,0,0,0,0,'Hive''Zora Reaver - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory'),
(1,11729,20384,0,0,2,0,20402,1,0,0,0,0,'Hive''Zora Hive Sister - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory'),
(1,11730,20384,0,0,2,0,20402,1,0,0,0,0,'Hive''Regal Ambusher - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory'),
(1,11731,20384,0,0,2,0,20402,1,0,0,0,0,'Hive''Regal Burrower - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory'),
(1,11732,20384,0,0,2,0,20402,1,0,0,0,0,'Hive''Regal Spitfire - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory'),
(1,11733,20384,0,0,2,0,20402,1,0,0,0,0,'Hive''Regal Slavemaker - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory'),
(1,11734,20384,0,0,2,0,20402,1,0,0,0,0,'Hive''Regal Hive Lord - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory'),
(1,13136,20384,0,0,2,0,20402,1,0,0,0,0,'Hive''Ashi Drone - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory'),
(1,13301,20384,0,0,2,0,20402,1,0,0,0,0,'Hive''Ashi Ambusher - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory'),
(1,15759,20384,0,0,2,0,20402,1,0,0,0,0,'Supreme Silithid Flayer - Group 0: Item ''Silithid Carapace Fragment'' can only be looted if the player does have the item ''Agent of Nozdormu'' in the inventory');
