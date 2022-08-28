DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (1491,1488);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1491,0,0,0,0,0,100,0,3000,6000,7000,8000,0,11,9080,2,0,0,0,0,2,0,0,0,0,0,0,0,0,'Zanzil Naga - IC - Cast ''Hamstring'''),
(1491,0,1,0,13,0,100,0,6000,21000,0,0,0,11,12555,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Zanzil Naga - On Victim Casting - Cast ''Pummel'''),

(1488,0,0,0,0,0,100,1,2000,3000,0,0,0,11,7102,2,0,1,0,0,2,0,0,0,0,0,0,0,0,'Zanzil Zombie - IC - Cast ''Contagion of Rot'' (No Repeat)');
