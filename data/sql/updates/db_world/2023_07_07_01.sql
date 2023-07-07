UPDATE `creature_template_addon` SET `emote` = 0 WHERE `entry` = 20453;
UPDATE `creature_template_addon` SET `auras` = '32566' WHERE `entry` = 20755;

UPDATE `creature` SET `position_x` = 4106.89, `position_y` = 2243.75, `position_z` = 116.262 WHERE `guid` = 72461;
UPDATE `creature` SET `position_x` = 3739.79, `position_y` = 2390.13, `position_z` = 112.78, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 72467;
UPDATE `creature` SET `orientation` = 0.891858 WHERE `guid` = 72480;
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` IN (72464,72465,72466);
UPDATE `creature` SET `spawntimesecs` = 60 WHERE `guid` IN (73229,73230,73231,72473);

UPDATE `creature_addon` SET `bytes2` = 1 WHERE `guid` IN (86836,73098);

DELETE FROM `creature_addon` WHERE `guid` IN (72457,72458,72459,72460,72463,72467,72472,72468,72469,72471,72474,72475,72477);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(72457,0,0,0,1,28,0,NULL),
(72458,0,0,0,1,45,0,NULL),
(72459,0,0,0,1,45,0,NULL),
(72460,0,0,0,1,28,0,NULL),
(72463,0,0,0,1,0,0,'35504'),
(72468,0,0,0,1,28,0,NULL),
(72469,0,0,0,1,28,0,NULL),
(72471,0,0,0,1,28,0,NULL),
(72474,0,0,0,1,28,0,NULL),
(72475,0,0,0,1,28,0,NULL),
(72477,0,0,0,1,28,0,NULL);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (20453,20458) AND `id` > 1;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (-73229,-73230,-73231,20769,20770);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2045800,2075500);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2045400 AND `id` = 6;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20453,0,2,0,1,0,100,0,2000,3000,2000,3000,0,10,36,60,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Shocktrooper - OOC - Play Random Emote (CONDITION_OBJECT_ENTRY_GUID)'),

(20458,0,2,3,11,0,100,0,0,0,0,0,0,17,468,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Archon - On Respawn - Set Emote State ''STATE_SPELL_CHANNEL_OMNI'' (CONDITION_OBJECT_ENTRY_GUID)'),
(20458,0,3,4,61,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Archon - Linked - Set Event Phase Reset Off'),
(20458,0,4,5,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Archon - Linked - Set Event Phase 1'),
(20458,0,5,0,61,0,100,0,0,0,0,0,0,11,12980,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Archon - Linked - Cast ''Simple Teleport'''),
(20458,0,6,0,1,1,100,0,5000,5000,5000,5000,0,80,2045800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Archon - OOC (Event Phase 1) - Call Timed Action List (CONDITION_NEAR_UNIT)'),

(2045800,9,0,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Archon - On Script - Set Event Phase 2'),
(2045800,9,1,0,0,0,100,0,0,0,0,0,0,11,12980,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Archon - On Script - Cast ''Simple Teleport'''),
(2045800,9,2,0,0,0,100,0,500,500,0,0,0,62,530,0,0,0,0,0,1,0,0,0,0,3872.99,2322.2,114.576,1.81453,'Ethereum Archon - On Script - Teleport'),
(2045800,9,3,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,8,0,0,0,0,3872.99,2322.2,114.576,1.81453,'Ethereum Archon - On Script - Set Home Position'),
(2045800,9,4,0,0,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Archon - On Script - Set Emote State ''ONESHOT_NONE'''),

(-73229,0,0,0,11,0,100,0,0,0,0,0,0,231,2075500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Energy Cell - On Respawn - Start Cyclic Movement'),
(-73229,0,1,2,1,0,100,0,10000,20000,10000,20000,0,11,45537,0,0,0,0,0,19,20458,15,0,0,0,0,0,0,'Ethereum Energy Cell - OOC - Cast ''Cosmetic - Lightning Beam Channel'' (Ethereum Archon)'),
(-73229,0,2,0,61,0,100,0,0,0,0,0,0,67,1,2000,2000,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Energy Cell - Linked - Create Timed Event 1'),
(-73229,0,3,0,59,0,100,0,1,0,0,0,0,92,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Energy Cell - On Timed Event 1 Triggered - Interrupt Spell'),
(-73229,0,4,0,38,0,100,0,1,1,0,0,0,80,2075500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Energy Cell - On Data Set 1 1 - Call Timed Action List'),

(-73230,0,0,0,11,0,100,0,0,0,0,0,0,231,2075501,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Energy Cell - On Respawn - Start Cyclic Movement'),
(-73230,0,1,2,1,0,100,0,10000,20000,10000,20000,0,11,45537,0,0,0,0,0,19,20458,15,0,0,0,0,0,0,'Ethereum Energy Cell - OOC - Cast ''Cosmetic - Lightning Beam Channel'' (Ethereum Archon)'),
(-73230,0,2,0,61,0,100,0,0,0,0,0,0,67,1,2000,2000,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Energy Cell - Linked - Create Timed Event 1'),
(-73230,0,3,0,59,0,100,0,1,0,0,0,0,92,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Energy Cell - On Timed Event 1 Triggered - Interrupt Spell'),
(-73230,0,4,0,38,0,100,0,1,1,0,0,0,80,2075500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Energy Cell - On Data Set 1 1 - Call Timed Action List'),

(-73231,0,0,0,11,0,100,0,0,0,0,0,0,231,2075502,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Energy Cell - On Respawn - Start Cyclic Movement'),
(-73231,0,1,2,1,0,100,0,10000,20000,10000,20000,0,11,45537,0,0,0,0,0,19,20458,15,0,0,0,0,0,0,'Ethereum Energy Cell - OOC - Cast ''Cosmetic - Lightning Beam Channel'' (Ethereum Archon)'),
(-73231,0,2,0,61,0,100,0,0,0,0,0,0,67,1,2000,2000,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Energy Cell - Linked - Create Timed Event 1'),
(-73231,0,3,0,59,0,100,0,1,0,0,0,0,92,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Energy Cell - On Timed Event 1 Triggered - Interrupt Spell'),
(-73231,0,4,0,38,0,100,0,1,1,0,0,0,80,2075500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Energy Cell - On Data Set 1 1 - Call Timed Action List'),

(2075500,9,0,0,0,0,100,0,0,0,0,0,0,231,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Energy Cell - On Script - Stop Cyclic Movement'),
(2075500,9,1,0,0,0,100,0,0,0,0,0,0,28,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Energy Cell - On Script - Remove All Auras'),
(2075500,9,2,0,0,0,100,0,0,0,0,0,0,11,35681,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Energy Cell - On Script - Cast ''Blue Energy State'''),
(2075500,9,3,0,0,0,100,0,5000,5000,0,0,0,11,58538,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Energy Cell - On Script - Cast ''Arcane Explosion Visual'''),
(2075500,9,4,0,0,0,100,0,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Energy Cell - On Script - Force Despawn'),

(20769,0,0,1,11,0,100,0,0,0,0,0,0,11,32566,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Salaadin''s Energy Ball - On Respawn - Cast ''Purple Banish State'''),
(20769,0,1,2,61,0,100,0,0,0,0,0,0,242,200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Salaadin''s Energy Ball - Linked - Set Scale'),
(20769,0,2,0,61,0,100,0,0,0,0,0,0,11,35515,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Salaadin''s Energy Ball - Linked - Cast Spell ''Salaadin''s Tesla'''),
(20769,0,3,0,38,0,100,0,1,1,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Salaadin''s Energy Ball - On Data Set 1 1 - Set Event Phase 1'),
(20769,0,4,5,60,1,100,1,13000,13000,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Salaadin''s Energy Ball - On Update (Event Phase 1, No Repeat) - Force Despawn'),
(20769,0,5,0,61,0,100,0,0,0,0,0,0,11,58538,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Salaadin''s Energy Ball - Linked - Cast ''Arcane Explosion Visual'''),

(20770,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,36515,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Warden Icoshock - OOC - Cast ''Shadowtouched'''),
(20770,0,1,0,0,0,100,0,2500,5000,10000,12500,0,11,36517,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Warden Icoshock - IC - Cast ''Shadowsurge''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (20453,20458);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,3,20453,0,0,31,1,3,0,72458,0,0,0,'Creature ''Ethereum Shocktrooper'' - Group 0: Execute SAI ID 2 if has GUID 72458'),
(22,3,20453,0,1,31,1,3,0,72459,0,0,0,'Creature ''Ethereum Shocktrooper'' - Group 1: Execute SAI ID 2 if has GUID 72459'),

(22,3,20458,0,0,31,1,3,0,72473,0,0,0,'Creature ''Ethereum Archon'' - Group 0: Execute SAI ID 2 if has GUID 72473'),

(22,7,20458,0,0,29,1,0,15,0,0,0,0,'Creature ''Ethereum Archon'' - Group 0: Execute SAI ID 6 if near player'),
(22,7,20458,0,1,29,1,20802,30,0,0,0,0,'Creature ''Ethereum Archon'' - Group 1: Execute SAI ID 6 if near creature ''Protectorate Demolitionist''');

DELETE FROM `waypoints` WHERE `entry` IN (2075500,2075501,2075502);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(2075500,1,3871.96,2306.17,118.437,'Ethereum Energy Cell GUID 73229'),
(2075500,2,3871.23,2310.04,118.327,NULL),
(2075500,3,3876.61,2314.49,117.492,NULL),
(2075500,4,3880.55,2310.23,117.718,NULL),
(2075500,5,3879.39,2305.07,117.686,NULL),

(2075501,1,3874.75,2312.04,121.746,'Ethereum Energy Cell GUID 73230'),
(2075501,2,3870.8,2307.02,121.25,NULL),
(2075501,3,3875.11,2303.17,121.024,NULL),
(2075501,4,3880.56,2306.53,120.632,NULL),
(2075501,5,3878.66,2312.38,121.455,NULL),

(2075502,1,3872.62,2307.35,124.38,'Ethereum Energy Cell GUID 73231'),
(2075502,2,3873.42,2313.07,125.821,NULL),
(2075502,3,3880.58,2313.78,128.582,NULL),
(2075502,4,3880.87,2307.01,125.334,NULL),
(2075502,5,3874.76,2303.13,123.533,NULL);

DELETE FROM `waypoint_data` WHERE `id` IN (730980,868360);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
-- Captain Zovax
(730980,1,4130.9,2301.45,103.186,NULL,0,0,0,0,100,0),
(730980,2,4121.8,2300.52,104.389,NULL,0,0,0,0,100,0),
(730980,3,4114.41,2299.77,105.704,NULL,0,0,0,0,100,0),
(730980,4,4109.02,2299.22,106.61,NULL,0,0,0,0,100,0),
(730980,5,4102.61,2298.57,106.653,NULL,0,0,0,0,100,0),
(730980,6,4096.84,2297.98,107.889,NULL,0,0,0,0,100,0),
(730980,7,4091.57,2297.44,109.133,NULL,0,0,0,0,100,0),
(730980,8,4088.09,2302.45,109.676,NULL,0,0,0,0,100,0),
(730980,9,4084.55,2307.54,110.288,NULL,0,0,0,0,100,0),
(730980,10,4081.38,2312.09,110.573,NULL,0,0,0,0,100,0),
(730980,11,4078.08,2316.83,110.836,NULL,0,0,0,0,100,0),
(730980,12,4074.5,2321.96,111.174,NULL,0,0,0,0,100,0),
(730980,13,4072.47,2328.06,111.364,NULL,0,0,0,0,100,0),
(730980,14,4070.64,2333.58,111.667,NULL,0,0,0,0,100,0),
(730980,15,4068.5,2340,111.615,NULL,0,0,0,0,100,0),
(730980,16,4066.47,2346.09,111.487,NULL,0,0,0,0,100,0),
(730980,17,4064.44,2352.19,111.608,NULL,0,0,0,0,100,0),
(730980,18,4066.47,2346.09,111.487,NULL,0,0,0,0,100,0),
(730980,19,4068.5,2340,111.615,NULL,0,0,0,0,100,0),
(730980,20,4070.64,2333.58,111.667,NULL,0,0,0,0,100,0),
(730980,21,4072.47,2328.06,111.364,NULL,0,0,0,0,100,0),
(730980,22,4074.5,2321.96,111.174,NULL,0,0,0,0,100,0),
(730980,23,4078.08,2316.83,110.836,NULL,0,0,0,0,100,0),
(730980,24,4081.38,2312.09,110.573,NULL,0,0,0,0,100,0),
(730980,25,4084.55,2307.54,110.288,NULL,0,0,0,0,100,0),
(730980,26,4088.09,2302.45,109.676,NULL,0,0,0,0,100,0),
(730980,27,4091.57,2297.44,109.133,NULL,0,0,0,0,100,0),
(730980,28,4096.84,2297.98,107.889,NULL,0,0,0,0,100,0),
(730980,29,4102.61,2298.57,106.653,NULL,0,0,0,0,100,0),
(730980,30,4109.02,2299.22,106.61,NULL,0,0,0,0,100,0),
(730980,31,4114.41,2299.77,105.704,NULL,0,0,0,0,100,0),
(730980,32,4121.8,2300.52,104.389,NULL,0,0,0,0,100,0),
(730980,33,4130.9,2301.45,103.186,NULL,0,0,0,0,100,0),
(730980,34,4137.39,2301.82,102.113,NULL,0,0,0,0,100,0),
-- Warden Icoshock
(868360,1,3921.74,2451.01,113.342,5.29633,30000,0,0,0,100,0),
(868360,2,3929.85,2448.08,113.841,NULL,0,0,0,0,100,0),
(868360,3,3937.93,2445.16,114.002,NULL,0,0,0,0,100,0),
(868360,4,3944.74,2446.65,113.954,NULL,0,0,0,0,100,0),
(868360,5,3952.18,2448.27,114.26,NULL,0,0,0,0,100,0),
(868360,6,3961.2,2450.25,114.277,3.62027,30000,0,0,0,100,0),
(868360,7,3952.18,2448.27,114.26,NULL,0,0,0,0,100,0),
(868360,8,3944.74,2446.65,113.954,NULL,0,0,0,0,100,0),
(868360,9,3937.93,2445.16,114.002,NULL,0,0,0,0,100,0),
(868360,10,3929.85,2448.08,113.841,NULL,0,0,0,0,100,0);
