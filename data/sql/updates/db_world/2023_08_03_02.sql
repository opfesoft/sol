DELETE FROM `event_scripts` WHERE `id` = 13037;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(13037,0,10,22146,10000,1,-1243.23,1312.41,3.55,1.34),
(13037,2,10,16939,60000,1,-1243.23,1312.41,3.55,1.34);

UPDATE `creature_template` SET `InhabitType` = `InhabitType` | 4 WHERE `entry` = 22146;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (22146,19599);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (16939,19599,22146);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16939,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Void Baron Galaxis - On Just Summoned - Set Active On'),
(16939,0,1,2,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Void Baron Galaxis - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(16939,0,2,3,61,0,100,0,0,0,0,0,0,11,34302,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Void Baron Galaxis - Linked - Cast ''Coalesce'''),
(16939,0,3,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,-1232.9,1355.96,5.23,0,'Void Baron Galaxis - Linked - Move To Point 1'),
(16939,0,4,5,34,0,100,0,8,1,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Void Baron Galaxis - On Point 1 Reached - Set Home Position'),
(16939,0,5,6,61,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Void Baron Galaxis - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(16939,0,6,7,61,0,100,0,0,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Void Baron Galaxis - Linked - Set Fly Off'),
(16939,0,7,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Void Baron Galaxis - Linked - Start Attack (Closest Player)'),
(16939,0,8,0,4,0,100,0,0,0,0,0,0,11,34236,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Void Baron Galaxis - On Aggro - Cast ''Baron`s Summons'''),
(16939,0,9,0,2,0,100,0,0,50,10000,10000,0,11,34239,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Void Baron Galaxis - Between 0-50% Health - Cast ''Absorb Life'''),

(22146,0,0,0,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoning Voidstorm - On Just Summoned - Set Active On'),

(19599,0,0,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Void Servant - On Just Summoned - Start Attack (Closest Player)'),
(19599,0,1,0,1,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Void Servant - OOC - Force Despawn');
