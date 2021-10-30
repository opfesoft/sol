-- DB update 2021_10_11_01 -> 2021_10_12_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_11_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_11_01 2021_10_12_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1634022641550931483'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1634022641550931483');

UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 51831;

DELETE FROM `creature` WHERE `guid` IN (152280,152281);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(152280,8201,1,0,0,1,1,0,1,-8990.43,-3435.19,24.91,0,9900,0,1,0,2,0,0,0,0),
(152281,8201,1,0,0,1,1,0,1,-9307.09,-2989.11,9.249,0,9900,0,1,0,2,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` IN (51831,152280,152281);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(51831,518310,0,0,1,0,0,NULL),
(152280,1522800,0,0,1,0,0,NULL),
(152281,1522810,0,0,1,0,0,NULL);

DELETE FROM `pool_template` WHERE `entry` = 366;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(366,1,'Omgorn the Lost Spawns (1 out of 3)');

DELETE FROM `pool_creature` WHERE `pool_entry` = 366;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(51831,366,0,'Omgorn the Lost - Dunemaul Compound Spawn'),
(152280,366,0,'Omgorn the Lost - Eastmoon Ruins Spawn'),
(152281,366,0,'Omgorn the Lost - Southmoon Ruins Spawn');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 8201 AND `id` = 3;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8201,0,3,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Omgorn the Lost - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` IN (518310,1522800,1522810);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(518310,1,-8431.95,-2890.55,8.62454,0,0,0,0,100,0),
(518310,2,-8440.84,-2896.33,8.75512,0,0,0,0,100,0),
(518310,3,-8447.82,-2900.86,9.52858,0,0,0,0,100,0),
(518310,4,-8455.92,-2906.13,9.73996,0,0,0,0,100,0),
(518310,5,-8466.03,-2912.71,8.6638,0,0,0,0,100,0),
(518310,6,-8477.27,-2920.01,9.08084,0,0,0,0,100,0),
(518310,7,-8487.06,-2926.37,8.65781,0,0,0,0,100,0),
(518310,8,-8495.7,-2931.99,8.71,0,0,0,0,100,0),
(518310,9,-8497.55,-2942.28,8.74118,0,0,0,0,100,0),
(518310,10,-8499.99,-2955.88,8.9515,0,0,0,0,100,0),
(518310,11,-8502.15,-2967.93,10.5,0,0,0,0,100,0),
(518310,12,-8499.27,-2974.72,11.0608,0,0,0,0,100,0),
(518310,13,-8494.91,-2984.96,11.2114,0,0,0,0,100,0),
(518310,14,-8489.98,-2996.57,11.2443,0,0,0,0,100,0),
(518310,15,-8485.21,-3007.8,11.2069,0,0,0,0,100,0),
(518310,16,-8481.48,-3016.57,10.8001,0,0,0,0,100,0),
(518310,17,-8476.6,-3028.05,9.26487,0,0,0,0,100,0),
(518310,18,-8472.66,-3037.34,9.36893,0,0,0,0,100,0),
(518310,19,-8468.36,-3047.46,9.83966,0,0,0,0,100,0),
(518310,20,-8462.07,-3062.26,9.79,0,0,0,0,100,0),
(518310,21,-8455.86,-3070.85,9.82889,0,0,0,0,100,0),
(518310,22,-8448.72,-3080.75,9.92653,0,0,0,0,100,0),
(518310,23,-8441.18,-3091.19,9.73719,0,0,0,0,100,0),
(518310,24,-8434.5,-3100.44,9.64771,0,0,0,0,100,0),
(518310,25,-8427.58,-3110.01,9.41084,0,0,0,0,100,0),
(518310,26,-8420.51,-3119.8,8.82065,0,0,0,0,100,0),
(518310,27,-8415.09,-3127.3,8.67527,0,0,0,0,100,0),
(518310,28,-8409.99,-3134.37,8.62507,0,0,0,0,100,0),
(518310,29,-8403.08,-3143.95,8.62507,0,0,0,0,100,0),
(518310,30,-8395.85,-3153.96,8.62507,0,0,0,0,100,0),
(518310,31,-8389.71,-3162.45,8.6645,0,0,0,0,100,0),
(518310,32,-8383.04,-3171.69,8.92084,0,0,0,0,100,0),
(518310,33,-8376.76,-3180.39,9.18633,0,0,0,0,100,0),
(518310,34,-8371.06,-3188.28,9.99,0,0,0,0,100,0),
(518310,35,-8362.17,-3187.02,11.7883,0,0,0,0,100,0),
(518310,36,-8354.59,-3185.95,13.2278,0,0,0,0,100,0),
(518310,37,-8345.02,-3184.6,14.6197,0,0,0,0,100,0),
(518310,38,-8334.26,-3183.07,15.7918,0,0,0,0,100,0),
(518310,39,-8321.78,-3181.31,16.9034,0,0,0,0,100,0),
(518310,40,-8310.75,-3179.75,17.8354,0,0,0,0,100,0),
(518310,41,-8298.91,-3178.07,18.4774,0,0,0,0,100,0),
(518310,42,-8287.78,-3176.5,18.68,0,0,0,0,100,0),
(518310,43,-8282.07,-3168.88,17.1035,0,0,0,0,100,0),
(518310,44,-8275.15,-3159.65,14.7168,0,0,0,0,100,0),
(518310,45,-8268.15,-3150.31,12.2951,0,0,0,0,100,0),
(518310,46,-8261.31,-3141.18,10.6081,0,0,0,0,100,0),
(518310,47,-8254.3,-3131.84,9.74959,0,0,0,0,100,0),
(518310,48,-8247.7,-3123.04,9.78372,0,0,0,0,100,0),
(518310,49,-8241.91,-3115.32,11.0958,0,0,0,0,100,0),
(518310,50,-8236.52,-3108.13,12.5861,0,0,0,0,100,0),
(518310,51,-8231.29,-3101.14,13.6046,0,0,0,0,100,0),
(518310,52,-8226.3,-3094.49,13.8497,0,0,0,0,100,0),
(518310,53,-8220.51,-3086.76,13.2909,0,0,0,0,100,0),
(518310,54,-8212.69,-3076.34,12.3252,0,0,0,0,100,0),
(518310,55,-8204.33,-3065.18,12.1593,0,0,0,0,100,0),
(518310,56,-8195.47,-3053.36,12.7957,0,0,0,0,100,0),
(518310,57,-8189.05,-3044.8,14.31,0,0,0,0,100,0),
(518310,58,-8191.22,-3034.97,14.518,0,0,0,0,100,0),
(518310,59,-8194.13,-3021.73,14.4925,0,0,0,0,100,0),
(518310,60,-8197.19,-3007.85,14.53,0,0,0,0,100,0),
(518310,61,-8200.25,-2993.97,14.3366,0,0,0,0,100,0),
(518310,62,-8203.34,-2979.95,13.6306,0,0,0,0,100,0),
(518310,63,-8206.14,-2967.25,13.7538,0,0,0,0,100,0),
(518310,64,-8208.24,-2957.69,15.6146,0,0,0,0,100,0),
(518310,65,-8209.79,-2950.67,17.1,0,0,0,0,100,0),
(518310,66,-8219.6,-2947.44,15.3274,0,0,0,0,100,0),
(518310,67,-8232.6,-2943.16,13.1944,0,0,0,0,100,0),
(518310,68,-8245.6,-2938.87,12.2427,0,0,0,0,100,0),
(518310,69,-8257.7,-2934.89,12.4791,0,0,0,0,100,0),
(518310,70,-8265.72,-2932.24,12.8525,0,0,0,0,100,0),
(518310,71,-8271.43,-2930.36,12.0956,0,0,0,0,100,0),
(518310,72,-8279.97,-2927.55,10.6422,0,0,0,0,100,0),
(518310,73,-8288.76,-2924.65,10.6511,0,0,0,0,100,0),
(518310,74,-8294.75,-2922.68,10.7421,0,0,0,0,100,0),
(518310,75,-8306.09,-2918.94,10.1639,0,0,0,0,100,0),
(518310,76,-8313.21,-2916.6,10.0962,0,0,0,0,100,0),
(518310,77,-8324.03,-2913.03,9.5757,0,0,0,0,100,0),
(518310,78,-8330.65,-2910.85,9.6692,0,0,0,0,100,0),
(518310,79,-8340.97,-2907.45,8.72169,0,0,0,0,100,0),
(518310,80,-8351.93,-2903.84,8.62622,0,0,0,0,100,0),
(518310,81,-8365.31,-2899.43,8.62477,0,0,0,0,100,0),
(518310,82,-8377.16,-2895.53,8.62477,0,0,0,0,100,0),
(518310,83,-8391.42,-2890.83,8.62477,0,0,0,0,100,0),
(518310,84,-8402.98,-2887.02,8.887,0,0,0,0,100,0),
(518310,85,-8409.5,-2887.81,9.29134,0,0,0,0,100,0),
(518310,86,-8418.28,-2888.88,9.05013,0,0,0,0,100,0),

(1522800,1,-8990.43,-3435.19,24.91,0,0,0,0,100,0),
(1522800,2,-8988.06,-3448.39,23.4354,0,0,0,0,100,0),
(1522800,3,-8985.46,-3462.91,21.6997,0,0,0,0,100,0),
(1522800,4,-8983.02,-3476.51,20.084,0,0,0,0,100,0),
(1522800,5,-8980.06,-3493.02,18.8796,0,0,0,0,100,0),
(1522800,6,-8977.31,-3508.33,18.2249,0,0,0,0,100,0),
(1522800,7,-8974.33,-3524.98,16.9452,0,0,0,0,100,0),
(1522800,8,-8971.64,-3539.97,15.39,0,0,0,0,100,0),
(1522800,9,-8963.56,-3546.34,15.1,0,0,0,0,100,0),
(1522800,10,-8956.19,-3545.98,14.672,0,0,0,0,100,0),
(1522800,11,-8947.08,-3545.54,13.0101,0,0,0,0,100,0),
(1522800,12,-8935.42,-3544.98,10.7265,0,0,0,0,100,0),
(1522800,13,-8926.04,-3544.52,10.1725,0,0,0,0,100,0),
(1522800,14,-8916.39,-3544.06,11.2204,0,0,0,0,100,0),
(1522800,15,-8907.95,-3543.65,12.9887,0,0,0,0,100,0),
(1522800,16,-8900.31,-3543.28,14.1246,0,0,0,0,100,0),
(1522800,17,-8894.42,-3542.99,14.0594,0,0,0,0,100,0),
(1522800,18,-8886.64,-3542.62,12.4815,0,0,0,0,100,0),
(1522800,19,-8878.06,-3542.2,10.2777,0,0,0,0,100,0),
(1522800,20,-8870.16,-3541.82,9.47744,0,0,0,0,100,0),
(1522800,21,-8860.51,-3541.35,10.3454,0,0,0,0,100,0),
(1522800,22,-8851.93,-3540.94,11.4878,0,0,0,0,100,0),
(1522800,23,-8844.96,-3540.6,11.8024,0,0,0,0,100,0),
(1522800,24,-8835.59,-3540.14,11.099,0,0,0,0,100,0),
(1522800,25,-8823,-3539.54,9.65749,0,0,0,0,100,0),
(1522800,26,-8813.38,-3539.07,9.411,0,0,0,0,100,0),
(1522800,27,-8813.21,-3529.01,9.33281,0,0,0,0,100,0),
(1522800,28,-8812.97,-3515.6,9.0244,0,0,0,0,100,0),
(1522800,29,-8812.72,-3501.11,8.70567,0,0,0,0,100,0),
(1522800,30,-8812.51,-3488.64,8.96239,0,0,0,0,100,0),
(1522800,31,-8812.32,-3477.78,10.6247,0,0,0,0,100,0),
(1522800,32,-8812.15,-3467.86,12.2824,0,0,0,0,100,0),
(1522800,33,-8812.02,-3460.35,12.5041,0,0,0,0,100,0),
(1522800,34,-8811.86,-3451.36,11.1876,0,0,0,0,100,0),
(1522800,35,-8811.69,-3441.42,8.71399,0,0,0,0,100,0),
(1522800,36,-8811.51,-3431.1,8.6764,0,0,0,0,100,0),
(1522800,37,-8811.32,-3420.09,9.11739,0,0,0,0,100,0),
(1522800,38,-8811.15,-3410.03,10.5457,0,0,0,0,100,0),
(1522800,39,-8810.98,-3400.5,11.4439,0,0,0,0,100,0),
(1522800,40,-8810.8,-3390.18,11.9693,0,0,0,0,100,0),
(1522800,41,-8810.6,-3378.39,11.7888,0,0,0,0,100,0),
(1522800,42,-8810.41,-3367.46,10.92,0,0,0,0,100,0),
(1522800,43,-8816.79,-3357.05,10.192,0,0,0,0,100,0),
(1522800,44,-8823.17,-3346.64,9.04596,0,0,0,0,100,0),
(1522800,45,-8828.79,-3337.46,8.735,0,0,0,0,100,0),
(1522800,46,-8840.45,-3337.34,8.98821,0,0,0,0,100,0),
(1522800,47,-8850.57,-3337.23,9.39,0,0,0,0,100,0),
(1522800,48,-8858.15,-3346.11,9.91988,0,0,0,0,100,0),
(1522800,49,-8866.07,-3355.39,10.7212,0,0,0,0,100,0),
(1522800,50,-8873.03,-3363.56,12.6216,0,0,0,0,100,0),
(1522800,51,-8880.96,-3372.85,15.088,0,0,0,0,100,0),
(1522800,52,-8887.23,-3380.19,15.8878,0,0,0,0,100,0),
(1522800,53,-8893.15,-3387.13,15.1866,0,0,0,0,100,0),
(1522800,54,-8899.6,-3394.69,13.877,0,0,0,0,100,0),
(1522800,55,-8905.34,-3401.42,13.47,0,0,0,0,100,0),
(1522800,56,-8916.44,-3405.82,14.2764,0,0,0,0,100,0),
(1522800,57,-8929.02,-3410.82,15.2246,0,0,0,0,100,0),
(1522800,58,-8941.24,-3415.67,16.1022,0,0,0,0,100,0),
(1522800,59,-8952.83,-3420.27,18.1986,0,0,0,0,100,0),
(1522800,60,-8963.67,-3424.57,21.3445,0,0,0,0,100,0),
(1522800,61,-8972.77,-3428.18,23.6099,0,0,0,0,100,0),
(1522800,62,-8982.58,-3432.08,24.9917,0,0,0,0,100,0),

(1522810,1,-9307.09,-2989.11,9.249,0,0,0,0,100,0),
(1522810,2,-9304.04,-2975.36,9.08321,0,0,0,0,100,0),
(1522810,3,-9300.71,-2960.29,8.98173,0,0,0,0,100,0),
(1522810,4,-9297.31,-2944.96,8.98226,0,0,0,0,100,0),
(1522810,5,-9294.27,-2931.24,9.141,0,0,0,0,100,0),
(1522810,6,-9282.23,-2922.29,10.919,0,0,0,0,100,0),
(1522810,7,-9269.65,-2923.31,12.6424,0,0,0,0,100,0),
(1522810,8,-9256.15,-2924.41,14.2834,0,0,0,0,100,0),
(1522810,9,-9243.84,-2925.41,15.0896,0,0,0,0,100,0),
(1522810,10,-9232.61,-2926.33,14.6232,0,0,0,0,100,0),
(1522810,11,-9221.23,-2927.25,14.9882,0,0,0,0,100,0),
(1522810,12,-9208.74,-2928.27,16.89,0,0,0,0,100,0),
(1522810,13,-9196.42,-2936.37,19.822,0,0,0,0,100,0),
(1522810,14,-9183.53,-2944.85,23.6023,0,0,0,0,100,0),
(1522810,15,-9170.41,-2953.48,27.0143,0,0,0,0,100,0),
(1522810,16,-9158.08,-2961.59,29.9398,0,0,0,0,100,0),
(1522810,17,-9148.54,-2967.87,32.8979,0,0,0,0,100,0),
(1522810,18,-9137.88,-2974.88,37.0778,0,0,0,0,100,0),
(1522810,19,-9126.37,-2982.45,40.41,0,0,0,0,100,0),
(1522810,20,-9126.36,-2996.67,41.5572,0,0,0,0,100,0),
(1522810,21,-9126.35,-3006.07,43.6255,0,0,0,0,100,0),
(1522810,22,-9126.34,-3018.15,44.8428,0,0,0,0,100,0),
(1522810,23,-9126.32,-3031.97,43.792,0,0,0,0,100,0),
(1522810,24,-9126.31,-3046.11,42.49,0,0,0,0,100,0),
(1522810,25,-9137.1,-3054.96,39.9626,0,0,0,0,100,0),
(1522810,26,-9149.96,-3065.51,37.2809,0,0,0,0,100,0),
(1522810,27,-9159.67,-3073.47,37.0111,0,0,0,0,100,0),
(1522810,28,-9167.96,-3080.27,36.7376,0,0,0,0,100,0),
(1522810,29,-9177.09,-3087.76,34.2534,0,0,0,0,100,0),
(1522810,30,-9185.39,-3094.57,30.4313,0,0,0,0,100,0),
(1522810,31,-9194.21,-3101.81,26.8714,0,0,0,0,100,0),
(1522810,32,-9204.38,-3110.15,25.0739,0,0,0,0,100,0),
(1522810,33,-9212.06,-3116.44,25.4885,0,0,0,0,100,0),
(1522810,34,-9218.8,-3121.97,24.8801,0,0,0,0,100,0),
(1522810,35,-9226.81,-3128.54,22.49,0,0,0,0,100,0),
(1522810,36,-9236.56,-3124.74,19.4348,0,0,0,0,100,0),
(1522810,37,-9249.94,-3119.52,15.5295,0,0,0,0,100,0),
(1522810,38,-9262.56,-3114.59,12.1267,0,0,0,0,100,0),
(1522810,39,-9275.19,-3109.67,10.3622,0,0,0,0,100,0),
(1522810,40,-9288.07,-3104.64,10.4828,0,0,0,0,100,0),
(1522810,41,-9301.12,-3099.55,11.65,0,0,0,0,100,0),
(1522810,42,-9301.93,-3084.55,10.7717,0,0,0,0,100,0),
(1522810,43,-9302.76,-3069.14,10.8458,0,0,0,0,100,0),
(1522810,44,-9303.46,-3056.27,10.7294,0,0,0,0,100,0),
(1522810,45,-9304.31,-3040.47,9.90855,0,0,0,0,100,0),
(1522810,46,-9305.16,-3024.79,10.074,0,0,0,0,100,0),
(1522810,47,-9306.21,-3005.37,9.44848,0,0,0,0,100,0);

UPDATE `creature_addon` SET `bytes2` = 4097 WHERE `guid` = 23159; -- Dunemaul Enforcer: Ready weapon

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;