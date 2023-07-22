UPDATE `creature_template` SET `InhabitType` = `InhabitType` | 4 WHERE `entry` = 22089;
UPDATE `creature_template` SET `flags_extra` = `flags_extra` | 128 WHERE `entry` = 21942;
DELETE FROM `creature_template_addon` WHERE `entry` = 21942;

DELETE FROM `waypoint_data` WHERE `id` = 741570;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(741570,1,1926.78,5600.32,267.37,1.88693,20000,0,0,0,100,0),
(741570,2,1932.13,5599.98,267.37,NULL,0,0,0,0,100,0),
(741570,3,1938.01,5599.6,267.37,NULL,0,0,0,0,100,0),
(741570,4,1944.29,5599.2,267.372,0.517781,20000,0,0,0,100,0),
(741570,5,1938.01,5599.6,267.37,NULL,0,0,0,0,100,0),
(741570,6,1932.13,5599.98,267.37,NULL,0,0,0,0,100,0);
