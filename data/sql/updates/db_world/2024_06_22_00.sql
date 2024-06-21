UPDATE `creature_text` SET `Language` = 1 WHERE `CreatureID` = 4949;
DELETE FROM `creature_text` WHERE `CreatureId` = 10719;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(10719,0,0,'Honor your heroes! On this day, they have dealt a great blow against one of our most hated enemies! The false Warchief, Rend Blackhand, has fallen!',14,1,100,22,0,0,6013,0,'Herald of Thrall');

DELETE FROM `creature` WHERE `guid` = 3009704;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
(3009704,10719,1,0,0,1,1,0,0,-462.404,-2637.68,96.0659,5.8606,300,0,1,0,0,0,0,0);
