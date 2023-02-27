DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (43568,43569);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
(43568,34872,1,'Frost Strike - Frostbite Rune'),
(43569,34872,1,'Frost - Frostbite Rune');

UPDATE `creature` SET `position_x` = 2820.33, `position_y` = -3602.55, `position_z` = 245.559, `orientation` = 3.66519 WHERE `guid` = 1975896;

DELETE FROM `creature` WHERE `guid` IN (76053,76054,76055,76057,76058,76059,76061);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(76053,15214,571,0,0,1,1,0,0,2842.76,-3599.55,247.256,1.65806,300,0,1,0,0,0,0,0,0),
(76054,15214,571,0,0,1,1,0,0,2807.39,-3586.93,247.692,3.45575,300,0,1,0,0,0,0,0,0),
(76055,15214,571,0,0,1,1,0,0,2833.02,-3621.02,247.373,1.85005,300,0,1,0,0,0,0,0,0),
(76057,23033,571,0,0,1,1,0,0,2832.85,-3638.88,246.936,0.523599,300,0,1,0,0,0,0,0,0),
(76058,23033,571,0,0,1,1,0,0,2820.24,-3602.6,261.44,6.16101,300,0,1,0,0,0,0,0,0),
(76059,23033,571,0,0,1,1,0,0,2855.82,-3596.34,248.486,5.13127,300,0,1,0,0,0,0,0,0),
(76061,23033,571,0,0,1,1,0,0,2818.34,-3604.44,252.666,3.84538,300,0,1,0,0,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` = 76058;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(76058,0,0,0,1,0,0,'43570');

UPDATE `creature` SET `MovementType` = 0 WHERE `guid` = 115879;
UPDATE `creature_addon` SET `path_id` = 0 WHERE `guid` = 115879;
DELETE FROM `waypoint_data` WHERE `id` = 1158790;
DELETE FROM `waypoint_scripts` WHERE `id` = 115879;

DELETE FROM `creature_text` WHERE `CreatureId` = 24029;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(24029,0,0,'Did you really think that by facing me, you have any hope of saving your friends?',12,0,100,0,0,0,23696,0,'Wyrmcaller Vile');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 24029;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (24029,24019,-106031,-76053,-76054,-76055,-76058,-76061);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` BETWEEN 1521400 AND 1521403;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(24029,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12544,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wyrmcaller Vile - OOC - Cast ''Frost Armor'''),
(24029,0,1,0,1,0,100,0,0,0,1000,1000,0,11,43576,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wyrmcaller Vile - OOC - Cast ''Frost Power'''),
(24029,0,2,0,0,0,100,0,0,0,4000,4000,0,11,9672,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wyrmcaller Vile - IC - Cast ''Frostbolt'''),
(24029,0,3,0,9,0,100,0,0,8,13000,15000,0,11,15532,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wyrmcaller Vile - Within 0-8 Range - Cast ''Frost Nova'''),
(24029,0,4,0,1,0,100,0,0,0,3000,3000,0,45,1,1,0,0,0,0,10,76061,23033,0,0,0,0,0,0,'Wyrmcaller Vile - OOC - Set Data 1 1 (Invisible Stalker (Floating))'),
(24029,0,5,0,1,0,100,0,0,0,5000,7000,0,45,1,1,0,0,0,0,10,76058,23033,0,0,0,0,0,0,'Wyrmcaller Vile - OOC - Set Data 1 1 (Invisible Stalker (Floating))'),
(24029,0,6,0,4,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wyrmcaller Vile - On Aggro - Say Line 0'),

(24019,0,0,1,11,0,100,0,0,0,0,0,0,53,1,24019,1,0,0,0,1,0,0,0,0,0,0,0,0,'Glacion - On Respawn - Start WP Movement (CONDITION_OBJECT_ENTRY_GUID)'),
(24019,0,1,2,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Glacion - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(24019,0,2,0,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Glacion - Linked - Set Active On'),
(24019,0,3,4,60,0,100,1,500,500,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,2823,-3620,247,0,'Glacion - On Update (No Repeat) - Move To Point 1 (CONDITION_OBJECT_ENTRY_GUID)'),
(24019,0,4,5,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Glacion - Linked - Set Active On'),
(24019,0,5,6,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Glacion - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(24019,0,6,7,61,0,100,0,0,0,0,0,0,204,1024,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Glacion - Linked - Set ''MOVEMENTFLAG_DISABLE_GRAVITY'''),
(24019,0,7,8,61,0,100,0,0,0,0,0,0,116,60,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Glacion - Linked - Set Corpse Delay'),
(24019,0,8,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,10,115879,24019,1,1,0,0,0,0,'Glacion - Linked - Force Despawn (Glacion)'),
(24019,0,9,10,34,0,100,0,8,1,0,0,0,204,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Glacion - On Point 1 Reached - Set ''MOVEMENTFLAG_NONE'''),
(24019,0,10,0,61,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Glacion - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(24019,0,11,0,0,0,100,0,3000,4000,8000,9000,0,11,43562,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Glacion - IC - Cast ''Frost Breath'''),
(24019,0,12,0,0,0,100,0,7000,7000,14000,15000,0,11,11264,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Glacion - IC - Cast ''Ice Blast'''),
(24019,0,13,0,1,0,100,0,20000,40000,20000,40000,0,4,7274,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Glacion - OOC - Play Sound ''DragonRoar'''),

(-106031,0,0,0,8,0,100,0,43568,0,0,0,0,80,1521400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Invisible Stalker - On SpellHit ''Frost Strike'' - Call Timed Action List'),
(-76053,0,0,0,8,0,100,0,43568,0,0,0,0,80,1521401,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Invisible Stalker - On SpellHit ''Frost Strike'' - Call Timed Action List'),
(-76054,0,0,0,8,0,100,0,43568,0,0,0,0,80,1521402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Invisible Stalker - On SpellHit ''Frost Strike'' - Call Timed Action List'),
(-76055,0,0,0,8,0,100,0,43568,0,0,0,0,80,1521403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Invisible Stalker - On SpellHit ''Frost Strike'' - Call Timed Action List'),
(-76058,0,0,0,38,0,100,0,1,1,0,0,0,11,43591,2,0,0,0,0,10,1975896,24029,0,0,0,0,0,0,'Invisible Stalker (Floating) - On Data Set 1 1 - Cast ''Soul Siphon'' (Wyrmcaller Vile)'),
(-76061,0,0,0,38,0,100,0,1,1,0,0,0,11,43568,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Invisible Stalker (Floating) - On Data Set 1 1 - Cast ''Frost Strike'''),

(1521400,9,0,0,0,0,100,0,2400,2400,0,0,0,11,43569,2,0,0,0,0,10,119543,23033,0,0,0,0,0,0,'Invisible Stalker - On Script - Cast ''Frost'' (Invisible Stalker (Floating))'),
(1521401,9,0,0,0,0,100,0,2400,2400,0,0,0,11,43569,2,0,0,0,0,10,76059,23033,0,0,0,0,0,0,'Invisible Stalker - On Script - Cast ''Frost'' (Invisible Stalker (Floating))'),
(1521402,9,0,0,0,0,100,0,2400,2400,0,0,0,11,43569,2,0,0,0,0,10,119533,23033,0,0,0,0,0,0,'Invisible Stalker - On Script - Cast ''Frost'' (Invisible Stalker (Floating))'),
(1521403,9,0,0,0,0,100,0,2400,2400,0,0,0,11,43569,2,0,0,0,0,10,76057,23033,0,0,0,0,0,0,'Invisible Stalker - On Script - Cast ''Frost'' (Invisible Stalker (Floating))');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 24019;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 43568;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,24019,0,0,31,1,3,0,115879,0,0,0,'Creature ''Glacion'' - Group 0: Execute SAI ID 0 only if has GUID 115879'),
(22,4,24019,0,0,31,1,3,0,115879,1,0,0,'Creature ''Glacion'' - Group 0: Execute SAI ID 3 only if has no GUID 115879'),

(13,1,43568,0,0,31,0,3,15214,0,0,0,0,'Spell ''Frost Strike'' - Group 0: Implicit target creature ''Invisible Stalker''');

DELETE FROM `waypoints` WHERE `entry` = 24019;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(24019,1,2537.7,-3682.9,308.71,'Glacion'),
(24019,2,2561.32,-3713.3,308.71,NULL),
(24019,3,2597.5,-3747.97,308.71,NULL),
(24019,4,2642.57,-3767.54,311.155,NULL),
(24019,5,2691.12,-3771.67,317.044,NULL),
(24019,6,2740.77,-3762.45,321.988,NULL),
(24019,7,2782.88,-3736.63,328.988,NULL),
(24019,8,2803.22,-3692.9,339.988,NULL),
(24019,9,2806.97,-3653.62,344.488,NULL),
(24019,10,2807.03,-3604.19,344.488,NULL),
(24019,11,2801.89,-3555.09,341.266,NULL),
(24019,12,2779.92,-3485.24,337.205,NULL),
(24019,13,2774.64,-3445.25,337.766,NULL),
(24019,14,2760.34,-3416.03,334.571,NULL),
(24019,15,2730.58,-3383.47,329.932,NULL),
(24019,16,2693.33,-3350.29,323.599,NULL),
(24019,17,2655.71,-3327.89,316.627,NULL),
(24019,18,2610.21,-3307.05,308.016,NULL),
(24019,19,2562.33,-3309.15,295.099,NULL),
(24019,20,2518.56,-3332.53,290.016,NULL),
(24019,21,2486.65,-3369.76,280.016,NULL),
(24019,22,2465.08,-3413.46,280.016,NULL),
(24019,23,2452.02,-3460.01,280.016,NULL),
(24019,24,2450.74,-3509.19,289.044,NULL),
(24019,25,2459.94,-3558.51,293.988,NULL),
(24019,26,2479.77,-3603.32,299.516,NULL),
(24019,27,2508.88,-3643.34,305.932,NULL);
