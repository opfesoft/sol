UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 17494;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 17494;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17494,0,0,0,0,0,100,0,0,0,3400,4800,0,11,20791,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Zevrax - IC - Cast ''Shadow Bolt'''),
(17494,0,1,0,0,0,100,0,15000,18000,30000,35000,0,11,21068,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Zevrax - IC - Cast ''Corruption'''),
(17494,0,2,0,0,0,100,0,9000,14000,17000,21000,0,11,17227,32,0,0,0,0,5,0,0,0,0,0,0,0,0,'Zevrax - IC - Cast ''Curse of Weakness'''),
(17494,0,3,0,2,0,100,0,0,30,21000,25000,0,11,11962,0,0,0,0,0,6,0,0,0,0,0,0,0,0,'Zevrax - Between 0-30% Health - Cast ''Immolate''');
