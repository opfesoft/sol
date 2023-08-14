UPDATE `creature` SET `spawntimesecs` = 60 WHERE `guid` = 71939;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 20287;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (20287,20243);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20287,0,0,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,85,0,0,0,0,0,0,0,'Zaxxis Ambusher - On Just Summoned - Start Attack (Closest Player)'),

(20243,0,0,0,11,0,100,0,0,0,0,0,0,116,60,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scrapped Fel Reaver - On Respawn - Set Corpse Delay'),
(20243,0,1,2,25,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scrapped Fel Reaver - On Reset - Set React State ''Passive'''),
(20243,0,2,0,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scrapped Fel Reaver - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(20243,0,3,4,8,0,100,0,35282,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scrapped Fel Reaver - On Spell Hit ''Fel Zapper'' - Say Line 0'),
(20243,0,4,0,61,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scrapped Fel Reaver - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(20243,0,5,0,0,0,100,0,2000,2000,30000,30000,0,12,20287,2,180000,1,0,0,8,0,0,0,0,2587.87,3952.51,136.37,2.38,'Scrapped Fel Reaver - IC - Summon Creature ''Zaxxis Ambusher'''),
(20243,0,6,0,0,0,100,0,17000,17000,45000,45000,0,12,20287,2,180000,1,0,0,8,0,0,0,0,2535.75,3922.99,135.58,1.81,'Scrapped Fel Reaver - IC - Summon Creature ''Zaxxis Ambusher'''),
(20243,0,7,0,0,0,100,0,32000,32000,45000,45000,0,12,20287,2,180000,1,0,0,8,0,0,0,0,2506.46,4008.93,133.8,6.19,'Scrapped Fel Reaver - IC - Summon Creature ''Zaxxis Ambusher'''),
(20243,0,8,0,0,0,100,0,60000,60000,45000,45000,0,12,20287,2,180000,1,0,0,8,0,0,0,0,2537.3,4027.11,135.5,4.3,'Scrapped Fel Reaver - IC - Summon Creature ''Zaxxis Ambusher'''),
(20243,0,9,0,6,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,11,20287,200,1,0,0,0,0,0,'Scrapped Fel Reaver - On Death - Force Despawn (Zaxxis Ambusher)'),
(20243,0,10,0,7,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,11,20287,200,1,0,0,0,0,0,'Scrapped Fel Reaver - On Evade - Force Despawn (Zaxxis Ambusher)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (13,17) AND `SourceEntry` = 35282;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,35282,0,0,31,0,3,20243,0,0,0,0,'Spell ''Fel Zapper'' - Group 0: Implicit target creature ''Scrapped Fel Reaver'''),
(17,0,35282,0,0,29,0,20243,13,0,0,0,0,'Spell ''Fel Zapper'' - Group 0: Can cast if nearby creature ''Scrapped Fel Reaver''');
