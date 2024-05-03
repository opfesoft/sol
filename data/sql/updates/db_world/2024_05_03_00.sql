DELETE FROM `acore_string` WHERE `entry` = 528;
INSERT INTO `acore_string` (`entry`, `content_default`)
VALUES
(528,'   Random, distance: %f');

DELETE FROM `acore_string_locale` WHERE `entry` = 528 AND `locale` = 'deDE';
INSERT INTO `acore_string_locale` (`entry`, `locale`, `content`)
VALUES
(528,'deDE','   zufällig, Distanz: %f');
