DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (27725,27534);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27725,0,0,0,0,0,100,0,3000,6000,7000,10000,0,11,40504,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ruby Guardian - IC - Cast ''Cleave'''),
(27725,0,1,2,1,0,100,0,0,5000,5000,15000,0,11,49068,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ruby Guardian - OOC - Cast ''Summon Frigid Ghoul'''),
(27725,0,2,0,61,0,100,0,0,0,0,0,0,11,49068,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ruby Guardian - Linked - Cast ''Summon Frigid Ghoul'''),

(27534,0,0,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Frigid Ghoul - On Just Summoned - Start Attack (Invoker)'),
(27534,0,1,0,0,0,100,0,3000,7000,45000,50000,0,11,50361,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Frigid Ghoul - IC - Cast ''Rot Armor''');
