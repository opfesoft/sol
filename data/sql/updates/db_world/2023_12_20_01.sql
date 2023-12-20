DELETE FROM `event_scripts` WHERE `id` = 15004;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(15004,3,10,23061,60000,1,2069.21,7445.97,406.447,4.69494);

UPDATE `creature_template` SET `modelid1` = 12869, `spell1` = 0, `spell2` = 0, `spell3` = 0, `spell4` = 0, `InhabitType` = 7 WHERE `entry` = 23061;
UPDATE `creature_template_addon` SET `bytes1` = 0 WHERE `entry` = 23061;

DELETE FROM `creature_text` WHERE `CreatureId` = 23061;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(23061,0,0,'Get away from my clutch!!!',14,0,100,0,0,7274,21696,0,'Rivendark'),
(23061,0,1,'I know you by your stench, little $n.  Here, in my perch, is where your bones shall finally rest.',14,0,100,0,0,7274,21706,0,'Rivendark'),
(23061,0,2,'I tire of interruptions from the insignificant.  Your time has come, $n!',14,0,100,0,0,7274,21710,0,'Rivendark'),
(23061,0,3,'The Skyguard shall pay for your temerity, $n!',14,0,100,0,0,7274,21714,0,'Rivendark'),
(23061,0,4,'I believe that I shall feast upon both $r and ogre flesh tonight.',14,0,100,0,0,7274,21718,0,'Rivendark'),
(23061,0,5,'Little $r, you will now come to appreciate my wrath!',14,0,100,0,0,7274,21720,0,'Rivendark'),
(23061,0,6,'You have dared to defile my perch and must now be cleansed in fire!',14,0,100,0,0,7274,21726,0,'Rivendark'),
(23061,0,7,'What''s this?!  $n and $g his : her; friends come to play?',14,0,100,0,0,7274,21733,0,'Rivendark');

DELETE FROM `creature` WHERE `guid` = 3009670;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
(3009670,23061,530,0,0,1,1,0,0,2289.83,7195.03,456.316,6.17541,900,0,1,0,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` = 3009670;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(3009670,0,0,33554432,0,0,1,NULL);

UPDATE `gameobject` SET `spawntimesecs` = -1 WHERE `guid` IN (27901,27907,27902,27904,27906,27903,27905,27900);
UPDATE `gameobject` SET `spawntimesecs` = 900 WHERE `guid` IN (27645,27648);
UPDATE `gameobject` SET `spawntimesecs` = 895 WHERE `guid` IN (27644,27646,27647);

DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 185936;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (23061,-3009670);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (18593600,2306100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(185936,1,0,0,64,0,100,0,1,0,0,0,0,215,0,0,0,0,0,0,8,0,0,0,0,2289.83,7195.03,0,0,'Rivendark''s Egg - On Gossip Hello - Load Grid (Rivendark Position)'),
(185936,1,1,0,62,0,100,0,8689,0,0,0,0,80,18593600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark''s Egg - On Gossip Option 0 Selected - Call Timed Action List'),

(18593600,9,0,0,0,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Rivendark''s Egg - On Script - Close Gossip'),
(18593600,9,1,0,0,0,100,0,0,0,0,0,0,12,23364,1,15000,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark''s Egg - On Script - Summon Creature (Black Dragon Whelpling)'),
(18593600,9,2,0,0,0,100,0,0,0,0,0,0,85,41045,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Rivendark''s Egg - On Script - Invoker Cast ''Four Dragons: Reagents - Rivendark'''),
(18593600,9,3,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,10,3009670,23061,1,1,0,0,0,0,'Rivendark''s Egg - On Script - Force Despawn (Rivendark)'),
(18593600,9,4,0,0,0,100,0,0,0,0,0,0,70,10,0,0,0,0,0,15,185933,5,0,0,0,0,0,0,'Rivendark''s Egg - On Script - Respawn GO (Apexis Shard 01)'),
(18593600,9,5,0,0,0,100,0,0,0,0,0,0,70,10,0,0,0,0,0,15,185934,5,0,0,0,0,0,0,'Rivendark''s Egg - On Script - Respawn GO (Apexis Shard 02)'),
(18593600,9,6,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark''s Egg - On Script - Despawn GO'),
(18593600,9,7,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,15,185935,5,0,0,0,0,0,0,'Rivendark''s Egg - On Script - Despawn GO (Dragon Egg Aura)'),
(18593600,9,8,0,0,0,100,0,10000,10000,0,0,0,233,0,0,0,0,0,0,15,185929,5,0,0,0,0,0,0,'Rivendark''s Egg - On Script - Despawn GO (Dragonkin Nest 01)'),
(18593600,9,9,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,15,185930,5,0,0,0,0,0,0,'Rivendark''s Egg - On Script - Despawn GO (Dragonkin Nest 02)'),
(18593600,9,10,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,15,185931,5,0,0,0,0,0,0,'Rivendark''s Egg - On Script - Despawn GO (Dragonkin Nest 03)'),

(-3009670,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark - On Respawn - Set Active On'),
(-3009670,0,1,2,61,0,100,0,0,0,0,0,0,70,0,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark - Linked - Disable Save Respawn Time'),
(-3009670,0,2,0,61,0,100,0,0,0,0,0,0,53,1,23061,1,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark - Linked - Start WP Movement'),
(-3009670,0,3,0,1,0,100,0,6000,6000,6000,6000,0,11,40032,0,0,0,0,0,21,65,0,0,0,0,0,0,0,'Rivendark - OOC - Cast ''Fiery Breath'' (Closest Player)'),

(23061,0,0,0,37,0,100,0,0,0,0,0,0,207,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark - On AI Init - Set Hover On'),
(23061,0,1,0,54,0,100,0,0,0,0,0,0,80,2306100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark - On Just Summoned - Call Timed Action List'),
(23061,0,2,0,34,0,100,0,8,1,0,0,0,67,1,1000,1000,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark - On Point 1 Reached - Create Timed Event 1'),
(23061,0,3,4,59,0,100,0,1,0,0,0,0,101,0,0,0,0,0,0,8,0,0,0,0,2068.16,7385.67,371.672,4.69494,'Rivendark - On Timed Event 1 Triggered - Set Home Position'),
(23061,0,4,5,61,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(23061,0,5,6,61,0,100,0,0,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark - Linked - Set Fly Off'),
(23061,0,6,7,61,0,100,0,0,0,0,0,0,207,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark - Linked - Set Hover Off'),
(23061,0,7,8,61,0,100,0,0,0,0,0,0,210,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark - Linked - Fall'),
(23061,0,8,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Rivendark - Linked - Start Attack (Stored Target 1)'),
(23061,0,9,0,0,0,100,0,5000,15000,10000,30000,0,11,9573,0,0,0,0,0,2,5,0,0,0,0,0,0,0,'Rivendark - IC - Cast ''Flame Breath'''),
(23061,0,10,0,0,0,100,0,3500,5500,7000,12000,0,11,40505,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rivendark - IC - Cast ''Cleave'''),
(23061,0,11,0,0,0,100,0,10000,20000,40000,60000,0,11,41988,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Rivendark - IC - Cast ''Corruption'''),
(23061,0,12,0,0,0,100,0,8000,25000,25000,60000,0,11,36922,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark - IC - Cast ''Bellowing Roar'''),
(23061,0,13,0,0,0,100,0,9000,15000,9000,15000,0,11,15847,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Rivendark - IC - Cast ''Tail Sweep'''),

(2306100,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark - On Script - Set Active On'),
(2306100,9,1,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Rivendark - On Script - Store Target 1 (Invoker)'),
(2306100,9,2,0,0,0,100,0,0,0,0,0,0,207,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark - On Script - Set Hover On'),
(2306100,9,3,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2306100,9,4,0,0,0,100,0,0,0,0,0,0,116,60,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rivendark - On Script - Set Corpse Delay'),
(2306100,9,5,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Rivendark - On Script - Say Line 0'),
(2306100,9,6,0,0,0,100,0,5000,5000,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,2068.16,7385.67,381.672,0,'Rivendark - On Script - Move To Point 1');

DELETE FROM `waypoints` WHERE `entry` = 23061;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(23061,1,2337.89,7189.83,456.316,'Rivendark'),
(23061,2,2386.93,7187.46,456.316,NULL),
(23061,3,2435.93,7188.45,456.316,NULL),
(23061,4,2478.51,7197.97,456.316,NULL),
(23061,5,2526.87,7207.8,456.316,NULL),
(23061,6,2573.82,7222.37,456.316,NULL),
(23061,7,2619.86,7240.87,456.316,NULL),
(23061,8,2664.41,7261.09,456.316,NULL),
(23061,9,2711.65,7272.88,456.316,NULL),
(23061,10,2758.45,7257.4,456.316,NULL),
(23061,11,2780.5,7213.08,456.316,NULL),
(23061,12,2774.11,7164.37,456.316,NULL),
(23061,13,2744.99,7125.34,456.316,NULL),
(23061,14,2707.23,7092.52,456.316,NULL),
(23061,15,2662.87,7071.4,456.316,NULL),
(23061,16,2614.2,7058.21,456.316,NULL),
(23061,17,2565.21,7055.04,456.316,NULL),
(23061,18,2517.21,7065.71,456.316,NULL),
(23061,19,2474.07,7089.08,456.316,NULL),
(23061,20,2427.14,7104.75,456.316,NULL),
(23061,21,2379.09,7117.87,456.316,NULL),
(23061,22,2330.58,7126.79,456.316,NULL),
(23061,23,2281.2,7132.03,456.316,NULL),
(23061,24,2232.04,7133.09,456.316,NULL),
(23061,25,2183.11,7133.6,456.316,NULL),
(23061,26,2134,7136.21,456.316,NULL),
(23061,27,2087.93,7153.8,456.316,NULL),
(23061,28,2054.12,7190.44,456.316,NULL),
(23061,29,2011.55,7215.84,456.316,NULL),
(23061,30,1963.17,7227.48,456.316,NULL),
(23061,31,1917.54,7208.64,456.316,NULL),
(23061,32,1871.09,7190.21,456.316,NULL),
(23061,33,1822.86,7181.09,456.316,NULL),
(23061,34,1773.85,7182.7,456.316,NULL),
(23061,35,1740.1,7217.58,456.316,NULL),
(23061,36,1733.91,7266.91,456.316,NULL),
(23061,37,1766.79,7300.08,456.316,NULL),
(23061,38,1814.62,7311.39,456.316,NULL),
(23061,39,1863.87,7315.84,456.316,NULL),
(23061,40,1912.88,7313.7,456.316,NULL),
(23061,41,1960.55,7303.18,456.316,NULL),
(23061,42,2007.86,7288.89,456.316,NULL),
(23061,43,2054.94,7271.1,456.316,NULL),
(23061,44,2100.89,7252.25,456.316,NULL),
(23061,45,2147.99,7235.72,456.316,NULL),
(23061,46,2194.88,7221.17,456.316,NULL),
(23061,47,2241.2,7205.49,456.316,NULL),
(23061,48,2289.83,7195.03,456.316,NULL);
