DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 27678;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27678,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,34827,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Warsong Shaman - OOC - Cast ''Water Shield'''),
(27678,0,1,0,0,0,100,0,0,0,6000,8000,0,11,39945,64,0,0,0,0,5,0,0,0,0,0,0,0,0,'Warsong Shaman - IC - Cast ''Chain Lightning'''),
(27678,0,2,0,0,0,100,0,8000,14000,11000,15000,0,11,25025,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Warsong Shaman - IC - Cast ''Earth Shock'''),
(27678,0,3,0,0,0,100,0,8000,13000,25000,31000,0,11,33560,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Warsong Shaman - IC - Cast ''Magma Flow Totem'''),
(27678,0,4,0,74,0,100,0,0,95,15000,18000,40,11,49309,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Warsong Shaman - On Friendly Between 0-95% Health - Cast ''Lesser Healing Wave'''),
(27678,0,5,0,74,0,100,0,0,95,12000,15000,40,11,16367,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Warsong Shaman - On Friendly Between 0-95% Health - Cast ''Chain Heal''');
