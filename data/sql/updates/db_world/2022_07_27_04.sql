UPDATE `creature_template` SET `spell1` = 15798, `spell2` = 12160, `AIName` = 'SmartAI' WHERE `entry` = 7453;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 7453;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7453,0,0,0,2,0,100,0,0,50,18000,21000,0,11,12160,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Moontouched Owlbeast - Between 0-50% Health - Cast ''Rejuvenation'''),
(7453,0,1,0,0,0,100,0,4000,6000,14000,16000,0,11,15798,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Moontouched Owlbeast - IC - Cast ''Moonfire''');
