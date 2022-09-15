DELETE FROM `command` WHERE `name` = 'wp stop';
INSERT INTO `command` (`name`, `security`, `help`)
VALUES
('wp stop',3,'Syntax: .wp stop $duration\r\nStop WP movement for $duration ms (can also be used to decrease the current WP duration).');

UPDATE `acore_string` SET `content_default` = 'Creature (GUID: %u) No waypoints found.' WHERE `entry` = 223;
UPDATE `acore_string_locale` SET `content` = 'Kreatur (GUID: %u) Keine Wegpunkte gefunden.' WHERE `entry` = 223 AND `locale` = 'deDE';
