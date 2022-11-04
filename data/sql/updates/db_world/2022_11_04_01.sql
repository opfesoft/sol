UPDATE `creature` SET `position_x` = -4470.54, `position_y` = -14095.6, `position_z` = 109.786, `orientation` = 2.52752 WHERE `guid` = 57464;
UPDATE `creature` SET `position_x` = -4397.45, `position_y` = -13759, `position_z` = 52.5403 WHERE `guid` = 75958;

UPDATE `creature_addon` SET `auras` = '29152' WHERE `guid` IN (75958,75959,75960,75961);

DELETE FROM `waypoint_data` WHERE `id` IN (573100,573130,759630,759580,759590,759610);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
-- Nestlewood Owlkin
(573100,1,-4443.44,-13695.2,46.8347,NULL,0,0,0,0,100,0),
(573100,2,-4447.3,-13701.7,47.8885,NULL,0,0,0,0,100,0),
(573100,3,-4451.55,-13708.9,48.4964,NULL,0,0,0,0,100,0),
(573100,4,-4446.19,-13712.6,49.9683,NULL,0,0,0,0,100,0),
(573100,5,-4438.93,-13717.7,51.3561,NULL,0,0,0,0,100,0),
(573100,6,-4431.98,-13722.6,51.7574,NULL,0,0,0,0,100,0),
(573100,7,-4425.05,-13722.3,51.583,NULL,0,0,0,0,100,0),
(573100,8,-4416.31,-13721.9,51.2833,NULL,0,0,0,0,100,0),
(573100,9,-4408.62,-13721.5,51.206,NULL,0,0,0,0,100,0),
(573100,10,-4396.15,-13721,50.4083,NULL,0,0,0,0,100,0),
(573100,11,-4385.4,-13720.5,50.135,NULL,0,0,0,0,100,0),
(573100,12,-4382.76,-13731.1,50.38,NULL,0,0,0,0,100,0),
(573100,13,-4380.47,-13740.4,50.452,NULL,0,0,0,0,100,0),
(573100,14,-4383.43,-13747.9,50.4513,NULL,0,0,0,0,100,0),
(573100,15,-4386.01,-13754.4,50.846,NULL,0,0,0,0,100,0),
(573100,16,-4388.49,-13760.6,51.2878,NULL,0,0,0,0,100,0),
(573100,17,-4390.75,-13766.4,52.2264,NULL,0,0,0,0,100,0),
(573100,18,-4392.35,-13770.4,52.292,NULL,0,0,0,0,100,0),
(573100,19,-4392.14,-13778.8,52.1271,NULL,0,0,0,0,100,0),
(573100,20,-4391.95,-13786.3,52.6647,NULL,0,0,0,0,100,0),
(573100,21,-4394.27,-13795.8,53.5119,NULL,0,0,0,0,100,0),
(573100,22,-4396.32,-13804.2,55.9769,NULL,0,0,0,0,100,0),
(573100,23,-4401.12,-13810.7,58.2856,NULL,0,0,0,0,100,0),
(573100,24,-4404.73,-13815.5,60.187,NULL,0,0,0,0,100,0),
(573100,25,-4405.8,-13822.5,61.567,NULL,0,0,0,0,100,0),
(573100,26,-4407.02,-13830.5,64.2813,NULL,0,0,0,0,100,0),
(573100,27,-4408.42,-13839.7,68.0529,NULL,0,0,0,0,100,0),
(573100,28,-4409.67,-13847.9,71.8702,NULL,0,0,0,0,100,0),
(573100,29,-4414.27,-13850.9,74.862,NULL,0,0,0,0,100,0),
(573100,30,-4419.17,-13854.1,78.3472,NULL,0,0,0,0,100,0),
(573100,31,-4425.91,-13855.5,81.9283,NULL,0,0,0,0,100,0),
(573100,32,-4432.24,-13856.8,85.8156,NULL,0,0,0,0,100,0),
(573100,33,-4436.72,-13860.7,90.1066,NULL,0,0,0,0,100,0),
(573100,34,-4441.74,-13865.1,94.9617,NULL,0,0,0,0,100,0),
(573100,35,-4447.25,-13869.9,99.7375,NULL,0,0,0,0,100,0),
(573100,36,-4450.68,-13872.9,100.96,NULL,0,0,0,0,100,0),
(573100,37,-4453.32,-13875.2,101.671,NULL,0,0,0,0,100,0),
(573100,38,-4450.68,-13872.9,100.96,NULL,0,0,0,0,100,0),
(573100,39,-4447.25,-13869.9,99.7375,NULL,0,0,0,0,100,0),
(573100,40,-4441.74,-13865.1,94.9617,NULL,0,0,0,0,100,0),
(573100,41,-4436.72,-13860.7,90.1066,NULL,0,0,0,0,100,0),
(573100,42,-4432.24,-13856.8,85.8156,NULL,0,0,0,0,100,0),
(573100,43,-4425.91,-13855.5,81.9283,NULL,0,0,0,0,100,0),
(573100,44,-4419.17,-13854.1,78.3472,NULL,0,0,0,0,100,0),
(573100,45,-4414.27,-13850.9,74.862,NULL,0,0,0,0,100,0),
(573100,46,-4409.67,-13847.9,71.8702,NULL,0,0,0,0,100,0),
(573100,47,-4408.42,-13839.7,68.0529,NULL,0,0,0,0,100,0),
(573100,48,-4407.02,-13830.5,64.2813,NULL,0,0,0,0,100,0),
(573100,49,-4405.8,-13822.5,61.567,NULL,0,0,0,0,100,0),
(573100,50,-4404.73,-13815.5,60.187,NULL,0,0,0,0,100,0),
(573100,51,-4401.12,-13810.7,58.2856,NULL,0,0,0,0,100,0),
(573100,52,-4396.32,-13804.2,55.9769,NULL,0,0,0,0,100,0),
(573100,53,-4394.27,-13795.8,53.5119,NULL,0,0,0,0,100,0),
(573100,54,-4391.95,-13786.3,52.6647,NULL,0,0,0,0,100,0),
(573100,55,-4392.14,-13778.8,52.1271,NULL,0,0,0,0,100,0),
(573100,56,-4392.35,-13770.4,52.292,NULL,0,0,0,0,100,0),
(573100,57,-4390.75,-13766.4,52.2264,NULL,0,0,0,0,100,0),
(573100,58,-4388.49,-13760.6,51.2878,NULL,0,0,0,0,100,0),
(573100,59,-4386.01,-13754.4,50.846,NULL,0,0,0,0,100,0),
(573100,60,-4383.43,-13747.9,50.4513,NULL,0,0,0,0,100,0),
(573100,61,-4380.47,-13740.4,50.452,NULL,0,0,0,0,100,0),
(573100,62,-4382.76,-13731.1,50.38,NULL,0,0,0,0,100,0),
(573100,63,-4385.4,-13720.5,50.135,NULL,0,0,0,0,100,0),
(573100,64,-4396.15,-13721,50.4083,NULL,0,0,0,0,100,0),
(573100,65,-4408.62,-13721.5,51.206,NULL,0,0,0,0,100,0),
(573100,66,-4416.31,-13721.9,51.2833,NULL,0,0,0,0,100,0),
(573100,67,-4425.05,-13722.3,51.583,NULL,0,0,0,0,100,0),
(573100,68,-4431.98,-13722.6,51.7574,NULL,0,0,0,0,100,0),
(573100,69,-4438.93,-13717.7,51.3561,NULL,0,0,0,0,100,0),
(573100,70,-4446.19,-13712.6,49.9683,NULL,0,0,0,0,100,0),
(573100,71,-4451.55,-13708.9,48.4964,NULL,0,0,0,0,100,0),
(573100,72,-4447.3,-13701.7,47.8885,NULL,0,0,0,0,100,0),
-- Nestlewood Owlkin
(573130,1,-4393.08,-13790.2,52.8699,NULL,0,0,0,0,100,0),
(573130,2,-4392.9,-13784.8,52.6335,NULL,0,0,0,0,100,0),
(573130,3,-4392.68,-13778,52.1691,NULL,0,0,0,0,100,0),
(573130,4,-4392.49,-13772.3,52.2943,NULL,0,0,0,0,100,0),
(573130,5,-4392.32,-13767.4,52.1865,NULL,0,0,0,0,100,0),
(573130,6,-4392.13,-13761.6,51.7931,NULL,0,0,0,0,100,0),
(573130,7,-4397.23,-13759.3,52.501,NULL,0,0,0,0,100,0),
(573130,8,-4401.46,-13757.4,53.0359,NULL,0,0,0,0,100,0),
(573130,9,-4407.62,-13754.6,53.1655,NULL,0,0,0,0,100,0),
(573130,10,-4412.63,-13752.3,53.8401,NULL,0,0,0,0,100,0),
(573130,11,-4415.65,-13747.1,52.9003,NULL,0,0,0,0,100,0),
(573130,12,-4418.35,-13742.5,52.9276,NULL,0,0,0,0,100,0),
(573130,13,-4421.17,-13737.6,53.1915,NULL,0,0,0,0,100,0),
(573130,14,-4423.75,-13733.2,53.1904,NULL,0,0,0,0,100,0),
(573130,15,-4426.4,-13728.7,52.7709,NULL,0,0,0,0,100,0),
(573130,16,-4429.81,-13722.8,51.8486,NULL,0,0,0,0,100,0),
(573130,17,-4422.56,-13722.7,51.4241,NULL,0,0,0,0,100,0),
(573130,18,-4415.67,-13722.7,51.328,NULL,0,0,0,0,100,0),
(573130,19,-4408.8,-13722.6,51.2365,NULL,0,0,0,0,100,0),
(573130,20,-4403.75,-13722.5,50.8767,NULL,0,0,0,0,100,0),
(573130,21,-4396.05,-13722.5,50.5994,NULL,0,0,0,0,100,0),
(573130,22,-4389.57,-13722.4,50.2886,NULL,0,0,0,0,100,0),
(573130,23,-4384.72,-13727.4,50.0762,NULL,0,0,0,0,100,0),
(573130,24,-4380.81,-13731.5,50.4513,NULL,0,0,0,0,100,0),
(573130,25,-4382.08,-13738.4,50.4513,NULL,0,0,0,0,100,0),
(573130,26,-4383.14,-13744.1,50.4693,NULL,0,0,0,0,100,0),
(573130,27,-4384.47,-13751.3,50.6035,NULL,0,0,0,0,100,0),
(573130,28,-4385.9,-13759.1,50.6214,NULL,0,0,0,0,100,0),
(573130,29,-4388.69,-13760.8,51.3381,NULL,0,0,0,0,100,0),
(573130,30,-4391.49,-13762.5,51.7525,NULL,0,0,0,0,100,0),
(573130,31,-4397.47,-13760.5,52.4848,NULL,0,0,0,0,100,0),
(573130,32,-4403.41,-13758.5,53.1175,NULL,0,0,0,0,100,0),
(573130,33,-4410.27,-13757.9,53.5294,NULL,0,0,0,0,100,0),
(573130,34,-4417.37,-13757.3,54.5066,NULL,0,0,0,0,100,0),
(573130,35,-4425.04,-13756.7,55.6445,NULL,0,0,0,0,100,0),
(573130,36,-4432.48,-13756.1,56.5914,NULL,0,0,0,0,100,0),
(573130,37,-4425.04,-13756.7,55.6445,NULL,0,0,0,0,100,0),
(573130,38,-4417.37,-13757.3,54.5066,NULL,0,0,0,0,100,0),
(573130,39,-4410.27,-13757.9,53.5294,NULL,0,0,0,0,100,0),
(573130,40,-4403.41,-13758.5,53.1175,NULL,0,0,0,0,100,0),
(573130,41,-4397.47,-13760.5,52.4848,NULL,0,0,0,0,100,0),
(573130,42,-4391.49,-13762.5,51.7525,NULL,0,0,0,0,100,0),
(573130,43,-4388.69,-13760.8,51.3381,NULL,0,0,0,0,100,0),
(573130,44,-4385.9,-13759.1,50.6214,NULL,0,0,0,0,100,0),
(573130,45,-4384.47,-13751.3,50.6035,NULL,0,0,0,0,100,0),
(573130,46,-4383.14,-13744.1,50.4693,NULL,0,0,0,0,100,0),
(573130,47,-4382.08,-13738.4,50.4513,NULL,0,0,0,0,100,0),
(573130,48,-4380.81,-13731.5,50.4513,NULL,0,0,0,0,100,0),
(573130,49,-4384.72,-13727.4,50.0762,NULL,0,0,0,0,100,0),
(573130,50,-4389.57,-13722.4,50.2886,NULL,0,0,0,0,100,0),
(573130,51,-4396.05,-13722.5,50.5994,NULL,0,0,0,0,100,0),
(573130,52,-4403.75,-13722.5,50.8767,NULL,0,0,0,0,100,0),
(573130,53,-4408.8,-13722.6,51.2365,NULL,0,0,0,0,100,0),
(573130,54,-4415.67,-13722.7,51.328,NULL,0,0,0,0,100,0),
(573130,55,-4422.56,-13722.7,51.4241,NULL,0,0,0,0,100,0),
(573130,56,-4429.81,-13722.8,51.8486,NULL,0,0,0,0,100,0),
(573130,57,-4426.4,-13728.7,52.7709,NULL,0,0,0,0,100,0),
(573130,58,-4423.75,-13733.2,53.1904,NULL,0,0,0,0,100,0),
(573130,59,-4421.17,-13737.6,53.1915,NULL,0,0,0,0,100,0),
(573130,60,-4418.35,-13742.5,52.9276,NULL,0,0,0,0,100,0),
(573130,61,-4415.65,-13747.1,52.9003,NULL,0,0,0,0,100,0),
(573130,62,-4412.63,-13752.3,53.8401,NULL,0,0,0,0,100,0),
(573130,63,-4407.62,-13754.6,53.1655,NULL,0,0,0,0,100,0),
(573130,64,-4401.46,-13757.4,53.0359,NULL,0,0,0,0,100,0),
(573130,65,-4397.23,-13759.3,52.501,NULL,0,0,0,0,100,0),
(573130,66,-4392.13,-13761.6,51.7931,NULL,0,0,0,0,100,0),
(573130,67,-4392.32,-13767.4,52.1865,NULL,0,0,0,0,100,0),
(573130,68,-4392.49,-13772.3,52.2943,NULL,0,0,0,0,100,0),
(573130,69,-4392.68,-13778,52.1691,NULL,0,0,0,0,100,0),
(573130,70,-4392.9,-13784.8,52.6335,NULL,0,0,0,0,100,0),
-- Nestlewood Owlkin
(759630,1,-4523.47,-14045.3,108.254,NULL,0,0,0,0,100,0),
(759630,2,-4518.67,-14039.5,109.07,NULL,0,0,0,0,100,0),
(759630,3,-4515.32,-14035.5,110.25,NULL,0,0,0,0,100,0),
(759630,4,-4512.34,-14031.9,111.705,NULL,0,0,0,0,100,0),
(759630,5,-4505.72,-14032.6,114.619,NULL,0,0,0,0,100,0),
(759630,6,-4498.53,-14033.3,119.031,NULL,0,0,0,0,100,0),
(759630,7,-4490.4,-14034.1,123.405,NULL,0,0,0,0,100,0),
(759630,8,-4485.8,-14034.6,126.027,NULL,0,0,0,0,100,0),
(759630,9,-4480.65,-14035.1,128.569,NULL,0,0,0,0,100,0),
(759630,10,-4476.16,-14031.2,131.164,NULL,0,0,0,0,100,0),
(759630,11,-4471.95,-14027.5,133.917,NULL,0,0,0,0,100,0),
(759630,12,-4468.78,-14024.8,136.193,NULL,0,0,0,0,100,0),
(759630,13,-4465.92,-14022.3,137.806,NULL,0,0,0,0,100,0),
(759630,14,-4464.53,-14015.3,140.448,NULL,0,0,0,0,100,0),
(759630,15,-4463.07,-14008,144.718,NULL,0,0,0,0,100,0),
(759630,16,-4461.74,-14001.4,148.363,NULL,0,0,0,0,100,0),
(759630,17,-4460.46,-13995,152.063,NULL,0,0,0,0,100,0),
(759630,18,-4459.3,-13989.1,155.11,NULL,0,0,0,0,100,0),
(759630,19,-4455.36,-13986.4,157.702,NULL,0,0,0,0,100,0),
(759630,20,-4450.93,-13983.4,159.697,NULL,0,0,0,0,100,0),
(759630,21,-4446.22,-13980.2,161.637,NULL,0,0,0,0,100,0),
(759630,22,-4441.53,-13976.9,163.079,NULL,0,0,0,0,100,0),
(759630,23,-4437.08,-13973.9,163.54,NULL,0,0,0,0,100,0),
(759630,24,-4441.53,-13976.9,163.079,NULL,0,0,0,0,100,0),
(759630,25,-4446.22,-13980.2,161.637,NULL,0,0,0,0,100,0),
(759630,26,-4450.93,-13983.4,159.697,NULL,0,0,0,0,100,0),
(759630,27,-4455.36,-13986.4,157.702,NULL,0,0,0,0,100,0),
(759630,28,-4459.3,-13989.1,155.11,NULL,0,0,0,0,100,0),
(759630,29,-4460.46,-13995,152.063,NULL,0,0,0,0,100,0),
(759630,30,-4461.74,-14001.4,148.363,NULL,0,0,0,0,100,0),
(759630,31,-4463.07,-14008,144.718,NULL,0,0,0,0,100,0),
(759630,32,-4464.53,-14015.3,140.448,NULL,0,0,0,0,100,0),
(759630,33,-4465.92,-14022.3,137.806,NULL,0,0,0,0,100,0),
(759630,34,-4468.78,-14024.8,136.193,NULL,0,0,0,0,100,0),
(759630,35,-4471.95,-14027.5,133.917,NULL,0,0,0,0,100,0),
(759630,36,-4476.16,-14031.2,131.164,NULL,0,0,0,0,100,0),
(759630,37,-4480.65,-14035.1,128.569,NULL,0,0,0,0,100,0),
(759630,38,-4485.8,-14034.6,126.027,NULL,0,0,0,0,100,0),
(759630,39,-4490.4,-14034.1,123.405,NULL,0,0,0,0,100,0),
(759630,40,-4498.53,-14033.3,119.031,NULL,0,0,0,0,100,0),
(759630,41,-4505.72,-14032.6,114.619,NULL,0,0,0,0,100,0),
(759630,42,-4512.34,-14031.9,111.705,NULL,0,0,0,0,100,0),
(759630,43,-4515.32,-14035.5,110.25,NULL,0,0,0,0,100,0),
(759630,44,-4518.67,-14039.5,109.07,NULL,0,0,0,0,100,0),
(759630,45,-4523.47,-14045.3,108.254,NULL,0,0,0,0,100,0),
(759630,46,-4520.12,-14050.9,108.645,NULL,0,0,0,0,100,0),
(759630,47,-4517,-14056.1,108.617,NULL,0,0,0,0,100,0),
(759630,48,-4513.47,-14062,108.382,NULL,0,0,0,0,100,0),
(759630,49,-4508.8,-14069.8,108.282,NULL,0,0,0,0,100,0),
(759630,50,-4504.49,-14077.1,108.307,NULL,0,0,0,0,100,0),
(759630,51,-4500.48,-14083.8,108.443,NULL,0,0,0,0,100,0),
(759630,52,-4493.86,-14094.8,108.966,NULL,0,0,0,0,100,0),
(759630,53,-4490.94,-14099.7,109.116,NULL,0,0,0,0,100,0),
(759630,54,-4486.06,-14103.9,109.229,NULL,0,0,0,0,100,0),
(759630,55,-4480.64,-14108.5,108.986,NULL,0,0,0,0,100,0),
(759630,56,-4475.6,-14112.8,109.116,NULL,0,0,0,0,100,0),
(759630,57,-4480.64,-14108.5,108.986,NULL,0,0,0,0,100,0),
(759630,58,-4486.06,-14103.9,109.229,NULL,0,0,0,0,100,0),
(759630,59,-4490.94,-14099.7,109.116,NULL,0,0,0,0,100,0),
(759630,60,-4493.86,-14094.8,108.966,NULL,0,0,0,0,100,0),
(759630,61,-4500.48,-14083.8,108.443,NULL,0,0,0,0,100,0),
(759630,62,-4504.49,-14077.1,108.307,NULL,0,0,0,0,100,0),
(759630,63,-4508.8,-14069.8,108.282,NULL,0,0,0,0,100,0),
(759630,64,-4513.47,-14062,108.382,NULL,0,0,0,0,100,0),
(759630,65,-4517,-14056.1,108.617,NULL,0,0,0,0,100,0),
(759630,66,-4520.12,-14050.9,108.645,NULL,0,0,0,0,100,0),
(759630,67,-4523.47,-14045.3,108.254,NULL,0,0,0,0,100,0),
(759630,68,-4529.53,-14045.1,107.52,NULL,0,0,0,0,100,0),
(759630,69,-4536.03,-14044.8,106.065,NULL,0,0,0,0,100,0),
(759630,70,-4540.21,-14042.5,104.398,NULL,0,0,0,0,100,0),
(759630,71,-4544.89,-14039.9,102.654,NULL,0,0,0,0,100,0),
(759630,72,-4546.11,-14034.6,100.347,NULL,0,0,0,0,100,0),
(759630,73,-4547.34,-14029.2,98.2769,NULL,0,0,0,0,100,0),
(759630,74,-4549.17,-14021.2,94.4465,NULL,0,0,0,0,100,0),
(759630,75,-4550.8,-14014.1,91.238,NULL,0,0,0,0,100,0),
(759630,76,-4549.17,-14021.2,94.4465,NULL,0,0,0,0,100,0),
(759630,77,-4547.34,-14029.2,98.2769,NULL,0,0,0,0,100,0),
(759630,78,-4546.11,-14034.6,100.347,NULL,0,0,0,0,100,0),
(759630,79,-4544.89,-14039.9,102.654,NULL,0,0,0,0,100,0),
(759630,80,-4540.21,-14042.5,104.396,NULL,0,0,0,0,100,0),
(759630,81,-4536.03,-14044.8,106.063,NULL,0,0,0,0,100,0),
(759630,82,-4529.53,-14045.1,107.52,NULL,0,0,0,0,100,0),
(759630,83,-4523.47,-14045.3,108.254,NULL,0,0,0,0,100,0),
(759630,84,-4520.12,-14050.9,108.645,NULL,0,0,0,0,100,0),
(759630,85,-4517,-14056.1,108.617,NULL,0,0,0,0,100,0),
(759630,86,-4513.47,-14062,108.382,NULL,0,0,0,0,100,0),
(759630,87,-4508.8,-14069.8,108.282,NULL,0,0,0,0,100,0),
(759630,88,-4504.49,-14077.1,108.307,NULL,0,0,0,0,100,0),
(759630,89,-4500.48,-14083.8,108.443,NULL,0,0,0,0,100,0),
(759630,90,-4491.03,-14085.2,108.585,NULL,0,0,0,0,100,0),
(759630,91,-4482.33,-14086.5,108.898,NULL,0,0,0,0,100,0),
(759630,92,-4478.45,-14092.7,109.498,NULL,0,0,0,0,100,0),
(759630,93,-4474.15,-14099.6,109.976,NULL,0,0,0,0,100,0),
(759630,94,-4470.75,-14105.1,109.772,NULL,0,0,0,0,100,0),
(759630,95,-4475.6,-14112.8,109.116,NULL,0,0,0,0,100,0),
(759630,96,-4480.64,-14108.5,108.986,NULL,0,0,0,0,100,0),
(759630,97,-4486.06,-14103.9,109.229,NULL,0,0,0,0,100,0),
(759630,98,-4490.94,-14099.7,109.116,NULL,0,0,0,0,100,0),
(759630,99,-4493.86,-14094.8,108.966,NULL,0,0,0,0,100,0),
(759630,100,-4500.48,-14083.8,108.443,NULL,0,0,0,0,100,0),
(759630,101,-4504.49,-14077.1,108.307,NULL,0,0,0,0,100,0),
(759630,102,-4508.8,-14069.8,108.282,NULL,0,0,0,0,100,0),
(759630,103,-4513.47,-14062,108.382,NULL,0,0,0,0,100,0),
(759630,104,-4517,-14056.1,108.617,NULL,0,0,0,0,100,0),
(759630,105,-4520.12,-14050.9,108.645,NULL,0,0,0,0,100,0),
-- Mutated Owlkin
(759580,1,-4397.45,-13759,52.5403,NULL,0,0,0,0,100,0),
(759580,2,-4392.27,-13754.6,52.094,NULL,0,0,0,0,100,0),
(759580,3,-4387.6,-13750.7,51.187,NULL,0,0,0,0,100,0),
(759580,4,-4385.92,-13744.3,50.816,NULL,0,0,0,0,100,0),
(759580,5,-4384.44,-13738.6,50.5713,NULL,0,0,0,0,100,0),
(759580,6,-4385.32,-13731.1,50.4359,NULL,0,0,0,0,100,0),
(759580,7,-4391.07,-13724.8,50.5065,NULL,0,0,0,0,100,0),
(759580,8,-4396.03,-13724.5,50.8659,NULL,0,0,0,0,100,0),
(759580,9,-4403.13,-13724,50.9263,NULL,0,0,0,0,100,0),
(759580,10,-4409.3,-13723.5,51.2638,NULL,0,0,0,0,100,0),
(759580,11,-4415.57,-13723.1,51.3604,NULL,0,0,0,0,100,0),
(759580,12,-4421.52,-13722.7,51.3647,NULL,0,0,0,0,100,0),
(759580,13,-4426.98,-13722.3,51.7162,NULL,0,0,0,0,100,0),
(759580,14,-4432.3,-13721,51.8533,NULL,0,0,0,0,100,0),
(759580,15,-4437.56,-13719.7,51.5869,NULL,0,0,0,0,100,0),
(759580,16,-4442.19,-13716.5,50.8378,NULL,0,0,0,0,100,0),
(759580,17,-4446.66,-13713.5,49.9453,NULL,0,0,0,0,100,0),
(759580,18,-4450.02,-13707.3,48.3929,NULL,0,0,0,0,100,0),
(759580,19,-4448.54,-13698.3,47.5457,NULL,0,0,0,0,100,0),
(759580,20,-4444.51,-13694.4,46.6222,NULL,0,0,0,0,100,0),
(759580,21,-4440.44,-13690.5,45.7925,NULL,0,0,0,0,100,0),
(759580,22,-4434.76,-13689.6,45.5794,NULL,0,0,0,0,100,0),
(759580,23,-4430.11,-13694,46.9106,NULL,0,0,0,0,100,0),
(759580,24,-4428.42,-13699.7,48.1021,NULL,0,0,0,0,100,0),
(759580,25,-4426.78,-13705.3,49.3794,NULL,0,0,0,0,100,0),
(759580,26,-4424.74,-13712.2,50.6564,NULL,0,0,0,0,100,0),
(759580,27,-4423.66,-13715.8,51.0542,NULL,0,0,0,0,100,0),
(759580,28,-4418.28,-13721.3,51.1114,NULL,0,0,0,0,100,0),
(759580,29,-4413.86,-13721.5,51.3143,NULL,0,0,0,0,100,0),
(759580,30,-4409.9,-13721.8,51.2373,NULL,0,0,0,0,100,0),
(759580,31,-4404.42,-13722.1,50.9057,NULL,0,0,0,0,100,0),
(759580,32,-4398.01,-13722.4,50.5256,NULL,0,0,0,0,100,0),
(759580,33,-4391.7,-13722.8,50.4426,NULL,0,0,0,0,100,0),
(759580,34,-4387,-13725.1,50.1552,NULL,0,0,0,0,100,0),
(759580,35,-4381.61,-13727.8,50.2699,NULL,0,0,0,0,100,0),
(759580,36,-4380.9,-13733.1,50.4502,NULL,0,0,0,0,100,0),
(759580,37,-4380.06,-13739.4,50.4521,NULL,0,0,0,0,100,0),
(759580,38,-4381.65,-13745.9,50.4516,NULL,0,0,0,0,100,0),
(759580,39,-4383.25,-13752.4,50.4515,NULL,0,0,0,0,100,0),
(759580,40,-4385.82,-13757,50.7015,NULL,0,0,0,0,100,0),
(759580,41,-4388.39,-13761.6,51.437,NULL,0,0,0,0,100,0),
(759580,42,-4390.51,-13765.3,52.0667,NULL,0,0,0,0,100,0),
(759580,43,-4392.68,-13769.2,52.2511,NULL,0,0,0,0,100,0),
(759580,44,-4390.35,-13775.7,52.1454,NULL,0,0,0,0,100,0),
(759580,45,-4385.74,-13778.5,52.072,NULL,0,0,0,0,100,0),
(759580,46,-4380.55,-13781.6,52.2611,NULL,0,0,0,0,100,0),
(759580,47,-4375.04,-13784.8,52.283,NULL,0,0,0,0,100,0),
(759580,48,-4370.44,-13787.6,52.2808,NULL,0,0,0,0,100,0),
(759580,49,-4368.16,-13791.2,52.3032,NULL,0,0,0,0,100,0),
(759580,50,-4369.71,-13795.9,52.4165,NULL,0,0,0,0,100,0),
(759580,51,-4375.19,-13797.5,52.3075,NULL,0,0,0,0,100,0),
(759580,52,-4379.54,-13798.8,52.1976,NULL,0,0,0,0,100,0),
(759580,53,-4384.04,-13797.5,52.4815,NULL,0,0,0,0,100,0),
(759580,54,-4387.86,-13796.5,53.1179,NULL,0,0,0,0,100,0),
(759580,55,-4391,-13795.6,53.3708,NULL,0,0,0,0,100,0),
(759580,56,-4391.83,-13790.4,52.869,NULL,0,0,0,0,100,0),
(759580,57,-4392.48,-13786.4,52.7211,NULL,0,0,0,0,100,0),
(759580,58,-4393.52,-13780.7,52.2362,NULL,0,0,0,0,100,0),
(759580,59,-4394.62,-13774.6,52.3636,NULL,0,0,0,0,100,0),
(759580,60,-4395.59,-13769.3,52.3373,NULL,0,0,0,0,100,0),
(759580,61,-4396.65,-13763.4,52.3325,NULL,0,0,0,0,100,0),
(759580,62,-4401.64,-13762.9,53.0553,NULL,0,0,0,0,100,0),
(759580,63,-4407.55,-13762.3,53.6727,NULL,0,0,0,0,100,0),
(759580,64,-4414.05,-13761.6,54.0969,NULL,0,0,0,0,100,0),
(759580,65,-4420.32,-13760.9,55.1649,NULL,0,0,0,0,100,0),
(759580,66,-4425.42,-13760.4,55.9785,NULL,0,0,0,0,100,0),
(759580,67,-4430.63,-13759.8,56.4479,NULL,0,0,0,0,100,0),
(759580,68,-4434.79,-13759.4,56.6967,NULL,0,0,0,0,100,0),
(759580,69,-4430.48,-13759.4,56.3968,NULL,0,0,0,0,100,0),
(759580,70,-4425.46,-13759.3,55.7126,NULL,0,0,0,0,100,0),
(759580,71,-4420.32,-13759.2,54.9675,NULL,0,0,0,0,100,0),
(759580,72,-4414.27,-13759.2,54.0624,NULL,0,0,0,0,100,0),
(759580,73,-4408.44,-13759.1,53.3176,NULL,0,0,0,0,100,0),
(759580,74,-4402.72,-13759.1,53.0817,NULL,0,0,0,0,100,0),
-- Mutated Owlkin
(759590,1,-4447.7,-13871.1,100.039,NULL,0,0,0,0,100,0),
(759590,2,-4446.33,-13869.9,99.4124,NULL,0,0,0,0,100,0),
(759590,3,-4441.94,-13866.2,95.5978,NULL,0,0,0,0,100,0),
(759590,4,-4438.46,-13863.3,92.2123,NULL,0,0,0,0,100,0),
(759590,5,-4434.19,-13859.7,88.0791,NULL,0,0,0,0,100,0),
(759590,6,-4430,-13856.2,84.2587,NULL,0,0,0,0,100,0),
(759590,7,-4426.16,-13852.9,81.2027,NULL,0,0,0,0,100,0),
(759590,8,-4426.21,-13846.3,80.213,NULL,0,0,0,0,100,0),
(759590,9,-4426.25,-13840,79.7379,NULL,0,0,0,0,100,0),
(759590,10,-4426.29,-13833.5,80.223,NULL,0,0,0,0,100,0),
(759590,11,-4426.32,-13828.3,80.6278,NULL,0,0,0,0,100,0),
(759590,12,-4426.34,-13824.5,81.0609,NULL,0,0,0,0,100,0),
(759590,13,-4428.62,-13820.8,80.9297,NULL,0,0,0,0,100,0),
(759590,14,-4430.41,-13817.9,81.551,NULL,0,0,0,0,100,0),
(759590,15,-4430.63,-13812.8,81.655,NULL,0,0,0,0,100,0),
(759590,16,-4430.82,-13808.3,82.1983,NULL,0,0,0,0,100,0),
(759590,17,-4430.97,-13804.7,82.2576,NULL,0,0,0,0,100,0),
(759590,18,-4430.82,-13808.3,82.1983,NULL,0,0,0,0,100,0),
(759590,19,-4430.63,-13812.8,81.655,NULL,0,0,0,0,100,0),
(759590,20,-4430.41,-13817.9,81.551,NULL,0,0,0,0,100,0),
(759590,21,-4428.62,-13820.8,80.9297,NULL,0,0,0,0,100,0),
(759590,22,-4426.34,-13824.5,81.0609,NULL,0,0,0,0,100,0),
(759590,23,-4426.32,-13828.3,80.6278,NULL,0,0,0,0,100,0),
(759590,24,-4426.29,-13833.5,80.223,NULL,0,0,0,0,100,0),
(759590,25,-4426.25,-13840,79.7379,NULL,0,0,0,0,100,0),
(759590,26,-4426.21,-13846.3,80.213,NULL,0,0,0,0,100,0),
(759590,27,-4426.16,-13852.9,81.2027,NULL,0,0,0,0,100,0),
(759590,28,-4421.14,-13852.2,79.0498,NULL,0,0,0,0,100,0),
(759590,29,-4412.94,-13851.1,74.4253,NULL,0,0,0,0,100,0),
(759590,30,-4405.93,-13850.1,71.7094,NULL,0,0,0,0,100,0),
(759590,31,-4401.04,-13846.9,70.3103,NULL,0,0,0,0,100,0),
(759590,32,-4395.28,-13843.2,69.9078,NULL,0,0,0,0,100,0),
(759590,33,-4389.12,-13839.2,69.7257,NULL,0,0,0,0,100,0),
(759590,34,-4383.27,-13835.4,69.403,NULL,0,0,0,0,100,0),
(759590,35,-4378.18,-13832.1,69.3447,NULL,0,0,0,0,100,0),
(759590,36,-4373.65,-13829.1,69.2236,NULL,0,0,0,0,100,0),
(759590,37,-4369.1,-13829,69.2236,NULL,0,0,0,0,100,0),
(759590,38,-4364.55,-13828.8,69.2236,NULL,0,0,0,0,100,0),
(759590,39,-4369.1,-13829,69.2236,NULL,0,0,0,0,100,0),
(759590,40,-4373.65,-13829.1,69.2236,NULL,0,0,0,0,100,0),
(759590,41,-4378.18,-13832.1,69.3447,NULL,0,0,0,0,100,0),
(759590,42,-4383.27,-13835.4,69.403,NULL,0,0,0,0,100,0),
(759590,43,-4389.12,-13839.2,69.7257,NULL,0,0,0,0,100,0),
(759590,44,-4395.28,-13843.2,69.9078,NULL,0,0,0,0,100,0),
(759590,45,-4401.04,-13846.9,70.3087,NULL,0,0,0,0,100,0),
(759590,46,-4408.78,-13846.6,71.0612,NULL,0,0,0,0,100,0),
(759590,47,-4408.28,-13840.9,68.526,NULL,0,0,0,0,100,0),
(759590,48,-4407.69,-13834.3,65.7861,NULL,0,0,0,0,100,0),
(759590,49,-4407.09,-13827.5,63.1703,NULL,0,0,0,0,100,0),
(759590,50,-4406.52,-13821,61.3451,NULL,0,0,0,0,100,0),
(759590,51,-4406.02,-13815.4,60.3337,NULL,0,0,0,0,100,0),
(759590,52,-4403.49,-13813.5,59.6752,NULL,0,0,0,0,100,0),
(759590,53,-4400.59,-13811.3,58.1433,NULL,0,0,0,0,100,0),
(759590,54,-4398.44,-13808,57.1387,NULL,0,0,0,0,100,0),
(759590,55,-4395.99,-13804.2,55.897,NULL,0,0,0,0,100,0),
(759590,56,-4398.44,-13808,57.1387,NULL,0,0,0,0,100,0),
(759590,57,-4400.59,-13811.3,58.1433,NULL,0,0,0,0,100,0),
(759590,58,-4403.49,-13813.5,59.6752,NULL,0,0,0,0,100,0),
(759590,59,-4406.02,-13815.4,60.3337,NULL,0,0,0,0,100,0),
(759590,60,-4406.52,-13821,61.3451,NULL,0,0,0,0,100,0),
(759590,61,-4407.09,-13827.5,63.1703,NULL,0,0,0,0,100,0),
(759590,62,-4407.69,-13834.3,65.7861,NULL,0,0,0,0,100,0),
(759590,63,-4408.28,-13840.9,68.526,NULL,0,0,0,0,100,0),
(759590,64,-4408.78,-13846.6,71.0612,NULL,0,0,0,0,100,0),
(759590,65,-4412.94,-13851.1,74.4253,NULL,0,0,0,0,100,0),
(759590,66,-4418.52,-13852.7,77.5809,NULL,0,0,0,0,100,0),
(759590,67,-4425.34,-13854.8,81.4648,NULL,0,0,0,0,100,0),
(759590,68,-4430,-13856.2,84.2587,NULL,0,0,0,0,100,0),
(759590,69,-4434.19,-13859.7,88.0791,NULL,0,0,0,0,100,0),
(759590,70,-4438.46,-13863.3,92.2123,NULL,0,0,0,0,100,0),
(759590,71,-4441.94,-13866.2,95.5978,NULL,0,0,0,0,100,0),
(759590,72,-4446.33,-13869.9,99.4124,NULL,0,0,0,0,100,0),
(759590,73,-4447.7,-13871.1,100.039,NULL,0,0,0,0,100,0),
(759590,74,-4447.91,-13876.9,101.468,NULL,0,0,0,0,100,0),
(759590,75,-4448.11,-13882.4,103.882,NULL,0,0,0,0,100,0),
(759590,76,-4448.26,-13886.6,105.886,NULL,0,0,0,0,100,0),
(759590,77,-4445.11,-13891.5,109.493,NULL,0,0,0,0,100,0),
(759590,78,-4441.72,-13896.8,113.326,NULL,0,0,0,0,100,0),
(759590,79,-4439.54,-13900.2,115.555,NULL,0,0,0,0,100,0),
(759590,80,-4437.66,-13906.7,119.276,NULL,0,0,0,0,100,0),
(759590,81,-4436.06,-13912.2,123.678,NULL,0,0,0,0,100,0),
(759590,82,-4434.32,-13918.3,127.799,NULL,0,0,0,0,100,0),
(759590,83,-4432.41,-13924.9,132.246,NULL,0,0,0,0,100,0),
(759590,84,-4430.38,-13932,137.144,NULL,0,0,0,0,100,0),
(759590,85,-4429.05,-13936.6,140.448,NULL,0,0,0,0,100,0),
(759590,86,-4429.79,-13940.7,143.333,NULL,0,0,0,0,100,0),
(759590,87,-4430.33,-13943.7,145.354,NULL,0,0,0,0,100,0),
(759590,88,-4428.27,-13946.2,147.234,NULL,0,0,0,0,100,0),
(759590,89,-4426.15,-13948.9,149.41,NULL,0,0,0,0,100,0),
(759590,90,-4425.92,-13953.4,152.071,NULL,0,0,0,0,100,0),
(759590,91,-4425.63,-13958.9,155.533,NULL,0,0,0,0,100,0),
(759590,92,-4425.38,-13963.9,158.647,NULL,0,0,0,0,100,0),
(759590,93,-4425.19,-13967.6,160.555,NULL,0,0,0,0,100,0),
(759590,94,-4424.99,-13971.4,161.606,NULL,0,0,0,0,100,0),
(759590,95,-4425.19,-13967.6,160.555,NULL,0,0,0,0,100,0),
(759590,96,-4425.38,-13963.9,158.647,NULL,0,0,0,0,100,0),
(759590,97,-4425.63,-13958.9,155.533,NULL,0,0,0,0,100,0),
(759590,98,-4425.92,-13953.4,152.071,NULL,0,0,0,0,100,0),
(759590,99,-4426.15,-13948.9,149.41,NULL,0,0,0,0,100,0),
(759590,100,-4428.27,-13946.2,147.234,NULL,0,0,0,0,100,0),
(759590,101,-4430.33,-13943.7,145.354,NULL,0,0,0,0,100,0),
(759590,102,-4429.79,-13940.7,143.333,NULL,0,0,0,0,100,0),
(759590,103,-4429.05,-13936.6,140.448,NULL,0,0,0,0,100,0),
(759590,104,-4430.38,-13932,137.144,NULL,0,0,0,0,100,0),
(759590,105,-4432.41,-13924.9,132.246,NULL,0,0,0,0,100,0),
(759590,106,-4434.32,-13918.3,127.799,NULL,0,0,0,0,100,0),
(759590,107,-4436.06,-13912.2,123.678,NULL,0,0,0,0,100,0),
(759590,108,-4437.66,-13906.7,119.276,NULL,0,0,0,0,100,0),
(759590,109,-4439.54,-13900.2,115.555,NULL,0,0,0,0,100,0),
(759590,110,-4441.72,-13896.8,113.326,NULL,0,0,0,0,100,0),
(759590,111,-4445.11,-13891.5,109.493,NULL,0,0,0,0,100,0),
(759590,112,-4448.26,-13886.6,105.886,NULL,0,0,0,0,100,0),
(759590,113,-4448.11,-13882.4,103.882,NULL,0,0,0,0,100,0),
(759590,114,-4447.91,-13876.9,101.468,NULL,0,0,0,0,100,0),
-- Mutated Owlkin
(759610,1,-4594.39,-14003.7,86.0171,NULL,0,0,0,0,100,0),
(759610,2,-4594.07,-13998.9,86.0458,NULL,0,0,0,0,100,0),
(759610,3,-4593.72,-13993.6,85.9359,NULL,0,0,0,0,100,0),
(759610,4,-4593.32,-13987.6,85.3918,NULL,0,0,0,0,100,0),
(759610,5,-4592.98,-13982.5,84.4133,NULL,0,0,0,0,100,0),
(759610,6,-4589.26,-13976.4,83.6161,NULL,0,0,0,0,100,0),
(759610,7,-4586.16,-13971.4,82.9927,NULL,0,0,0,0,100,0),
(759610,8,-4584.48,-13967.1,82.8887,NULL,0,0,0,0,100,0),
(759610,9,-4582.25,-13961.3,83.238,NULL,0,0,0,0,100,0),
(759610,10,-4580.24,-13956.1,83.3117,NULL,0,0,0,0,100,0),
(759610,11,-4576.45,-13951.1,83.577,NULL,0,0,0,0,100,0),
(759610,12,-4572.69,-13947.5,83.9695,NULL,0,0,0,0,100,0),
(759610,13,-4567.53,-13942.6,84.0368,NULL,0,0,0,0,100,0),
(759610,14,-4562.89,-13938.2,84.2128,NULL,0,0,0,0,100,0),
(759610,15,-4557.57,-13933.1,84.6951,NULL,0,0,0,0,100,0),
(759610,16,-4552.84,-13928.6,84.9886,NULL,0,0,0,0,100,0),
(759610,17,-4550.65,-13926.5,85.922,NULL,0,0,0,0,100,0),
(759610,18,-4547.78,-13923.8,86.6559,NULL,0,0,0,0,100,0),
(759610,19,-4545.16,-13921.3,87.1992,NULL,0,0,0,0,100,0),
(759610,20,-4543.19,-13919.4,87.5357,NULL,0,0,0,0,100,0),
(759610,21,-4539.73,-13915.1,87.0489,NULL,0,0,0,0,100,0),
(759610,22,-4537.05,-13911.9,87.8796,NULL,0,0,0,0,100,0),
(759610,23,-4534.84,-13909.1,89.1981,NULL,0,0,0,0,100,0),
(759610,24,-4533.02,-13906.9,89.8762,NULL,0,0,0,0,100,0),
(759610,25,-4527.96,-13904.1,90.9655,NULL,0,0,0,0,100,0),
(759610,26,-4522.83,-13901.4,90.9075,NULL,0,0,0,0,100,0),
(759610,27,-4518.12,-13898.8,91.8311,NULL,0,0,0,0,100,0),
(759610,28,-4513.17,-13896.1,92.7869,NULL,0,0,0,0,100,0),
(759610,29,-4509.21,-13896.1,93.9999,NULL,0,0,0,0,100,0),
(759610,30,-4505.23,-13896,95.0798,NULL,0,0,0,0,100,0),
(759610,31,-4501.98,-13896,95.7497,NULL,0,0,0,0,100,0),
(759610,32,-4505.23,-13896,95.0798,NULL,0,0,0,0,100,0),
(759610,33,-4509.21,-13896.1,93.9999,NULL,0,0,0,0,100,0),
(759610,34,-4513.17,-13896.1,92.7869,NULL,0,0,0,0,100,0),
(759610,35,-4518.12,-13898.8,91.8311,NULL,0,0,0,0,100,0),
(759610,36,-4522.83,-13901.4,90.9075,NULL,0,0,0,0,100,0),
(759610,37,-4527.96,-13904.1,90.9655,NULL,0,0,0,0,100,0),
(759610,38,-4533.02,-13906.9,89.8762,NULL,0,0,0,0,100,0),
(759610,39,-4534.84,-13909.1,89.1981,NULL,0,0,0,0,100,0),
(759610,40,-4537.05,-13911.9,87.8796,NULL,0,0,0,0,100,0),
(759610,41,-4539.73,-13915.1,87.0489,NULL,0,0,0,0,100,0),
(759610,42,-4543.32,-13918.5,87.5246,NULL,0,0,0,0,100,0),
(759610,43,-4545.55,-13920.5,87.1149,NULL,0,0,0,0,100,0),
(759610,44,-4548.2,-13923,86.5683,NULL,0,0,0,0,100,0),
(759610,45,-4551.11,-13925.7,85.7885,NULL,0,0,0,0,100,0),
(759610,46,-4553.26,-13927.7,84.941,NULL,0,0,0,0,100,0),
(759610,47,-4557.45,-13931.6,84.8098,NULL,0,0,0,0,100,0),
(759610,48,-4562.75,-13936.5,84.3059,NULL,0,0,0,0,100,0),
(759610,49,-4567.71,-13941.1,84.1364,NULL,0,0,0,0,100,0),
(759610,50,-4572.68,-13945.7,83.9548,NULL,0,0,0,0,100,0),
(759610,51,-4576.24,-13949,83.6602,NULL,0,0,0,0,100,0),
(759610,52,-4583.29,-13950.6,83.2528,NULL,0,0,0,0,100,0),
(759610,53,-4589.23,-13952,83.2427,NULL,0,0,0,0,100,0),
(759610,54,-4594.71,-13952,83.2856,NULL,0,0,0,0,100,0),
(759610,55,-4599.73,-13952,83.4174,NULL,0,0,0,0,100,0),
(759610,56,-4604.19,-13952,83.5327,NULL,0,0,0,0,100,0),
(759610,57,-4610.48,-13949.5,83.6894,NULL,0,0,0,0,100,0),
(759610,58,-4616.22,-13947.2,83.8974,NULL,0,0,0,0,100,0),
(759610,59,-4621.91,-13945.5,84.2248,NULL,0,0,0,0,100,0),
(759610,60,-4627.14,-13943.9,84.4674,NULL,0,0,0,0,100,0),
(759610,61,-4632.27,-13944.2,84.9128,NULL,0,0,0,0,100,0),
(759610,62,-4637.3,-13944.4,85.009,NULL,0,0,0,0,100,0),
(759610,63,-4641.91,-13946.4,85.1573,NULL,0,0,0,0,100,0),
(759610,64,-4645.88,-13948.1,85.5633,NULL,0,0,0,0,100,0),
(759610,65,-4649.9,-13949.8,85.5586,NULL,0,0,0,0,100,0),
(759610,66,-4654.12,-13954.9,85.8709,NULL,0,0,0,0,100,0),
(759610,67,-4657.77,-13959.4,86.2783,NULL,0,0,0,0,100,0),
(759610,68,-4661.36,-13964.9,86.496,NULL,0,0,0,0,100,0),
(759610,69,-4664.29,-13969.3,86.5976,NULL,0,0,0,0,100,0),
(759610,70,-4663.83,-13973.4,86.5259,NULL,0,0,0,0,100,0),
(759610,71,-4663.33,-13977.8,86.4898,NULL,0,0,0,0,100,0),
(759610,72,-4662.94,-13981.2,86.5135,NULL,0,0,0,0,100,0),
(759610,73,-4661.05,-13987,86.838,NULL,0,0,0,0,100,0),
(759610,74,-4659.69,-13991.1,87.4205,NULL,0,0,0,0,100,0),
(759610,75,-4659.37,-13996.8,88.2882,NULL,0,0,0,0,100,0),
(759610,76,-4659.05,-14002.6,88.7217,NULL,0,0,0,0,100,0),
(759610,77,-4658.57,-13996.8,88.2886,NULL,0,0,0,0,100,0),
(759610,78,-4658.11,-13991.3,87.3414,NULL,0,0,0,0,100,0),
(759610,79,-4655.17,-13986.7,86.1019,NULL,0,0,0,0,100,0),
(759610,80,-4652.72,-13982.8,85.1681,NULL,0,0,0,0,100,0),
(759610,81,-4648.96,-13981,84.2678,NULL,0,0,0,0,100,0),
(759610,82,-4645.31,-13979.2,83.5255,NULL,0,0,0,0,100,0),
(759610,83,-4641.26,-13977.2,82.925,NULL,0,0,0,0,100,0),
(759610,84,-4637.51,-13975.4,82.5139,NULL,0,0,0,0,100,0),
(759610,85,-4631.7,-13974.9,82.4958,NULL,0,0,0,0,100,0),
(759610,86,-4625.43,-13974.3,82.6961,NULL,0,0,0,0,100,0),
(759610,87,-4618.1,-13973.6,82.8776,NULL,0,0,0,0,100,0),
(759610,88,-4612.33,-13973.1,83.1243,NULL,0,0,0,0,100,0),
(759610,89,-4607.27,-13971.7,83.1961,NULL,0,0,0,0,100,0),
(759610,90,-4602.5,-13970.4,82.9605,NULL,0,0,0,0,100,0),
(759610,91,-4597.79,-13975.3,83.3084,NULL,0,0,0,0,100,0),
(759610,92,-4595.84,-13979,83.8286,NULL,0,0,0,0,100,0),
(759610,93,-4594.1,-13982.3,84.3964,NULL,0,0,0,0,100,0),
(759610,94,-4592.27,-13985.8,84.9837,NULL,0,0,0,0,100,0),
(759610,95,-4592.64,-13988.9,85.5124,NULL,0,0,0,0,100,0),
(759610,96,-4593.09,-13992.7,85.8744,NULL,0,0,0,0,100,0),
(759610,97,-4593.7,-13997.9,86.0483,NULL,0,0,0,0,100,0);
