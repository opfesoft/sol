UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 17299;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 17299;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17299,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crashin'' Thrashin'' Robot - On Just Summoned - Set Active On'),
(17299,0,1,2,61,0,100,0,0,0,0,0,0,116,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crashin'' Thrashin'' Robot - Linked - Set Corpse Delay'),
(17299,0,2,3,61,0,100,0,0,0,0,0,0,67,1,180000,180000,0,0,0,1,0,0,0,0,0,0,0,0,'Crashin'' Thrashin'' Robot - Linked - Create Timed Event 1'),
(17299,0,3,0,61,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crashin'' Thrashin'' Robot - Linked - Start Random Movement'),
(17299,0,4,0,59,0,100,0,1,0,0,0,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crashin'' Thrashin'' Robot - On Timed Event 1 Triggered - Kill Unit'),
(17299,0,5,0,0,0,100,0,8000,16000,8000,16000,0,11,42372,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Crashin'' Thrashin'' Robot - IC - Cast ''Electrical Charge'''),
(17299,0,6,0,0,0,100,0,2000,4000,2000,4000,0,11,42382,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Crashin'' Thrashin'' Robot - IC - Cast ''Machine Gun''');
