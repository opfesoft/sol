UPDATE `spell_dbc` SET `Effect1` = 6, `StackAmount` = 4, `EffectBasePoints1` = -25, `EffectApplyAuraName1` = 61 WHERE `ID` = 41935;

DELETE FROM `spell_script_names` WHERE `spell_id` = 55795;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
(55795,'spell_gen_creature_feign_death');

UPDATE `creature_template` SET `InhabitType` = `InhabitType` | 4 WHERE `entry` = 27530;
UPDATE `creature_template_addon` SET `auras` = '55795 61204' WHERE `entry` = 27530;

UPDATE `creature` SET `unit_flags` = 512, `dynamicflags` = 0 WHERE `guid` IN (108311,108312,108315,108316,108317,108318);
UPDATE `creature` SET `wander_distance` = 10, `unit_flags` = 256 WHERE `guid` = 108330;

DELETE FROM `creature` WHERE `guid` BETWEEN 3009674 AND 3009680;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
(3009674,27530,571,0,0,1,1,0,0,3690.58,1034.33,55.7121,1.43117,300,0,1,0,0,0,512,0),
(3009675,27530,571,0,0,1,1,0,0,3722.78,872.282,56.4471,3.56587,300,0,1,0,0,0,512,0),
(3009676,27530,571,0,0,1,1,0,0,3678.09,938.621,57.2201,1.50971,300,0,1,0,0,0,512,0),
(3009677,27530,571,0,0,1,1,0,0,3599.12,1122.7,242.695,0.729031,300,10,1,0,1,0,256,0),
(3009678,27530,571,0,0,1,1,0,0,3918.6,887.081,242.695,4.09515,300,10,1,0,1,0,256,0),
(3009679,27530,571,0,0,1,1,0,0,3628.1,1342.82,188.455,5.30012,300,10,1,0,1,0,256,0),
(3009680,27530,571,0,0,1,1,0,0,3605.37,985.666,110.761,3.77551,300,10,1,0,1,0,256,0);

DELETE FROM `creature_addon` WHERE `guid` IN (108330,3009677,3009678,3009679,3009680);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `maxAggroRadius`, `auras`)
VALUES
(108330,0,0,33554432,0,0,1,NULL,NULL),
(3009677,0,0,33554432,0,0,1,NULL,NULL),
(3009678,0,0,33554432,0,0,1,NULL,NULL),
(3009679,0,0,33554432,0,0,1,NULL,NULL),
(3009680,0,0,33554432,0,0,1,NULL,NULL);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 27530;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2753000;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27530,0,0,1,1,0,100,0,2000,2000,0,0,0,75,49132,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ruby Keeper - OOC - Add Aura ''Ember Flame (Burning Corpse)'' (CONDITION_OBJECT_ENTRY_GUID)'),
(27530,0,1,0,61,0,100,0,0,0,0,0,0,117,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ruby Keeper - Linked - Disable Evade'),
(27530,0,2,3,8,0,100,0,49349,0,10000,10000,0,11,49364,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ruby Keeper - On Spellhit ''Planting Ruby Acorn'' - Cast ''Return to Earth'' (Invoker)'),
(27530,0,3,0,61,0,100,0,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ruby Keeper - Linked - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 27530;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,27530,0,0,31,1,3,0,108311,0,0,0,'Creature ''Ruby Keeper'' - Group 0: Execute SAI ID 0 if has GUID 108311'),
(22,1,27530,0,1,31,1,3,0,108312,0,0,0,'Creature ''Ruby Keeper'' - Group 0: Execute SAI ID 0 if has GUID 108312'),
(22,1,27530,0,2,31,1,3,0,108315,0,0,0,'Creature ''Ruby Keeper'' - Group 0: Execute SAI ID 0 if has GUID 108315'),
(22,1,27530,0,3,31,1,3,0,108316,0,0,0,'Creature ''Ruby Keeper'' - Group 0: Execute SAI ID 0 if has GUID 108316'),
(22,1,27530,0,4,31,1,3,0,108317,0,0,0,'Creature ''Ruby Keeper'' - Group 0: Execute SAI ID 0 if has GUID 108317'),
(22,1,27530,0,5,31,1,3,0,108318,0,0,0,'Creature ''Ruby Keeper'' - Group 0: Execute SAI ID 0 if has GUID 108318'),
(22,1,27530,0,6,31,1,3,0,3009674,0,0,0,'Creature ''Ruby Keeper'' - Group 0: Execute SAI ID 0 if has GUID 3009674'),
(22,1,27530,0,7,31,1,3,0,3009675,0,0,0,'Creature ''Ruby Keeper'' - Group 0: Execute SAI ID 0 if has GUID 3009675'),
(22,1,27530,0,8,31,1,3,0,3009676,0,0,0,'Creature ''Ruby Keeper'' - Group 0: Execute SAI ID 0 if has GUID 3009676');
