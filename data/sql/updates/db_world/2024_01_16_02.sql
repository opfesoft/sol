UPDATE `creature` SET `position_x` = -2271.39, `position_y` = 3641.37, `position_z` = -9.73783, `orientation` = 4.66162, `MovementType` = 2 WHERE `guid` = 66940;

DELETE FROM `creature_addon` WHERE `guid` = 66940;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(66940,669400,0,0,0,0,0,NULL);

DELETE FROM `waypoint_data` WHERE `id` = 669400;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(669400,1,-2271.39,3641.37,-9.73783,NULL,0,0,0,0,100,0),
(669400,2,-2271.6,3637.4,-10.8028,NULL,0,0,0,0,100,0),
(669400,3,-2271.89,3631.57,-13.6333,NULL,0,0,0,0,100,0),
(669400,4,-2272.18,3625.98,-14.788,NULL,0,0,0,0,100,0),
(669400,5,-2272.45,3620.62,-14.8782,NULL,0,0,0,0,100,0),
(669400,6,-2272.77,3614.21,-15.0388,NULL,0,0,0,0,100,0),
(669400,7,-2273.02,3609.4,-15.2511,NULL,0,0,0,0,100,0),
(669400,8,-2270.99,3603.93,-15.7989,NULL,0,0,0,0,100,0),
(669400,9,-2269.28,3599.35,-15.9425,NULL,0,0,0,0,100,0),
(669400,10,-2267.7,3595.08,-16.1665,NULL,0,0,0,0,100,0),
(669400,11,-2266.03,3590.6,-17.324,NULL,0,0,0,0,100,0),
(669400,12,-2264.52,3586.55,-18.4019,NULL,0,0,0,0,100,0),
(669400,13,-2263.74,3581.23,-18.7058,NULL,0,0,0,0,100,0),
(669400,14,-2263.24,3577.77,-18.0025,NULL,0,0,0,0,100,0),
(669400,15,-2262.71,3574.19,-16.4597,NULL,0,0,0,0,100,0),
(669400,16,-2262.15,3570.38,-15.429,NULL,0,0,0,0,100,0),
(669400,17,-2261.64,3566.92,-15.3829,NULL,0,0,0,0,100,0),
(669400,18,-2261.1,3563.23,-15.8944,NULL,0,0,0,0,100,0),
(669400,19,-2260.65,3560.11,-16.4744,NULL,0,0,0,0,100,0),
(669400,20,-2259.49,3555.83,-17.6427,NULL,0,0,0,0,100,0),
(669400,21,-2258.39,3551.78,-19.055,NULL,0,0,0,0,100,0),
(669400,22,-2257.57,3548.73,-20.5827,NULL,0,0,0,0,100,0),
(669400,23,-2256.25,3543.88,-22.9541,NULL,0,0,0,0,100,0),
(669400,24,-2255.94,3538.53,-23.7026,NULL,0,0,0,0,100,0),
(669400,25,-2255.61,3532.94,-24.2585,NULL,0,0,0,0,100,0),
(669400,26,-2255.18,3525.72,-25.0108,NULL,0,0,0,0,100,0),
(669400,27,-2254.76,3518.59,-25.6784,NULL,0,0,0,0,100,0),
(669400,28,-2256.02,3514.22,-26.1408,NULL,0,0,0,0,100,0),
(669400,29,-2257.48,3509.18,-26.6611,NULL,0,0,0,0,100,0),
(669400,30,-2258.62,3505.26,-26.2545,NULL,0,0,0,0,100,0),
(669400,31,-2260.04,3500.33,-24.7582,NULL,0,0,0,0,100,0),
(669400,32,-2261.06,3496.82,-23.8825,NULL,0,0,0,0,100,0),
(669400,33,-2262.13,3493.62,-23.6427,NULL,0,0,0,0,100,0),
(669400,34,-2263.57,3489.31,-23.7707,NULL,0,0,0,0,100,0),
(669400,35,-2264.99,3485.09,-24.0617,NULL,0,0,0,0,100,0),
(669400,36,-2262.47,3481.15,-23.9134,NULL,0,0,0,0,100,0),
(669400,37,-2259.26,3476.13,-23.5793,NULL,0,0,0,0,100,0),
(669400,38,-2255.64,3470.46,-23.3117,NULL,0,0,0,0,100,0),
(669400,39,-2255.26,3462.52,-23.2027,NULL,0,0,0,0,100,0),
(669400,40,-2254.98,3456.67,-22.4494,NULL,0,0,0,0,100,0),
(669400,41,-2255.9,3453.06,-21.5837,NULL,0,0,0,0,100,0),
(669400,42,-2256.97,3448.88,-20.6393,NULL,0,0,0,0,100,0),
(669400,43,-2258.66,3442.26,-20.0141,NULL,0,0,0,0,100,0),
(669400,44,-2260.09,3436.65,-19.2671,NULL,0,0,0,0,100,0),
(669400,45,-2262.01,3432.66,-18.6286,NULL,0,0,0,0,100,0),
(669400,46,-2263.92,3428.66,-17.8495,NULL,0,0,0,0,100,0),
(669400,47,-2265.53,3425.29,-17.7272,NULL,0,0,0,0,100,0),
(669400,48,-2267.44,3421.29,-18.0808,NULL,0,0,0,0,100,0),
(669400,49,-2269.33,3417.35,-18.0361,NULL,0,0,0,0,100,0),
(669400,50,-2267.18,3413.08,-17.7778,NULL,0,0,0,0,100,0),
(669400,51,-2265.23,3409.23,-17.8755,NULL,0,0,0,0,100,0),
(669400,52,-2263.39,3405.58,-18.5162,NULL,0,0,0,0,100,0),
(669400,53,-2261.4,3401.65,-19.3113,NULL,0,0,0,0,100,0),
(669400,54,-2257.1,3401.16,-20.1281,NULL,0,0,0,0,100,0),
(669400,55,-2251.77,3400.56,-21.0087,NULL,0,0,0,0,100,0),
(669400,56,-2246.43,3399.96,-21.2028,NULL,0,0,0,0,100,0),
(669400,57,-2241.92,3399.45,-20.9344,NULL,0,0,0,0,100,0),
(669400,58,-2237.29,3399.51,-20.6836,NULL,0,0,0,0,100,0),
(669400,59,-2233.44,3399.55,-20.7425,NULL,0,0,0,0,100,0),
(669400,60,-2228.77,3399.61,-21.1791,NULL,0,0,0,0,100,0),
(669400,61,-2223.09,3399.69,-22.3444,NULL,0,0,0,0,100,0),
(669400,62,-2217.75,3399.04,-23.8741,NULL,0,0,0,0,100,0),
(669400,63,-2212.78,3398.44,-25.6545,NULL,0,0,0,0,100,0),
(669400,64,-2208.42,3396.21,-27.2146,NULL,0,0,0,0,100,0),
(669400,65,-2203.85,3393.87,-29.0478,NULL,0,0,0,0,100,0),
(669400,66,-2198.72,3389.63,-30.6538,NULL,0,0,0,0,100,0),
(669400,67,-2193.18,3385.06,-31.7141,NULL,0,0,0,0,100,0),
(669400,68,-2190.54,3380,-31.6117,NULL,0,0,0,0,100,0),
(669400,69,-2187.94,3375,-31.8117,NULL,0,0,0,0,100,0),
(669400,70,-2188.47,3368.72,-31.5192,NULL,0,0,0,0,100,0),
(669400,71,-2188.95,3363.05,-31.1673,NULL,0,0,0,0,100,0),
(669400,72,-2189.65,3356.32,-30.9663,NULL,0,0,0,0,100,0),
(669400,73,-2190.24,3350.65,-31.0415,NULL,0,0,0,0,100,0),
(669400,74,-2189.65,3356.32,-30.9663,NULL,0,0,0,0,100,0),
(669400,75,-2188.95,3363.05,-31.1673,NULL,0,0,0,0,100,0),
(669400,76,-2188.47,3368.72,-31.5192,NULL,0,0,0,0,100,0),
(669400,77,-2187.94,3375,-31.8117,NULL,0,0,0,0,100,0),
(669400,78,-2190.54,3380,-31.6117,NULL,0,0,0,0,100,0),
(669400,79,-2193.18,3385.06,-31.7141,NULL,0,0,0,0,100,0),
(669400,80,-2198.72,3389.63,-30.6538,NULL,0,0,0,0,100,0),
(669400,81,-2203.85,3393.87,-29.0478,NULL,0,0,0,0,100,0),
(669400,82,-2208.42,3396.21,-27.2146,NULL,0,0,0,0,100,0),
(669400,83,-2212.78,3398.44,-25.6545,NULL,0,0,0,0,100,0),
(669400,84,-2217.75,3399.04,-23.8741,NULL,0,0,0,0,100,0),
(669400,85,-2223.09,3399.69,-22.3444,NULL,0,0,0,0,100,0),
(669400,86,-2228.77,3399.61,-21.1791,NULL,0,0,0,0,100,0),
(669400,87,-2233.44,3399.55,-20.7425,NULL,0,0,0,0,100,0),
(669400,88,-2237.29,3399.51,-20.6836,NULL,0,0,0,0,100,0),
(669400,89,-2241.92,3399.45,-20.9344,NULL,0,0,0,0,100,0),
(669400,90,-2246.43,3399.96,-21.2028,NULL,0,0,0,0,100,0),
(669400,91,-2251.77,3400.56,-21.0087,NULL,0,0,0,0,100,0),
(669400,92,-2257.1,3401.16,-20.1281,NULL,0,0,0,0,100,0),
(669400,93,-2261.4,3401.65,-19.3113,NULL,0,0,0,0,100,0),
(669400,94,-2263.39,3405.58,-18.5162,NULL,0,0,0,0,100,0),
(669400,95,-2265.23,3409.23,-17.8755,NULL,0,0,0,0,100,0),
(669400,96,-2267.18,3413.08,-17.7778,NULL,0,0,0,0,100,0),
(669400,97,-2269.33,3417.35,-18.0361,NULL,0,0,0,0,100,0),
(669400,98,-2267.44,3421.29,-18.0808,NULL,0,0,0,0,100,0),
(669400,99,-2265.53,3425.29,-17.7272,NULL,0,0,0,0,100,0),
(669400,100,-2263.92,3428.66,-17.8495,NULL,0,0,0,0,100,0),
(669400,101,-2262.01,3432.66,-18.6286,NULL,0,0,0,0,100,0),
(669400,102,-2260.09,3436.65,-19.2671,NULL,0,0,0,0,100,0),
(669400,103,-2258.66,3442.26,-20.0141,NULL,0,0,0,0,100,0),
(669400,104,-2256.97,3448.88,-20.6393,NULL,0,0,0,0,100,0),
(669400,105,-2255.9,3453.06,-21.5837,NULL,0,0,0,0,100,0),
(669400,106,-2254.98,3456.67,-22.4494,NULL,0,0,0,0,100,0),
(669400,107,-2255.26,3462.52,-23.2027,NULL,0,0,0,0,100,0),
(669400,108,-2255.64,3470.46,-23.3117,NULL,0,0,0,0,100,0),
(669400,109,-2259.26,3476.13,-23.5793,NULL,0,0,0,0,100,0),
(669400,110,-2262.47,3481.15,-23.9134,NULL,0,0,0,0,100,0),
(669400,111,-2264.99,3485.09,-24.0617,NULL,0,0,0,0,100,0),
(669400,112,-2263.57,3489.31,-23.7707,NULL,0,0,0,0,100,0),
(669400,113,-2262.13,3493.62,-23.6427,NULL,0,0,0,0,100,0),
(669400,114,-2261.06,3496.82,-23.8825,NULL,0,0,0,0,100,0),
(669400,115,-2260.04,3500.33,-24.7582,NULL,0,0,0,0,100,0),
(669400,116,-2258.62,3505.26,-26.2545,NULL,0,0,0,0,100,0),
(669400,117,-2257.48,3509.18,-26.6611,NULL,0,0,0,0,100,0),
(669400,118,-2256.02,3514.22,-26.1408,NULL,0,0,0,0,100,0),
(669400,119,-2254.76,3518.59,-25.6784,NULL,0,0,0,0,100,0),
(669400,120,-2255.18,3525.72,-25.0108,NULL,0,0,0,0,100,0),
(669400,121,-2255.61,3532.94,-24.2585,NULL,0,0,0,0,100,0),
(669400,122,-2255.94,3538.53,-23.7026,NULL,0,0,0,0,100,0),
(669400,123,-2256.25,3543.88,-22.9541,NULL,0,0,0,0,100,0),
(669400,124,-2257.57,3548.73,-20.5827,NULL,0,0,0,0,100,0),
(669400,125,-2258.39,3551.78,-19.055,NULL,0,0,0,0,100,0),
(669400,126,-2259.49,3555.83,-17.6427,NULL,0,0,0,0,100,0),
(669400,127,-2260.65,3560.11,-16.4744,NULL,0,0,0,0,100,0),
(669400,128,-2261.1,3563.23,-15.8944,NULL,0,0,0,0,100,0),
(669400,129,-2261.64,3566.92,-15.3829,NULL,0,0,0,0,100,0),
(669400,130,-2262.15,3570.38,-15.429,NULL,0,0,0,0,100,0),
(669400,131,-2262.71,3574.19,-16.4597,NULL,0,0,0,0,100,0),
(669400,132,-2263.24,3577.77,-18.0025,NULL,0,0,0,0,100,0),
(669400,133,-2263.74,3581.23,-18.7058,NULL,0,0,0,0,100,0),
(669400,134,-2264.52,3586.55,-18.4019,NULL,0,0,0,0,100,0),
(669400,135,-2266.03,3590.6,-17.324,NULL,0,0,0,0,100,0),
(669400,136,-2267.7,3595.08,-16.1665,NULL,0,0,0,0,100,0),
(669400,137,-2269.28,3599.35,-15.9425,NULL,0,0,0,0,100,0),
(669400,138,-2270.99,3603.93,-15.7989,NULL,0,0,0,0,100,0),
(669400,139,-2273.02,3609.4,-15.2511,NULL,0,0,0,0,100,0),
(669400,140,-2272.77,3614.21,-15.0388,NULL,0,0,0,0,100,0),
(669400,141,-2272.45,3620.62,-14.8782,NULL,0,0,0,0,100,0),
(669400,142,-2272.18,3625.98,-14.788,NULL,0,0,0,0,100,0),
(669400,143,-2271.89,3631.57,-13.6333,NULL,0,0,0,0,100,0),
(669400,144,-2271.6,3637.4,-10.8028,NULL,0,0,0,0,100,0);