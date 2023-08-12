DELETE FROM `creature_template_addon` WHERE `entry` = 4126;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(4126,0,0,0,0,0,0,'22766');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 8151;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
(8151,-22766,0,'Surprise Attack - Remove ''Sneak''');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 4126;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4126,0,0,0,23,0,100,0,22766,1,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crag Stalker - On Has Aura ''Sneak'' - Disable Auto Attack'),
(4126,0,1,0,23,0,100,0,22766,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crag Stalker - On Has No Aura ''Sneak'' - Enable Auto Attack'),
(4126,0,2,0,0,0,100,0,0,0,0,0,0,11,8151,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Crag Stalker - IC - Cast ''Surprise Attack''');
