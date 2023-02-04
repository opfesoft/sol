DELETE FROM `spell_script_names` WHERE `spell_id` = 33810;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
(33810,'spell_gen_rock_shell');

UPDATE `creature_addon` SET `auras` = NULL WHERE `guid` IN (143827,143837,143840,143843,143848,143850,143859);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 23326;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 23326;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23326,0,0,0,0,0,100,0,2500,5000,20000,25000,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Nethermine Ravager - IC - Cast ''Rend'''),
(23326,0,1,0,2,0,100,1,20,80,0,0,0,11,33810,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethermine Ravager - Between 20-80% Health - Cast ''Rock Shell'' (No Repeat)');
