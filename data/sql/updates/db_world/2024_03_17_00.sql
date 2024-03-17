UPDATE `creature` SET `position_x` = -323.048, `position_y` = -707.553, `position_z` = 57.728, `orientation` = 2.12068, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 15576;
UPDATE `creature` SET `position_x` = -340.669, `position_y` = -711.193, `position_z` = 57.7333, `orientation` = 1.17171, `wander_distance` = 7, `MovementType` = 1 WHERE `guid` = 15703;

UPDATE `creature_addon` SET `auras` = '8601' WHERE `guid` IN (15577,15702,15705);
UPDATE `creature_addon` SET `path_id` = 155760, `auras` = '6718 8601' WHERE `guid` = 15576;
UPDATE `creature_addon` SET `auras` = '6718 8601' WHERE `guid` = 15703;

DELETE FROM `waypoint_data` WHERE `id` = 155760;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(155760,1,-323.048,-707.553,57.728,NULL,0,0,0,0,100,0),
(155760,2,-326.25,-702.329,57.7294,NULL,0,0,0,0,100,0),
(155760,3,-331.109,-698.344,57.2476,NULL,0,0,0,0,100,0),
(155760,4,-337.517,-695.01,57.5144,NULL,0,0,0,0,100,0),
(155760,5,-345.356,-695.147,57.7294,NULL,0,0,0,0,100,0),
(155760,6,-351.548,-697.48,57.643,NULL,0,0,0,0,100,0),
(155760,7,-357.778,-702.645,57.7293,NULL,0,0,0,0,100,0),
(155760,8,-360.869,-709.274,57.7294,NULL,0,0,0,0,100,0),
(155760,9,-362.518,-716.524,57.6291,NULL,0,0,0,0,100,0),
(155760,10,-359.883,-724.049,57.7294,NULL,0,0,0,0,100,0),
(155760,11,-354.634,-729.426,57.7177,NULL,0,0,0,0,100,0),
(155760,12,-342.941,-734.252,57.721,NULL,0,0,0,0,100,0),
(155760,13,-333.018,-731.967,57.6508,NULL,0,0,0,0,100,0),
(155760,14,-325.698,-725.507,57.7294,NULL,0,0,0,0,100,0),
(155760,15,-321.808,-716.379,57.7294,NULL,0,0,0,0,100,0);
