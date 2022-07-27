UPDATE `creature` SET `position_x` = -1198.38, `position_y` = -3096.47, `position_z` = 94.5309, `orientation` = 3.19887 WHERE `guid` = 14007;
UPDATE `creature` SET `position_x` = -1198.56, `position_y` = -3101.08, `position_z` = 94.7473, `orientation` = 3.17138 WHERE `guid` = 20588;

DELETE FROM `creature_formations` WHERE `leaderGUID` = 20720;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`)
VALUES
(20720,20720,0,0,2),
(20720,20588,3,325,2),
(20720,14007,3,35,2);
