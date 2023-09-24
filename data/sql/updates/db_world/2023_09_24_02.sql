ALTER TABLE `game_event` MODIFY `start_time` DATETIME NULL DEFAULT '2000-01-01 08:00:00' COMMENT 'Absolute start date, the event will never start before';
ALTER TABLE `game_event` MODIFY `end_time` DATETIME NULL DEFAULT '2000-01-01 08:00:00' COMMENT 'Absolute end date, the event will never start after';
