UPDATE `creature` SET `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 29809;
UPDATE `creature_addon` SET `path_id` = 0 WHERE `guid` = 29809;
DELETE FROM `waypoint_data` WHERE `id` = 298090;
