UPDATE `gameobject` SET `position_x` = -2307.99, `position_y` = -11266.1, `position_z` = 36.51, `rotation0` = -0.0499472, `rotation1` = 0.00178869, `rotation2` = -0.99811, `rotation3` = -0.035744 WHERE `guid` = 44724;

DELETE FROM `gameobject_addon` WHERE `guid` = 44724;
INSERT INTO `gameobject_addon` (`guid`, `invisibilityType`, `invisibilityValue`, `useRotation`)
VALUES
(44724,0,0,1);
