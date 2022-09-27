DELETE FROM `gameobject` WHERE `guid` IN (7080,7081,7082,7083);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(7080,181488,530,0,0,1,1,-4469.02,-14118.9,109.055,0.253072,0,0,0.126199,0.992005,120,255,1,0),
(7081,181984,530,0,0,1,1,-3704.78,-13588.1,8.32599,4.1277,0,0,-0.880891,0.473319,120,255,1,0),
(7082,181495,530,0,0,1,1,-4389.01,-13960.8,162.295,4.44186,-0.0270905,0.00680065,-0.795921,0.604755,120,255,1,0),
(7083,181489,530,0,0,1,1,-4505.46,-14097.1,108.829,4.86074,0.00182867,-0.0246096,-0.652329,0.757534,120,255,1,0);

DELETE FROM `gameobject_addon` WHERE `guid` IN (7080,7081,7082,7083);
INSERT INTO `gameobject_addon` (`guid`, `invisibilityType`, `invisibilityValue`, `useRotation`)
VALUES
(7080,0,0,1),
(7081,0,0,1),
(7082,0,0,1),
(7083,0,0,1);
