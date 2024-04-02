UPDATE `creature_template` SET `speed_walk` = 1 WHERE `entry` = 21164;
UPDATE `creature` SET `position_x` = -3873.33, `position_y` = 436.683, `position_z` = 104.08, `orientation` = 3.04312 WHERE `guid` = 74235;
UPDATE `creature_addon` SET `bytes2` = 1 WHERE `guid` = 74235;

DELETE FROM `waypoint_data` WHERE `id` = 742350;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(742350,1,-3873.33,436.683,104.08,NULL,0,0,0,0,100,0),
(742350,2,-3880.41,437.383,104.077,NULL,0,0,0,0,100,0),
(742350,3,-3885.87,437.922,104.077,NULL,0,0,0,0,100,0),
(742350,4,-3888.89,438.22,105.118,NULL,0,0,0,0,100,0),
(742350,5,-3894.81,438.805,104.992,NULL,0,0,0,0,100,0),
(742350,6,-3901.66,439.482,104.808,NULL,0,0,0,0,100,0),
(742350,7,-3909.21,440.228,104.603,NULL,0,0,0,0,100,0),
(742350,8,-3916.42,440.939,104.46,NULL,0,0,0,0,100,0),
(742350,9,-3924.45,441.733,104.437,0.101806,90000,0,0,0,100,0),
(742350,10,-3916.09,442.422,104.487,NULL,0,0,0,0,100,0),
(742350,11,-3912.59,446.202,104.678,NULL,0,0,0,0,100,0),
(742350,12,-3908.56,450.568,104.773,NULL,0,0,0,0,100,0),
(742350,13,-3904.93,454.503,104.86,NULL,0,0,0,0,100,0),
(742350,14,-3900.2,455.935,104.946,4.75126,15000,0,0,0,100,0),
(742350,15,-3897.08,463.484,105.006,NULL,0,0,0,0,100,0),
(742350,16,-3893.64,471.797,104.645,NULL,0,0,0,0,100,0),
(742350,17,-3892.16,472.287,104.049,NULL,0,0,0,0,100,0),
(742350,18,-3888.32,473.555,104.048,5.4753,10000,0,0,0,100,0),
(742350,19,-3885.53,468.702,104.052,NULL,0,0,0,0,100,0),
(742350,20,-3882.03,462.635,104.056,NULL,0,0,0,0,100,0),
(742350,21,-3878.72,456.872,104.06,NULL,0,0,0,0,100,0),
(742350,22,-3875.57,451.412,104.064,NULL,0,0,0,0,100,0),
(742350,23,-3870.83,451.103,104.067,5.37611,10000,0,0,0,100,0),
(742350,24,-3870.32,445.528,104.07,NULL,0,0,0,0,100,0),
(742350,25,-3869.79,439.648,104.076,NULL,0,0,0,0,100,0),
(742350,26,-3869.49,436.298,104.079,NULL,0,0,0,0,100,0),
(742350,27,-3862.57,436.108,104.079,NULL,0,0,0,0,100,0),
(742350,28,-3855.81,435.922,104.086,NULL,0,0,0,0,100,0),
(742350,29,-3848.58,435.724,104.093,NULL,0,0,0,0,100,0),
(742350,30,-3841.35,435.526,104.06,NULL,0,0,0,0,100,0),
(742350,31,-3834.12,435.327,104.06,NULL,0,0,0,0,100,0),
(742350,32,-3826.89,435.129,104.06,NULL,0,0,0,0,100,0),
(742350,33,-3819.43,434.924,104.08,NULL,0,0,0,0,100,0),
(742350,34,-3813.01,434.748,104.126,NULL,0,0,0,0,100,0),
(742350,35,-3807.59,432.939,104.152,NULL,10000,0,0,0,100,0),
(742350,36,-3813.01,434.748,104.126,NULL,0,0,0,0,100,0),
(742350,37,-3819.43,434.924,104.08,NULL,0,0,0,0,100,0),
(742350,38,-3826.89,435.129,104.06,NULL,0,0,0,0,100,0),
(742350,39,-3834.12,435.327,104.06,NULL,0,0,0,0,100,0),
(742350,40,-3839.89,434.423,104.06,NULL,0,0,0,0,100,0),
(742350,41,-3847.04,433.301,104.08,NULL,0,0,0,0,100,0),
(742350,42,-3853.49,432.289,104.093,NULL,0,0,0,0,100,0),
(742350,43,-3860.88,431.13,104.085,NULL,0,0,0,0,100,0),
(742350,44,-3867.65,430.068,104.086,2.55107,30000,0,0,0,100,0);
