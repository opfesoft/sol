-- Infinite Timerender: Enable flying
UPDATE `creature_template` SET `InhabitType` = `InhabitType` | 4 WHERE `entry` = 27900;

-- Hourglass of Eternity: Disable turning
UPDATE `creature_template` SET `unit_flags2` = `unit_flags2` | 32768 WHERE `entry` IN (27840,32327);

-- Future You: Regenerate health; remove obsolete SAI; increase health modifier
UPDATE `creature_template` SET `RegenHealth` = 1, `AIName` = '', `HealthModifier` = 1 WHERE `entry` = 27899;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 27899 AND `source_type` = 0;

-- Past You: Set level 75
UPDATE `creature_template` SET `minlevel` = 75, `maxlevel` = 75 WHERE `entry` = 32331;

-- Hourglass of Eternity: Remove obsolete SAI; add missing auras
UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 27840;
UPDATE `creature_template_addon` SET `auras` = '50057 50867' WHERE `entry` = 27840;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 27840 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2784000,2784001) AND `source_type` = 9;

-- Also show Nozdormu while the quest "Mystery of the Infinite, Redux" is completed (same as for "Mystery of the Infinite")
DELETE FROM `spell_area` WHERE `quest_start` = 13343;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`)
VALUES
(50012,4175,13343,0,0,0,2,1,2,11);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (27896,27897,27898,27900);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27896,0,0,0,7,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infinite Assailant - On Evade - Force Despawn'),

(27897,0,0,0,7,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infinite Destroyer - On Evade - Force Despawn'),

(27898,0,0,0,0,0,100,0,5000,10000,15000,30000,0,11,38085,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Infinite Chrono-Magus - IC - Cast ''Shadow Blast'''),
(27898,0,1,0,0,0,100,0,1000,1000,15000,30000,0,11,9613,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Infinite Chrono-Magus - IC - Cast ''Shadow Bolt'''),
(27898,0,2,0,7,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infinite Chrono-Magus - On Evade - Force Despawn'),

(27900,0,0,0,0,0,100,0,5000,10000,10000,15000,0,11,51020,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Infinite Timerender - IC - Cast ''Time Lapse'''),
(27900,0,1,0,7,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infinite Timerender - On Evade - Force Despawn');
