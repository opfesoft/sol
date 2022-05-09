ALTER TABLE `waypoint_data` MODIFY `orientation` float DEFAULT NULL;
UPDATE `waypoint_data` SET `orientation` = NULL WHERE `orientation` <= 0 OR `delay` = 0;
UPDATE `waypoint_data` SET `orientation` = 0 WHERE `orientation` LIKE 6.28319;
