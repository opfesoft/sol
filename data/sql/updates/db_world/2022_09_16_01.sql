DELETE FROM `creature` WHERE `guid` IN (43456,43457,43458,3009100,3009101,3009102,3009103);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(43456,15655,530,0,0,1,1,0,0,8607.49,-6788.45,101.839,0.00836706,-1,0,120,0,2,0,0,0,0),
(43457,15654,530,0,0,1,1,0,1,8605.56,-6790.09,102.006,0.00836706,-1,0,120,0,0,0,0,0,0),
(43458,15654,530,0,0,1,1,0,1,8605.38,-6786.45,102.481,0.00836706,-1,0,120,0,0,0,0,0,0),

(3009100,15655,530,0,0,1,1,0,0,9301.48,-6958.67,8.01523,6.19155,-1,0,120,0,2,0,0,0,0),
(3009101,15655,530,0,0,1,1,0,0,9298.69,-6960.92,7.68314,6.19155,-1,0,120,0,0,0,0,0,0),
(3009102,15655,530,0,0,1,1,0,0,9296.88,-6958.01,7.37056,6.19155,-1,0,120,0,0,0,0,0,0),
(3009103,15655,530,0,0,1,1,0,0,9300.1,-6955.84,7.74662,6.19155,-1,0,120,0,0,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` IN (43456,3009100);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(43456,434560,0,0,0,0,0,NULL),
(3009100,30091000,0,0,0,0,0,NULL);

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (43456,3009100);
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`)
VALUES
(43456,43456,0,0,2),
(43456,43457,2,45,2),
(43456,43458,2,315,2),

(3009100,3009100,0,0,2),
(3009100,3009101,2,45,2),
(3009100,3009103,2,315,2),
(3009100,3009102,2,0,2);

DELETE FROM `creature_text` WHERE `CreatureId` IN (15942,15416);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(15942,0,0,'Open fire!',14,0,100,0,0,0,12417,0,'Ranger Sareyn'),
(15942,0,1,'Enemy sighted!  Ready your weapons!',14,0,100,0,0,0,12418,0,'Ranger Sareyn'),
(15942,0,2,'Hold your positions!',14,0,100,0,0,0,12419,0,'Ranger Sareyn'),

(15416,0,0,'Slay them!  Don''t let the Scourge scum defile our city!',14,0,100,0,0,0,12861,0,'Ranger Jaela'),
(15416,0,1,'The enemy approaches from the south.  Ready your weapons!',14,0,100,0,0,0,12862,0,'Ranger Jaela'),
(15416,0,2,'The undead are approaching.  Attack!',14,0,100,0,0,0,12863,0,'Ranger Jaela'),
(15416,0,3,'Attack!  Don''t let them reach the gates!',14,0,100,0,0,0,11721,0,'Ranger Jaela');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (15942,15416);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (15942,15416);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(15942,0,0,1,1,0,100,0,300000,600000,300000,600000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ranger Sareyn - OOC - Say Line 0'),
(15942,0,1,2,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,43456,15655,0,0,0,0,0,0,'Ranger Sareyn - Linked - Respawn Target (Rotlimb Cannibal)'),
(15942,0,2,3,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,43457,15654,0,0,0,0,0,0,'Ranger Sareyn - Linked - Respawn Target (Plaguebone Pillager)'),
(15942,0,3,0,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,43458,15654,0,0,0,0,0,0,'Ranger Sareyn - Linked - Respawn Target (Plaguebone Pillager)'),

(15416,0,0,1,1,0,100,0,300000,600000,300000,600000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ranger Jaela - OOC - Say Line 0'),
(15416,0,1,2,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,3009100,15655,0,0,0,0,0,0,'Ranger Jaela - Linked - Respawn Target (Rotlimb Cannibal)'),
(15416,0,2,3,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,3009101,15655,0,0,0,0,0,0,'Ranger Jaela - Linked - Respawn Target (Rotlimb Cannibal)'),
(15416,0,3,4,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,3009102,15655,0,0,0,0,0,0,'Ranger Jaela - Linked - Respawn Target (Rotlimb Cannibal)'),
(15416,0,4,0,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,3009103,15655,0,0,0,0,0,0,'Ranger Jaela - Linked - Respawn Target (Rotlimb Cannibal)'),
(15416,0,5,0,0,0,100,0,0,0,3100,3700,0,11,20811,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ranger Jaela - IC - Cast ''Fireball''');

DELETE FROM `waypoint_data` WHERE `id` IN (434560,30091000);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(434560,1,8607.49,-6788.45,101.839,NULL,0,1,0,0,100,0),
(434560,2,8614.84,-6788.52,100.374,NULL,0,1,0,0,100,0),
(434560,3,8623.36,-6788.59,99.0964,NULL,0,1,0,0,100,0),
(434560,4,8634.09,-6788.69,98.0238,NULL,0,1,0,0,100,0),
(434560,5,8644.35,-6788.78,96.8979,NULL,0,1,0,0,100,0),
(434560,6,8654.84,-6788.88,95.5535,NULL,0,1,0,0,100,0),
(434560,7,8665.23,-6788.97,94.551,NULL,0,1,0,0,100,0),
(434560,8,8673.75,-6789.05,93.7817,NULL,0,1,0,0,100,0),
(434560,9,8681.79,-6789.12,93.1745,NULL,0,1,0,0,100,0),
(434560,10,8689.61,-6789.19,92.5613,NULL,0,1,0,0,100,0),
(434560,11,8681.79,-6789.12,93.1745,NULL,0,1,0,0,100,0),
(434560,12,8673.75,-6789.05,93.7817,NULL,0,1,0,0,100,0),
(434560,13,8665.23,-6788.97,94.551,NULL,0,1,0,0,100,0),
(434560,14,8654.84,-6788.88,95.5535,NULL,0,1,0,0,100,0),
(434560,15,8644.35,-6788.78,96.8979,NULL,0,1,0,0,100,0),
(434560,16,8634.09,-6788.69,98.0238,NULL,0,1,0,0,100,0),
(434560,17,8623.36,-6788.59,99.0964,NULL,0,1,0,0,100,0),
(434560,18,8614.84,-6788.52,100.374,NULL,0,1,0,0,100,0),

(30091000,1,9301.48,-6958.67,8.01523,NULL,0,1,0,0,100,0),
(30091000,2,9311.11,-6959.71,9.38412,NULL,0,1,0,0,100,0),
(30091000,3,9320.51,-6960.72,10.5473,NULL,0,1,0,0,100,0),
(30091000,4,9329.56,-6961.7,11.6182,NULL,0,1,0,0,100,0),
(30091000,5,9337.44,-6962.55,13.0861,NULL,0,1,0,0,100,0),
(30091000,6,9344.87,-6963.35,14.8941,NULL,0,1,0,0,100,0),
(30091000,7,9351.72,-6964.09,16.4165,NULL,0,1,0,0,100,0),
(30091000,8,9358.21,-6964.79,17.2386,NULL,0,1,0,0,100,0),
(30091000,9,9364.47,-6965.46,17.6392,NULL,0,1,0,0,100,0),
(30091000,10,9358.21,-6964.79,17.2386,NULL,0,1,0,0,100,0),
(30091000,11,9351.72,-6964.09,16.4165,NULL,0,1,0,0,100,0),
(30091000,12,9344.87,-6963.35,14.8941,NULL,0,1,0,0,100,0),
(30091000,13,9337.44,-6962.55,13.0861,NULL,0,1,0,0,100,0),
(30091000,14,9329.56,-6961.7,11.6182,NULL,0,1,0,0,100,0),
(30091000,15,9320.51,-6960.72,10.5473,NULL,0,1,0,0,100,0),
(30091000,16,9311.11,-6959.71,9.38412,NULL,0,1,0,0,100,0);
