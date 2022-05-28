-- Wintergarde Gryphon: Immunity to Knockback
UPDATE `creature_template` SET `flags_extra` = `flags_extra` | 1073741824 WHERE `entry` = 27258;

-- Helpless Wintergarde Villager: Template addons not needed, handled via SAI
DELETE FROM `creature_template_addon` WHERE `entry` IN (27315,27336);

-- Wintergarde NPCs in/near the inn: Add aura "Wintergarde Invisibility Type C"
UPDATE `creature_addon` SET `bytes1` = 0, `auras` = '48796' WHERE `guid` IN (133601,133602,133605,133611,133617,133618,133619,133620,133760,133761,133762,133763);

-- Helpless Wintergarde Villagers: Disable random movement, handled via SAI
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `id` IN (27315,27336);

-- GO "Wanted!": Set invisibility
DELETE FROM `gameobject_addon` WHERE `guid` = 67780;
INSERT INTO `gameobject_addon` (`guid`, `invisibilityType`, `invisibilityValue`, `useRotation`)
VALUES
(67780,1,1000,0);

-- Wintergarde Keep area: Force aura "See Wintergarde Invisibility Type C" if quest "Flight of the Wintergarde Defender" is rewarded
DELETE FROM `spell_area` WHERE `spell` = 48797 AND `area` = 4177;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`)
VALUES
(48797,4177,12237,0,0,1101,2,1,64,0);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 27258;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (27315,27336,27258);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2731500,2731501,2731502);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27315,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Respawn - Disable Event Phase Reset'),
(27315,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - Linked - Set Event Phase 1'),
(27315,0,2,0,1,1,100,1,1000,1000,0,0,0,80,2731500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - OOC - Call Timed Action List (Event Phase 1, No Repeat)'),
(27315,0,3,0,8,1,100,0,48363,0,0,0,0,80,2731501,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Spellhit ''Rescue Villager'' - Call Timed Action List (Event Phase 1)'),
(27315,0,4,0,60,2,100,0,5000,10000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Update - Say Line 0 (Event Phase 2)'),
(27315,0,5,0,23,2,100,1,43671,0,1000,1000,0,80,2731502,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Has No Aura ''Ride Vehicle'' - Call Timed Action List (Event Phase 2) (CONDITION_NEAR_GAMEOBJECT)'),
(27315,0,6,7,23,2,100,1,43671,0,1000,1000,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Has No Aura ''Ride Vehicle'' - Set Event Phase 0 (Event Phase 2) (CONDITION_NEAR_GAMEOBJECT)'),
(27315,0,7,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - Linked - Force Despawn'),

(2731500,9,0,0,0,0,100,0,0,0,0,0,0,89,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Script - Disable Random Movement'),
(2731500,9,1,0,0,0,100,0,0,0,0,0,0,75,49774,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Script - Add Aura ''Cower + Fear Visual'''),
(2731500,9,2,0,0,0,100,0,1000,1000,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Script - Set Run On'),
(2731500,9,3,0,0,0,100,0,0,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Script - Enable Random Movement'),

(2731501,9,0,0,0,0,100,0,0,0,0,0,0,28,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Script - Remove All Auras'),
(2731501,9,1,0,0,0,100,0,0,0,0,0,0,89,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Script - Disable Random Movement'),
(2731501,9,2,0,0,0,100,0,0,0,0,0,0,11,43671,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Script - Cast ''Ride Vehicle'' (Invoker)'),
(2731501,9,3,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Script - Set Event Phase 2'),

(2731502,9,0,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Script - Say Line 1'),
(2731502,9,1,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,8,0,0,0,0,3683.01,-719.994,212.618,3.57396,'Helpless Wintergarde Villager - On Script - Set Home Position'),
(2731502,9,2,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Script - Set Event Phase 0'),
(2731502,9,3,0,0,0,100,0,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Script - Force Despawn'),
(2731502,9,4,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Script - Evade'),

(27336,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Respawn - Disable Event Phase Reset'),
(27336,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - Linked - Set Event Phase 1'),
(27336,0,2,0,1,1,100,1,1000,1000,0,0,0,80,2731500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - OOC - Call Timed Action List (Event Phase 1, No Repeat)'),
(27336,0,3,0,8,1,100,0,48363,0,0,0,0,80,2731501,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Spellhit ''Rescue Villager'' - Call Timed Action List (Event Phase 1)'),
(27336,0,4,0,60,2,100,0,5000,10000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Update - Say Line 0 (Event Phase 2)'),
(27336,0,5,0,23,2,100,1,43671,0,1000,1000,0,80,2731502,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Has No Aura ''Ride Vehicle'' - Call Timed Action List (Event Phase 2) (CONDITION_NEAR_GAMEOBJECT)'),
(27336,0,6,7,23,2,100,1,43671,0,1000,1000,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - On Has No Aura ''Ride Vehicle'' - Set Event Phase 0 (Event Phase 2) (CONDITION_NEAR_GAMEOBJECT)'),
(27336,0,7,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helpless Wintergarde Villager - Linked - Force Despawn'),

(27258,0,0,0,54,0,100,0,0,0,0,0,0,67,1,30000,30000,0,0,0,1,0,0,0,0,0,0,0,0,'Wintergarde Gryphon - On Just Summoned - Create Timed Event 1'),
(27258,0,1,0,28,0,100,0,0,0,0,1,0,67,1,5000,5000,0,0,0,1,0,0,0,0,0,0,0,0,'Wintergarde Gryphon - On Passenger Removed (Player Only) - Create Timed Event 1'),
(27258,0,2,0,59,0,100,0,1,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wintergarde Gryphon - On Timed Event 1 Triggered - Force Despawn'),
(27258,0,3,0,27,0,100,0,0,0,0,1,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wintergarde Gryphon - On Passenger Boarded (Player Only) - Remove Timed Event 1');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (27315,27336);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,6,27315,0,0,30,1,188679,15,0,0,0,0,'Helpless Wintergarde Villager - Group 0: Execute SAI ID 5 only if near GO ''Wintergarde Gryphon Station'''),
(22,7,27315,0,0,30,1,188679,15,0,1,0,0,'Helpless Wintergarde Villager - Group 0: Execute SAI ID 6 only if not near GO ''Wintergarde Gryphon Station'''),

(22,6,27336,0,0,30,1,188679,15,0,0,0,0,'Helpless Wintergarde Villager - Group 0: Execute SAI ID 5 only if near GO ''Wintergarde Gryphon Station'''),
(22,7,27336,0,0,30,1,188679,15,0,1,0,0,'Helpless Wintergarde Villager - Group 0: Execute SAI ID 6 only if not near GO ''Wintergarde Gryphon Station''');

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 133611;
DELETE FROM `waypoint_data` WHERE `id` IN (1336170,1336110);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
-- Illusia Lune
(1336170,1,3647.15,-715.152,215.035,NULL,0,0,0,0,100,0),
(1336170,2,3645.22,-714.925,214.24,NULL,0,0,0,0,100,0),
(1336170,3,3635.04,-713.575,214.241,5.62167,60000,0,0,0,100,0),
(1336170,4,3645.22,-714.925,214.24,NULL,0,0,0,0,100,0),
(1336170,5,3647.15,-715.152,215.035,NULL,0,0,0,0,100,0),
(1336170,6,3647.98,-717.186,215.034,NULL,0,0,0,0,100,0),
(1336170,7,3655.22,-718.06,215.03,1.49833,60000,0,0,0,100,0),
(1336170,8,3647.95,-717.195,215.034,NULL,0,0,0,0,100,0),
-- Fanny McLumpkins
(1336110,1,3637.99,-711.77,223.968,NULL,0,0,0,0,100,0),
(1336110,2,3630.42,-710.852,220.467,NULL,0,0,0,0,100,0),
(1336110,3,3627.1,-710.331,220.132,NULL,0,0,0,0,100,0),
(1336110,4,3626.73,-716.152,220.132,NULL,0,0,0,0,100,0),
(1336110,5,3631.37,-716.911,220.132,0.443608,60000,0,0,0,100,0),
(1336110,6,3631.47,-720.496,220.132,NULL,0,0,0,0,100,0),
(1336110,7,3634.01,-720.864,220.132,NULL,0,0,0,0,100,0),
(1336110,8,3638.85,-721.566,217.89,NULL,0,0,0,0,100,0),
(1336110,9,3645.89,-722.588,215.035,NULL,0,0,0,0,100,0),
(1336110,10,3647.71,-721.812,215.034,NULL,0,0,0,0,100,0),
(1336110,11,3649.91,-718.255,215.034,NULL,60000,0,0,0,100,0),
(1336110,12,3647.71,-721.812,215.034,NULL,0,0,0,0,100,0),
(1336110,13,3646.03,-722.76,215.034,NULL,0,0,0,0,100,0),
(1336110,14,3639.77,-722.025,217.434,NULL,0,0,0,0,100,0),
(1336110,15,3633.86,-721.33,220.132,NULL,0,0,0,0,100,0),
(1336110,16,3632.07,-720.429,220.132,NULL,0,0,0,0,100,0),
(1336110,17,3629.9,-718.148,220.132,NULL,0,0,0,0,100,0),
(1336110,18,3627.27,-715.728,220.132,NULL,0,0,0,0,100,0),
(1336110,19,3627.87,-710.613,220.132,NULL,0,0,0,0,100,0),
(1336110,20,3632.1,-711.113,221.245,NULL,0,0,0,0,100,0),
(1336110,21,3638.36,-711.786,224.137,NULL,0,0,0,0,100,0),
(1336110,22,3642.97,-712.281,226.014,NULL,0,0,0,0,100,0),
(1336110,23,3644.13,-712.406,226.014,NULL,60000,0,0,0,100,0),
(1336110,24,3642.81,-712.269,226.014,NULL,0,0,0,0,100,0);
