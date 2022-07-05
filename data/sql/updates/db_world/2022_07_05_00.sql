-- Gargoyle Ambusher, Frostbrood Sentry, Enraged Fleshrender, Stitched Brute, Skeletal Footsoldier, Scourge War Machine: 60s respawn time
UPDATE `creature` SET `spawntimesecs` = 60 WHERE `id` IN (32769,32767,32770,32771,32772,32154);

-- Skybreaker Recon Fighter: Increase wander distance
UPDATE `creature` SET `wander_distance` = 60 WHERE `guid` IN (1977242,1977243,1977244,1977245,1977246,1977247,1977248,1977249,1977250,1977251,1977252,1977253,1977254);

-- Skeletal Footsoldier: Set kill credit for "Bombardment Infantry"
UPDATE `creature_template` SET `KillCredit1` = 32399 WHERE `entry` = 32772;

-- Gargoyle Ambusher, Frostbrood Sentry: Set CREATURE_TYPE_FLAG_CAN_COLLIDE_WITH_MISSILES
UPDATE `creature_template` SET `type_flags` = `type_flags` | 524288 WHERE `entry` IN (32769,32767);

-- Frostbrood Sentry: Set large
UPDATE `creature_template_addon` SET `isLarge` = 1 WHERE `entry` = 32767;
UPDATE `creature_addon` SET `isLarge` = 1 WHERE `guid` IN (125108,125109,125110,125155,125162);

-- Gargoyle Ambusher, Stitched Brute: Set large
DELETE FROM `creature_template_addon` WHERE `entry` IN (32769,32771);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(32769,0,0,0,0,0,1,NULL),
(32771,0,0,0,1,0,1,NULL);

-- Scourge War Machine: Add UNIT_FLAG2_DISABLE_TURN, CREATURE_FLAG_EXTRA_NO_DODGE, CREATURE_FLAG_EXTRA_CIVILIAN
UPDATE `creature_template` SET `unit_flags2` = `unit_flags2` | 32768, `flags_extra` = `flags_extra` | 8388610 WHERE `entry` = 32154;

-- Add more spawns for Enraged Fleshrender, Stitched Brute, Skeletal Footsoldier
DELETE FROM `creature` WHERE `guid` IN (
3008971,3008972,3008973,3008974,3008975,3008977,3008978,3008979,3008980,3008981,3008982,3008983,3008984,3008985,3008986,3008987,
3008988,3008989,3008990,3008991,3008992,3008993,3008994,3008995,3008996,3008997,3008998,3008999,3009000,3009001,3009002,3009003,
3009004,3009005,3009006,3009007,3009008,3009009,3009010,3009011,3009012,3009013,3009014,3009016,3009017,3009018,3009019,3009020,
3009021,3009022,3009023,3009024,3009025,3009026,3009027,3009028,3009029,3009030,3009031,3009032,3009033,3009034,3009035,3009036);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3008971,32771,571,0,0,1,1,0,1,7764.59,1841.85,357.135,3.4587,60,5,50400,0,1,0,0,0,0),
(3008972,32770,571,0,0,1,1,0,0,7770.04,1845.28,358.027,2.59869,60,5,44100,0,1,0,0,0,0),
(3008973,32770,571,0,0,1,1,0,0,7762.04,1851.32,357.367,3.60793,60,5,44100,0,1,0,0,0,0),
(3008974,32772,571,0,0,1,1,0,0,7754.25,1841.55,357.15,4.86456,60,5,37800,0,1,0,0,0,0),
(3008975,32772,571,0,0,1,1,0,0,7757.64,1834.85,357.353,0.384651,60,5,37800,0,1,0,0,0,0),
(3008977,32771,571,0,0,1,1,0,1,7615.62,1793.91,354.966,1.15042,60,5,50400,0,1,0,0,0,0),
(3008978,32770,571,0,0,1,1,0,0,7619.62,1786.25,353.628,0.310043,60,5,44100,0,1,0,0,0,0),
(3008979,32770,571,0,0,1,1,0,0,7626.51,1798.77,354.788,2.21463,60,5,44100,0,1,0,0,0,0),
(3008980,32772,571,0,0,1,1,0,0,7618.06,1802.41,356.054,2.90578,60,5,37800,0,1,0,0,0,0),
(3008981,32772,571,0,0,1,1,0,0,7605.77,1793.94,356.174,1.10329,60,5,37800,0,1,0,0,0,0),
(3008982,32771,571,0,0,1,1,0,1,7594.19,1712.14,344.326,5.9492,60,5,50400,0,1,0,0,0,0),
(3008983,32770,571,0,0,1,1,0,0,7586.95,1705.64,345.123,5.63504,60,5,44100,0,1,0,0,0,0),
(3008984,32770,571,0,0,1,1,0,0,7600.31,1706.56,343.305,1.01454,60,5,44100,0,1,0,0,0,0),
(3008985,32772,571,0,0,1,1,0,0,7593.09,1721.1,345.16,0.801701,60,5,37800,0,1,0,0,0,0),
(3008986,32772,571,0,0,1,1,0,0,7584.91,1715.93,345.986,4.9761,60,5,37800,0,1,0,0,0,0),
(3008987,32771,571,0,0,1,1,0,1,7734.34,1683.03,344.491,1.00827,60,5,50400,0,1,0,0,0,0),
(3008988,32770,571,0,0,1,1,0,0,7738.4,1673.78,345.555,0.438851,60,5,44100,0,1,0,0,0,0),
(3008989,32770,571,0,0,1,1,0,0,7724.21,1685.32,342.352,1.41274,60,5,44100,0,1,0,0,0,0),
(3008990,32772,571,0,0,1,1,0,0,7731.67,1691.31,343.516,6.01518,60,5,37800,0,1,0,0,0,0),
(3008991,32772,571,0,0,1,1,0,0,7740.79,1688.8,345.668,6.01518,60,5,37800,0,1,0,0,0,0),
(3008992,32771,571,0,0,1,1,0,1,7844.67,1652.94,363.034,0.906945,60,5,50400,0,1,0,0,0,0),
(3008993,32770,571,0,0,1,1,0,0,7846.57,1663.88,362.851,2.77619,60,5,44100,0,1,0,0,0,0),
(3008994,32770,571,0,0,1,1,0,0,7853.6,1651.53,365.842,3.77365,60,5,44100,0,1,0,0,0,0),
(3008995,32772,571,0,0,1,1,0,0,7839.61,1646.05,362.023,2.69373,60,5,37800,0,1,0,0,0,0),
(3008996,32772,571,0,0,1,1,0,0,7833.54,1656.87,359.975,1.58239,60,5,37800,0,1,0,0,0,0),
(3008997,32772,571,0,0,1,1,0,0,7832.11,1675.57,358.801,1.96723,60,5,37800,0,1,0,0,0,0),
(3008998,32770,571,0,0,1,1,0,0,7846.61,1681.36,361.674,5.58007,60,5,44100,0,1,0,0,0,0),
(3008999,32771,571,0,0,1,1,0,1,7884.46,1740.5,366.159,0.447493,60,5,50400,0,1,0,0,0,0),
(3009000,32772,571,0,0,1,1,0,0,7878.92,1731.63,365.947,5.47797,60,5,37800,0,1,0,0,0,0),
(3009001,32772,571,0,0,1,1,0,0,7873.77,1737.48,364.14,0.891244,60,5,37800,0,1,0,0,0,0),
(3009002,32770,571,0,0,1,1,0,0,7881.45,1749.15,365.068,0.820558,60,5,44100,0,1,0,0,0,0),
(3009003,32770,571,0,0,1,1,0,0,7891.32,1749.1,367.519,5.62327,60,5,44100,0,1,0,0,0,0),
(3009004,32770,571,0,0,1,1,0,0,7875.03,1766.09,364.016,2.69373,60,5,44100,0,1,0,0,0,0),
(3009005,32772,571,0,0,1,1,0,0,7861.73,1764.53,361.033,3.83099,60,5,37800,0,1,0,0,0,0),
(3009006,32771,571,0,0,1,1,0,1,7854.88,1797.08,361.545,3.10449,60,5,50400,0,1,0,0,0,0),
(3009007,32772,571,0,0,1,1,0,0,7853.11,1810.5,362.623,2.90893,60,5,37800,0,1,0,0,0,0),
(3009008,32772,571,0,0,1,1,0,0,7844.6,1801.35,361.052,3.88282,60,5,37800,0,1,0,0,0,0),
(3009009,32770,571,0,0,1,1,0,0,7850.74,1790.08,361.322,5.64997,60,5,44100,0,1,0,0,0,0),
(3009010,32770,571,0,0,1,1,0,0,7864.25,1789.5,363.298,0.0516484,60,5,44100,0,1,0,0,0,0),
(3009011,32770,571,0,0,1,1,0,0,7879.04,1799.46,364.183,0.884171,60,5,44100,0,1,0,0,0,0),
(3009012,32771,571,0,0,1,1,0,1,7844.88,1907.38,362.83,1.85414,60,5,50400,0,1,0,0,0,0),
(3009013,32770,571,0,0,1,1,0,0,7855.21,1912.58,364.435,1.86199,60,5,44100,0,1,0,0,0,0),
(3009014,32770,571,0,0,1,1,0,0,7842.1,1915.88,365.094,3.25136,60,5,44100,0,1,0,0,0,0),
(3009016,32772,571,0,0,1,1,0,0,7842.23,1897.25,362.702,2.9317,60,5,37800,0,1,0,0,0,0),
(3009017,32772,571,0,0,1,1,0,0,7850.69,1899.07,364.204,1.79287,60,5,37800,0,1,0,0,0,0),
(3009018,32772,571,0,0,1,1,0,0,7856.51,1928.14,365.581,1.51406,60,5,37800,0,1,0,0,0,0),
(3009019,32772,571,0,0,1,1,0,0,7874.42,1924.62,365.648,0.250352,60,5,37800,0,1,0,0,0,0),
(3009020,32771,571,0,0,1,1,0,1,7742.63,1909.67,363.218,2.97254,60,5,50400,0,1,0,0,0,0),
(3009021,32770,571,0,0,1,1,0,0,7731.13,1910.61,363.083,3.76501,60,5,44100,0,1,0,0,0,0),
(3009022,32770,571,0,0,1,1,0,0,7737.06,1898.43,361.953,5.1905,60,5,44100,0,1,0,0,0,0),
(3009023,32772,571,0,0,1,1,0,0,7750.57,1903.2,362.955,0.120756,60,5,37800,0,1,0,0,0,0),
(3009024,32772,571,0,0,1,1,0,0,7751.37,1913.86,364.321,1.55018,60,5,37800,0,1,0,0,0,0),
(3009025,32771,571,0,0,1,1,0,1,7699.84,1751.28,346.159,4.02419,60,5,50400,0,1,0,0,0,0),
(3009026,32770,571,0,0,1,1,0,0,7687.3,1754.83,348.156,4.54569,60,5,44100,0,1,0,0,0,0),
(3009027,32770,571,0,0,1,1,0,0,7695.4,1744.94,346.553,6.03402,60,5,44100,0,1,0,0,0,0),
(3009028,32772,571,0,0,1,1,0,0,7707.82,1752.7,347.035,5.22742,60,5,37800,0,1,0,0,0,0),
(3009029,32772,571,0,0,1,1,0,0,7705.61,1758.26,347.556,3.41708,60,5,37800,0,1,0,0,0,0),
(3009030,32772,571,0,0,1,1,0,0,7708.83,1771.94,347.991,1.67742,60,5,37800,0,1,0,0,0,0),
(3009031,32771,571,0,0,1,1,0,1,7661.73,1667.51,340.426,5.79683,60,5,50400,0,1,0,0,0,0),
(3009032,32772,571,0,0,1,1,0,0,7664.6,1658.32,339.486,0.342244,60,5,37800,0,1,0,0,0,0),
(3009033,32772,571,0,0,1,1,0,0,7654.16,1664.26,340.184,1.19676,60,5,37800,0,1,0,0,0,0),
(3009034,32770,571,0,0,1,1,0,0,7659.68,1676.7,340.937,1.02397,60,5,44100,0,1,0,0,0,0),
(3009035,32770,571,0,0,1,1,0,0,7668.83,1677.08,341.31,5.54001,60,5,44100,0,1,0,0,0,0),
(3009036,32770,571,0,0,1,1,0,0,7687.88,1671.83,339.656,6.11728,60,5,44100,0,1,0,0,0,0);

DELETE FROM `creature_text` WHERE `CreatureId` IN (31406,31838,32512,32513);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(31406,0,0,'Your vehicle is burning!',41,0,100,0,0,0,33000,0,'Alliance Infra-green Bomber'),
(31838,0,0,'Your vehicle is burning!',41,0,100,0,0,0,33000,0,'Horde Infra-green Bomber'),
(32512,0,0,'Your vehicle is burning!',41,0,100,0,0,0,33000,0,'Alliance Infra-green Bomber'),
(32513,0,0,'Your vehicle is burning!',41,0,100,0,0,0,33000,0,'Horde Infra-green Bomber');

DELETE FROM `disables` WHERE `sourceType` = 1 AND `entry` = 13374;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`)
VALUES
(1,13374,0,'','','Deprecated Quest: Amped for Revolt!');

-- Remove Flight Orders on quest reward
DELETE FROM `spell_scripts` WHERE `id` = 61282;
INSERT INTO `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(61282,0,0,14,61281,0,0,0,0,0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` IN (13406,13376,13404,13382);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(19,0,13406,0,0,47,0,13376,10,0,1,0,0,'Riding the Wavelength: The Bombardment - Group 0: Can accept the quest only if quest ''Total Ohmage: The Valley of Lost Hope!'' is not in progress or completed'),
(20,0,13406,0,0,47,0,13376,10,0,1,0,0,'Riding the Wavelength: The Bombardment - Group 0: Show quest mark only if quest ''Total Ohmage: The Valley of Lost Hope!'' is not in progress or completed'),
(19,0,13376,0,0,47,0,13406,10,0,1,0,0,'Total Ohmage: The Valley of Lost Hope! - Group 0: Can accept the quest only if quest ''Riding the Wavelength: The Bombardment'' is not in progress or completed'),
(20,0,13376,0,0,47,0,13406,10,0,1,0,0,'Total Ohmage: The Valley of Lost Hope! - Group 0: Show quest mark only if quest ''Riding the Wavelength: The Bombardment'' is not in progress or completed'),
(19,0,13404,0,0,47,0,13382,10,0,1,0,0,'Static Shock Troops: the Bombardment - Group 0: Can accept the quest only if quest ''Putting the Hertz: The Valley of Lost Hope'' is not in progress or completed'),
(20,0,13404,0,0,47,0,13382,10,0,1,0,0,'Static Shock Troops: the Bombardment - Group 0: Show quest mark only if quest ''Putting the Hertz: The Valley of Lost Hope'' is not in progress or completed'),
(19,0,13382,0,0,47,0,13404,10,0,1,0,0,'Putting the Hertz: The Valley of Lost Hope - Group 0: Can accept the quest only if quest ''Static Shock Troops: the Bombardment'' is not in progress or completed'),
(20,0,13382,0,0,47,0,13404,10,0,1,0,0,'Putting the Hertz: The Valley of Lost Hope - Group 0: Show quest mark only if quest ''Static Shock Troops: the Bombardment'' is not in progress or completed');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (32770,32771,32772);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (32769,32767,32770,32771,32772,32154);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(32769,0,0,0,11,0,100,0,0,0,0,0,0,116,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gargoyle Ambusher - On Respawn - Set Corpse Delay'),
(32769,0,1,0,25,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gargoyle Ambusher - On Reset - Set Active Off'),
(32769,0,2,0,1,0,100,0,5000,10000,5000,10000,0,49,0,0,0,0,0,0,19,31406,50,0,0,0,0,0,0,'Gargoyle Ambusher - OOC - Attack Start (Alliance Infra-green Bomber)'),
(32769,0,3,0,1,0,100,0,5000,10000,5000,10000,0,49,0,0,0,0,0,0,19,32512,50,0,0,0,0,0,0,'Gargoyle Ambusher - OOC - Attack Start (Alliance Infra-green Bomber)'),
(32769,0,4,0,1,0,100,0,5000,10000,5000,10000,0,49,0,0,0,0,0,0,19,31838,50,0,0,0,0,0,0,'Gargoyle Ambusher - OOC - Attack Start (Horde Infra-green Bomber)'),
(32769,0,5,0,1,0,100,0,5000,10000,5000,10000,0,49,0,0,0,0,0,0,19,32513,50,0,0,0,0,0,0,'Gargoyle Ambusher - OOC - Attack Start (Horde Infra-green Bomber)'),
(32769,0,6,0,9,0,100,0,0,50,3000,3000,1,11,60239,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gargoyle Ambusher - Within 0-50 Range - Cast ''Gargoyle Ambusher Strike'''),
(32769,0,7,8,4,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gargoyle Ambusher - On Aggro - Set Active On'),
(32769,0,8,9,61,0,100,0,0,0,0,0,0,67,1,30000,30000,0,0,0,1,0,0,0,0,0,0,0,0,'Gargoyle Ambusher - Linked - Create Timed Event 1'),
(32769,0,9,0,61,0,100,0,0,0,0,0,0,117,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gargoyle Ambusher - Linked - Disable Evade'),
(32769,0,10,0,59,0,100,0,1,0,0,0,0,117,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gargoyle Ambusher - On Timed Event 1 Triggered - Enable Evade'),

(32767,0,0,0,11,0,100,0,0,0,0,0,0,116,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frostbrood Sentry - On Respawn - Set Corpse Delay'),
(32767,0,1,0,25,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frostbrood Sentry - On Reset - Set Active Off'),
(32767,0,2,0,1,0,100,0,5000,10000,5000,10000,0,49,0,0,0,0,0,0,19,31406,60,0,0,0,0,0,0,'Frostbrood Sentry - OOC - Attack Start (Alliance Infra-green Bomber)'),
(32767,0,3,0,1,0,100,0,5000,10000,5000,10000,0,49,0,0,0,0,0,0,19,32512,60,0,0,0,0,0,0,'Frostbrood Sentry - OOC - Attack Start (Alliance Infra-green Bomber)'),
(32767,0,4,0,1,0,100,0,5000,10000,5000,10000,0,49,0,0,0,0,0,0,19,31838,60,0,0,0,0,0,0,'Frostbrood Sentry - OOC - Attack Start (Horde Infra-green Bomber)'),
(32767,0,5,0,1,0,100,0,5000,10000,5000,10000,0,49,0,0,0,0,0,0,19,32513,60,0,0,0,0,0,0,'Frostbrood Sentry - OOC - Attack Start (Horde Infra-green Bomber)'),
(32767,0,6,0,9,0,100,0,0,60,3000,3000,1,11,60542,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Frostbrood Sentry - Within 0-60 Range - Cast ''Bitter Blast'''),
(32767,0,7,8,4,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frostbrood Sentry - On Aggro - Set Active On'),
(32767,0,8,9,61,0,100,0,0,0,0,0,0,67,1,30000,30000,0,0,0,1,0,0,0,0,0,0,0,0,'Frostbrood Sentry - Linked - Create Timed Event 1'),
(32767,0,9,0,61,0,100,0,0,0,0,0,0,117,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frostbrood Sentry - Linked - Disable Evade'),
(32767,0,10,0,59,0,100,0,1,0,0,0,0,117,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frostbrood Sentry - On Timed Event 1 Triggered - Enable Evade'),

(32770,0,0,0,11,0,100,0,0,0,0,0,0,116,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Fleshrender - On Respawn - Set Corpse Delay'),

(32771,0,0,0,11,0,100,0,0,0,0,0,0,116,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stitched Brute - On Respawn - Set Corpse Delay'),

(32772,0,0,0,11,0,100,0,0,0,0,0,0,116,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skeletal Footsoldier - On Respawn - Set Corpse Delay'),

(32154,0,0,1,11,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scourge War Machine - On Respawn - Disable Attack'),
(32154,0,1,2,61,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scourge War Machine - Linked - Set Root On'),
(32154,0,2,0,61,0,100,0,0,0,0,0,0,116,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scourge War Machine - Linked - Set Corpse Delay'),
(32154,0,3,0,4,0,100,0,0,0,0,0,0,67,1,5000,5000,0,0,0,1,0,0,0,0,0,0,0,0,'Scourge War Machine - On Aggro - Create Timed Event 1'),
(32154,0,4,0,59,0,100,0,1,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scourge War Machine - On Timed Event 1 Triggered - Evade'),
(32154,0,5,0,6,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scourge War Machine - On Death - Remove Timed Event 1');
