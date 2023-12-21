DELETE FROM `event_scripts` WHERE `id` = 15003;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(15003,3,10,23261,60000,1,3824.14,5245.13,334.098,6.02139);

UPDATE `creature_template` SET `modelid1` = 12869, `spell1` = 0, `spell2` = 0, `spell3` = 0, `spell4` = 0, `InhabitType` = 7 WHERE `entry` = 23261;
UPDATE `creature_template_addon` SET `bytes1` = 0 WHERE `entry` = 23261;

DELETE FROM `creature_text` WHERE `CreatureId` = 23261;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(23261,0,0,'Get away from my clutch!!!',14,0,100,0,0,7274,21696,0,'Furywing'),
(23261,0,1,'I know you by your stench, little $n.  Here, in my perch, is where your bones shall finally rest.',14,0,100,0,0,7274,21706,0,'Furywing'),
(23261,0,2,'I tire of interruptions from the insignificant.  Your time has come, $n!',14,0,100,0,0,7274,21710,0,'Furywing'),
(23261,0,3,'The Skyguard shall pay for your temerity, $n!',14,0,100,0,0,7274,21714,0,'Furywing'),
(23261,0,4,'I believe that I shall feast upon both $r and ogre flesh tonight.',14,0,100,0,0,7274,21718,0,'Furywing'),
(23261,0,5,'Little $r, you will now come to appreciate my wrath!',14,0,100,0,0,7274,21720,0,'Furywing'),
(23261,0,6,'You have dared to defile my perch and must now be cleansed in fire!',14,0,100,0,0,7274,21726,0,'Furywing'),
(23261,0,7,'What''s this?!  $n and $g his : her; friends come to play?',14,0,100,0,0,7274,21733,0,'Furywing');

DELETE FROM `creature` WHERE `guid` = 3009672;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
(3009672,23261,530,0,0,1,1,0,0,4045.91,4914.19,361.612,1.34577,900,0,1,0,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` = 3009672;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(3009672,0,0,33554432,0,0,1,NULL);

UPDATE `gameobject` SET `spawntimesecs` = -1 WHERE `guid` IN (28022,28027,28023,28028,28025,28029,28024,28026);
UPDATE `gameobject` SET `spawntimesecs` = 900 WHERE `guid` IN (27967,27969);
UPDATE `gameobject` SET `spawntimesecs` = 895 WHERE `guid` IN (27965,27966,27968);

DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 185937;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (23261,-3009672);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (18593700,2326100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(185937,1,0,0,64,0,100,0,1,0,0,0,0,215,0,0,0,0,0,0,8,0,0,0,0,4045.91,4914.19,0,0,'Furywing''s Egg - On Gossip Hello - Load Grid (Furywing Position)'),
(185937,1,1,0,62,0,100,0,8690,0,0,0,0,80,18593700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing''s Egg - On Gossip Option 0 Selected - Call Timed Action List'),

(18593700,9,0,0,0,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Furywing''s Egg - On Script - Close Gossip'),
(18593700,9,1,0,0,0,100,0,0,0,0,0,0,12,23364,1,15000,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing''s Egg - On Script - Summon Creature (Black Dragon Whelpling)'),
(18593700,9,2,0,0,0,100,0,0,0,0,0,0,85,41049,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Furywing''s Egg - On Script - Invoker Cast ''Four Dragons: Reagents - Furywing'''),
(18593700,9,3,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,10,3009672,23261,1,1,0,0,0,0,'Furywing''s Egg - On Script - Force Despawn (Furywing)'),
(18593700,9,4,0,0,0,100,0,0,0,0,0,0,70,10,0,0,0,0,0,15,185933,5,0,0,0,0,0,0,'Furywing''s Egg - On Script - Respawn GO (Apexis Shard 01)'),
(18593700,9,5,0,0,0,100,0,0,0,0,0,0,70,10,0,0,0,0,0,15,185934,5,0,0,0,0,0,0,'Furywing''s Egg - On Script - Respawn GO (Apexis Shard 02)'),
(18593700,9,6,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing''s Egg - On Script - Despawn GO'),
(18593700,9,7,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,15,185935,5,0,0,0,0,0,0,'Furywing''s Egg - On Script - Despawn GO (Dragon Egg Aura)'),
(18593700,9,8,0,0,0,100,0,10000,10000,0,0,0,233,0,0,0,0,0,0,15,185929,5,0,0,0,0,0,0,'Furywing''s Egg - On Script - Despawn GO (Dragonkin Nest 01)'),
(18593700,9,9,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,15,185930,5,0,0,0,0,0,0,'Furywing''s Egg - On Script - Despawn GO (Dragonkin Nest 02)'),
(18593700,9,10,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,15,185931,5,0,0,0,0,0,0,'Furywing''s Egg - On Script - Despawn GO (Dragonkin Nest 03)'),

(-3009672,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing - On Respawn - Set Active On'),
(-3009672,0,1,2,61,0,100,0,0,0,0,0,0,70,0,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing - Linked - Disable Save Respawn Time'),
(-3009672,0,2,0,61,0,100,0,0,0,0,0,0,53,1,23261,1,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing - Linked - Start WP Movement'),
(-3009672,0,3,0,1,0,100,0,6000,6000,6000,6000,0,11,40032,0,0,0,0,0,21,65,0,0,0,0,0,0,0,'Furywing - OOC - Cast ''Fiery Breath'' (Closest Player)'),

(23261,0,0,0,37,0,100,0,0,0,0,0,0,207,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing - On AI Init - Set Hover On'),
(23261,0,1,0,54,0,100,0,0,0,0,0,0,80,2326100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing - On Just Summoned - Call Timed Action List'),
(23261,0,2,0,34,0,100,0,8,1,0,0,0,67,1,1000,1000,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing - On Point 1 Reached - Create Timed Event 1'),
(23261,0,3,4,59,0,100,0,1,0,0,0,0,101,0,0,0,0,0,0,8,0,0,0,0,3880.75,5229.96,270.603,6.02139,'Furywing - On Timed Event 1 Triggered - Set Home Position'),
(23261,0,4,5,61,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(23261,0,5,6,61,0,100,0,0,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing - Linked - Set Fly Off'),
(23261,0,6,7,61,0,100,0,0,0,0,0,0,207,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing - Linked - Set Hover Off'),
(23261,0,7,8,61,0,100,0,0,0,0,0,0,210,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing - Linked - Fall'),
(23261,0,8,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Furywing - Linked - Start Attack (Stored Target 1)'),
(23261,0,9,0,0,0,100,0,5000,15000,10000,30000,0,11,9573,0,0,0,0,0,2,5,0,0,0,0,0,0,0,'Furywing - IC - Cast ''Flame Breath'''),
(23261,0,10,0,0,0,100,0,3500,5500,7000,12000,0,11,40505,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Furywing - IC - Cast ''Cleave'''),
(23261,0,11,0,0,0,100,0,4000,7000,40000,60000,0,11,41572,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Furywing - IC - Cast ''Wing Buffet'''),
(23261,0,12,0,0,0,100,0,8000,25000,25000,60000,0,11,36922,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing - IC - Cast ''Bellowing Roar'''),
(23261,0,13,0,0,0,100,0,9000,15000,9000,15000,0,11,15847,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Furywing - IC - Cast ''Tail Sweep'''),

(2326100,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing - On Script - Set Active On'),
(2326100,9,1,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Furywing - On Script - Store Target 1 (Invoker)'),
(2326100,9,2,0,0,0,100,0,0,0,0,0,0,207,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing - On Script - Set Hover On'),
(2326100,9,3,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2326100,9,4,0,0,0,100,0,0,0,0,0,0,116,60,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Furywing - On Script - Set Corpse Delay'),
(2326100,9,5,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Furywing - On Script - Say Line 0'),
(2326100,9,6,0,0,0,100,0,5000,5000,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,3880.75,5229.96,280.603,0,'Furywing - On Script - Move To Point 1');

DELETE FROM `waypoints` WHERE `entry` = 23261;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(23261,1,4057.03,4962.77,361.612,'Furywing'),
(23261,2,4053.2,5011.8,361.612,NULL),
(23261,3,4052.46,5060.95,361.612,NULL),
(23261,4,4053.65,5109.91,361.612,NULL),
(23261,5,4053.26,5158.96,361.612,NULL),
(23261,6,4049.45,5207.94,361.612,NULL),
(23261,7,4041.68,5251.51,361.612,NULL),
(23261,8,4038.73,5300.97,361.612,NULL),
(23261,9,4040.51,5349.67,361.612,NULL),
(23261,10,4043.06,5398.79,361.612,NULL),
(23261,11,4046.15,5447.84,361.612,NULL),
(23261,12,4053.93,5496.79,361.612,NULL),
(23261,13,4068.87,5542.62,361.612,NULL),
(23261,14,4066.99,5591.75,361.612,NULL),
(23261,15,4053.57,5639.87,361.612,NULL),
(23261,16,4037.27,5686.93,361.612,NULL),
(23261,17,4014.02,5730.72,361.612,NULL),
(23261,18,3988.54,5772.89,361.612,NULL),
(23261,19,3966.26,5816.79,361.612,NULL),
(23261,20,3947.24,5862.56,361.612,NULL),
(23261,21,3928.41,5908.81,361.612,NULL),
(23261,22,3932.79,5957.5,361.612,NULL),
(23261,23,3947.28,6004.66,361.612,NULL),
(23261,24,3929.28,6050.74,361.612,NULL),
(23261,25,3881.02,6060.04,361.612,NULL),
(23261,26,3834.01,6043.28,361.612,NULL),
(23261,27,3812.44,5999.02,361.612,NULL),
(23261,28,3804.87,5950.09,361.612,NULL),
(23261,29,3829.84,5907.25,361.612,NULL),
(23261,30,3858.82,5867.79,361.612,NULL),
(23261,31,3889.9,5828.43,361.612,NULL),
(23261,32,3920.99,5789.04,361.612,NULL),
(23261,33,3948.72,5748.27,361.612,NULL),
(23261,34,3971.72,5704.24,361.612,NULL),
(23261,35,3983.51,5656.17,361.612,NULL),
(23261,36,3991.1,5608.38,361.612,NULL),
(23261,37,3994.9,5559.08,361.612,NULL),
(23261,38,3994.37,5510.29,361.612,NULL),
(23261,39,3995.17,5461.3,361.612,NULL),
(23261,40,3996.76,5412.01,361.612,NULL),
(23261,41,3998.8,5363.44,361.612,NULL),
(23261,42,3991.57,5314.28,361.612,NULL),
(23261,43,3970.13,5269.34,361.612,NULL),
(23261,44,3953.14,5222.13,361.612,NULL),
(23261,45,3937.27,5175.01,361.612,NULL),
(23261,46,3922.6,5128.04,361.612,NULL),
(23261,47,3921.25,5079.44,361.612,NULL),
(23261,48,3923.93,5031.54,361.612,NULL),
(23261,49,3926.66,4982.02,361.612,NULL),
(23261,50,3939.91,4934.33,361.612,NULL),
(23261,51,3965.7,4892.08,361.612,NULL),
(23261,52,4006.36,4883.67,361.612,NULL),
(23261,53,4045.91,4914.19,361.612,NULL);
