DELETE FROM `gameobject` WHERE `guid` BETWEEN 3009346 AND 3009349;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
(3009346,194468,530,0,0,1,1,-1892.86,5669.2,127.458,0.785397,0,0,0.382683,0.92388,120,255,1),
(3009347,194468,530,0,0,1,1,-2045.01,5568.72,53.3837,5.09636,0,0,-0.559193,0.829038,120,255,1),
(3009348,38491,33,0,0,1,1,-344.818,2035.34,16.9989,3.55175,0,0,-0.979045,0.203644,7200,255,1),
(3009349,4090,534,0,0,1,1,4983.69,-1768.3,1329.4,1.7017,0,0,0.75184,0.659346,604800,255,1);
