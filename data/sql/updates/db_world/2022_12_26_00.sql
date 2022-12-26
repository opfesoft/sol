DELETE FROM `spell_script_names` WHERE `spell_id` = 34779;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
(34779,'spell_gen_freezing_circle');

UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` | 1 | 2 | 16 | 64 | 1024 WHERE `entry` = 18044;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 18088;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18088,0,0,0,0,0,100,0,0,0,6000,8000,0,11,34446,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bloodscale Enchantress - IC - Cast ''Arcane Missiles'''),
(18088,0,1,0,0,0,100,0,6000,8000,16000,22000,0,11,34787,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bloodscale Enchantress - IC - Cast ''Freezing Circle'''),
(18088,0,2,0,0,0,100,0,1000,10000,20000,30000,0,11,33245,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodscale Enchantress - IC - Cast ''Ice Barrier''');
