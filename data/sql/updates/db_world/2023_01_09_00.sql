UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` | 4096 | 128 | 16 | 4 WHERE `entry` = 18423;
UPDATE `creature` SET `spawntimesecs` = 300 WHERE `guid` = 31747;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 18423 AND `id` = 3;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18423,0,3,0,0,0,100,0,6000,16000,6000,16000,0,11,15708,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cho''war the Pillager - IC - Cast ''Mortal Strike''');
