DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 19399;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19399,0,0,1,11,0,100,0,0,0,0,0,0,116,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Cannon - On Respawn - Set Corpse Delay'),
(19399,0,1,2,61,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Cannon - Linked - Disable Attack'),
(19399,0,2,0,61,0,100,0,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Cannon - Linked - Disable Combat Movement'),
(19399,0,3,0,0,0,100,0,0,1000,2500,2500,0,11,36238,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Fel Cannon - IC - Cast ''Fel Cannon Blast''');
