DELETE FROM `event_scripts` WHERE `id` = 15002;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(15002,3,10,23281,60000,1,4220.44,5412.87,327.126,2.77507);

UPDATE `creature_template` SET `modelid1` = 12869, `spell1` = 0, `spell2` = 0, `spell3` = 0, `spell4` = 0, `InhabitType` = 7 WHERE `entry` = 23281;
UPDATE `creature_template_addon` SET `bytes1` = 0 WHERE `entry` = 23281;

DELETE FROM `creature_text` WHERE `CreatureId` = 23281;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(23281,0,0,'Get away from my clutch!!!',14,0,100,0,0,7274,21696,0,'Insidion'),
(23281,0,1,'I know you by your stench, little $n.  Here, in my perch, is where your bones shall finally rest.',14,0,100,0,0,7274,21706,0,'Insidion'),
(23281,0,2,'I tire of interruptions from the insignificant.  Your time has come, $n!',14,0,100,0,0,7274,21710,0,'Insidion'),
(23281,0,3,'The Skyguard shall pay for your temerity, $n!',14,0,100,0,0,7274,21714,0,'Insidion'),
(23281,0,4,'I believe that I shall feast upon both $r and ogre flesh tonight.',14,0,100,0,0,7274,21718,0,'Insidion'),
(23281,0,5,'Little $r, you will now come to appreciate my wrath!',14,0,100,0,0,7274,21720,0,'Insidion'),
(23281,0,6,'You have dared to defile my perch and must now be cleansed in fire!',14,0,100,0,0,7274,21726,0,'Insidion'),
(23281,0,7,'What''s this?!  $n and $g his : her; friends come to play?',14,0,100,0,0,7274,21733,0,'Insidion');

DELETE FROM `creature` WHERE `guid` = 3009671;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
(3009671,23281,530,0,0,1,1,0,0,3893.82,6067.05,392.508,5.41273,900,0,1,0,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` = 3009671;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(3009671,0,0,33554432,0,0,1,NULL);

UPDATE `gameobject` SET `spawntimesecs` = -1 WHERE `guid` IN (28052,28053,28051,28056,28055,28054,28050,28057);
UPDATE `gameobject` SET `spawntimesecs` = 900 WHERE `guid` IN (28045,28048);
UPDATE `gameobject` SET `spawntimesecs` = 895 WHERE `guid` IN (28044,28047,28046);

DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 185938;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (23281,-3009671);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (18593800,2328100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(185938,1,0,0,64,0,100,0,1,0,0,0,0,215,0,0,0,0,0,0,8,0,0,0,0,3893.82,6067.05,0,0,'Insidion''s Egg - On Gossip Hello - Load Grid (Insidion Position)'),
(185938,1,1,0,62,0,100,0,8691,0,0,0,0,80,18593800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion''s Egg - On Gossip Option 0 Selected - Call Timed Action List'),

(18593800,9,0,0,0,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Insidion''s Egg - On Script - Close Gossip'),
(18593800,9,1,0,0,0,100,0,0,0,0,0,0,12,23364,1,15000,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion''s Egg - On Script - Summon Creature (Black Dragon Whelpling)'),
(18593800,9,2,0,0,0,100,0,0,0,0,0,0,85,41051,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Insidion''s Egg - On Script - Invoker Cast ''Four Dragons: Reagents - Insidion'''),
(18593800,9,3,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,10,3009671,23281,1,1,0,0,0,0,'Insidion''s Egg - On Script - Force Despawn (Insidion)'),
(18593800,9,4,0,0,0,100,0,0,0,0,0,0,70,10,0,0,0,0,0,15,185933,5,0,0,0,0,0,0,'Insidion''s Egg - On Script - Respawn GO (Apexis Shard 01)'),
(18593800,9,5,0,0,0,100,0,0,0,0,0,0,70,10,0,0,0,0,0,15,185934,5,0,0,0,0,0,0,'Insidion''s Egg - On Script - Respawn GO (Apexis Shard 02)'),
(18593800,9,6,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion''s Egg - On Script - Despawn GO'),
(18593800,9,7,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,15,185935,5,0,0,0,0,0,0,'Insidion''s Egg - On Script - Despawn GO (Dragon Egg Aura)'),
(18593800,9,8,0,0,0,100,0,10000,10000,0,0,0,233,0,0,0,0,0,0,15,185929,5,0,0,0,0,0,0,'Insidion''s Egg - On Script - Despawn GO (Dragonkin Nest 01)'),
(18593800,9,9,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,15,185930,5,0,0,0,0,0,0,'Insidion''s Egg - On Script - Despawn GO (Dragonkin Nest 02)'),
(18593800,9,10,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,15,185931,5,0,0,0,0,0,0,'Insidion''s Egg - On Script - Despawn GO (Dragonkin Nest 03)'),

(-3009671,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion - On Respawn - Set Active On'),
(-3009671,0,1,2,61,0,100,0,0,0,0,0,0,70,0,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion - Linked - Disable Save Respawn Time'),
(-3009671,0,2,0,61,0,100,0,0,0,0,0,0,53,1,23281,1,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion - Linked - Start WP Movement'),
(-3009671,0,3,0,1,0,100,0,6000,6000,6000,6000,0,11,40032,0,0,0,0,0,21,65,0,0,0,0,0,0,0,'Insidion - OOC - Cast ''Fiery Breath'' (Closest Player)'),

(23281,0,0,0,37,0,100,0,0,0,0,0,0,207,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion - On AI Init - Set Hover On'),
(23281,0,1,0,54,0,100,0,0,0,0,0,0,80,2328100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion - On Just Summoned - Call Timed Action List'),
(23281,0,2,0,34,0,100,0,8,1,0,0,0,67,1,1000,1000,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion - On Point 1 Reached - Create Timed Event 1'),
(23281,0,3,4,59,0,100,0,1,0,0,0,0,101,0,0,0,0,0,0,8,0,0,0,0,4152.42,5438.98,274.061,2.77507,'Insidion - On Timed Event 1 Triggered - Set Home Position'),
(23281,0,4,5,61,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(23281,0,5,6,61,0,100,0,0,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion - Linked - Set Fly Off'),
(23281,0,6,7,61,0,100,0,0,0,0,0,0,207,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion - Linked - Set Hover Off'),
(23281,0,7,8,61,0,100,0,0,0,0,0,0,210,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion - Linked - Fall'),
(23281,0,8,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Insidion - Linked - Start Attack (Stored Target 1)'),
(23281,0,9,0,0,0,100,0,5000,15000,10000,30000,0,11,9573,0,0,0,0,0,2,5,0,0,0,0,0,0,0,'Insidion - IC - Cast ''Flame Breath'''),
(23281,0,10,0,0,0,100,0,3500,5500,7000,12000,0,11,40505,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Insidion - IC - Cast ''Cleave'''),
(23281,0,11,0,0,0,100,0,3000,7000,10000,30000,0,11,40719,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Insidion - IC - Cast ''Flame Buffet'''),
(23281,0,12,0,0,0,100,0,8000,25000,25000,60000,0,11,36922,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion - IC - Cast ''Bellowing Roar'''),
(23281,0,13,0,0,0,100,0,9000,15000,9000,15000,0,11,15847,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Insidion - IC - Cast ''Tail Sweep'''),

(2328100,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion - On Script - Set Active On'),
(2328100,9,1,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Insidion - On Script - Store Target 1 (Invoker)'),
(2328100,9,2,0,0,0,100,0,0,0,0,0,0,207,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion - On Script - Set Hover On'),
(2328100,9,3,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2328100,9,4,0,0,0,100,0,0,0,0,0,0,116,60,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Insidion - On Script - Set Corpse Delay'),
(2328100,9,5,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Insidion - On Script - Say Line 0'),
(2328100,9,6,0,0,0,100,0,5000,5000,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,4152.42,5438.98,284.061,0,'Insidion - On Script - Move To Point 1');

DELETE FROM `waypoints` WHERE `entry` = 23281;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(23281,1,3925.47,6029.5,392.508,'Insidion'),
(23281,2,3938.97,5981.24,392.508,NULL),
(23281,3,3942.93,5932.12,392.508,NULL),
(23281,4,3955.21,5884.47,392.508,NULL),
(23281,5,3972.29,5837.08,392.508,NULL),
(23281,6,3993.95,5792.93,392.508,NULL),
(23281,7,4011.21,5746.19,392.508,NULL),
(23281,8,4020.96,5697.28,392.508,NULL),
(23281,9,4024.18,5648.02,392.508,NULL),
(23281,10,4026.6,5599.42,392.508,NULL),
(23281,11,4026.85,5550.05,392.508,NULL),
(23281,12,4026.86,5501.14,392.508,NULL),
(23281,13,4028.34,5452.07,392.508,NULL),
(23281,14,4030.6,5403.51,392.508,NULL),
(23281,15,4030.42,5354.29,392.508,NULL),
(23281,16,4034.89,5305.03,392.508,NULL),
(23281,17,4036.91,5256.31,392.508,NULL),
(23281,18,4039.6,5207.4,392.508,NULL),
(23281,19,4042.62,5158.38,392.508,NULL),
(23281,20,4044.14,5109.4,392.508,NULL),
(23281,21,4055.73,5061.05,392.508,NULL),
(23281,22,4074.66,5019.07,392.508,NULL),
(23281,23,4073.9,4970.12,392.508,NULL),
(23281,24,4055.59,4924.23,392.508,NULL),
(23281,25,4016.14,4893.17,392.508,NULL),
(23281,26,3967.71,4893.43,392.508,NULL),
(23281,27,3942.15,4936.81,392.508,NULL),
(23281,28,3939.93,4985.97,392.508,NULL),
(23281,29,3958.47,5027.59,392.508,NULL),
(23281,30,3976.41,5068.93,392.508,NULL),
(23281,31,3989.6,5110.75,392.508,NULL),
(23281,32,3983.44,5153.64,392.508,NULL),
(23281,33,3962.46,5197.79,392.508,NULL),
(23281,34,3957.36,5246.87,392.508,NULL),
(23281,35,3971.21,5293.97,392.508,NULL),
(23281,36,3995.19,5327.17,392.508,NULL),
(23281,37,4003.43,5376.97,392.508,NULL),
(23281,38,3993.08,5424.28,392.508,NULL),
(23281,39,3989.17,5470.56,392.508,NULL),
(23281,40,3989.76,5519.64,392.508,NULL),
(23281,41,3989.63,5568.55,392.508,NULL),
(23281,42,3982.74,5617.76,392.508,NULL),
(23281,43,3975.15,5662.21,392.508,NULL),
(23281,44,3965.21,5708.47,392.508,NULL),
(23281,45,3938.43,5750.99,392.508,NULL),
(23281,46,3908.25,5785.25,392.508,NULL),
(23281,47,3875.19,5821.7,392.508,NULL),
(23281,48,3839.98,5853.03,392.508,NULL),
(23281,49,3805.81,5886.93,392.508,NULL),
(23281,50,3774.81,5922.07,392.508,NULL),
(23281,51,3750.26,5965.65,392.508,NULL),
(23281,52,3733.89,6012.81,392.508,NULL),
(23281,53,3737.2,6050.02,392.508,NULL),
(23281,54,3759.75,6085.06,392.508,NULL),
(23281,55,3848.76,6088.41,392.508,NULL),
(23281,56,3893.82,6067.05,392.508,NULL);
