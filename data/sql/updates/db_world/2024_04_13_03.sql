UPDATE `smart_scripts` SET `link` = 3 WHERE `source_type` = 0 AND `entryorguid` = 6268 AND `id` = 2;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 6268 AND `id` > 2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6268,0,3,4,61,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Felhunter - Linked - Add ''UNIT_FLAG_IMMUNE_TO_PC'''),
(6268,0,4,5,61,0,100,0,0,0,0,0,0,11,7741,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Felhunter - Linked - Cast ''Summoned Demon'''),
(6268,0,5,0,61,0,100,0,0,0,0,0,0,67,1,3000,3000,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Felhunter - Linked - Create Timed Event 1'),
(6268,0,6,7,59,0,100,0,1,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Felhunter - On Timed Event 1 Triggered - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),
(6268,0,7,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Summoned Felhunter - Linked - Start Attack (Summoner)');
