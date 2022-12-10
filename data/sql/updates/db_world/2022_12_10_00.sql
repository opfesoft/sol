DELETE FROM `acore_string` WHERE `entry` = 31080;
INSERT INTO `acore_string` (`entry`, `content_default`)
VALUES
(31080,'Completion of the "%s" quest is required.');

DELETE FROM `acore_string_locale` WHERE `entry` = 31080;
INSERT INTO `acore_string_locale` (`entry`, `locale`, `content`)
VALUES
(31080,'deDE','Abschluss der Quest "%s" wird benötigt.');

UPDATE `access_requirement` SET `quest_failed_text` = NULL WHERE `mapId` = 269;
