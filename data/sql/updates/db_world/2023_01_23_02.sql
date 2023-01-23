DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 17270 AND `id` > 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17270,0,1,0,0,0,100,0,12100,15300,13300,18200,0,11,30614,0,0,0,0,0,5,30,0,0,0,0,0,0,0,'Bleeding Hollow Archer - IC - Cast ''Aimed Shot'''),
(17270,0,2,0,9,0,100,2,5,30,2300,5000,1,11,18651,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bleeding Hollow Archer - Within 5-30 Range - Cast ''Multi-Shot'''),
(17270,0,3,0,9,0,100,4,5,30,2300,5000,1,11,31942,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bleeding Hollow Archer - Within 5-30 Range - Cast ''Multi-Shot''');
