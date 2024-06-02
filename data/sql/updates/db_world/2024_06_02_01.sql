UPDATE `creature_template` SET `AIName` = 'SmartAI', `InhabitType` = 3, `flags_extra` = `flags_extra` | 512 WHERE `entry` IN (6498,6499,6500,6560,6584);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 6499;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 6584 AND `id` = 3;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (6498,6500,6560) AND `id` = 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6498,0,1,0,25,0,100,0,0,0,0,0,0,61,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Devilsaur - On Reset - Set Swim Off'),
(6500,0,1,0,25,0,100,0,0,0,0,0,0,61,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tyrant Devilsaur - On Reset - Set Swim Off'),
(6499,0,0,0,25,0,100,0,0,0,0,0,0,61,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ironhide Devilsaur - On Reset - Set Swim Off'),
(6560,0,1,0,25,0,100,0,0,0,0,0,0,61,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stone Guardian - On Reset - Set Swim Off'),
(6584,0,3,0,25,0,100,0,0,0,0,0,0,61,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'King Mosh - On Reset - Set Swim Off');
