UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 17604;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 17604;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17604,0,0,0,0,0,100,0,1000,3000,12000,16000,0,11,13730,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunhawk Spy - IC - Cast ''Demoralizing Shout'''),
(17604,0,1,0,0,0,100,0,6000,9000,9000,21000,0,11,31827,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunhawk Spy - IC - Cast ''Heroic Strike'''),
(17604,0,2,0,0,0,100,0,4000,6000,9000,14000,0,11,31734,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunhawk Spy - IC - Cast ''Mark of the Sunhawk'''),
(17604,0,3,0,2,0,100,0,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunhawk Spy - Between 0-15% Health - Flee For Assist');
