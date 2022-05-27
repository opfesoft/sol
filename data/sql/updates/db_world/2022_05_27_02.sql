DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 771 AND `id` > 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(771,0,1,2,8,0,100,0,3488,0,0,0,0,94,128,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Commander Felstrom - On Spellhit ''Felstrom Resurrection'' - Set ''UNIT_DYNFLAG_TAPPED_BY_ALL_THREAT_LIST'''),
(771,0,2,0,61,0,100,0,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Commander Felstrom - Linked - Force Despawn');
