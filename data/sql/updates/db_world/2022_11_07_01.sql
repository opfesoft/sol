UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` IN (81963,81985,81984,81948,81993,81990,81972,81954,81956);
UPDATE `creature` SET `position_x` = 7379.31, `position_y` = -7796.62, `position_z` = 147.975, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 81955;
UPDATE `creature` SET `position_x` = 7457.03, `position_y` = -7870.59, `position_z` = 157.918, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 81950;
UPDATE `creature` SET `position_x` = 7401.83, `position_y` = -7905.49, `position_z` = 158.416, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 81951;
UPDATE `creature` SET `position_x` = 7258.2, `position_y` = -7750.88, `position_z` = 149.976, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 81978;
UPDATE `creature` SET `position_x` = 7414.26, `position_y` = -7944.12, `position_z` = 161.239, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 81961;

DELETE FROM `creature_addon` WHERE `guid` IN (81978,81961);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(81978,819780,0,0,1,0,0,NULL),
(81961,819610,0,0,1,0,0,NULL);

DELETE FROM `waypoint_data` WHERE `id` IN (819780,819610);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
-- Shadowpine Shadowcaster
(819780,1,7258.2,-7750.88,149.976,NULL,0,0,0,0,100,0),
(819780,2,7263.64,-7745.8,150.029,NULL,0,0,0,0,100,0),
(819780,3,7274.56,-7743.9,150.075,NULL,0,0,0,0,100,0),
(819780,4,7286.54,-7746.86,149.87,NULL,0,0,0,0,100,0),
(819780,5,7295.23,-7756.68,150.007,NULL,0,0,0,0,100,0),
(819780,6,7297.97,-7767.88,150.081,NULL,0,0,0,0,100,0),
(819780,7,7293.82,-7781.94,150.043,NULL,0,0,0,0,100,0),
(819780,8,7289.06,-7785.7,150.007,NULL,0,0,0,0,100,0),
(819780,9,7281.84,-7777.58,150.019,NULL,0,0,0,0,100,0),
(819780,10,7268.98,-7774.61,150.019,NULL,0,0,0,0,100,0),
(819780,11,7265.92,-7769.98,154.045,NULL,0,0,0,0,100,0),
(819780,12,7265.45,-7763.79,157.172,NULL,0,0,0,0,100,0),
(819780,13,7266.27,-7759.8,157.597,NULL,0,0,0,0,100,0),
(819780,14,7262.59,-7755.27,157.72,NULL,0,0,0,0,100,0),
(819780,15,7262.97,-7748.72,157.538,NULL,0,0,0,0,100,0),
(819780,16,7268.6,-7746.85,160.472,NULL,0,0,0,0,100,0),
(819780,17,7274.37,-7747.58,162.985,NULL,0,0,0,0,100,0),
(819780,18,7278.69,-7751.26,162.943,NULL,0,0,0,0,100,0),
(819780,19,7277.47,-7756.35,162.937,NULL,0,0,0,0,100,0),
(819780,20,7267.84,-7760.37,163.065,NULL,0,0,0,0,100,0),
(819780,21,7262.77,-7767.45,162.877,NULL,0,0,0,0,100,0),
(819780,22,7263.86,-7774.21,162.938,NULL,0,0,0,0,100,0),
(819780,23,7268.46,-7778.91,163.005,NULL,0,0,0,0,100,0),
(819780,24,7278.38,-7778.03,163.037,NULL,0,0,0,0,100,0),
(819780,25,7283.69,-7772.72,163.027,NULL,0,0,0,0,100,0),
(819780,26,7282.85,-7764.21,162.937,NULL,0,0,0,0,100,0),
(819780,27,7277.47,-7756.35,162.937,NULL,0,0,0,0,100,0),
(819780,28,7278.69,-7751.26,162.943,NULL,0,0,0,0,100,0),
(819780,29,7274.37,-7747.58,162.985,NULL,0,0,0,0,100,0),
(819780,30,7268.6,-7746.85,160.472,NULL,0,0,0,0,100,0),
(819780,31,7262.97,-7748.72,157.538,NULL,0,0,0,0,100,0),
(819780,32,7262.59,-7755.27,157.72,NULL,0,0,0,0,100,0),
(819780,33,7266.27,-7759.8,157.597,NULL,0,0,0,0,100,0),
(819780,34,7265.3,-7763.81,157.134,NULL,0,0,0,0,100,0),
(819780,35,7266,-7769.93,154.051,NULL,0,0,0,0,100,0),
(819780,36,7268.96,-7774.56,150.019,NULL,0,0,0,0,100,0),
(819780,37,7281.74,-7777.4,150.019,NULL,0,0,0,0,100,0),
(819780,38,7289.15,-7785.69,150.007,NULL,0,0,0,0,100,0),
(819780,39,7285.07,-7789.73,150.013,NULL,0,0,0,0,100,0),
(819780,40,7273.74,-7792.13,150.094,NULL,0,0,0,0,100,0),
(819780,41,7260.4,-7786.96,150.263,NULL,0,0,0,0,100,0),
(819780,42,7251.76,-7777.36,149.99,NULL,0,0,0,0,100,0),
(819780,43,7249.86,-7766.42,149.843,NULL,0,0,0,0,100,0),
(819780,44,7253.85,-7754.85,149.859,NULL,0,0,0,0,100,0),
-- Shadowpine Shadowcaster
(819610,1,7414.26,-7944.12,161.239,NULL,0,0,0,0,100,0),
(819610,2,7420.3,-7944.38,161.239,NULL,0,0,0,0,100,0),
(819610,3,7429.63,-7952.79,161.323,NULL,0,0,0,0,100,0),
(819610,4,7433.21,-7966.14,161.482,NULL,0,0,0,0,100,0),
(819610,5,7430.91,-7977.68,161.238,NULL,0,0,0,0,100,0),
(819610,6,7423.58,-7985.98,161.09,NULL,0,0,0,0,100,0),
(819610,7,7412.28,-7990.25,161.097,NULL,0,0,0,0,100,0),
(819610,8,7405.36,-7989.33,161.222,NULL,0,0,0,0,100,0),
(819610,9,7398.24,-7987.23,161.264,NULL,0,0,0,0,100,0),
(819610,10,7390.52,-7979.59,161.28,NULL,0,0,0,0,100,0),
(819610,11,7385.23,-7969.68,161.085,NULL,0,0,0,0,100,0),
(819610,12,7388.71,-7956.61,161.238,NULL,0,0,0,0,100,0),
(819610,13,7395.52,-7947.34,161.316,NULL,0,0,0,0,100,0),
(819610,14,7409.83,-7942.27,161.271,NULL,0,0,0,0,100,0),
(819610,15,7414.19,-7944.01,161.239,NULL,0,0,0,0,100,0),
(819610,16,7412.56,-7951.64,161.249,NULL,0,0,0,0,100,0),
(819610,17,7418.32,-7966.84,161.249,NULL,0,0,0,0,100,0),
(819610,18,7416.76,-7971.57,164.888,NULL,0,0,0,0,100,0),
(819610,19,7415.14,-7973.91,166.441,NULL,0,0,0,0,100,0),
(819610,20,7411.69,-7975.51,168.455,NULL,0,0,0,0,100,0),
(819610,21,7408.36,-7978.19,168.85,NULL,0,0,0,0,100,0),
(819610,22,7406.29,-7983.4,168.952,NULL,0,0,0,0,100,0),
(819610,23,7401.4,-7987.16,168.77,NULL,0,0,0,0,100,0),
(819610,24,7396.55,-7984.08,171.509,NULL,0,0,0,0,100,0),
(819610,25,7394.03,-7978.39,174.203,NULL,0,0,0,0,100,0),
(819610,26,7395.76,-7971.85,174.168,NULL,0,0,0,0,100,0),
(819610,27,7401.41,-7959.69,174.176,NULL,0,0,0,0,100,0),
(819610,28,7409.8,-7956.15,174.243,NULL,0,0,0,0,100,0),
(819610,29,7418.03,-7958.65,174.205,NULL,0,0,0,0,100,0),
(819610,30,7421.59,-7966.85,174.213,NULL,0,0,0,0,100,0),
(819610,31,7417.9,-7974.64,174.089,NULL,0,0,0,0,100,0),
(819610,32,7407.82,-7977.24,174.323,NULL,0,0,0,0,100,0),
(819610,33,7395.76,-7971.85,174.168,NULL,0,0,0,0,100,0),
(819610,34,7394.03,-7978.39,174.203,NULL,0,0,0,0,100,0),
(819610,35,7396.58,-7984.09,171.498,NULL,0,0,0,0,100,0),
(819610,36,7401.4,-7987.16,168.77,NULL,0,0,0,0,100,0),
(819610,37,7406.29,-7983.4,168.952,NULL,0,0,0,0,100,0),
(819610,38,7408.36,-7978.19,168.85,NULL,0,0,0,0,100,0),
(819610,39,7411.73,-7975.67,168.443,NULL,0,0,0,0,100,0),
(819610,40,7415.12,-7973.88,166.442,NULL,0,0,0,0,100,0),
(819610,41,7416.68,-7971.39,164.775,NULL,0,0,0,0,100,0),
(819610,42,7418.24,-7966.99,161.249,NULL,0,0,0,0,100,0),
(819610,43,7412.59,-7951.58,161.249,NULL,0,0,0,0,100,0);