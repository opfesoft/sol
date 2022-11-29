DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 1052 AND `id` > 4;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 1222 AND `id` > 3;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (105200,122200);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1052,0,5,6,8,0,100,0,28012,0,0,0,0,241,500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Saboteur - On Spellhit ''Suicide'' - Set Kill Delay'),
(1052,0,6,0,61,0,100,0,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Saboteur - Linked - Die'),

(1222,0,4,5,8,0,100,0,28012,0,0,0,0,241,500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Sapper - On Spellhit ''Suicide'' - Set Kill Delay'),
(1222,0,5,0,61,0,100,0,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Sapper - Linked - Die');
