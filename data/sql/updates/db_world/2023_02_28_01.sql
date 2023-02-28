DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 18865;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18865,0,0,0,1,0,100,0,0,0,1000,1000,0,11,36640,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Warp Aberration - OOC - Cast ''Arcane Shield'''),
(18865,0,1,0,8,0,100,1,34520,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Warp Aberration - On Spellhit ''Elemental Power Extractor'' (No Repeat) - Set Event Phase 1'),
(18865,0,2,0,6,1,100,0,0,0,0,0,0,11,34525,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Warp Aberration - On Just Died (Event Phase 1) - Cast ''Create Elemental Power'''),
(18865,0,3,0,0,0,100,0,2500,5000,30000,35000,0,11,36577,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warp Aberration - IC - Cast ''Warp Storm''');
