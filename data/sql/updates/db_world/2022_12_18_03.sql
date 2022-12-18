DELETE FROM `gameobject` WHERE `guid` IN (3009036,3009037,3009038);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3009036,184031,530,0,0,1,1,3096.23,2195.02,149.16,0.314158,0,0,0,0,181,255,1,0),
(3009037,184031,530,0,0,1,1,3097.86,2184.51,149.162,2.40855,0,0,0,0,181,255,1,0),
(3009038,184031,530,0,0,1,1,3098.44,2164.58,149.168,0.628317,0,0,0,0,181,255,1,0);
