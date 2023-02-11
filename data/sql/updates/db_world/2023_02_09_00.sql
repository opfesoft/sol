UPDATE `gameobject_template` SET `Data2` = 0 WHERE `entry` = 182582;

DELETE FROM `gameobject` WHERE `guid` BETWEEN 3009063 AND 3009110;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3009063,182583,530,0,0,1,1,-2242.17,4199.34,0.98813,0.226893,0,0,0.113203,0.993572,181,100,1,0),
(3009064,182582,530,0,0,1,1,-2242.17,4199.34,0.98813,0.226893,0,0,0.113203,0.993572,181,100,1,0),
(3009065,182583,530,0,0,1,1,-2233.47,4186.17,6.79379,-0.890118,0,0,0.430511,-0.902585,181,100,1,0),
(3009066,182582,530,0,0,1,1,-2233.47,4186.17,6.79379,-0.890118,0,0,0.430511,-0.902585,181,100,1,0),
(3009067,182583,530,0,0,1,1,-2218.39,4282.58,3.18854,-0.802851,0,0,0.390731,-0.920505,181,100,1,0),
(3009068,182582,530,0,0,1,1,-2218.39,4282.58,3.18854,-0.802851,0,0,0.390731,-0.920505,181,100,1,0),
(3009069,182581,530,0,0,1,1,-2214.27,4128.94,2.18347,1.01229,0,0,0.48481,0.87462,181,100,1,0),
(3009070,182581,530,0,0,1,1,-2194.98,4210.07,10.6862,2.26893,0,0,0.906308,0.422618,181,100,1,0),
(3009071,182581,530,0,0,1,1,-2188.69,4314.8,1.58989,1.64061,0,0,0.731354,0.681998,181,100,1,0),
(3009072,182581,530,0,0,1,1,-2178.81,4183.44,13.0069,2.42601,0,0,0.936672,0.350207,181,100,1,0),
(3009073,182583,530,0,0,1,1,-2174.74,4265.66,3.34275,-1.50098,0,0,0.681998,-0.731354,181,100,1,0),
(3009074,182582,530,0,0,1,1,-2174.74,4265.66,3.34275,-1.50098,0,0,0.681998,-0.731354,181,100,1,0),
(3009075,182583,530,0,0,1,1,-2173.49,4162.01,11.4883,-2.96706,0,0,0.996195,-0.087156,181,100,1,0),
(3009076,182582,530,0,0,1,1,-2173.49,4162.01,11.4883,-2.96706,0,0,0.996195,-0.087156,181,100,1,0),
(3009077,182581,530,0,0,1,1,-2164.23,4283.19,11.8928,1.90241,0,0,0.814116,0.580703,181,100,1,0),
(3009078,182583,530,0,0,1,1,-2158,4244.16,5.10902,-2.56563,0,0,0.95882,-0.284015,181,100,1,0),
(3009079,182582,530,0,0,1,1,-2158,4244.16,5.10902,-2.56563,0,0,0.95882,-0.284015,181,100,1,0),
(3009080,182583,530,0,0,1,1,-2144.68,4153.03,9.5939,-2.35619,0,0,0.92388,-0.382683,181,100,1,0),
(3009081,182582,530,0,0,1,1,-2144.68,4153.03,9.5939,-2.35619,0,0,0.92388,-0.382683,181,100,1,0),
(3009082,182583,530,0,0,1,1,-2125.93,4155.51,12.8692,-0.733038,0,0,0.358368,-0.93358,181,100,1,0),
(3009083,182582,530,0,0,1,1,-2125.93,4155.51,12.8692,-0.733038,0,0,0.358368,-0.93358,181,100,1,0),
(3009084,182583,530,0,0,1,1,-2100.89,4285.96,10.7175,-0.890118,0,0,0.430511,-0.902585,181,100,1,0),
(3009085,182582,530,0,0,1,1,-2100.89,4285.96,10.7175,-0.890118,0,0,0.430511,-0.902585,181,100,1,0),
(3009086,182583,530,0,0,1,1,-2096.26,4253.14,8.57988,-1.51844,0,0,0.688354,-0.725374,181,100,1,0),
(3009087,182582,530,0,0,1,1,-2096.26,4253.14,8.57988,-1.51844,0,0,0.688354,-0.725374,181,100,1,0),
(3009088,182583,530,0,0,1,1,-2095.12,4263.77,10.5644,2.05949,0,0,0.857167,0.515038,181,100,1,0),
(3009089,182582,530,0,0,1,1,-2095.12,4263.77,10.5644,2.05949,0,0,0.857167,0.515038,181,100,1,0),
(3009090,182581,530,0,0,1,1,-2090.96,4059.73,-0.0956,-2.56563,0,0,0.95882,-0.284015,181,100,1,0),
(3009091,182583,530,0,0,1,1,-2081.23,4021.93,1.07354,1.6057,0,0,0.71934,0.694658,181,100,1,0),
(3009092,182582,530,0,0,1,1,-2081.23,4021.93,1.07354,1.6057,0,0,0.71934,0.694658,181,100,1,0),
(3009093,182583,530,0,0,1,1,-2080.21,4260.14,9.3808,1.93731,0,0,0.824126,0.566406,181,100,1,0),
(3009094,182582,530,0,0,1,1,-2080.21,4260.14,9.3808,1.93731,0,0,0.824126,0.566406,181,100,1,0),
(3009095,182581,530,0,0,1,1,-2047.99,4242.85,7.77286,1.93731,0,0,0.824126,0.566406,181,100,1,0),
(3009096,182583,530,0,0,1,1,-2037.85,4155.95,13.7935,0.418879,0,0,0.207912,0.978148,181,100,1,0),
(3009097,182582,530,0,0,1,1,-2037.85,4155.95,13.7935,0.418879,0,0,0.207912,0.978148,181,100,1,0),
(3009098,182581,530,0,0,1,1,-2029.26,4192.19,15.1243,2.16421,0,0,0.882948,0.469472,181,100,1,0),
(3009099,182583,530,0,0,1,1,-2021.74,4260.31,4.41444,-0.05236,0,0,0.026177,-0.999657,181,100,1,0),
(3009100,182582,530,0,0,1,1,-2021.74,4260.31,4.41444,-0.05236,0,0,0.026177,-0.999657,181,100,1,0),
(3009101,182581,530,0,0,1,1,-2012.63,4115.6,1.19053,-0.436333,0,0,0.21644,-0.976296,181,100,1,0),
(3009102,182583,530,0,0,1,1,-2009.13,4311.98,2.8658,3.01942,0,0,0.998135,0.061049,181,100,1,0),
(3009103,182582,530,0,0,1,1,-2009.13,4311.98,2.8658,3.01942,0,0,0.998135,0.061049,181,100,1,0),
(3009104,182583,530,0,0,1,1,-1986.44,4149.45,3.80724,1.09956,0,0,0.522499,0.85264,181,100,1,0),
(3009105,182582,530,0,0,1,1,-1986.44,4149.45,3.80724,1.09956,0,0,0.522499,0.85264,181,100,1,0),
(3009106,182583,530,0,0,1,1,-1972.7,4196.09,2.53436,-0.890118,0,0,0.430511,-0.902585,181,100,1,0),
(3009107,182582,530,0,0,1,1,-1972.7,4196.09,2.53436,-0.890118,0,0,0.430511,-0.902585,181,100,1,0),
(3009108,182583,530,0,0,1,1,-1971.09,4280.85,1.35353,-1.18682,0,0,0.559193,-0.829037,181,100,1,0),
(3009109,182582,530,0,0,1,1,-1971.09,4280.85,1.35353,-1.18682,0,0,0.559193,-0.829037,181,100,1,0),
(3009110,182581,530,0,0,1,1,-1970.23,4212.42,2.5699,0.488692,0,0,0.241922,0.970296,181,100,1,0);

DELETE FROM `pool_template` WHERE `entry` BETWEEN 13369 AND 13397;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(13369,1,'Draenei Vessel'),
(13370,1,'Draenei Vessel'),
(13371,1,'Draenei Vessel'),
(13372,1,'Draenei Vessel'),
(13373,1,'Draenei Vessel'),
(13374,1,'Draenei Vessel'),
(13375,1,'Draenei Vessel'),
(13376,1,'Draenei Vessel'),
(13377,1,'Draenei Vessel'),
(13378,1,'Draenei Vessel'),
(13379,1,'Draenei Vessel'),
(13380,1,'Draenei Vessel'),
(13381,1,'Draenei Vessel'),
(13382,1,'Draenei Vessel'),
(13383,1,'Draenei Vessel'),
(13384,1,'Draenei Vessel'),
(13385,1,'Draenei Vessel'),
(13386,1,'Draenei Vessel'),
(13387,1,'Draenei Vessel'),
(13388,1,'Draenei Vessel'),
(13389,1,'Draenei Vessel'),
(13390,1,'Draenei Vessel'),
(13391,1,'Draenei Vessel'),
(13392,1,'Draenei Vessel'),
(13393,1,'Draenei Vessel'),
(13394,1,'Draenei Vessel'),
(13395,1,'Draenei Vessel'),
(13396,1,'Draenei Vessel'),
(13397,1,'Draenei Vessel');

DELETE FROM `pool_gameobject` WHERE `pool_entry` BETWEEN 13369 AND 13397;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(23202,13369,70,'Draenei Vessel'),
(3009063,13369,0,'Draenei Vessel (empty)'),
(23186,13370,70,'Draenei Vessel'),
(3009065,13370,0,'Draenei Vessel (empty)'),
(23198,13371,70,'Draenei Vessel'),
(3009067,13371,0,'Draenei Vessel (empty)'),
(3009069,13372,70,'Draenei Vessel'),
(23215,13372,0,'Draenei Vessel (empty)'),
(3009070,13373,70,'Draenei Vessel'),
(23223,13373,0,'Draenei Vessel (empty)'),
(3009071,13374,70,'Draenei Vessel'),
(23224,13374,0,'Draenei Vessel (empty)'),
(3009072,13375,70,'Draenei Vessel'),
(23222,13375,0,'Draenei Vessel (empty)'),
(23197,13376,70,'Draenei Vessel'),
(3009073,13376,0,'Draenei Vessel (empty)'),
(23195,13377,70,'Draenei Vessel'),
(3009075,13377,0,'Draenei Vessel (empty)'),
(3009077,13378,70,'Draenei Vessel'),
(23221,13378,0,'Draenei Vessel (empty)'),
(23196,13379,70,'Draenei Vessel'),
(3009078,13379,0,'Draenei Vessel (empty)'),
(23193,13380,70,'Draenei Vessel'),
(3009080,13380,0,'Draenei Vessel (empty)'),
(23194,13381,70,'Draenei Vessel'),
(3009082,13381,0,'Draenei Vessel (empty)'),
(23201,13382,70,'Draenei Vessel'),
(3009084,13382,0,'Draenei Vessel (empty)'),
(23200,13383,70,'Draenei Vessel'),
(3009086,13383,0,'Draenei Vessel (empty)'),
(23199,13384,70,'Draenei Vessel'),
(3009088,13384,0,'Draenei Vessel (empty)'),
(3009090,13385,70,'Draenei Vessel'),
(23216,13385,0,'Draenei Vessel (empty)'),
(23187,13386,70,'Draenei Vessel'),
(3009091,13386,0,'Draenei Vessel (empty)'),
(23192,13387,70,'Draenei Vessel'),
(3009093,13387,0,'Draenei Vessel (empty)'),
(3009095,13388,70,'Draenei Vessel'),
(23220,13388,0,'Draenei Vessel (empty)'),
(23188,13389,70,'Draenei Vessel'),
(3009096,13389,0,'Draenei Vessel (empty)'),
(3009098,13390,70,'Draenei Vessel'),
(23218,13390,0,'Draenei Vessel (empty)'),
(23191,13391,70,'Draenei Vessel'),
(3009099,13391,0,'Draenei Vessel (empty)'),
(3009101,13392,70,'Draenei Vessel'),
(23217,13392,0,'Draenei Vessel (empty)'),
(23203,13393,70,'Draenei Vessel'),
(3009102,13393,0,'Draenei Vessel (empty)'),
(23189,13394,70,'Draenei Vessel'),
(3009104,13394,0,'Draenei Vessel (empty)'),
(23190,13395,70,'Draenei Vessel'),
(3009106,13395,0,'Draenei Vessel (empty)'),
(23204,13396,70,'Draenei Vessel'),
(3009108,13396,0,'Draenei Vessel (empty)'),
(3009110,13397,70,'Draenei Vessel'),
(23219,13397,0,'Draenei Vessel (empty)');