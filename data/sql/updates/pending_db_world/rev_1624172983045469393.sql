INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1624172983045469393');

-- Relocate Wild Gryphon spawn and enable random movement
UPDATE `creature` 
SET `position_x` = -269.935, `position_y` = -1409.396, `position_z` = 91.607, `orientation` = 1.929, `wander_distance` = 15, `MovementType` = 1
WHERE `guid`= 14851;

UPDATE `creature` SET `wander_distance` = 15, `MovementType` = 1 WHERE `guid` = 15974;
