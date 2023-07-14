UPDATE `creature_template_addon` SET `auras` = '40773' WHERE `entry` = 22180;
DELETE FROM `creature_addon` WHERE `guid` IN (77790,77952,78216,78217,78218,78219,78246);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (22180,22243,22254);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(22180,0,0,0,0,0,100,0,4700,15300,9700,16300,0,11,34783,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shard-Hide Boar - IC - Cast ''Spell Reflection'''),

(22243,0,0,0,0,0,100,0,0,0,2400,3800,0,11,34446,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bash''ir Arcanist - IC - Cast ''Arcane Missiles'''),
(22243,0,1,0,0,0,100,0,9000,14000,14000,20000,0,11,36508,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bash''ir Arcanist - IC - Cast ''Energy Surge'''),

(22254,0,0,0,0,0,100,0,0,0,2400,3800,0,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wrath Corruptor - IC - Cast ''Shadow Bolt'''),
(22254,0,1,0,0,0,100,0,2700,4200,26000,30000,0,11,32063,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Wrath Corruptor - IC - Cast ''Corruption'''),
(22254,0,2,0,2,0,100,0,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Wrath Corruptor - Between 0-15% Health - Flee For Assist');
