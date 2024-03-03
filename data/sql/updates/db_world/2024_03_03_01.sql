UPDATE `creature` SET `orientation` = 1.89283 WHERE `guid` = 203501;
UPDATE `creature` SET `orientation` = 3.20315 WHERE `guid` = 203502;
UPDATE `creature` SET `orientation` = 4.60703 WHERE `guid` = 203499;
UPDATE `creature` SET `orientation` = 5.92611 WHERE `guid` = 203498;
UPDATE `creature` SET `orientation` = 5.1734 WHERE `guid` = 203505;
UPDATE `creature` SET `orientation` = 1.67791 WHERE `guid` = 203500;
UPDATE `creature` SET `orientation` = 2.55305 WHERE `guid` = 203504;

DELETE FROM `creature` WHERE `guid` IN (3009684,3009685);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
(3009684,24013,571,0,0,1,1,17311,0,2636.69,-3701.58,245.683,6.26878,300,0,1,0,0,0,0,0),
(3009685,24013,571,0,0,1,1,17311,0,2656.06,-3728.26,247.305,1.23435,300,0,1,0,0,0,0,0);
