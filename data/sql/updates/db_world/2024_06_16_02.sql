UPDATE `gameobject` SET `spawntimesecs` = 120 WHERE `guid` IN (13381,13382,13384,13385);

DELETE FROM `gameobject` WHERE `guid` BETWEEN 3009368 AND 3009371;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
(3009368,175708,1,0,0,1,1,-134.408,-3309.68,91.6667,5.37562,0,0,-0.438371,0.898794,120,255,1),
(3009369,175708,1,0,0,1,1,-238.936,-3337.52,91.6852,1.06465,0,0,0.507538,0.861629,120,255,1),
(3009370,175708,1,0,0,1,1,-38.3517,-3373.56,91.7019,0.767944,0,0,0.374606,0.927184,120,255,1),
(3009371,175708,1,0,0,1,1,-48.2439,-3403.22,91.6978,2.47837,0,0,0.945518,0.325568,120,255,1);
