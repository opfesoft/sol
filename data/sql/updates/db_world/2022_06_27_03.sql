DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 1940;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1940,0,0,0,0,0,100,0,2000,18000,30000,45000,0,11,3237,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rot Hide Plague Weaver - IC - Cast ''Curse of Thule'''),
(1940,0,1,0,0,0,100,0,3000,14000,25000,40000,0,11,3256,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rot Hide Plague Weaver - IC - Cast ''Plague Cloud'''),
(1940,0,2,0,4,0,15,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Rot Hide Plague Weaver - On Aggro - Say Line 0');
