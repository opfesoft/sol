UPDATE `creature` SET `modelid` = 0 WHERE `id` = 27203;
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 102444;

DELETE FROM `creature` WHERE `guid` IN (3009702,3009703);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
(3009702,27203,571,0,0,1,1,0,1,2878.47,-274.761,106.88,6.28167,-1,0,1,0,0,0,0,0),
(3009703,27219,571,0,0,1,1,0,0,2881.07,-274.765,106.88,6.28167,900,0,1,0,2,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` = 3009703;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `addonFlags`, `maxAggroRadius`, `auras`)
VALUES
(3009703,30097030,0,0,0,0,0,NULL,NULL);

DELETE FROM `creature_text` WHERE `CreatureId` = 27211;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(27211,0,0,'About time!',12,0,100,1,0,0,26292,0,'Onslaught Executioner'),
(27211,1,0,'Any last words you impure mongrel?',12,0,100,6,0,0,26293,0,'Onslaught Executioner'),
(27211,2,0,'On second thought, I don''t care.  Burn in hell wretch!',12,0,100,1,0,0,26294,0,'Onslaught Executioner'),
(27211,3,0,'Hah!  That never gets old.',12,0,100,11,0,0,26295,0,'Onslaught Executioner');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 27219;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = -3009703;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 27211 AND `id` > 4;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 27203 AND `id` > 8;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2721900,2721901,2721902,2721100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-3009703,0,0,0,11,0,100,0,0,0,0,0,0,80,2721900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Forsaken Prisoner - On Respawn - Call Timed Action List'),
(-3009703,0,1,0,1,1,100,0,5000,5000,5000,5000,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Forsaken Prisoner - OOC (Event Phase 1) - Force Despawn (CONDITION_NEAR_CREATURE_GUID)'),
(-3009703,0,2,0,34,0,100,0,2,46,0,0,0,80,2721901,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Forsaken Prisoner - On WP 47 Reached - Call Timed Action List'),
(-3009703,0,3,0,34,0,100,0,8,1,0,0,0,80,2721902,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Forsaken Prisoner - On Point 1 Reached - Call Timed Action List'),

(2721900,9,0,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Forsaken Prisoner - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(2721900,9,1,0,0,0,100,0,3000,3000,0,0,0,70,50714,0,0,0,0,0,10,3009702,27203,1,2,0,0,0,0,'Forsaken Prisoner - On Script - Respawn Target (Onslaught Footman)'),
(2721900,9,2,0,0,0,100,0,1000,1000,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Forsaken Prisoner - On Script - Set Event Phase 1'),
(2721900,9,3,0,0,0,100,0,1000,1000,0,0,0,45,1,1,0,0,0,0,10,3009702,27203,0,1,0,0,0,0,'Forsaken Prisoner - On Script - Set Data 1 1 (Onslaught Footman)'),

(2721901,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Forsaken Prisoner - On Script - Set Active On'),
(2721901,9,1,0,0,0,100,0,0,0,0,0,0,41,300000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Forsaken Prisoner - On Script - Force Despawn'),
(2721901,9,2,0,0,0,100,0,0,0,0,0,0,237,0,1,0,0,0,0,1,0,0,0,1,0,0,0,0,'Forsaken Prisoner - On Script - Leave Formation'),
(2721901,9,3,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,19,27211,0,0,0,0,0,0,0,'Forsaken Prisoner - On Script - Say Line 0 (Onslaught Executioner)'),
(2721901,9,4,0,0,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Forsaken Prisoner - On Script - Set Run Off'),
(2721901,9,5,0,0,0,100,0,3000,3000,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,2890.21,-379.885,116.389,0,'Forsaken Prisoner - On Script - Move To Point 1'),
(2721901,9,6,0,0,0,100,0,2000,2000,0,0,0,45,1,1,0,0,0,0,19,27211,0,0,0,0,0,0,0,'Forsaken Prisoner - On Script - Set Data 1 1 (Onslaught Executioner)'),
(2721901,9,7,0,0,0,100,0,2000,2000,0,0,0,45,2,2,0,0,0,0,10,3009702,27203,0,1,0,0,0,0,'Forsaken Prisoner - On Script - Set Data 2 2 (Onslaught Footman)'),

(2721902,9,0,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,5.54327,'Forsaken Prisoner - On Script - Set Orientation'),
(2721902,9,1,0,0,0,100,0,1000,1000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Forsaken Prisoner - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),

(27211,0,5,0,38,0,100,0,1,1,0,0,0,53,0,2721100,0,0,0,2,1,0,0,0,0,0,0,0,0,'Onslaught Executioner - On Data Set 1 1 - Start WP Movement'),
(27211,0,6,0,58,0,100,0,0,2721100,0,0,0,80,2721100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Executioner - On WP Path Ended - Call Timed Action List'),
(27211,0,7,8,58,0,100,0,0,2721101,0,0,0,101,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Executioner - On WP Path Ended - Reset Home Position'),
(27211,0,8,0,61,0,100,0,0,0,0,0,0,66,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Executioner - Linked - Reset Orientation'),

(2721100,9,0,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Executioner - On Script - Say Line 1'),
(2721100,9,1,0,0,0,100,0,3000,3000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Executioner - On Script - Say Line 2'),
(2721100,9,2,0,0,0,100,0,4000,4000,0,0,0,5,38,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Executioner - On Script - Play Emote ''ONESHOT_ATTACK2HLOOSE'''),
(2721100,9,3,0,0,0,100,0,500,500,0,0,0,51,0,0,0,0,0,0,10,3009703,27219,0,1,0,0,0,0,'Onslaught Executioner - On Script - Kill Unit ''Forsaken Prisoner'''),
(2721100,9,4,0,0,0,100,0,3000,3000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Executioner - On Script - Say Line 3'),
(2721100,9,5,0,0,0,100,0,3000,3000,0,0,0,53,0,2721101,0,0,0,2,1,0,0,0,0,0,0,0,0,'Onslaught Executioner - On Script - Start WP Movement'),

(27203,0,9,0,38,0,100,0,1,1,0,0,0,237,0,0,0,0,0,0,7,0,0,0,0,0,0,2,0,'Onslaught Footman - On Data Set 1 1 - Create Creature Formation (Invoker)'),
(27203,0,10,11,38,0,100,0,2,2,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Footman - On Data Set 2 2 - Set Active On'),
(27203,0,11,0,61,0,100,0,0,0,0,0,0,53,0,2720300,0,0,1000,2,1,0,0,0,0,0,0,0,0,'Onslaught Footman - Linked - Start WP Movement');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = -3009703;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,2,-3009703,0,0,155,1,3009702,10,0,1,0,0,'Creature ''Forsaken Prisoner'' - Group 0: Execute SAI ID 1 if not near creature ''Onslaught Footman'''),
(22,2,-3009703,0,0,155,1,102627,10,0,1,0,0,'Creature ''Forsaken Prisoner'' - Group 0: Execute SAI ID 1 if not near creature ''Onslaught Executioner''');

DELETE FROM `waypoints` WHERE `entry` IN (2721100,2721101,2720300);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(2721100,1,2882.83,-386.974,112.462,'Onslaught Executioner - Path 1'),
(2721100,2,2884.34,-385.524,114.588,NULL),
(2721100,3,2885.94,-383.986,116.389,NULL),
(2721100,4,2887.79,-382.206,116.389,NULL),
(2721100,5,2889.39,-380.669,116.389,NULL),

(2721101,1,2887.79,-382.206,116.389,'Onslaught Executioner - Path 2'),
(2721101,2,2885.94,-383.986,116.389,NULL),
(2721101,3,2884.34,-385.524,114.588,NULL),
(2721101,4,2882.83,-386.974,112.462,NULL),
(2721101,5,2879.77,-387.146,112.462,NULL),

(2720300,1,2873.86,-387.533,112.462,'Onslaught Footman'),
(2720300,2,2870.92,-378.821,112.462,NULL),
(2720300,3,2875.91,-371.081,112.462,NULL),
(2720300,4,2879.9,-364.901,112.462,NULL),
(2720300,5,2884.07,-358.445,112.469,NULL),
(2720300,6,2884.48,-352.046,112.464,NULL),
(2720300,7,2884.97,-344.242,112.463,NULL),
(2720300,8,2885.17,-341.098,112.796,NULL),
(2720300,9,2885.65,-333.414,112.796,NULL),
(2720300,10,2886.1,-326.309,112.796,NULL),
(2720300,11,2886.5,-320.021,112.796,NULL),
(2720300,12,2886.72,-316.528,112.796,NULL),
(2720300,13,2886.99,-312.306,112.519,NULL),
(2720300,14,2887.25,-308.1,112.534,NULL),
(2720300,15,2890.22,-307.111,112.536,NULL),
(2720300,16,2894.97,-305.528,114.045,NULL),
(2720300,17,2900.05,-303.832,114.035,NULL),
(2720300,18,2904.14,-302.468,114.035,NULL),
(2720300,19,2907.13,-301.472,114.035,NULL),
(2720300,20,2907.81,-295.92,114.035,NULL),
(2720300,21,2908.66,-288.972,114.035,NULL),
(2720300,22,2909.41,-282.837,114.035,NULL),
(2720300,23,2910.14,-276.931,114.035,NULL),
(2720300,24,2910.65,-272.756,114.035,NULL);

DELETE FROM `waypoint_data` WHERE `id` = 30097030;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(30097030,1,2881.07,-274.765,106.88,NULL,5000,0,5,0,100,0),
(30097030,2,2885.96,-274.772,106.88,NULL,0,0,4,0,100,0),
(30097030,3,2890.39,-274.779,106.88,NULL,0,0,4,0,100,0),
(30097030,4,2891.31,-274.781,107.245,NULL,0,0,4,0,100,0),
(30097030,5,2893.06,-274.784,107.243,NULL,0,0,5,0,100,0),
(30097030,6,2893.06,-276.184,107.243,NULL,0,0,4,0,100,0),
(30097030,7,2893.05,-278.641,108.807,NULL,0,0,4,0,100,0),
(30097030,8,2893.05,-282.379,111.005,NULL,0,0,4,0,100,0),
(30097030,9,2893.04,-285.76,112.992,NULL,0,0,4,0,100,0),
(30097030,10,2893.04,-287.853,114.035,NULL,0,0,4,0,100,0),
(30097030,11,2893.04,-290.072,114.035,NULL,0,0,5,0,100,0),
(30097030,12,2895.18,-292.056,114.035,NULL,0,0,4,0,100,0),
(30097030,13,2898.11,-292.839,114.035,NULL,0,0,4,0,100,0),
(30097030,14,2901.26,-293.68,114.035,NULL,0,0,4,0,100,0),
(30097030,15,2903.86,-294.371,114.035,NULL,0,0,4,0,100,0),
(30097030,16,2906.11,-294.972,114.035,NULL,0,0,5,0,100,0),
(30097030,17,2907.19,-297.432,114.035,NULL,0,0,4,0,100,0),
(30097030,18,2907.13,-300.232,114.035,NULL,0,0,4,0,100,0),
(30097030,19,2905.12,-302.65,114.035,NULL,0,0,5,0,100,0),
(30097030,20,2901.78,-303.688,114.035,NULL,0,0,4,0,100,0),
(30097030,21,2898.32,-304.76,114.035,NULL,0,0,4,0,100,0),
(30097030,22,2894.96,-305.805,114.041,NULL,0,0,5,0,100,0),
(30097030,23,2892.28,-306.635,113.185,NULL,0,0,4,0,100,0),
(30097030,24,2890.06,-307.323,112.536,NULL,0,0,4,0,100,0),
(30097030,25,2888.06,-307.946,112.536,NULL,0,0,4,0,100,0),
(30097030,26,2886.29,-310.839,112.561,NULL,0,0,5,0,100,0),
(30097030,27,2885.96,-314.083,112.518,NULL,0,0,4,0,100,0),
(30097030,28,2885.68,-316.764,112.796,NULL,0,0,4,0,100,0),
(30097030,29,2885.22,-321.171,112.796,NULL,0,0,4,0,100,0),
(30097030,30,2884.72,-325.926,112.796,NULL,0,0,5,0,100,0),
(30097030,31,2884.17,-331.267,112.796,NULL,0,0,4,0,100,0),
(30097030,32,2883.7,-335.792,112.796,NULL,0,0,4,0,100,0),
(30097030,33,2883.15,-341.077,112.796,NULL,0,0,4,0,100,0),
(30097030,34,2882.93,-343.165,112.462,NULL,0,0,5,0,100,0),
(30097030,35,2882.48,-347.468,112.465,NULL,0,0,4,0,100,0),
(30097030,36,2882.01,-351.994,112.502,NULL,0,0,4,0,100,0),
(30097030,37,2881.55,-356.408,112.63,NULL,0,0,4,0,100,0),
(30097030,38,2881.17,-360.119,112.522,NULL,0,0,5,0,100,0),
(30097030,39,2878.78,-364.259,112.465,NULL,0,0,4,0,100,0),
(30097030,40,2876.1,-368.902,112.462,NULL,0,0,4,0,100,0),
(30097030,41,2873.41,-373.551,112.462,NULL,0,0,4,0,100,0),
(30097030,42,2871.13,-377.491,112.462,NULL,0,0,5,0,100,0),
(30097030,43,2871.68,-381.294,112.462,NULL,0,0,4,0,100,0),
(30097030,44,2872.22,-384.994,112.462,NULL,0,0,4,0,100,0),
(30097030,45,2872.7,-388.34,112.462,NULL,0,0,5,0,100,0),
(30097030,46,2876.15,-388.947,112.462,NULL,0,0,4,0,100,0),
(30097030,47,2880.44,-389.703,112.462,0.811332,900000,0,5,0,100,0);
