UPDATE `game_tele` SET `id` = 1435 WHERE `id` = 5000;
DELETE FROM `game_tele` WHERE `id` = 5000;
INSERT INTO `game_tele` (`id`, `position_x`, `position_y`, `position_z`, `orientation`, `map`, `name`)
VALUES
(5000,7324.4,-2974.14,913.549,1.61015,571,'DunNiffelem');
