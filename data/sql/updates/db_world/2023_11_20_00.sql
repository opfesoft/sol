DELETE FROM `spell_script_names` WHERE `spell_id` IN (38119,38249);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
(38119,'spell_calling_korkron_or_wildhammer'),
(38249,'spell_calling_korkron_or_wildhammer');

UPDATE `creature_template` SET `unit_flags` = 768, `speed_run` = 2.28571, `AIName` = 'SmartAI', `InhabitType` = 7 WHERE `entry` IN (21998,22059);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (21998,22059);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(21998,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Wind Rider - On Just Summoned - Set Active On'),
(21998,0,1,0,61,0,100,0,0,0,0,0,0,69,1,0,0,1,0,0,7,0,0,0,0,0,0,5,0,'Kor''kron Wind Rider - Linked - Move To Point 1 (Invoker)'),
(21998,0,2,0,34,0,100,0,8,1,0,0,0,67,1,1000,1000,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Wind Rider - On Point 1 Reached - Create Timed Event 1'),
(21998,0,3,4,59,0,100,0,1,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Wind Rider - On Timed Event 1 Triggered - Set Fly Off'),
(21998,0,4,0,61,0,100,0,0,0,0,0,0,210,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Wind Rider - Linked - Fall'),

(22059,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wildhammer Gryphon Rider - On Just Summoned - Set Active On'),
(22059,0,1,0,61,0,100,0,0,0,0,0,0,69,1,0,0,1,0,0,7,0,0,0,0,0,0,5,0,'Wildhammer Gryphon Rider - Linked - Move To Point 1 (Invoker)'),
(22059,0,2,0,34,0,100,0,8,1,0,0,0,67,1,1000,1000,0,0,0,1,0,0,0,0,0,0,0,0,'Wildhammer Gryphon Rider - On Point 1 Reached - Create Timed Event 1'),
(22059,0,3,4,59,0,100,0,1,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wildhammer Gryphon Rider - On Timed Event 1 Triggered - Set Fly Off'),
(22059,0,4,0,61,0,100,0,0,0,0,0,0,210,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wildhammer Gryphon Rider - Linked - Fall');
