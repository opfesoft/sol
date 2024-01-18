UPDATE `creature` SET `position_x` = -3519.91, `position_y` = 5799.6, `position_z` = -7.7045, `orientation` = 3.82123, `MovementType` = 2 WHERE `guid` = 66481;

DELETE FROM `creature_addon` WHERE `guid` = 66481;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(66481,664810,0,0,0,0,0,NULL);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 18475;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1847500;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18475,0,0,0,34,0,100,0,2,14,0,0,0,80,1847500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mug''gok - On WP 15 Reached - Call Timed Action List'),
(18475,0,1,0,4,0,100,0,0,0,0,0,0,11,31994,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mug''gok - On Aggro - Cast ''Shoulder Charge'''),

(1847500,9,0,0,0,0,100,0,5000,5000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mug''gok - On Script - Say Line 0'),
(1847500,9,1,0,0,0,100,0,10000,10000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mug''gok - On Script - Say Line 1'),
(1847500,9,2,0,0,0,100,0,10000,10000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mug''gok - On Script - Say Line 2');

DELETE FROM `waypoints` WHERE `entry` = 18475;
DELETE FROM `waypoint_data` WHERE `id` = 664810;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(664810,1,-3519.91,5799.6,-7.7045,NULL,0,0,0,0,100,0),
(664810,2,-3522.61,5797.42,-7.35629,NULL,0,0,0,0,100,0),
(664810,3,-3527.42,5793.53,-7.31927,NULL,0,0,0,0,100,0),
(664810,4,-3532.31,5789.58,-6.88335,NULL,0,0,0,0,100,0),
(664810,5,-3537.99,5788.26,-6.63504,NULL,0,0,0,0,100,0),
(664810,6,-3544.01,5786.86,-6.41493,NULL,0,0,0,0,100,0),
(664810,7,-3549.35,5785.62,-5.77388,NULL,0,0,0,0,100,0),
(664810,8,-3553.79,5784.59,-4.42401,NULL,0,0,0,0,100,0),
(664810,9,-3558.56,5784.98,-2.66025,NULL,0,0,0,0,100,0),
(664810,10,-3562.55,5785.31,-1.97546,NULL,0,0,0,0,100,0),
(664810,11,-3566.68,5786.08,-2.0977,NULL,0,0,0,0,100,0),
(664810,12,-3571.73,5787.03,-2.96542,NULL,0,0,0,0,100,0),
(664810,13,-3576.66,5787.96,-3.68652,NULL,0,0,0,0,100,0),
(664810,14,-3581.02,5788.77,-3.76807,NULL,0,0,0,0,100,0),
(664810,15,-3586.12,5789.73,-4.4364,NULL,30000,0,0,0,100,0),
(664810,16,-3589.72,5791.89,-4.98474,NULL,0,0,0,0,100,0),
(664810,17,-3593.82,5794.35,-5.17265,NULL,0,0,0,0,100,0),
(664810,18,-3598.33,5797.05,-5.31295,NULL,0,0,0,0,100,0),
(664810,19,-3602.73,5799.69,-4.92624,NULL,0,0,0,0,100,0),
(664810,20,-3607.36,5802.46,-4.30784,NULL,0,0,0,0,100,0),
(664810,21,-3609.72,5808.42,-3.57967,NULL,0,0,0,0,100,0),
(664810,22,-3611.6,5813.16,-4.79293,NULL,0,0,0,0,100,0),
(664810,23,-3613.49,5817.17,-4.9304,NULL,0,0,0,0,100,0),
(664810,24,-3615.33,5821.07,-4.68351,NULL,0,0,0,0,100,0),
(664810,25,-3617.17,5824.98,-4.10434,NULL,0,0,0,0,100,0),
(664810,26,-3619.3,5829.52,-2.02347,NULL,0,0,0,0,100,0),
(664810,27,-3620.7,5832.48,-0.371044,NULL,0,0,0,0,100,0),
(664810,28,-3622.28,5834.21,0.279194,NULL,0,0,0,0,100,0),
(664810,29,-3624.88,5837.05,0.523941,NULL,0,0,0,0,100,0),
(664810,30,-3628.5,5841,0.0934818,NULL,0,0,0,0,100,0),
(664810,31,-3632.27,5845.13,-0.320858,NULL,0,0,0,0,100,0),
(664810,32,-3634.05,5848.41,-0.404399,NULL,0,0,0,0,100,0),
(664810,33,-3636.01,5852.01,-0.673575,NULL,0,0,0,0,100,0),
(664810,34,-3637.57,5854.88,-1.23083,NULL,0,0,0,0,100,0),
(664810,35,-3639.46,5858.36,-2.62875,NULL,0,0,0,0,100,0),
(664810,36,-3641.8,5862.67,-4.2198,NULL,0,0,0,0,100,0),
(664810,37,-3644.94,5868.45,-5.42145,NULL,0,0,0,0,100,0),
(664810,38,-3644.27,5872.13,-6.16966,NULL,0,0,0,0,100,0),
(664810,39,-3643.64,5875.57,-7.08675,NULL,0,0,0,0,100,0),
(664810,40,-3642.88,5879.7,-8.55443,NULL,0,0,0,0,100,0),
(664810,41,-3642.05,5884.29,-10.5207,NULL,0,0,0,0,100,0),
(664810,42,-3641.25,5888.65,-12.4403,NULL,0,0,0,0,100,0),
(664810,43,-3640.41,5893.24,-14.4264,NULL,0,0,0,0,100,0),
(664810,44,-3639.6,5897.71,-16.4165,NULL,0,0,0,0,100,0),
(664810,45,-3638.65,5902.87,-18.9565,NULL,0,0,0,0,100,0),
(664810,46,-3637.31,5910.22,-22.5082,NULL,0,0,0,0,100,0),
(664810,47,-3637.81,5914.4,-24.405,NULL,0,0,0,0,100,0),
(664810,48,-3638.22,5917.87,-26.3901,NULL,0,0,0,0,100,0),
(664810,49,-3638.56,5920.77,-28.2925,NULL,0,0,0,0,100,0),
(664810,50,-3638.93,5923.89,-29.6579,NULL,0,0,0,0,100,0),
(664810,51,-3639.43,5928.06,-30.2866,NULL,0,0,0,0,100,0),
(664810,52,-3639.81,5931.31,-30.3733,NULL,0,0,0,0,100,0),
(664810,53,-3640.22,5934.78,-30.2167,NULL,0,0,0,0,100,0),
(664810,54,-3640.57,5937.68,-30.2738,NULL,0,0,0,0,100,0),
(664810,55,-3641.05,5941.75,-31.3134,NULL,0,0,0,0,100,0),
(664810,56,-3640.62,5945.81,-31.4832,NULL,0,0,0,0,100,0),
(664810,57,-3640.21,5949.64,-31.2093,NULL,0,0,0,0,100,0),
(664810,58,-3639.82,5953.23,-30.3956,NULL,0,0,0,0,100,0),
(664810,59,-3639.51,5956.14,-28.8971,NULL,0,0,0,0,100,0),
(664810,60,-3639.19,5959.15,-27.0301,NULL,0,0,0,0,100,0),
(664810,61,-3638.85,5962.29,-25.6157,NULL,0,0,0,0,100,0),
(664810,62,-3638.41,5966.47,-23.961,NULL,0,0,0,0,100,0),
(664810,63,-3638.01,5970.19,-22.5289,NULL,0,0,0,0,100,0),
(664810,64,-3635.86,5972.65,-21.8055,NULL,0,0,0,0,100,0),
(664810,65,-3633.24,5975.63,-21.1805,NULL,0,0,0,0,100,0),
(664810,66,-3630.55,5978.7,-20.7896,NULL,0,0,0,0,100,0),
(664810,67,-3627.93,5981.68,-20.4963,NULL,0,0,0,0,100,0),
(664810,68,-3625.29,5984.69,-20.2792,NULL,0,0,0,0,100,0),
(664810,69,-3622.26,5984.71,-21.2405,NULL,0,0,0,0,100,0),
(664810,70,-3618.53,5984.74,-22.613,NULL,0,0,0,0,100,0),
(664810,71,-3615.03,5984.76,-24.1142,NULL,0,0,0,0,100,0),
(664810,72,-3612,5984.79,-25.6399,NULL,0,0,0,0,100,0),
(664810,73,-3608.39,5984.81,-27.7581,NULL,0,0,0,0,100,0),
(664810,74,-3604.65,5984.84,-29.2617,NULL,0,0,0,0,100,0),
(664810,75,-3599.05,5984.88,-30.3963,NULL,0,0,0,0,100,0),
(664810,76,-3593.81,5984.92,-31.317,NULL,0,0,0,0,100,0),
(664810,77,-3589.65,5986.08,-31.8423,NULL,0,0,0,0,100,0),
(664810,78,-3585.15,5987.34,-32.3346,NULL,0,0,0,0,100,0),
(664810,79,-3581.22,5988.44,-32.5745,NULL,0,0,0,0,100,0),
(664810,80,-3578.07,5989.32,-32.6916,NULL,0,0,0,0,100,0),
(664810,81,-3574.03,5990.45,-33.1812,NULL,0,0,0,0,100,0),
(664810,82,-3569.99,5991.58,-34.1279,NULL,0,0,0,0,100,0),
(664810,83,-3564.37,5993.15,-34.7731,NULL,0,0,0,0,100,0),
(664810,84,-3560.43,5994.25,-34.9286,NULL,0,0,0,0,100,0),
(664810,85,-3557.32,5997.74,-34.9016,NULL,0,0,0,0,100,0),
(664810,86,-3554.22,6001.22,-34.7967,NULL,0,0,0,0,100,0),
(664810,87,-3550.88,6004.96,-34.4939,NULL,0,0,0,0,100,0),
(664810,88,-3548.55,6007.58,-33.6514,NULL,0,0,0,0,100,0),
(664810,89,-3545.99,6010.45,-31.5901,NULL,0,0,0,0,100,0),
(664810,90,-3543.51,6013.23,-29.6114,NULL,0,0,0,0,100,0),
(664810,91,-3541.19,6015.84,-28.3393,NULL,0,0,0,0,100,0),
(664810,92,-3538.54,6018.81,-27.0239,NULL,0,0,0,0,100,0),
(664810,93,-3535.67,6022.03,-25.6759,NULL,0,0,0,0,100,0),
(664810,94,-3533.4,6024.58,-24.723,NULL,0,0,0,0,100,0),
(664810,95,-3531.83,6029.1,-24.105,NULL,0,0,0,0,100,0),
(664810,96,-3530.27,6033.62,-23.7801,NULL,0,0,0,0,100,0),
(664810,97,-3528.54,6038.58,-23.0098,NULL,0,0,0,0,100,0),
(664810,98,-3526.75,6043.76,-21.7869,NULL,0,0,0,0,100,0),
(664810,99,-3525.01,6048.77,-20.5384,NULL,0,0,0,0,100,0),
(664810,100,-3521.07,6051.68,-18.8986,NULL,0,0,0,0,100,0),
(664810,101,-3517.41,6054.39,-17.5898,NULL,0,0,0,0,100,0),
(664810,102,-3513.19,6057.52,-16.6167,NULL,0,0,0,0,100,0),
(664810,103,-3509.14,6060.51,-15.9033,NULL,0,0,0,0,100,0),
(664810,104,-3505.41,6060.6,-15.4902,NULL,0,0,0,0,100,0),
(664810,105,-3502.25,6060.67,-15.4252,NULL,0,0,0,0,100,0),
(664810,106,-3498.4,6060.76,-15.5741,NULL,0,0,0,0,100,0),
(664810,107,-3494.56,6060.85,-16.1432,NULL,0,0,0,0,100,0),
(664810,108,-3490.47,6060.95,-17.0494,NULL,0,0,0,0,100,0),
(664810,109,-3485.92,6061.05,-18.0197,NULL,0,0,0,0,100,0),
(664810,110,-3481.26,6061.16,-18.119,NULL,0,0,0,0,100,0),
(664810,111,-3476.48,6061.27,-17.8103,NULL,0,0,0,0,100,0),
(664810,112,-3471.11,6061.4,-17.1928,NULL,0,0,0,0,100,0),
(664810,113,-3465.91,6061.52,-16.0358,NULL,0,0,0,0,100,0),
(664810,114,-3463.09,6059.46,-14.772,NULL,0,0,0,0,100,0),
(664810,115,-3459.42,6056.78,-13.1859,NULL,0,0,0,0,100,0),
(664810,116,-3455.74,6054.1,-12.3807,NULL,0,0,0,0,100,0),
(664810,117,-3455.09,6050.31,-12.279,NULL,0,0,0,0,100,0),
(664810,118,-3454.3,6045.71,-12.2618,NULL,0,0,0,0,100,0),
(664810,119,-3453.51,6041.1,-12.6068,NULL,0,0,0,0,100,0),
(664810,120,-3452.74,6036.61,-13.4088,NULL,0,0,0,0,100,0),
(664810,121,-3452,6032.29,-14.4927,NULL,0,0,0,0,100,0),
(664810,122,-3451.45,6027.54,-15.6103,NULL,0,0,0,0,100,0),
(664810,123,-3450.82,6022.09,-16.5237,NULL,0,0,0,0,100,0),
(664810,124,-3450.25,6017.22,-17.0325,NULL,0,0,0,0,100,0),
(664810,125,-3449.69,6012.39,-17.7794,NULL,0,0,0,0,100,0),
(664810,126,-3448.41,6008.63,-18.8463,NULL,0,0,0,0,100,0),
(664810,127,-3446.79,6003.88,-20.2544,NULL,0,0,0,0,100,0),
(664810,128,-3444.91,5998.35,-21.9693,NULL,0,0,0,0,100,0),
(664810,129,-3443.19,5993.31,-23.4579,NULL,0,0,0,0,100,0),
(664810,130,-3441.66,5989.77,-24.2804,NULL,0,0,0,0,100,0),
(664810,131,-3440.39,5986.85,-24.7464,NULL,0,0,0,0,100,0),
(664810,132,-3439.71,5982.59,-25.1941,NULL,0,0,0,0,100,0),
(664810,133,-3438.89,5977.52,-25.3606,NULL,0,0,0,0,100,0),
(664810,134,-3438.02,5972.11,-25.2969,NULL,0,0,0,0,100,0),
(664810,135,-3437.27,5967.39,-25.1706,NULL,0,0,0,0,100,0),
(664810,136,-3436.34,5961.63,-24.9612,NULL,0,0,0,0,100,0),
(664810,137,-3435.47,5956.2,-25.0386,NULL,0,0,0,0,100,0),
(664810,138,-3436.59,5953.01,-25.5903,NULL,0,0,0,0,100,0),
(664810,139,-3438.11,5948.72,-26.5669,NULL,0,0,0,0,100,0),
(664810,140,-3439.81,5943.88,-27.9761,NULL,0,0,0,0,100,0),
(664810,141,-3441.63,5938.7,-29.8488,NULL,0,0,0,0,100,0),
(664810,142,-3443.3,5933.97,-31.4103,NULL,0,0,0,0,100,0),
(664810,143,-3445.08,5928.91,-32.7215,NULL,0,0,0,0,100,0),
(664810,144,-3446.49,5924.92,-33.5278,NULL,0,0,0,0,100,0),
(664810,145,-3449.17,5920.82,-33.9818,NULL,0,0,0,0,100,0),
(664810,146,-3452.48,5915.73,-33.8247,NULL,0,0,0,0,100,0),
(664810,147,-3455.48,5911.14,-33.2764,NULL,0,0,0,0,100,0),
(664810,148,-3458.73,5906.16,-32.3037,NULL,0,0,0,0,100,0),
(664810,149,-3461.41,5902.06,-31.1933,NULL,0,0,0,0,100,0),
(664810,150,-3464.15,5897.85,-30.0614,NULL,0,0,0,0,100,0),
(664810,151,-3466.2,5894.72,-29.3391,NULL,0,0,0,0,100,0),
(664810,152,-3468.96,5890.82,-28.52,NULL,0,0,0,0,100,0),
(664810,153,-3472.13,5886.34,-27.49,NULL,0,0,0,0,100,0),
(664810,154,-3475.22,5881.96,-26.4544,NULL,0,0,0,0,100,0),
(664810,155,-3478.45,5877.39,-25.3871,NULL,0,0,0,0,100,0),
(664810,156,-3481.22,5873.48,-24.4932,NULL,0,0,0,0,100,0),
(664810,157,-3483.42,5870.37,-23.8397,NULL,0,0,0,0,100,0),
(664810,158,-3485.66,5866.41,-22.9761,NULL,0,0,0,0,100,0),
(664810,159,-3488.02,5862.25,-21.6915,NULL,0,0,0,0,100,0),
(664810,160,-3490.43,5858,-19.9902,NULL,0,0,0,0,100,0),
(664810,161,-3492.9,5853.63,-18.0138,NULL,0,0,0,0,100,0),
(664810,162,-3495.21,5849.56,-16.2582,NULL,0,0,0,0,100,0),
(664810,163,-3496.48,5846.55,-15.1114,NULL,0,0,0,0,100,0),
(664810,164,-3497.7,5843.64,-14.2179,NULL,0,0,0,0,100,0),
(664810,165,-3499.19,5840.1,-13.5268,NULL,0,0,0,0,100,0),
(664810,166,-3500.37,5837.3,-13.2752,NULL,0,0,0,0,100,0),
(664810,167,-3501.86,5833.75,-13.8527,NULL,0,0,0,0,100,0),
(664810,168,-3503.13,5830.74,-14.3159,NULL,0,0,0,0,100,0),
(664810,169,-3505.33,5825.53,-14.4462,NULL,0,0,0,0,100,0),
(664810,170,-3507.46,5820.46,-13.1723,NULL,0,0,0,0,100,0),
(664810,171,-3510.09,5816.05,-11.9425,NULL,0,0,0,0,100,0),
(664810,172,-3512.78,5811.55,-10.7393,NULL,0,0,0,0,100,0),
(664810,173,-3515.35,5807.24,-9.61262,NULL,0,0,0,0,100,0),
(664810,174,-3518.1,5802.63,-8.50214,NULL,0,0,0,0,100,0);
