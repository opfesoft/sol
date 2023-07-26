UPDATE `creature_template` SET `InhabitType` = `InhabitType` | 4 WHERE `entry` = 24035;
DELETE FROM `creature_text` WHERE `CreatureID` = 24035 AND `GroupID` = 0 AND `ID` > 8;
UPDATE `creature` SET `modelid` = 0, `spawntimesecs` = 295, `wander_distance` = 0, `MovementType` = 0 WHERE `id` = 24035;
UPDATE `creature` SET `orientation` = 1.05852 WHERE `guid` = 115239;
UPDATE `creature` SET `orientation` = 5.31736 WHERE `guid` = 115235;
UPDATE `creature` SET `orientation` = 0.456211 WHERE `guid` = 115236;
UPDATE `creature` SET `orientation` = 3.61817 WHERE `guid` = 115238;
UPDATE `creature` SET `position_x` = 2686.8, `position_y` = -3513.21, `position_z` = 206.213, `orientation` = 1.10566 WHERE `guid` = 113202;
UPDATE `gameobject` SET `id` = 186907, `state` = 1 WHERE `guid` = 56466;
UPDATE `gameobject` SET `id` = 186910 WHERE `guid` = 56225;

DELETE FROM `creature` WHERE `guid` = 48198;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(48198,24014,571,0,0,1,1,0,1,2598.21,-3574.16,161.379,4.19727,300,0,7185,0,0,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` IN (117664,117670,117671,117672,117677);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(117664,0,0,0,0,383,0,'32566'),
(117670,0,0,0,0,383,0,'32566'),
(117671,0,0,0,0,383,0,'32566'),
(117672,0,0,0,0,383,0,'32566'),
(117677,0,0,0,0,383,0,'32566');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (24035,24014);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (18649100,2403500);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18649100,9,0,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Gjalerbron Cage - On Script - Store Target 1 (Invoker)'),
(18649100,9,1,0,0,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,9,24035,0,1,0,0,0,0,0,'Gjalerbron Cage - On Script - Send Target 1 (Gjalerbron Prisoner)'),
(18649100,9,2,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,9,24035,0,1,0,0,0,0,0,'Gjalerbron Cage - On Script - Set Data 1 1 (Gjalerbron Prisoner)'),

(24035,0,0,0,11,0,100,0,0,0,0,0,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Gjalerbron Prisoner - On Respawn - Set Fly Off (CONDITION_OBJECT_ENTRY_GUID)'),
(24035,0,1,2,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gjalerbron Prisoner - On Respawn - Disable Event Phase Reset'),
(24035,0,2,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gjalerbron Prisoner - Linked - Set Event Phase 1'),
(24035,0,3,0,1,1,100,0,180000,360000,180000,360000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gjalerbron Prisoner - OOC (Event Phase 1) - Say Line 0 (CONDITION_OBJECT_ENTRY_GUID)'),
(24035,0,4,0,38,0,100,1,1,1,0,0,0,80,2403500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gjalerbron Prisoner - On Data Set 1 1 - Call Timed Action List (CONDITION_OBJECT_ENTRY_GUID)'),
(24035,0,5,0,1,0,100,0,5000,5000,5000,5000,0,45,2,2,0,0,0,0,19,24014,10,0,0,0,0,0,0,'Gjalerbron Prisoner - OOC - Set Data 2 2 (Necrolord) (CONDITION_OBJECT_ENTRY_GUID)'),

(2403500,9,0,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gjalerbron Prisoner - On Script - Set Event Phase 2'),
(2403500,9,1,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gjalerbron Prisoner - On Script - Set Active On'),
(2403500,9,2,0,0,0,100,0,0,0,0,0,0,33,24035,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Gjalerbron Prisoner - On Script - Quest Credit ''Gjalerbron Prisoner'''),
(2403500,9,3,0,0,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Gjalerbron Prisoner - On Script - Say Line 1'),
(2403500,9,4,0,0,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gjalerbron Prisoner - On Script - Force Despawn'),

(24014,0,0,0,4,0,50,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Necrolord - On Aggro - Say Line 0'),
(24014,0,1,0,0,0,100,0,0,0,3000,4000,0,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Necrolord - IC - Cast ''Shadow Bolt'''),
(24014,0,2,0,0,0,100,0,3000,7000,10000,20000,0,11,17173,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Necrolord - IC - Cast ''Drain Life'''),
(24014,0,3,0,0,0,100,0,5000,8000,25000,30000,0,11,18267,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Necrolord - IC - Cast ''Curse of Weakness'''),
(24014,0,4,0,38,0,100,0,2,2,0,0,0,11,43151,32,0,0,0,0,7,0,0,0,0,0,0,0,0,'Necrolord - On Data Set 2 2 - Cast ''Necrolord: Purple Beam'' (Invoker)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 24035;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,24035,0,0,31,1,3,0,117664,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 0 if has no GUID 117664'),
(22,1,24035,0,0,31,1,3,0,117670,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 0 if has no GUID 117670'),
(22,1,24035,0,0,31,1,3,0,117671,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 0 if has no GUID 117671'),
(22,1,24035,0,0,31,1,3,0,117672,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 0 if has no GUID 117672'),
(22,1,24035,0,0,31,1,3,0,117677,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 0 if has no GUID 117677'),

(22,4,24035,0,0,31,1,3,0,117664,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 3 if has no GUID 117664'),
(22,4,24035,0,0,31,1,3,0,117670,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 3 if has no GUID 117670'),
(22,4,24035,0,0,31,1,3,0,117671,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 3 if has no GUID 117671'),
(22,4,24035,0,0,31,1,3,0,117672,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 3 if has no GUID 117672'),
(22,4,24035,0,0,31,1,3,0,117677,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 3 if has no GUID 117677'),
(22,4,24035,0,0,31,1,3,0,117717,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 3 if has no GUID 117717'),
(22,4,24035,0,0,31,1,3,0,117718,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 3 if has no GUID 117718'),
(22,4,24035,0,0,31,1,3,0,117719,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 3 if has no GUID 117719'),
(22,4,24035,0,0,31,1,3,0,117720,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 3 if has no GUID 117720'),
(22,4,24035,0,0,31,1,3,0,117721,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 3 if has no GUID 117721'),
(22,4,24035,0,0,31,1,3,0,117722,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 3 if has no GUID 117722'),
(22,4,24035,0,0,31,1,3,0,117723,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 3 if has no GUID 117723'),

(22,5,24035,0,0,31,1,3,0,117664,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 4 if has no GUID 117664'),
(22,5,24035,0,0,31,1,3,0,117670,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 4 if has no GUID 117670'),
(22,5,24035,0,0,31,1,3,0,117671,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 4 if has no GUID 117671'),
(22,5,24035,0,0,31,1,3,0,117672,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 4 if has no GUID 117672'),
(22,5,24035,0,0,31,1,3,0,117677,1,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 4 if has no GUID 117677'),

(22,6,24035,0,0,31,1,3,0,117664,0,0,0,'Creature ''Gjalerbron Prisoner'' - Group 0: Execute SAI ID 5 if has GUID 117664'),
(22,6,24035,0,1,31,1,3,0,117670,0,0,0,'Creature ''Gjalerbron Prisoner'' - Group 1: Execute SAI ID 5 if has GUID 117670'),
(22,6,24035,0,2,31,1,3,0,117671,0,0,0,'Creature ''Gjalerbron Prisoner'' - Group 2: Execute SAI ID 5 if has GUID 117671'),
(22,6,24035,0,3,31,1,3,0,117672,0,0,0,'Creature ''Gjalerbron Prisoner'' - Group 3: Execute SAI ID 5 if has GUID 117672'),
(22,6,24035,0,4,31,1,3,0,117677,0,0,0,'Creature ''Gjalerbron Prisoner'' - Group 4: Execute SAI ID 5 if has GUID 117677');
