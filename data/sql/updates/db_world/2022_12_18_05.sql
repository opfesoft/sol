UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 768, `unit_flags2` = `unit_flags2` | 32768, `AIName` = 'SmartAI' WHERE `entry` IN (33608,33609,33610,33611,33612,33613,33614,33615,33616,33617,33618,33619,33621,33623);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (33608,33609,33610,33611,33612,33613,33614,33615,33616,33617,33618,33619,33621,33623);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(33608,0,0,0,63,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alchemy - On Just Created - Set Root On'),
(33609,0,0,0,63,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blacksmithing - On Just Created - Set Root On'),
(33610,0,0,0,63,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Enchanting - On Just Created - Set Root On'),
(33611,0,0,0,63,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Engineering - On Just Created - Set Root On'),
(33612,0,0,0,63,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Leatherworking - On Just Created - Set Root On'),
(33613,0,0,0,63,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tailoring - On Just Created - Set Root On'),
(33614,0,0,0,63,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jewelcrafting - On Just Created - Set Root On'),
(33615,0,0,0,63,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Inscription - On Just Created - Set Root On'),
(33616,0,0,0,63,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Herbalism - On Just Created - Set Root On'),
(33617,0,0,0,63,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mining - On Just Created - Set Root On'),
(33618,0,0,0,63,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skinning - On Just Created - Set Root On'),
(33619,0,0,0,63,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cooking - On Just Created - Set Root On'),
(33621,0,0,0,63,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'First Aid - On Just Created - Set Root On'),
(33623,0,0,0,63,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fishing - On Just Created - Set Root On');
