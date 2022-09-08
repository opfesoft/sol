DELETE FROM `command` WHERE `name` = 'wp go';
INSERT INTO `command` (`name`, `security`, `help`)
VALUES
('wp go',3,'Syntax: .wp go $pathid $point\r\nTeleport the player to the specified waypoint (has to be on the same map!).');
