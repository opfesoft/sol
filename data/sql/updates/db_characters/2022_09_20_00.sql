UPDATE `characters` SET `taxi_path` = '' WHERE LENGTH(`taxi_path`) > 0;

ALTER TABLE `character_entry_point`
ADD COLUMN `taxiPath0` INT(10) UNSIGNED DEFAULT 0 NOT NULL AFTER `joinMapId`,
ADD COLUMN `taxiPath1` INT(10) UNSIGNED DEFAULT 0 NOT NULL AFTER `taxiPath0`,
DROP COLUMN `taxiPath`;
