DELETE FROM `event_scripts` WHERE `id` = 12925;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(12925,0,10,18544,60000,1,3780.22,1458.31,-149.97,0);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 18544;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18544,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Veraku - On Just Summoned - Set Active On'),
(18544,0,1,2,61,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,8,0,0,0,0,3840.57,1449.08,-135.836,0.204608,'Veraku - Linked - Set Home Position'),
(18544,0,2,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,3840.57,1449.08,-135.836,0,'Veraku - Linked - Move To Point 1');
