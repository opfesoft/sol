UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 5458;
UPDATE `creature_addon` SET `path_id` = 0, `auras` = '8876' WHERE `guid` = 5458;
DELETE FROM `waypoint_data` WHERE `id` = 54580;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 9176;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(9176,0,0,0,0,0,100,0,5000,7000,12000,15000,0,11,12734,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gor''tesh - IC - Cast ''Ground Smash'''),
(9176,0,1,0,0,0,100,0,9000,11000,14000,18000,0,11,10101,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gor''tesh - IC - Cast ''Knock Away''');
