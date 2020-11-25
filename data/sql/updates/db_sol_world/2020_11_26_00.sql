-- DB update 2020_11_25_02 -> 2020_11_26_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_11_25_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_11_25_02 2020_11_26_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1606348609466219171'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1606348609466219171');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 519 AND `source_type` = 0 AND `id` = 2;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 520 AND `source_type` = 0 AND `id` = 4;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(519,0,2,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slark - On Respawn - Set Active On'),

(520,0,4,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brack - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` IN (902060,902070);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
-- Slark
(902060,1,-10015.9,1922.52,2.3172,0,0,0,0,100,0),
(902060,2,-10027.1,1930.29,1.76108,0,0,0,0,100,0),
(902060,3,-10037.3,1937.33,1.93618,0,0,0,0,100,0),
(902060,4,-10047.2,1943.32,2.52464,0,0,0,0,100,0),
(902060,5,-10058.3,1950.03,3.93423,0,0,0,0,100,0),
(902060,6,-10071.1,1957.83,3.91127,0,0,0,0,100,0),
(902060,7,-10081.5,1964.11,4.31857,0,0,0,0,100,0),
(902060,8,-10094.8,1975.81,5.37254,0,0,0,0,100,0),
(902060,9,-10106.9,1986.41,5.55764,0,0,0,0,100,0),
(902060,10,-10119,1990.61,6.50675,0,0,0,0,100,0),
(902060,11,-10129.5,1994.24,7.8997,0,0,0,0,100,0),
(902060,12,-10141,1998.22,8.78254,0,0,0,0,100,0),
(902060,13,-10151.4,2001.84,10.0435,0,0,0,0,100,0),
(902060,14,-10160.6,2005.02,8.72842,0,0,0,0,100,0),
(902060,15,-10173.1,2009.38,7.95337,0,0,0,0,100,0),
(902060,16,-10184.6,2013.36,8.45871,0,0,0,0,100,0),
(902060,17,-10192.9,2017.65,7.34676,0,0,0,0,100,0),
(902060,18,-10203.1,2022.95,7.88886,0,0,0,0,100,0),
(902060,19,-10214.2,2028.67,7.79603,0,0,0,0,100,0),
(902060,20,-10224.4,2026.5,9.04813,0,0,0,0,100,0),
(902060,21,-10232.9,2024.68,9.78735,0,0,0,0,100,0),
(902060,22,-10241.4,2018.24,11.2056,0,0,0,0,100,0),
(902060,23,-10244.9,2010.93,11.7918,0,0,0,0,100,0),
(902060,24,-10241.1,2003.61,12.3472,0,0,0,0,100,0),
(902060,25,-10234.5,1998.45,12.6432,0,0,0,0,100,0),
(902060,26,-10224.2,1997.08,12.3224,0,0,0,0,100,0),
(902060,27,-10214.7,1997.98,11.5208,0,0,0,0,100,0),
(902060,28,-10205.3,1998.86,11.7894,0,0,0,0,100,0),
(902060,29,-10196.1,1996.34,10.7126,0,0,0,0,100,0),
(902060,30,-10188.8,1994.35,11.0919,0,0,0,0,100,0),
(902060,31,-10179.7,1991.86,10.2759,0,0,0,0,100,0),
(902060,32,-10169.9,1989.18,11.4592,0,0,0,0,100,0),
(902060,33,-10160.3,1986.57,11.7989,0,0,0,0,100,0),
(902060,34,-10150.4,1983.85,11.4493,0,0,0,0,100,0),
(902060,35,-10143.7,1978.6,11.8766,0,0,0,0,100,0),
(902060,36,-10135.6,1972.28,11.6684,0,0,0,0,100,0),
(902060,37,-10127.8,1966.17,10.5791,0,0,0,0,100,0),
(902060,38,-10121,1960.86,11.0765,0,0,0,0,100,0),
(902060,39,-10115.1,1956.27,11.3431,0,0,0,0,100,0),
(902060,40,-10108.5,1951.08,10.4991,0,0,0,0,100,0),
(902060,41,-10099.8,1944.33,9.28428,0,0,0,0,100,0),
(902060,42,-10089.8,1936.54,9.4502,0,0,0,0,100,0),
(902060,43,-10079.9,1932.17,8.4124,0,0,0,0,100,0),
(902060,44,-10071.6,1928.52,7.91448,0,0,0,0,100,0),
(902060,45,-10062.9,1924.71,7.76392,0,0,0,0,100,0),
(902060,46,-10052.1,1919.96,6.76378,0,0,0,0,100,0),
(902060,47,-10046.6,1910.76,8.46841,0,0,0,0,100,0),
(902060,48,-10040.7,1900.93,10.0861,0,0,0,0,100,0),
(902060,49,-10032.1,1898.72,10.527,0,0,0,0,100,0),
(902060,50,-10025.8,1897.1,10.9353,0,0,0,0,100,0),
(902060,51,-10016.9,1894.83,9.93655,0,0,0,0,100,0),
(902060,52,-10010.9,1893.27,10.3875,0,0,0,0,100,0),
(902060,53,-10004.9,1891.74,11.866,0,0,0,0,100,0),
(902060,54,-9997.67,1889.88,11.7597,0,0,0,0,100,0),
(902060,55,-9989.08,1887.67,10.8235,0,0,0,0,100,0),
(902060,56,-9981.28,1885.67,12.7361,0,0,0,0,100,0),
(902060,57,-9977.44,1883.25,13.6279,0,0,0,0,100,0),
(902060,58,-9970.13,1878.64,14.0633,0,0,0,0,100,0),
(902060,59,-9962.43,1873.79,14.5824,0,0,0,0,100,0),
(902060,60,-9959.92,1870.05,14.9428,0,0,0,0,100,0),
(902060,61,-9956.22,1864.53,14.2232,0,0,0,0,100,0),
(902060,62,-9951.99,1858.22,13.6757,0,0,0,0,100,0),
(902060,63,-9944.71,1847.37,11.933,0,0,0,0,100,0),
(902060,64,-9941.42,1840.15,11.2681,0,0,0,0,100,0),
(902060,65,-9937.89,1832.41,10.8163,0,0,0,0,100,0),
(902060,66,-9933.54,1822.85,12.0412,0,0,0,0,100,0),
(902060,67,-9931.92,1819.29,11.4749,0,0,0,0,100,0),
(902060,68,-9932.1,1812.29,10.5233,0,0,0,0,100,0),
(902060,69,-9932.28,1804.94,10.1422,0,0,0,0,100,0),
(902060,70,-9932.45,1798.42,11.4234,0,0,0,0,100,0),
(902060,71,-9932.59,1792.83,12.5439,0,0,0,0,100,0),
(902060,72,-9930.45,1784.06,12.9074,0,0,0,0,100,0),
(902060,73,-9928.52,1776.14,13.2403,0,0,0,0,100,0),
(902060,74,-9922.88,1769.45,12.1179,0,0,0,0,100,0),
(902060,75,-9915.74,1760.98,12.1109,0,0,0,0,100,0),
(902060,76,-9906.13,1757.76,10.6025,0,0,0,0,100,0),
(902060,77,-9896.69,1757.46,10.8756,0,0,0,0,100,0),
(902060,78,-9887.49,1757.17,11.8362,0,0,0,0,100,0),
(902060,79,-9879.16,1756.91,11.9911,0,0,0,0,100,0),
(902060,80,-9873.27,1753.84,13.1314,0,0,0,0,100,0),
(902060,81,-9867.59,1750.88,12.5508,0,0,0,0,100,0),
(902060,82,-9861.44,1745.85,12.38,0,0,0,0,100,0),
(902060,83,-9854.46,1740.16,10.9672,0,0,0,0,100,0),
(902060,84,-9848.14,1735,10.0634,0,0,0,0,100,0),
(902060,85,-9842.81,1730.64,9.86734,0,0,0,0,100,0),
(902060,86,-9836.3,1725.33,9.37078,0,0,0,0,100,0),
(902060,87,-9828.77,1719.18,10.8268,0,0,0,0,100,0),
(902060,88,-9823.16,1714.6,10.7951,0,0,0,0,100,0),
(902060,89,-9815.92,1708.69,11.9986,0,0,0,0,100,0),
(902060,90,-9807.83,1702.07,12.5485,0,0,0,0,100,0),
(902060,91,-9805.4,1698.22,12.8647,0,0,0,0,100,0),
(902060,92,-9802.04,1692.89,11.6205,0,0,0,0,100,0),
(902060,93,-9798.68,1687.56,11.4266,0,0,0,0,100,0),
(902060,94,-9794.08,1680.26,9.98042,0,0,0,0,100,0),
(902060,95,-9790.33,1674.31,9.43389,0,0,0,0,100,0),
(902060,96,-9783.41,1667.22,9.32267,0,0,0,0,100,0),
(902060,97,-9776.6,1660.24,10.4572,0,0,0,0,100,0),
(902060,98,-9770.89,1657.08,10.3701,0,0,0,0,100,0),
(902060,99,-9763.03,1652.72,9.49078,0,0,0,0,100,0),
(902060,100,-9755.99,1648.82,9.87435,0,0,0,0,100,0),
(902060,101,-9749.36,1645.15,9.89809,0,0,0,0,100,0),
(902060,102,-9745.18,1642.84,9.75997,0,0,0,0,100,0),
(902060,103,-9736.2,1637.86,11.0677,0,0,0,0,100,0),
(902060,104,-9726.81,1632.67,11.9837,0,0,0,0,100,0),
(902060,105,-9715.56,1626.44,12.8356,0,0,0,0,100,0),
(902060,106,-9708.93,1620.55,13.2374,0,0,0,0,100,0),
(902060,107,-9701.85,1614.28,12.9322,0,0,0,0,100,0),
(902060,108,-9694.28,1607.56,12.8159,0,0,0,0,100,0),
(902060,109,-9693.92,1599.99,14.054,0,0,0,0,100,0),
(902060,110,-9693.61,1593.23,14.4477,0,0,0,0,100,0),
(902060,111,-9693.29,1586.47,13.5221,0,0,0,0,100,0),
(902060,112,-9692.96,1579.53,12.922,0,0,0,0,100,0),
(902060,113,-9688.62,1571.01,12.4978,0,0,0,0,100,0),
(902060,114,-9684.06,1562.07,12.133,0,0,0,0,100,0),
(902060,115,-9680.45,1554.98,13.0069,0,0,0,0,100,0),
(902060,116,-9678.26,1551.38,12.683,0,0,0,0,100,0),
(902060,117,-9674.25,1544.8,11.3086,0,0,0,0,100,0),
(902060,118,-9670.37,1538.42,11.3896,0,0,0,0,100,0),
(902060,119,-9665.94,1531.14,10.4888,0,0,0,0,100,0),
(902060,120,-9661.03,1523.07,10.0491,0,0,0,0,100,0),
(902060,121,-9656.18,1515.11,9.40965,0,0,0,0,100,0),
(902060,122,-9651.07,1506.72,10.4502,0,0,0,0,100,0),
(902060,123,-9647.86,1501.44,10.4309,0,0,0,0,100,0),
(902060,124,-9643.98,1495.06,11.1772,0,0,0,0,100,0),
(902060,125,-9637.42,1484.3,11.6012,0,0,0,0,100,0),
(902060,126,-9630.57,1473.04,12.7404,0,0,0,0,100,0),
(902060,127,-9630.1,1467.91,13.4133,0,0,0,0,100,0),
(902060,128,-9629.37,1459.9,12.9214,0,0,0,0,100,0),
(902060,129,-9628.52,1450.6,11.7016,0,0,0,0,100,0),
(902060,130,-9627.51,1439.52,11.7985,0,0,0,0,100,0),
(902060,131,-9630.87,1433.8,11.7962,0,0,0,0,100,0),
(902060,132,-9634.59,1427.46,12.3231,0,0,0,0,100,0),
(902060,133,-9639.02,1419.92,14.9205,0,0,0,0,100,0),
(902060,134,-9640.97,1416.61,15.2061,0,0,0,0,100,0),
(902060,135,-9643.9,1411.61,13.7704,0,0,0,0,100,0),
(902060,136,-9646.38,1407.38,13.0974,0,0,0,0,100,0),
(902060,137,-9649.22,1402.55,14.0038,0,0,0,0,100,0),
(902060,138,-9653.21,1395.76,13.2734,0,0,0,0,100,0),
(902060,139,-9657.74,1388.04,14.5401,0,0,0,0,100,0),
(902060,140,-9659.65,1379.63,13.5386,0,0,0,0,100,0),
(902060,141,-9661.68,1370.65,13.5116,0,0,0,0,100,0),
(902060,142,-9663.93,1360.73,14.4927,0,0,0,0,100,0),
(902060,143,-9663.78,1352.91,13.9975,0,0,0,0,100,0),
(902060,144,-9663.59,1342.65,13.2716,0,0,0,0,100,0),
(902060,145,-9663.37,1331.06,13.4502,0,0,0,0,100,0),
(902060,146,-9664.04,1326.56,13.0789,0,0,0,0,100,0),
(902060,147,-9664.69,1322.16,11.7954,0,0,0,0,100,0),
(902060,148,-9665.5,1316.75,11.2203,0,0,0,0,100,0),
(902060,149,-9666.61,1309.25,9.73586,0,0,0,0,100,0),
(902060,150,-9668.04,1299.67,8.78334,0,0,0,0,100,0),
(902060,151,-9669.49,1289.91,9.11323,0,0,0,0,100,0),
(902060,152,-9668.71,1281.43,8.45195,0,0,0,0,100,0),
(902060,153,-9667.7,1270.38,7.50619,0,0,0,0,100,0),
(902060,154,-9666.64,1258.77,8.11315,0,0,0,0,100,0),
(902060,155,-9665.71,1248.64,9.20372,0,0,0,0,100,0),
(902060,156,-9665.09,1241.91,9.44626,0,0,0,0,100,0),
(902060,157,-9664.26,1232.73,9.11176,0,0,0,0,100,0),
(902060,158,-9663.39,1223.21,9.25695,0,0,0,0,100,0),
(902060,159,-9662.48,1213.33,9.91464,0,0,0,0,100,0),
(902060,160,-9661.6,1203.68,10.0812,0,0,0,0,100,0),
(902060,161,-9660.81,1194.97,9.9374,0,0,0,0,100,0),
(902060,162,-9659.83,1184.27,9.06568,0,0,0,0,100,0),
(902060,163,-9657.88,1177.55,7.83097,0,0,0,0,100,0),
(902060,164,-9655.04,1167.8,6.00081,0,0,0,0,100,0),
(902060,165,-9652.22,1158.08,5.03211,0,0,0,0,100,0),
(902060,166,-9659.02,1152.94,5.36728,0,0,0,0,100,0),
(902060,167,-9667.3,1146.68,6.09361,0,0,0,0,100,0),
(902060,168,-9676,1140.11,7.10979,0,0,0,0,100,0),
(902060,169,-9674.54,1132.44,6.63127,0,0,0,0,100,0),
(902060,170,-9672.79,1123.27,7.63758,0,0,0,0,100,0),
(902060,171,-9671.38,1115.9,8.78279,0,0,0,0,100,0),
(902060,172,-9671.16,1107.97,9.3609,0,0,0,0,100,0),
(902060,173,-9670.93,1099.81,10.5705,0,0,0,0,100,0),
(902060,174,-9670.72,1092.49,11.5488,0,0,0,0,100,0),
(902060,175,-9669.89,1084.24,11.394,0,0,0,0,100,0),
(902060,176,-9669.22,1077.63,11.4564,0,0,0,0,100,0),
(902060,177,-9668.37,1069.16,12.7181,0,0,0,0,100,0),
(902060,178,-9667.56,1061.17,14.6201,0,0,0,0,100,0),
(902060,179,-9664.04,1055.39,14.902,0,0,0,0,100,0),
(902060,180,-9658.04,1045.52,14.2024,0,0,0,0,100,0),
(902060,181,-9651.17,1034.24,12.5872,0,0,0,0,100,0),
(902060,182,-9642.12,1031.52,10.2317,0,0,0,0,100,0),
(902060,183,-9634.12,1029.11,8.85091,0,0,0,0,100,0),
(902060,184,-9626.09,1031.15,6.93729,0,0,0,0,100,0),
(902060,185,-9614.68,1034.04,6.96313,0,0,0,0,100,0),
(902060,186,-9608.26,1039.99,7.28413,0,0,0,0,100,0),
(902060,187,-9601.54,1046.22,6.80724,0,0,0,0,100,0),
(902060,188,-9601.52,1052.77,5.89212,0,0,0,0,100,0),
(902060,189,-9608.64,1061.72,4.442,0,0,0,0,100,0),
(902060,190,-9616.73,1071.87,3.31118,0,0,0,0,100,0),
(902060,191,-9621.08,1081.04,2.46184,0,0,0,0,100,0),
(902060,192,-9625.74,1090.85,2.18971,0,0,0,0,100,0),
(902060,193,-9629.69,1099.17,2.58015,0,0,0,0,100,0),
(902060,194,-9633.2,1106.58,3.51185,0,0,0,0,100,0),
(902060,195,-9631.98,1115.36,3.65874,0,0,0,0,100,0),
(902060,196,-9630.29,1127.49,3.61056,0,0,0,0,100,0),
(902060,197,-9628.07,1143.47,3.84549,0,0,0,0,100,0),
(902060,198,-9628.47,1148.82,4.62394,0,0,0,0,100,0),
(902060,199,-9628.9,1154.41,5.63554,0,0,0,0,100,0),
(902060,200,-9629.19,1158.32,5.40981,0,0,0,0,100,0),
(902060,201,-9630.76,1164.78,4.64254,0,0,0,0,100,0),
(902060,202,-9633.16,1174.64,5.29918,0,0,0,0,100,0),
(902060,203,-9635.84,1185.63,6.11096,0,0,0,0,100,0),
(902060,204,-9638.94,1198.37,7.76093,0,0,0,0,100,0),
(902060,205,-9638.97,1205.84,7.98753,0,0,0,0,100,0),
(902060,206,-9639,1215.29,8.29425,0,0,0,0,100,0),
(902060,207,-9639.03,1224.03,8.26665,0,0,0,0,100,0),
(902060,208,-9639.07,1230.45,6.65688,0,0,0,0,100,0),
(902060,209,-9639.13,1239.67,5.6042,0,0,0,0,100,0),
(902060,210,-9639.2,1250.87,3.90404,0,0,0,0,100,0),
(902060,211,-9639.27,1261.49,3.23871,0,0,0,0,100,0),
(902060,212,-9639.34,1273.04,3.49883,0,0,0,0,100,0),
(902060,213,-9639.42,1285.74,4.58874,0,0,0,0,100,0),
(902060,214,-9635.79,1299.14,3.90747,0,0,0,0,100,0),
(902060,215,-9631.91,1313.44,3.9649,0,0,0,0,100,0),
(902060,216,-9628.19,1327.18,3.69328,0,0,0,0,100,0),
(902060,217,-9623.71,1343.73,3.4554,0,0,0,0,100,0),
(902060,218,-9619.52,1359.16,3.57127,0,0,0,0,100,0),
(902060,219,-9615.16,1375.26,4.00073,0,0,0,0,100,0),
(902060,220,-9611.25,1389.68,4.52659,0,0,0,0,100,0),
(902060,221,-9607.1,1405,4.39903,0,0,0,0,100,0),
(902060,222,-9603.41,1418.62,3.90635,0,0,0,0,100,0),
(902060,223,-9599.63,1432.58,4.92532,0,0,0,0,100,0),
(902060,224,-9603.04,1439.72,4.92567,0,0,0,0,100,0),
(902060,225,-9606.72,1447.4,6.05606,0,0,0,0,100,0),
(902060,226,-9610.59,1455.5,8.81739,0,0,0,0,100,0),
(902060,227,-9613.86,1462.34,10.4725,0,0,0,0,100,0),
(902060,228,-9618.03,1471.07,10.22,0,0,0,0,100,0),
(902060,229,-9622.87,1481.18,11.0444,0,0,0,0,100,0),
(902060,230,-9626.39,1488.55,10.1866,0,0,0,0,100,0),
(902060,231,-9629.66,1495.39,8.57696,0,0,0,0,100,0),
(902060,232,-9633.94,1504.34,8.95968,0,0,0,0,100,0),
(902060,233,-9637.46,1511.71,7.46377,0,0,0,0,100,0),
(902060,234,-9640.63,1518.33,6.28916,0,0,0,0,100,0),
(902060,235,-9644.66,1526.76,6.70095,0,0,0,0,100,0),
(902060,236,-9648.29,1534.36,7.25042,0,0,0,0,100,0),
(902060,237,-9652.91,1542.06,6.66144,0,0,0,0,100,0),
(902060,238,-9657.89,1550.37,7.18384,0,0,0,0,100,0),
(902060,239,-9663.5,1559.73,8.34915,0,0,0,0,100,0),
(902060,240,-9663.5,1567.9,7.88126,0,0,0,0,100,0),
(902060,241,-9663.5,1578.98,8.16746,0,0,0,0,100,0),
(902060,242,-9663.51,1590.76,9.04026,0,0,0,0,100,0),
(902060,243,-9663.51,1602.74,10.0072,0,0,0,0,100,0),
(902060,244,-9668.83,1607.11,10.8177,0,0,0,0,100,0),
(902060,245,-9675.23,1612.37,12.279,0,0,0,0,100,0),
(902060,246,-9680.03,1616.32,11.9389,0,0,0,0,100,0),
(902060,247,-9686.34,1621.51,9.91698,0,0,0,0,100,0),
(902060,248,-9692.56,1626.62,9.94036,0,0,0,0,100,0),
(902060,249,-9700.77,1633.36,10.0596,0,0,0,0,100,0),
(902060,250,-9710.32,1641.21,9.53294,0,0,0,0,100,0),
(902060,251,-9720.36,1649.46,8.73509,0,0,0,0,100,0),
(902060,252,-9727.03,1654.94,7.47392,0,0,0,0,100,0),
(902060,253,-9734.97,1661.47,5.61226,0,0,0,0,100,0),
(902060,254,-9742.9,1667.98,5.36769,0,0,0,0,100,0),
(902060,255,-9749.78,1673.64,6.01076,0,0,0,0,100,0),
(902060,256,-9757.17,1679.71,4.91732,0,0,0,0,100,0),
(902060,257,-9765.19,1686.3,4.77876,0,0,0,0,100,0),
(902060,258,-9773.75,1693.34,5.1877,0,0,0,0,100,0),
(902060,259,-9780.51,1698.9,7.39366,0,0,0,0,100,0),
(902060,260,-9786.22,1703.59,9.44111,0,0,0,0,100,0),
(902060,261,-9792.72,1709.77,9.56939,0,0,0,0,100,0),
(902060,262,-9799.99,1716.69,9.62742,0,0,0,0,100,0),
(902060,263,-9806.17,1722.56,8.16917,0,0,0,0,100,0),
(902060,264,-9812.51,1728.59,6.41826,0,0,0,0,100,0),
(902060,265,-9820.28,1735.98,5.36677,0,0,0,0,100,0),
(902060,266,-9825.35,1740.8,5.26267,0,0,0,0,100,0),
(902060,267,-9831.27,1746.43,5.85568,0,0,0,0,100,0),
(902060,268,-9836.42,1751.33,5.5192,0,0,0,0,100,0),
(902060,269,-9844.03,1758.56,6.39182,0,0,0,0,100,0),
(902060,270,-9852.25,1766.38,7.30137,0,0,0,0,100,0),
(902060,271,-9858.35,1773.13,7.06633,0,0,0,0,100,0),
(902060,272,-9865.63,1781.18,6.45349,0,0,0,0,100,0),
(902060,273,-9873.3,1789.66,4.69029,0,0,0,0,100,0),
(902060,274,-9880.74,1797.88,3.84036,0,0,0,0,100,0),
(902060,275,-9887.82,1805.71,3.3239,0,0,0,0,100,0),
(902060,276,-9893.05,1814.81,2.15561,0,0,0,0,100,0),
(902060,277,-9899.21,1825.53,1.79766,0,0,0,0,100,0),
(902060,278,-9904.67,1835.03,2.93333,0,0,0,0,100,0),
(902060,279,-9908.91,1842.41,4.63638,0,0,0,0,100,0),
(902060,280,-9912.31,1848.32,6.31649,0,0,0,0,100,0),
(902060,281,-9915.33,1853.58,6.84496,0,0,0,0,100,0),
(902060,282,-9919.99,1861.68,5.94626,0,0,0,0,100,0),
(902060,283,-9923.59,1867.95,6.29629,0,0,0,0,100,0),
(902060,284,-9927.68,1875.07,7.31192,0,0,0,0,100,0),
(902060,285,-9932.89,1878.4,7.10356,0,0,0,0,100,0),
(902060,286,-9940.27,1883.11,6.57877,0,0,0,0,100,0),
(902060,287,-9947.54,1887.76,7.21297,0,0,0,0,100,0),
(902060,288,-9954.64,1892.29,8.27415,0,0,0,0,100,0),
(902060,289,-9961.34,1895.6,7.52765,0,0,0,0,100,0),
(902060,290,-9968.98,1899.37,6.80606,0,0,0,0,100,0),
(902060,291,-9978.39,1904.01,7.04227,0,0,0,0,100,0),
(902060,292,-9985.93,1907.73,6.33662,0,0,0,0,100,0),
(902060,293,-9993.57,1911.5,4.69287,0,0,0,0,100,0),
(902060,294,-10004.7,1916.97,3.84105,0,0,0,0,100,0),
-- Brack
(902070,1,-10444.2,2069.12,8.20056,0,0,0,0,100,0),
(902070,2,-10453.6,2070.52,8.234,0,0,0,0,100,0),
(902070,3,-10462.6,2072.09,8.38928,0,0,0,0,100,0),
(902070,4,-10469.9,2073.38,9.10604,0,0,0,0,100,0),
(902070,5,-10477.8,2074.76,10.3362,0,0,0,0,100,0),
(902070,6,-10492.2,2076.77,10.1731,0,0,0,0,100,0),
(902070,7,-10507,2072.5,12.182,0,0,0,0,100,0),
(902070,8,-10515.8,2074.29,12.3981,0,0,0,0,100,0),
(902070,9,-10529.7,2077.06,9.97815,0,0,0,0,100,0),
(902070,10,-10541.6,2077.64,10.2633,0,0,0,0,100,0),
(902070,11,-10551.1,2075.49,8.99028,0,0,0,0,100,0),
(902070,12,-10556.7,2073.45,10.062,0,0,0,0,100,0),
(902070,13,-10561.6,2071.65,11.1978,0,0,0,0,100,0),
(902070,14,-10566.3,2070.27,10.8812,0,0,0,0,100,0),
(902070,15,-10571.6,2068.71,9.77647,0,0,0,0,100,0),
(902070,16,-10577.2,2066.4,10.6014,0,0,0,0,100,0),
(902070,17,-10583,2064.02,12.0053,0,0,0,0,100,0),
(902070,18,-10590.1,2062.01,12.4351,0,0,0,0,100,0),
(902070,19,-10597.6,2059.88,13.4323,0,0,0,0,100,0),
(902070,20,-10604.8,2057.84,14.3665,0,0,0,0,100,0),
(902070,21,-10614.9,2057.29,12.7727,0,0,0,0,100,0),
(902070,22,-10625.6,2058.99,12.4567,0,0,0,0,100,0),
(902070,23,-10631.2,2059.91,11.0188,0,0,0,0,100,0),
(902070,24,-10637.3,2060.89,8.72323,0,0,0,0,100,0),
(902070,25,-10645,2061.09,7.51885,0,0,0,0,100,0),
(902070,26,-10657.4,2061.41,6.60271,0,0,0,0,100,0),
(902070,27,-10671.7,2061.78,6.41631,0,0,0,0,100,0),
(902070,28,-10679.8,2062.21,7.82198,0,0,0,0,100,0),
(902070,29,-10685.5,2063.3,7.85132,0,0,0,0,100,0),
(902070,30,-10692.1,2064.55,6.98597,0,0,0,0,100,0),
(902070,31,-10702,2067.78,7.82694,0,0,0,0,100,0),
(902070,32,-10711.4,2070.08,7.75683,0,0,0,0,100,0),
(902070,33,-10724.8,2071.42,9.42271,0,0,0,0,100,0),
(902070,34,-10733.3,2072.48,9.11816,0,0,0,0,100,0),
(902070,35,-10738.7,2073.17,8.0958,0,0,0,0,100,0),
(902070,36,-10744.4,2073.88,7.45495,0,0,0,0,100,0),
(902070,37,-10751.8,2074.44,7.10435,0,0,0,0,100,0),
(902070,38,-10757.6,2074.98,7.52875,0,0,0,0,100,0),
(902070,39,-10764.5,2075.62,8.50698,0,0,0,0,100,0),
(902070,40,-10766,2080.17,7.17995,0,0,0,0,100,0),
(902070,41,-10767.6,2085.16,5.13387,0,0,0,0,100,0),
(902070,42,-10769.6,2092,3.71396,0,0,0,0,100,0),
(902070,43,-10771.7,2099.51,2.43216,0,0,0,0,100,0),
(902070,44,-10765.3,2097.21,2.9682,0,0,0,0,100,0),
(902070,45,-10758.7,2094.82,3.79868,0,0,0,0,100,0),
(902070,46,-10748.5,2093.05,4.71853,0,0,0,0,100,0),
(902070,47,-10741.1,2092.95,5.62591,0,0,0,0,100,0),
(902070,48,-10732.8,2092.84,7.2406,0,0,0,0,100,0),
(902070,49,-10724.9,2093.21,7.09038,0,0,0,0,100,0),
(902070,50,-10715.4,2093.65,6.79453,0,0,0,0,100,0),
(902070,51,-10703.7,2094.2,6.0759,0,0,0,0,100,0),
(902070,52,-10696.3,2088.46,5.75376,0,0,0,0,100,0),
(902070,53,-10689,2082.76,5.60829,0,0,0,0,100,0),
(902070,54,-10681.7,2077.3,5.50241,0,0,0,0,100,0),
(902070,55,-10672.9,2070.69,5.81566,0,0,0,0,100,0),
(902070,56,-10665.7,2068.65,6.15876,0,0,0,0,100,0),
(902070,57,-10654.9,2070.02,6.22521,0,0,0,0,100,0),
(902070,58,-10648.1,2071.78,7.58142,0,0,0,0,100,0),
(902070,59,-10642,2073.38,8.45299,0,0,0,0,100,0),
(902070,60,-10633.3,2073.55,8.18629,0,0,0,0,100,0),
(902070,61,-10625.9,2073.69,8.46953,0,0,0,0,100,0),
(902070,62,-10619.7,2076.16,8.659,0,0,0,0,100,0),
(902070,63,-10611.4,2079.61,9.73426,0,0,0,0,100,0),
(902070,64,-10603.4,2078.04,8.77988,0,0,0,0,100,0),
(902070,65,-10593.2,2075.42,10.9888,0,0,0,0,100,0),
(902070,66,-10586,2073.52,11.426,0,0,0,0,100,0),
(902070,67,-10578.3,2072.43,9.678,0,0,0,0,100,0),
(902070,68,-10572.3,2071.96,9.13429,0,0,0,0,100,0),
(902070,69,-10563.8,2072.44,11.0205,0,0,0,0,100,0),
(902070,70,-10559.4,2072.75,10.7339,0,0,0,0,100,0),
(902070,71,-10554.9,2073.07,9.7248,0,0,0,0,100,0),
(902070,72,-10549.8,2074.42,9.19739,0,0,0,0,100,0),
(902070,73,-10545.1,2076.44,9.97804,0,0,0,0,100,0),
(902070,74,-10540.9,2078.23,10.2263,0,0,0,0,100,0),
(902070,75,-10535.8,2078.39,9.92861,0,0,0,0,100,0),
(902070,76,-10531.2,2078.54,9.61921,0,0,0,0,100,0),
(902070,77,-10522.8,2078.57,10.4439,0,0,0,0,100,0),
(902070,78,-10515.2,2078.6,11.9547,0,0,0,0,100,0),
(902070,79,-10512.2,2078.11,11.9153,0,0,0,0,100,0),
(902070,80,-10507.5,2077.35,10.806,0,0,0,0,100,0),
(902070,81,-10501.2,2073.63,11.624,0,0,0,0,100,0),
(902070,82,-10494.6,2069.78,12.0978,0,0,0,0,100,0),
(902070,83,-10483.9,2066.57,12.436,0,0,0,0,100,0),
(902070,84,-10477.1,2064.98,11.8729,0,0,0,0,100,0),
(902070,85,-10469.4,2063.19,11.0286,0,0,0,0,100,0),
(902070,86,-10455.5,2060.33,10.6734,0,0,0,0,100,0),
(902070,87,-10447.3,2059.33,9.61913,0,0,0,0,100,0),
(902070,88,-10435.7,2058.98,9.8335,0,0,0,0,100,0),
(902070,89,-10422,2060.04,8.10524,0,0,0,0,100,0),
(902070,90,-10414.6,2060.63,8.01151,0,0,0,0,100,0),
(902070,91,-10407.9,2061.15,8.73816,0,0,0,0,100,0),
(902070,92,-10398.2,2060.59,7.7724,0,0,0,0,100,0),
(902070,93,-10391.1,2059.39,8.1997,0,0,0,0,100,0),
(902070,94,-10385.9,2058.52,8.90667,0,0,0,0,100,0),
(902070,95,-10380.6,2057.63,9.68221,0,0,0,0,100,0),
(902070,96,-10375.7,2056.22,9.35587,0,0,0,0,100,0),
(902070,97,-10369.6,2054.48,7.8039,0,0,0,0,100,0),
(902070,98,-10364.1,2052.89,6.87734,0,0,0,0,100,0),
(902070,99,-10358.6,2050.06,6.60227,0,0,0,0,100,0),
(902070,100,-10350.7,2046.01,6.61939,0,0,0,0,100,0),
(902070,101,-10343.1,2046.38,6.34021,0,0,0,0,100,0),
(902070,102,-10336.4,2046.71,6.34931,0,0,0,0,100,0),
(902070,103,-10330.2,2043.78,7.1894,0,0,0,0,100,0),
(902070,104,-10323.1,2040.46,8.204,0,0,0,0,100,0),
(902070,105,-10315.1,2036.69,9.49819,0,0,0,0,100,0),
(902070,106,-10306.1,2033.21,11.2992,0,0,0,0,100,0),
(902070,107,-10302.7,2031.65,11.4674,0,0,0,0,100,0),
(902070,108,-10296.9,2028.99,10.5666,0,0,0,0,100,0),
(902070,109,-10289.8,2028.93,11.1424,0,0,0,0,100,0),
(902070,110,-10281.7,2028.87,11.4885,0,0,0,0,100,0),
(902070,111,-10271.2,2028.08,11.3608,0,0,0,0,100,0),
(902070,112,-10259.8,2027.22,10.5916,0,0,0,0,100,0),
(902070,113,-10260.5,2033.72,9.45782,0,0,0,0,100,0),
(902070,114,-10261.1,2040.19,9.2408,0,0,0,0,100,0),
(902070,115,-10262.7,2044.07,8.34435,0,0,0,0,100,0),
(902070,116,-10265,2049.34,6.55717,0,0,0,0,100,0),
(902070,117,-10266.9,2053.98,5.3752,0,0,0,0,100,0),
(902070,119,-10277.9,2059.38,5.10982,0,0,0,0,100,0),
(902070,120,-10287.7,2061.19,4.56597,0,0,0,0,100,0),
(902070,121,-10299.1,2063.31,3.49527,0,0,0,0,100,0),
(902070,122,-10312.8,2065.84,2.24795,0,0,0,0,100,0),
(902070,123,-10321.9,2065.45,2.61183,0,0,0,0,100,0),
(902070,124,-10332.9,2064.97,2.94756,0,0,0,0,100,0),
(902070,125,-10339.9,2062.76,3.65504,0,0,0,0,100,0),
(902070,126,-10346.8,2060.59,4.82195,0,0,0,0,100,0),
(902070,127,-10353.5,2058.49,6.10978,0,0,0,0,100,0),
(902070,128,-10365.3,2059.92,6.14434,0,0,0,0,100,0),
(902070,129,-10372.7,2060.71,8.00088,0,0,0,0,100,0),
(902070,130,-10379.8,2061.47,9.09825,0,0,0,0,100,0),
(902070,131,-10390.2,2062.35,7.55365,0,0,0,0,100,0),
(902070,132,-10399,2063.16,7.26749,0,0,0,0,100,0),
(902070,133,-10409.2,2064.1,8.50318,0,0,0,0,100,0),
(902070,134,-10416.2,2064.24,7.65728,0,0,0,0,100,0),
(902070,135,-10426.3,2066.09,7.2964,0,0,0,0,100,0),
(902070,136,-10436.4,2067.94,8.194,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
