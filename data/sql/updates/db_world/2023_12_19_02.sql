DELETE FROM `event_scripts` WHERE `id` = 15005;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(15005,3,10,23282,60000,1,2424.98,6933.42,409.55,1.43117);

UPDATE `creature_template` SET `InhabitType` = 7 WHERE `entry` IN (23364,23282);
UPDATE `creature_template_addon` SET `bytes1` = 0 WHERE `entry` = 23282;

DELETE FROM `creature_text` WHERE `CreatureId` = 23282;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(23282,0,0,'Get away from my clutch!!!',14,0,100,0,0,7274,21696,0,'Obsidia'),
(23282,0,1,'I know you by your stench, little $n.  Here, in my perch, is where your bones shall finally rest.',14,0,100,0,0,7274,21706,0,'Obsidia'),
(23282,0,2,'I tire of interruptions from the insignificant.  Your time has come, $n!',14,0,100,0,0,7274,21710,0,'Obsidia'),
(23282,0,3,'The Skyguard shall pay for your temerity, $n!',14,0,100,0,0,7274,21714,0,'Obsidia'),
(23282,0,4,'I believe that I shall feast upon both $r and ogre flesh tonight.',14,0,100,0,0,7274,21718,0,'Obsidia'),
(23282,0,5,'Little $r, you will now come to appreciate my wrath!',14,0,100,0,0,7274,21720,0,'Obsidia'),
(23282,0,6,'You have dared to defile my perch and must now be cleansed in fire!',14,0,100,0,0,7274,21726,0,'Obsidia'),
(23282,0,7,'What''s this?!  $n and $g his : her; friends come to play?',14,0,100,0,0,7274,21733,0,'Obsidia');

DELETE FROM `creature` WHERE `guid` = 3009669;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
(3009669,23282,530,0,0,1,1,0,0,2060.91,7215.12,497.217,6.01821,900,0,1,0,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` = 3009669;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(3009669,0,0,33554432,0,0,1,NULL);

UPDATE `gameobject` SET `spawntimesecs` = -1 WHERE `guid` IN (28122,28118,28120,28121,28119,28117,28116,28123);
UPDATE `gameobject` SET `spawntimesecs` = 900 WHERE `guid` IN (27915,27916);
UPDATE `gameobject` SET `spawntimesecs` = 895 WHERE `guid` IN (27914,27917,27918);

DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 185932;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (23282,-3009669,23364);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (18593200,2328200);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(185932,1,0,0,64,0,100,0,1,0,0,0,0,215,0,0,0,0,0,0,8,0,0,0,0,2060.91,7215.12,0,0,'Obsidia''s Egg - On Gossip Hello - Load Grid (Obsidia Position)'),
(185932,1,1,0,62,0,100,0,8685,0,0,0,0,80,18593200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia''s Egg - On Gossip Option 0 Selected - Call Timed Action List'),

(18593200,9,0,0,0,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Obsidia''s Egg - On Script - Close Gossip'),
(18593200,9,1,0,0,0,100,0,0,0,0,0,0,12,23364,1,15000,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia''s Egg - On Script - Summon Creature (Black Dragon Whelpling)'),
(18593200,9,2,0,0,0,100,0,0,0,0,0,0,85,41036,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Obsidia''s Egg - On Script - Invoker Cast ''Four Dragons: Reagents - Obsidia'''),
(18593200,9,3,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,10,3009669,23282,1,1,0,0,0,0,'Obsidia''s Egg - On Script - Force Despawn (Obsidia)'),
(18593200,9,4,0,0,0,100,0,0,0,0,0,0,70,10,0,0,0,0,0,15,185933,5,0,0,0,0,0,0,'Obsidia''s Egg - On Script - Respawn GO (Apexis Shard 01)'),
(18593200,9,5,0,0,0,100,0,0,0,0,0,0,70,10,0,0,0,0,0,15,185934,5,0,0,0,0,0,0,'Obsidia''s Egg - On Script - Respawn GO (Apexis Shard 02)'),
(18593200,9,6,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia''s Egg - On Script - Despawn GO'),
(18593200,9,7,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,15,185935,5,0,0,0,0,0,0,'Obsidia''s Egg - On Script - Despawn GO (Dragon Egg Aura)'),
(18593200,9,8,0,0,0,100,0,10000,10000,0,0,0,233,0,0,0,0,0,0,15,185929,5,0,0,0,0,0,0,'Obsidia''s Egg - On Script - Despawn GO (Dragonkin Nest 01)'),
(18593200,9,9,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,15,185930,5,0,0,0,0,0,0,'Obsidia''s Egg - On Script - Despawn GO (Dragonkin Nest 02)'),
(18593200,9,10,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,15,185931,5,0,0,0,0,0,0,'Obsidia''s Egg - On Script - Despawn GO (Dragonkin Nest 03)'),

(-3009669,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia - On Respawn - Set Active On'),
(-3009669,0,1,2,61,0,100,0,0,0,0,0,0,70,0,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia - Linked - Disable Save Respawn Time'),
(-3009669,0,2,0,61,0,100,0,0,0,0,0,0,53,1,23282,1,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia - Linked - Start WP Movement'),
(-3009669,0,3,0,1,0,100,0,6000,6000,6000,6000,0,11,40032,0,0,0,0,0,21,65,0,0,0,0,0,0,0,'Obsidia - OOC - Cast ''Fiery Breath'' (Closest Player)'),

(23282,0,0,0,37,0,100,0,0,0,0,0,0,207,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia - On AI Init - Set Hover On'),
(23282,0,1,0,54,0,100,0,0,0,0,0,0,80,2328200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia - On Just Summoned - Call Timed Action List'),
(23282,0,2,0,34,0,100,0,8,1,0,0,0,67,1,1000,1000,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia - On Point 1 Reached - Create Timed Event 1'),
(23282,0,3,4,59,0,100,0,1,0,0,0,0,101,0,0,0,0,0,0,8,0,0,0,0,2428.08,6980.77,368.392,1.50542,'Obsidia - On Timed Event 1 Triggered - Set Home Position'),
(23282,0,4,5,61,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(23282,0,5,6,61,0,100,0,0,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia - Linked - Set Fly Off'),
(23282,0,6,7,61,0,100,0,0,0,0,0,0,207,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia - Linked - Set Hover Off'),
(23282,0,7,8,61,0,100,0,0,0,0,0,0,210,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia - Linked - Fall'),
(23282,0,8,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Obsidia - Linked - Start Attack (Stored Target 1)'),
(23282,0,9,0,0,0,100,0,5000,15000,10000,30000,0,11,9573,0,0,0,0,0,2,5,0,0,0,0,0,0,0,'Obsidia - IC - Cast ''Flame Breath'''),
(23282,0,10,0,0,0,100,0,3500,5500,7000,12000,0,11,40505,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Obsidia - IC - Cast ''Cleave'''),
(23282,0,11,0,0,0,100,0,5000,7000,20000,30000,0,11,40717,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia - IC - Cast ''Hellfire'''),
(23282,0,12,0,0,0,100,0,8000,25000,25000,60000,0,11,36922,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Obsidia - IC - Cast ''Bellowing Roar'''),
(23282,0,13,0,0,0,100,0,9000,15000,9000,15000,0,11,15847,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Obsidia - IC - Cast ''Tail Sweep'''),

(2328200,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia - On Script - Set Active On'),
(2328200,9,1,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Obsidia - On Script - Store Target 1 (Invoker)'),
(2328200,9,2,0,0,0,100,0,0,0,0,0,0,207,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia - On Script - Set Hover On'),
(2328200,9,3,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2328200,9,4,0,0,0,100,0,0,0,0,0,0,116,60,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidia - On Script - Set Corpse Delay'),
(2328200,9,5,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Obsidia - On Script - Say Line 0'),
(2328200,9,6,0,0,0,100,0,5000,5000,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,2428.08,6980.77,378.392,0,'Obsidia - On Script - Move To Point 1'),

(23364,0,0,1,54,0,100,0,0,0,0,0,0,11,15750,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Black Dragon Whelpling - On Just Summoned - Cast ''Rookery Whelp Spawn-in Spell'''),
(23364,0,1,2,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Black Dragon Whelpling - Linked - Say Line 0'),
(23364,0,2,3,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Black Dragon Whelpling - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(23364,0,3,0,61,0,100,0,0,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Black Dragon Whelpling - Linked - Start Random Movement');

DELETE FROM `waypoints` WHERE `entry` IN (23282,23364);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(23282,1,2060.91,7215.12,497.217,'Obsidia'),
(23282,2,2108.56,7202.19,497.217,NULL),
(23282,3,2155.72,7186.68,497.217,NULL),
(23282,4,2203.21,7175.34,497.217,NULL),
(23282,5,2251.97,7163.65,497.217,NULL),
(23282,6,2296.35,7152.57,497.217,NULL),
(23282,7,2344.65,7140.99,497.217,NULL),
(23282,8,2390.76,7121.33,497.217,NULL),
(23282,9,2434.69,7100.82,497.217,NULL),
(23282,10,2478.16,7077.78,497.217,NULL),
(23282,11,2526.49,7064.32,497.217,NULL),
(23282,12,2575.9,7061.91,497.217,NULL),
(23282,13,2622.53,7072.71,497.217,NULL),
(23282,14,2670.9,7085.05,497.217,NULL),
(23282,15,2714.95,7108.4,497.217,NULL),
(23282,16,2752.93,7140.26,497.217,NULL),
(23282,17,2774.98,7184.98,497.217,NULL),
(23282,18,2766.88,7233.41,497.217,NULL),
(23282,19,2733.92,7269.04,497.217,NULL),
(23282,20,2688.75,7276.65,497.217,NULL),
(23282,21,2641.17,7259.36,497.217,NULL),
(23282,22,2596.13,7239.19,497.217,NULL),
(23282,23,2548.46,7226.16,497.217,NULL),
(23282,24,2501.6,7211.38,497.217,NULL),
(23282,25,2453.11,7199.98,497.217,NULL),
(23282,26,2405.11,7192.81,497.217,NULL),
(23282,27,2359.49,7177.67,497.217,NULL),
(23282,28,2311.12,7166.88,497.217,NULL),
(23282,29,2263.86,7179.79,497.217,NULL),
(23282,30,2226.36,7212.38,497.217,NULL),
(23282,31,2194.03,7250.32,497.217,NULL),
(23282,32,2156.12,7281.98,497.217,NULL),
(23282,33,2110.34,7290.64,497.217,NULL),
(23282,34,2062.15,7291.46,497.217,NULL),
(23282,35,2015.35,7307.77,497.217,NULL),
(23282,36,1968.22,7323.25,497.217,NULL),
(23282,37,1920.12,7326.57,497.217,NULL),
(23282,38,1872.02,7314.75,497.217,NULL),
(23282,39,1835.11,7281.13,497.217,NULL),
(23282,40,1814.26,7236.68,497.217,NULL),
(23282,41,1833.94,7191.12,497.217,NULL),
(23282,42,1874.71,7163.79,497.217,NULL),
(23282,43,1923.19,7167.38,497.217,NULL),
(23282,44,1967.37,7190.95,497.217,NULL),
(23282,45,2011.64,7213.34,497.217,NULL);
