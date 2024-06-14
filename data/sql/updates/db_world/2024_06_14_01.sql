DELETE FROM `gameobject` WHERE `guid` BETWEEN 3009358 AND 3009367;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
(3009358,186422,571,0,0,1,1,449.718,-4539.1,244.864,0.558504,0,0,0.275637,0.961262,180,255,1),
(3009359,186422,571,0,0,1,1,453.997,-4545.92,244.864,-1.01229,0,0,-0.484809,0.87462,180,255,1),
(3009360,181592,571,0,0,1,1,454.757,-4546.08,245.717,-2.46091,0,0,-0.942641,0.333808,180,255,1),
(3009361,181592,571,0,0,1,1,449.503,-4538.53,245.724,-2.426,0,0,-0.936671,0.35021,180,255,1),
(3009362,181592,571,0,0,1,1,450.246,-4539.32,245.72,-3.03684,0,0,-0.998629,0.0523532,180,255,1),
(3009363,180049,571,0,0,1,1,453.88,-4546.72,245.734,-1.8675,0,0,-0.803857,0.594823,180,255,1),
(3009364,180049,571,0,0,1,1,448.892,-4539.18,245.731,-2.74016,0,0,-0.979924,0.19937,180,255,1),
(3009365,180049,571,0,0,1,1,453.228,-4545.86,245.739,-1.98967,0,0,-0.83867,0.54464,180,255,1),
(3009366,180049,571,0,0,1,1,450.096,-4538.51,245.754,0.855211,0,0,0.414693,0.909961,180,255,1),
(3009367,180049,571,0,0,1,1,454.046,-4545.21,245.746,-2.40855,0,0,-0.93358,0.358368,180,255,1);

UPDATE `creature` SET `position_x` = 452.013, `position_y` = -4543.45, `position_z` = 244.866, `orientation` = 3.66519, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 88151;
UPDATE `creature` SET `position_x` = 450.978, `position_y` = -4541.85, `position_z` = 244.867, `orientation` = 3.76991, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 88150;
UPDATE `creature_addon` SET `path_id` = 881510 WHERE `guid` = 88151;
UPDATE `creature_addon` SET `path_id` = 881500 WHERE `guid` = 88150;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (33019,33018);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (33019,33018);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (3301900,3301800);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(33019,0,0,0,1,0,100,0,120000,240000,120000,240000,0,239,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Megan Owings - OOC - Resume WP Path After 5 Seconds'),
(33019,0,1,0,34,0,100,0,2,3,0,0,0,80,3301900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Megan Owings - On WP 3 Reached - Call Timed Action List'),

(3301900,9,0,0,0,0,100,0,1000,1000,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Megan Owings - On Script - Set Emote State ''STATE_USESTANDING'''),
(3301900,9,1,0,0,0,100,0,13000,13000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Megan Owings - On Script - Set Emote State ''ONESHOT_NONE'''),

(33018,0,0,0,1,0,100,0,120000,240000,120000,240000,0,239,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jennifer Owings - OOC - Resume WP Path After 5 Seconds'),
(33018,0,1,0,34,0,100,0,2,6,0,0,0,80,3301800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jennifer Owings - On WP 6 Reached - Call Timed Action List'),

(3301800,9,0,0,0,0,100,0,1000,1000,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jennifer Owings - On Script - Set Emote State ''STATE_USESTANDING'''),
(3301800,9,1,0,0,0,100,0,13000,13000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jennifer Owings - On Script - Set Emote State ''ONESHOT_NONE''');

DELETE FROM `waypoint_data` WHERE `id` IN (881510,881500);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
-- Jennifer Owings
(881500,1,450.978,-4541.85,244.867,3.76991,900000,0,0,0,100,0),
(881500,2,454.951,-4540.57,244.864,NULL,0,0,0,0,100,0),
(881500,3,459.861,-4536.83,244.883,NULL,0,0,0,0,100,0),
(881500,4,459.189,-4529.97,244.998,NULL,0,0,0,0,100,0),
(881500,5,461.252,-4527.58,244.985,NULL,0,0,0,0,100,0),
(881500,6,456.461,-4519.24,244.978,3.0073,15000,0,0,0,100,0),
(881500,7,461.252,-4527.58,244.985,NULL,0,0,0,0,100,0),
(881500,8,459.189,-4529.97,244.998,NULL,0,0,0,0,100,0),
(881500,9,459.861,-4536.83,244.883,NULL,0,0,0,0,100,0),
(881500,10,454.951,-4540.57,244.864,NULL,0,0,0,0,100,0),
-- Megan Owings
(881510,1,452.013,-4543.45,244.866,3.66519,900000,0,0,0,100,0),
(881510,2,448.476,-4544.58,244.864,NULL,0,0,0,0,100,0),
(881510,3,445.929,-4542.31,244.872,2.3338,15000,0,0,0,100,0),
(881510,4,447.864,-4544.08,244.863,NULL,0,0,0,0,100,0);
