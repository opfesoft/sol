DELETE FROM `event_scripts` WHERE `id` = 3241;
UPDATE `gameobject_template` SET `Data3` = 180000 WHERE `entry` = 150140;
UPDATE `creature_template` SET `lootid` = 0 WHERE `entry` = 8608;
DELETE FROM `creature_loot_template` WHERE `Entry` = 8608;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (8581,8578,8608);
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 150140;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (8581,8578,8608);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (150140,-48374);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (858100,857800,860800,15014000);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8581,0,0,0,54,0,100,0,0,0,0,0,0,80,858100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blood Elf Defender - On Just Summoned - Call Timed Action List'),
(8581,0,1,0,4,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blood Elf Defender - On Aggro - Say Line 0'),
(8581,0,2,0,0,0,100,0,7000,12000,11000,14000,0,11,12169,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blood Elf Defender - IC - Cast ''Shield Block'''),
(8581,0,3,0,0,0,100,0,5000,9000,8000,13000,0,11,12170,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Blood Elf Defender - IC - Cast ''Revenge'''),
(8581,0,4,5,2,1,100,1,0,50,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blood Elf Defender - Between 0-50% Health (Event Phase 1, No Repeat) - Set Event Phase 2'),
(8581,0,5,0,61,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,14,48374,150140,0,0,0,0,0,0,'Blood Elf Defender - Linked - Set Data 2 2 (Arcane Focusing Crystal)'),
(8581,0,6,0,6,1,100,0,0,0,0,0,0,45,2,2,0,0,0,0,14,48374,150140,0,0,0,0,0,0,'Blood Elf Defender - On Death (Event Phase 1) - Set Data 2 2 (Arcane Focusing Crystal)'),

(858100,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blood Elf Defender - On Script - Set Active On'),
(858100,9,1,0,0,0,100,0,0,0,0,0,0,116,30,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blood Elf Defender - On Script - Set Corpse Delay'),
(858100,9,2,0,0,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blood Elf Defender - On Script - Disable Event Phase Reset'),
(858100,9,3,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blood Elf Defender - On Script - Set Event Phase 1'),
(858100,9,4,0,0,0,100,0,0,0,0,0,0,11,51347,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blood Elf Defender - On Script - Cast ''Teleport Visual Only'''),
(858100,9,5,0,0,0,100,0,2000,2000,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Blood Elf Defender - On Script - Start Attack (Closest Player)'),

(8578,0,0,0,54,0,100,0,0,0,0,0,0,80,857800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magus Rimtori - On Just Summoned - Call Timed Action List'),
(8578,0,1,0,0,0,100,0,0,0,3000,5000,0,11,20823,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Magus Rimtori - IC - Cast ''Fireball'''),
(8578,0,2,0,9,0,100,0,0,8,13000,16000,0,11,11831,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magus Rimtori - Within 0-8 Range - Cast ''Frost Nova'''),
(8578,0,3,0,4,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magus Rimtori - On Aggro - Say Line 0'),

(857800,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magus Rimtori - On Script - Set Active On'),
(857800,9,1,0,0,0,100,0,0,0,0,0,0,116,30,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magus Rimtori - On Script - Set Corpse Delay'),
(857800,9,2,0,0,0,100,0,0,0,0,0,0,11,51347,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magus Rimtori - On Script - Cast ''Teleport Visual Only'''),
(857800,9,3,0,0,0,100,0,2000,2000,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Magus Rimtori - On Script - Start Attack (Closest Player)'),

(8608,0,0,0,54,0,100,0,0,0,0,0,0,80,860800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Angered Infernal - On Just Summoned - Call Timed Action List'),

(860800,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Angered Infernal - On Script - Set Active On'),
(860800,9,1,0,0,0,100,0,0,0,0,0,0,116,30,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Angered Infernal - On Script - Set Corpse Delay'),
(860800,9,2,0,0,0,100,0,0,0,0,0,0,11,51347,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Angered Infernal - On Script - Cast ''Teleport Visual Only'''),
(860800,9,3,0,0,0,100,0,2000,2000,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Angered Infernal - On Script - Start Attack (Closest Player)'),

(150140,1,0,0,71,0,100,0,3241,0,0,0,0,45,1,1,0,0,0,0,14,48374,150140,0,0,0,0,0,0,'Arcane Focusing Crystal - On Event Script 3241 - Set Data 1 1 (Arcane Focusing Crystal)'),

(-48374,1,0,1,37,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arcane Focusing Crystal - On AI Init - Disable Event Phase Reset'),
(-48374,1,1,0,61,0,100,0,0,0,0,0,0,31,2,4,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arcane Focusing Crystal - Linked - Set Random Event Phase Range 2-4'),
(-48374,1,2,4,71,0,100,0,3241,0,0,0,0,23,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arcane Focusing Crystal - On Event Script 3241 - Decrease Event Phase'),
(-48374,1,3,4,38,0,100,0,1,1,0,0,0,23,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arcane Focusing Crystal - On Data Set 1 1 - Decrease Event Phase'),
(-48374,1,4,0,61,0,100,0,0,0,0,0,0,67,1,1000,1000,0,0,0,1,0,0,0,0,0,0,0,0,'Arcane Focusing Crystal - Linked - Create Timed Event 1'),
(-48374,1,5,6,59,1,100,0,1,0,0,0,0,12,8581,1,300000,0,0,0,8,0,0,0,0,4279.11,-6295.57,95.56,0.05,'Arcane Focusing Crystal - On Timed Event 1 Triggered (Event Phase 1) - Summon Creature ''Blood Elf Defender'''),
(-48374,1,6,0,61,0,100,0,0,0,0,0,0,67,2,1000,1000,0,0,0,1,0,0,0,0,0,0,0,0,'Arcane Focusing Crystal - Linked - Create Timed Event 2'),
(-48374,1,7,0,59,14,100,0,1,0,0,0,0,12,8608,1,300000,0,0,0,8,0,0,0,0,4279.11,-6295.57,95.56,0.05,'Arcane Focusing Crystal - On Timed Event 1 Triggered (Event Phase 2-4) - Summon Creature ''Angered Infernal'''),
(-48374,1,8,0,59,0,100,0,2,0,0,0,0,31,2,4,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arcane Focusing Crystal - On Timed Event 2 Triggered - Set Random Event Phase Range 2-4'),
(-48374,1,9,0,38,0,100,0,2,2,5000,5000,0,80,15014000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arcane Focusing Crystal - On Data Set 2 2 - Call Timed Action List'),

(15014000,9,0,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,19,8581,0,0,0,0,0,0,0,'Arcane Focusing Crystal - On Script - Say Line 1 (Blood Elf Defender)'),
(15014000,9,1,0,0,0,100,0,6000,6000,0,0,0,1,2,0,0,0,0,0,19,8581,0,0,0,0,0,0,0,'Arcane Focusing Crystal - On Script - Say Line 2 (Blood Elf Defender)'),
(15014000,9,2,0,0,0,100,0,0,0,0,0,0,12,8578,1,300000,0,0,0,8,0,0,0,0,4279.11,-6295.57,95.56,0.05,'Arcane Focusing Crystal - On Script - Summon Creature ''Magus Rimtori''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = -48374 AND `SourceId` = 1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,3,-48374,1,0,29,1,8578,50,0,1,0,0,'GO ''Arcane Focusing Crystal'' - Group 0: Execute SAI ID 2 only if not nearby creature ''Magus Rimtori'' (Alive)'),
(22,3,-48374,1,0,29,1,8578,50,1,1,0,0,'GO ''Arcane Focusing Crystal'' - Group 0: Execute SAI ID 2 only if not nearby creature ''Magus Rimtori'' (Dead)'),
(22,3,-48374,1,0,29,1,8581,50,0,1,0,0,'GO ''Arcane Focusing Crystal'' - Group 0: Execute SAI ID 2 only if not nearby creature ''Blood Elf Defender'' (Alive)'),
(22,3,-48374,1,0,29,1,8581,50,1,1,0,0,'GO ''Arcane Focusing Crystal'' - Group 0: Execute SAI ID 2 only if not nearby creature ''Blood Elf Defender'' (Dead)'),

(22,4,-48374,1,0,29,1,8578,50,0,1,0,0,'GO ''Arcane Focusing Crystal'' - Group 0: Execute SAI ID 3 only if not nearby creature ''Magus Rimtori'' (Alive)'),
(22,4,-48374,1,0,29,1,8578,50,1,1,0,0,'GO ''Arcane Focusing Crystal'' - Group 0: Execute SAI ID 3 only if not nearby creature ''Magus Rimtori'' (Dead)'),
(22,4,-48374,1,0,29,1,8581,50,0,1,0,0,'GO ''Arcane Focusing Crystal'' - Group 0: Execute SAI ID 3 only if not nearby creature ''Blood Elf Defender'' (Alive)'),
(22,4,-48374,1,0,29,1,8581,50,1,1,0,0,'GO ''Arcane Focusing Crystal'' - Group 0: Execute SAI ID 3 only if not nearby creature ''Blood Elf Defender'' (Dead)');
