-- Captured Crusader: Adjust position for one of the spawns
UPDATE `creature` SET `position_x` = 6604.81, `position_y` = 541.046, `position_z` = 399.055 WHERE `guid` = 137721;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 30500;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (30407,30500);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 3040700;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(30407,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Crusader - On Respawn - Disable Event Phase Reset'),
(30407,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Crusader - Linked - Set Event Phase 1'),
(30407,0,2,0,1,1,100,1,1000,1000,0,0,0,75,56726,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Crusader - OOC - Add Aura ''Nerubian Webs'' (Event Phase 1, No Repeat)'),
(30407,0,3,0,1,1,100,0,4000,6000,4000,6000,0,10,70,22,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Crusader - OOC - Play Random Emote (Event Phase 1)'),
(30407,0,4,5,8,1,100,0,56683,0,0,0,0,11,56687,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Captured Crusader - On Spellhit ''Grab Captured Crusader'' - Cast ''Ride Vehicle'' (Event Phase 1)'),
(30407,0,5,6,61,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Crusader - Linked - Set Event Phase 2'),
(30407,0,6,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Crusader - Linked - Say Line 0'),
(30407,0,7,0,1,2,100,1,5000,10000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Crusader - OOC - Say Line 1 (Event Phase 2, No Repeat)'),
(30407,0,8,0,23,2,100,1,56687,0,1000,1000,0,80,3040700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Crusader - On Has No Aura ''Ride Vehicle'' - Call Timed Action List (Event Phase 2) (CONDITION_NEAR_GAMEOBJECT)'),
(30407,0,9,10,23,2,100,1,56687,0,1000,1000,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Crusader - On Has No Aura ''Ride Vehicle'' - Set Event Phase 0 (Event Phase 2) (CONDITION_NEAR_GAMEOBJECT)'),
(30407,0,10,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Crusader - Linked - Force Despawn'),

(3040700,9,0,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Crusader - On Script - Say Line 2'),
(3040700,9,1,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,8,0,0,0,0,6216.38,-1.33821,410.164,0.838938,'Captured Crusader - On Script - Set Home Position'),
(3040700,9,2,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Crusader - On Script - Set Event Phase 0'),
(3040700,9,3,0,0,0,100,0,0,0,0,0,0,41,7000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Crusader - On Script - Force Despawn'),
(3040700,9,4,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Crusader - On Script - Evade'),

(30500,0,0,0,73,0,100,0,0,0,0,0,0,67,1,1000,1000,0,0,0,1,0,0,0,0,0,0,0,0,'Argent Skytalon - On Spellclick - Create Timed Event 1'),
(30500,0,1,0,59,0,100,0,1,0,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Argent Skytalon - On Timed Event 1 Triggered - Reset Orientation');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 30407;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,9,30407,0,0,30,1,192523,15,0,0,0,0,'Captured Crusader - Group 0: Execute SAI ID 8 only if near GO ''Vanguard Infirmary'''),
(22,10,30407,0,0,30,1,192523,15,0,1,0,0,'Captured Crusader - Group 0: Execute SAI ID 9 only if not near GO ''Vanguard Infirmary''');

-- Halig Fireforge: Adjust orientation and WP script
UPDATE `waypoint_data` SET `orientation` = 3.6299 WHERE `id` = 1244970;
UPDATE `waypoint_scripts` SET `datalong` = 233, `datalong2` = 1 WHERE `id` = 1167;

-- Frostbrood Destroyer: Set "CREATURE_FLAG_EXTRA_NO_PLAYER_DAMAGE_REQ"
UPDATE `creature_template` SET `flags_extra` = `flags_extra` | 2097152 WHERE `entry` = 30575;
