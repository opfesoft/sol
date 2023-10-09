DELETE FROM `creature_equip_template` WHERE `CreatureID` = 1437;
UPDATE `creature` SET `equipment_id` = 0, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 9468;
UPDATE `waypoint_data` SET `orientation` = 3.57897, `delay` = 30000 WHERE `id` = 94680 AND `point` = 1;
