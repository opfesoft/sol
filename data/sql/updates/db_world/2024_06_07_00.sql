UPDATE `acore_string` SET `content_default` = 'Escort' WHERE `entry` = 530;

DELETE FROM `acore_string` WHERE `entry` BETWEEN 1184 AND 1186;
INSERT INTO `acore_string` (`entry`, `content_default`)
VALUES
(1184,'Assistance Distract'),
(1185,'Timed Fleeing'),
(1186,'Rotate');
