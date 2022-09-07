DELETE FROM `spell_script_names` WHERE `spell_id` = 59660;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
(59660,'spell_inside_cloak_dome');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 59651;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
(59651,61358,2,'Infra-green Vision');

DELETE FROM `gameobject` WHERE `guid` IN (268692,268693,268767,268768);

UPDATE `gameobject` SET `rotation0` = -0.0217996, `rotation1` = -0.999762, `rotation2` = -0.0000463177, `rotation3` = -0.00000100995 WHERE `guid` = 268795;
UPDATE `gameobject` SET `rotation0` = 0.682009, `rotation1` = -0.731344, `rotation2` = -0.0000338822, `rotation3` = 0.0000315966 WHERE `guid` = 268827;
UPDATE `gameobject` SET `rotation0` = -0.740209, `rotation1` = -0.672377, `rotation2` = -0.0000311503, `rotation3` = -0.0000342929 WHERE `guid` = 268792;
UPDATE `gameobject` SET `rotation0` = -0.999962, `rotation1` = 0.00870939, `rotation2` = 0.000000403495, `rotation3` = -0.0000463269 WHERE `guid` = 268808;
UPDATE `gameobject` SET `rotation0` = 0.682009, `rotation1` = -0.731344, `rotation2` = -0.0000338822, `rotation3` = 0.0000315966 WHERE `guid` = 268753;
UPDATE `gameobject` SET `rotation0` = -0.0217996, `rotation1` = -0.999762, `rotation2` = -0.0000463177, `rotation3` = -0.00000100995 WHERE `guid` = 268721;
UPDATE `gameobject` SET `rotation0` = -0.740209, `rotation1` = -0.672377, `rotation2` = -0.0000311503, `rotation3` = -0.0000342929 WHERE `guid` = 268718;
UPDATE `gameobject` SET `rotation0` = -0.999962, `rotation1` = 0.00870939, `rotation2` = 0.000000403495, `rotation3` = -0.0000463269 WHERE `guid` = 268734;
UPDATE `gameobject` SET `rotation0` = 0.365315, `rotation1` = -0.530624, `rotation2` = -0.629979, `rotation3` = 0.433717 WHERE `guid` = 268696;
UPDATE `gameobject` SET `rotation0` = 0.665958, `rotation1` = -0.237432, `rotation2` = -0.707029, `rotation3` = -0.0153314 WHERE `guid` = 268763;
UPDATE `gameobject` SET `rotation0` = 0.0444306, `rotation1` = -0.0603356, `rotation2` = -0.591297, `rotation3` = -0.802965 WHERE `guid` = 268697;
UPDATE `gameobject` SET `position_z` = 601.48, `rotation0` = -0.584691, `rotation1` = -0.390846, `rotation2` = -0.446594, `rotation3` = -0.553109 WHERE `guid` = 268772;
UPDATE `gameobject` SET `rotation0` = 0.66714, `rotation1` = -0.234099, `rotation2` = -0.706941, `rotation3` = -0.0188654 WHERE `guid` = 268837;
UPDATE `gameobject` SET `rotation0` = -0.437658, `rotation1` = -0.498201, `rotation2` = -0.562333, `rotation3` = -0.493997 WHERE `guid` = 255513;
UPDATE `gameobject` SET `position_x` = 7897.26, `position_y` = 2044.02 WHERE `guid` = 268814;
UPDATE `gameobject` SET `phaseMask` = `phaseMask` | 4 WHERE `guid` IN (268695,268770,268688,268689,268690,268691,62738,62739,62740,62741);

DELETE FROM `gameobject` WHERE `guid` IN (256036,257787,258233,260066,260579,261410,261970,262680,263207,263653,265211,266056,267263,267510,267905,268771);

UPDATE `gameobject` SET `phaseMask` = 4 WHERE `guid` IN (
268696,268697,268698,268699,268700,268701,268702,268703,268704,268705,268706,268707,268708,268709,268710,268711,
268712,268713,268714,268715,268716,268717,268718,268719,268720,268721,268722,268723,268724,268725,268726,268727,
268728,268729,268730,268731,268732,268733,268734,268735,268736,268737,268738,268739,268740,268741,268742,268743,
268744,268745,268746,268747,268748,268749,268750,268751,268752,268753,268754,268755,268756,268757,268758,268759,
268760,268761,268762,268763,268764,268765,268766,255513,268772,268773,268774,268775,268776,268777,268778,268779,
268780,268781,268782,268783,268784,268785,268786,268787,268788,268789,268790,268791,268792,268793,268794,268795,
268796,268797,268798,268799,268800,268801,268802,268803,268804,268805,268806,268807,268808,268809,268810,268811,
268812,268813,268814,268815,268816,268817,268818,268819,268820,268821,268822,268823,268824,268825,268826,268827,
268828,268829,268830,268831,268832,268833,268834,268835,268838,268837,268839,268840,268836);

UPDATE `creature` SET `phaseMask` = 4 WHERE `guid` IN (78210,78211,1975894,1975961,1975962,1975963,78213,78214,1975895,1977169);

DELETE FROM `gameobject` WHERE `guid` = 3009034;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3009034,193757,571,0,0,1,4,7888.6,2057.9,599.632,-1.66679,0,0,-0.740218,0.672367,180,255,1,0);

DELETE FROM `gameobject_addon` WHERE `guid` IN (
268696,268697,268698,268699,268700,268701,268702,268703,268704,268705,268706,268707,268708,268709,268710,268711,
268712,268713,268714,268715,268716,268717,268718,268719,268720,268721,268722,268723,268724,268725,268726,268727,
268728,268729,268730,268731,268732,268733,268734,268735,268736,268737,268738,268739,268740,268741,268742,268743,
268744,268745,268746,268747,268748,268749,268750,268751,268752,268753,268754,268755,268756,268757,268758,268759,
268760,268761,268762,268763,268764,268765,268766,255513,268772,268773,268774,268775,268776,268777,268778,268779,
268780,268781,268782,268783,268784,268785,268786,268787,268788,268789,268790,268791,268792,268793,268794,268795,
268796,268797,268798,268799,268800,268801,268802,268803,268804,268805,268806,268807,268808,268809,268810,268811,
268812,268813,268814,268815,268816,268817,268818,268819,268820,268821,268822,268823,268824,268825,268826,268827,
268828,268829,268830,268831,268832,268833,268834,268835,268838,268837,268839,268840,268836,3009034,268695,268770);
INSERT INTO `gameobject_addon` (`guid`, `invisibilityType`, `invisibilityValue`, `useRotation`)
VALUES
(268795,8,999,1),
(268827,8,999,1),
(268792,8,999,1),
(268808,8,999,1),
(268753,8,999,1),
(268721,8,999,1),
(268718,8,999,1),
(268734,8,999,1),
(268763,8,999,1),
(268696,8,999,1),
(268697,8,999,1),
(268772,8,999,1),
(268837,8,999,1),
(255513,8,999,1),
(268698,8,999,0),
(268699,8,999,0),
(268700,8,999,0),
(268701,8,999,0),
(268702,8,999,0),
(268703,8,999,0),
(268704,8,999,0),
(268705,8,999,0),
(268706,8,999,0),
(268707,8,999,0),
(268708,8,999,0),
(268709,8,999,0),
(268710,8,999,0),
(268711,8,999,0),
(268712,8,999,0),
(268713,8,999,0),
(268714,8,999,0),
(268715,8,999,0),
(268716,8,999,0),
(268717,8,999,0),
(268719,8,999,0),
(268720,8,999,0),
(268722,8,999,0),
(268723,8,999,0),
(268724,8,999,0),
(268725,8,999,0),
(268726,8,999,0),
(268727,8,999,0),
(268728,8,999,0),
(268729,8,999,0),
(268730,8,999,0),
(268731,8,999,0),
(268732,8,999,0),
(268733,8,999,0),
(268735,8,999,0),
(268736,8,999,0),
(268737,8,999,0),
(268738,8,999,0),
(268739,8,999,0),
(268740,8,999,0),
(268741,8,999,0),
(268742,8,999,0),
(268743,8,999,0),
(268744,8,999,0),
(268745,8,999,0),
(268746,8,999,0),
(268747,8,999,0),
(268748,8,999,0),
(268749,8,999,0),
(268750,8,999,0),
(268751,8,999,0),
(268752,8,999,0),
(268754,8,999,0),
(268755,8,999,0),
(268756,8,999,0),
(268757,8,999,0),
(268758,8,999,0),
(268759,8,999,0),
(268760,8,999,0),
(268761,8,999,0),
(268762,8,999,0),
(268764,8,999,0),
(268765,8,999,0),
(268766,8,999,0),
(268773,8,999,0),
(268774,8,999,0),
(268775,8,999,0),
(268776,8,999,0),
(268777,8,999,0),
(268778,8,999,0),
(268779,8,999,0),
(268780,8,999,0),
(268781,8,999,0),
(268782,8,999,0),
(268783,8,999,0),
(268784,8,999,0),
(268785,8,999,0),
(268786,8,999,0),
(268787,8,999,0),
(268788,8,999,0),
(268789,8,999,0),
(268790,8,999,0),
(268791,8,999,0),
(268793,8,999,0),
(268794,8,999,0),
(268796,8,999,0),
(268797,8,999,0),
(268798,8,999,0),
(268799,8,999,0),
(268800,8,999,0),
(268801,8,999,0),
(268802,8,999,0),
(268803,8,999,0),
(268804,8,999,0),
(268805,8,999,0),
(268806,8,999,0),
(268807,8,999,0),
(268809,8,999,0),
(268810,8,999,0),
(268811,8,999,0),
(268812,8,999,0),
(268813,8,999,0),
(268814,8,999,0),
(268815,8,999,0),
(268816,8,999,0),
(268817,8,999,0),
(268818,8,999,0),
(268819,8,999,0),
(268820,8,999,0),
(268821,8,999,0),
(268822,8,999,0),
(268823,8,999,0),
(268824,8,999,0),
(268825,8,999,0),
(268826,8,999,0),
(268828,8,999,0),
(268829,8,999,0),
(268830,8,999,0),
(268831,8,999,0),
(268832,8,999,0),
(268833,8,999,0),
(268834,8,999,0),
(268835,8,999,0),
(268836,8,999,0),
(268838,8,999,0),
(268839,8,999,0),
(268840,8,999,0),
(3009034,8,999,0),
(268695,7,9999,0),
(268770,7,9999,0);

UPDATE `creature_template` SET `unit_flags` = `unit_flags` & ~33554432 WHERE `entry` IN (32274,32317);
UPDATE `creature_template` SET `unit_flags` = 33555200 WHERE `entry` = 32528;
UPDATE `creature_template` SET `faction` = 1891, `flags_extra` = 0 WHERE `entry` = 30352;
UPDATE `creature_template` SET `faction` = 1735, `flags_extra` = 0 WHERE `entry` = 30755;
UPDATE `creature_template` SET `InhabitType` = `InhabitType` | 4, `ScriptName` = 'npc_cloak_dome_bunny' WHERE `entry` = 32298;
DELETE FROM `creature` WHERE `guid` IN (121551,121559);
UPDATE `creature` SET `phaseMask` = `phaseMask` | 4, `position_x` = 7888.6, `position_y` = 2057.9, `position_z` = 590.592, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 121552;
UPDATE `creature` SET `phaseMask` = `phaseMask` | 4, `position_x` = 7628.6, `position_y` = 2060.2, `position_z` = 590.592, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 121562;
UPDATE `creature` SET `phaseMask` = `phaseMask` | 4 WHERE `guid` IN (124264,124265);

DELETE FROM `creature` WHERE `guid` IN (3009037,3009038,3009039,3009040,3009041,3009042,3009043,3009044,3009045);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009037,30352,571,0,0,1,4,0,1,7642.4,2065.03,600.261,1.11701,120,0,0,0,0,0,0,0,0),
(3009038,30352,571,0,0,1,4,0,1,7640.46,2066.7,600.261,0.296706,120,0,0,0,0,0,0,0,0),
(3009039,30352,571,0,0,1,4,0,1,7623.7,2045.05,600.261,4.45059,120,0,0,0,0,0,0,0,0),
(3009040,32274,571,0,0,1,4,0,0,7625.41,2074.51,600.261,3.68412,300,0,0,0,0,0,0,0,0),
(3009041,32317,571,0,0,1,4,0,0,7897.79,2066.47,600.261,2.83531,300,0,0,0,0,0,0,0,0),
(3009042,30755,571,0,0,1,4,0,1,7904.84,2054.74,600.343,5.86431,120,0,0,0,0,0,0,0,0),
(3009043,30755,571,0,0,1,4,0,1,7884.73,2042.48,600.343,4.17134,120,0,0,0,0,0,0,0,0),
(3009044,30755,571,0,0,1,4,0,1,7873.44,2062.45,600.343,2.84489,120,0,0,0,0,0,0,0,0),
(3009045,30755,571,0,0,1,4,0,1,7876.2,2052.41,600.343,3.78736,120,0,0,0,0,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` IN (78210,78211,1975894,1975961,1975962,1975963,78213,78214,1975895,1977169,3009037,3009038,3009039,3009040,3009041,3009042,3009043,3009044,3009045);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(78210,0,0,0,0,0,0,'59660'),
(78211,0,0,0,0,0,0,'59660'),
(1975894,0,0,0,0,0,0,'59660'),
(1975961,0,0,0,0,0,0,'59660'),
(1975962,0,0,0,0,0,0,'59660'),
(1975963,0,0,0,0,0,0,'59660'),
(78213,0,0,0,0,0,0,'59660'),
(78214,0,0,0,0,0,0,'59660'),
(1975895,0,0,0,0,0,0,'59660'),
(1977169,0,0,0,0,0,0,'59660'),
(3009037,0,0,0,0,0,0,'59660'),
(3009038,0,0,0,0,0,0,'59660'),
(3009039,0,0,0,0,0,0,'59660'),
(3009040,0,0,0,0,0,0,'59660'),
(3009041,0,0,0,0,0,0,'59660'),
(3009042,0,0,0,0,0,0,'59660'),
(3009043,0,0,0,0,0,0,'59660'),
(3009044,0,0,0,0,0,0,'59660'),
(3009045,0,0,0,0,0,0,'59660');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (30345,30825);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (30345,30825);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(30345,0,0,0,19,0,100,0,13383,0,0,0,0,11,59651,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Chief Engineer Boltwrench - On Quest ''Killohertz'' Accepted - Cast''Infra-green Vision'' (Invoker)'),

(30825,0,0,0,19,0,100,0,13379,0,0,0,0,11,59651,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Chief Engineer Copperclaw - On Quest ''Green Technology'' Accepted - Cast''Infra-green Vision'' (Invoker)');

UPDATE `waypoints` SET `position_x` = 7883.36, `position_y` = 2053.68 WHERE `entry` = 31838 AND `pointid` = 69;
UPDATE `waypoints` SET `position_x` = 7883.36, `position_y` = 2053.68 WHERE `entry` = 32513 AND `pointid` = 110;