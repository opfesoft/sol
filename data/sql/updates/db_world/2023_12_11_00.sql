UPDATE `creature_template` SET `spell1` = 36248, `spell2` = 34259 WHERE `entry` = 22204;
UPDATE `creature_template_addon` SET `auras` = '35408' WHERE `entry` = 22204;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (19973,22204) AND `id` = 2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19973,0,2,0,0,0,100,0,6000,15000,18000,28000,0,11,37633,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Abyssal Flamebringer - IC - Cast ''Abyssal Strike'''),

(22204,0,2,0,0,0,100,0,9000,20000,13000,27000,0,11,38356,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Fear Fiend - IC - Cast ''Fel Flames''');
