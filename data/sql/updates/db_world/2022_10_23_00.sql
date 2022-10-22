DELETE FROM `gameobject` WHERE `guid` = 3009035;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3009035,177793,1,0,0,1,1,7838.95,-259.246,-26.4806,0.191986,0,0,0.095846,0.995396,900,100,1,0);

UPDATE `gameobject_template_addon` SET `faction` = 83 WHERE `entry` IN (177790,177794);
UPDATE `gameobject_template_addon` SET `faction` = 84 WHERE `entry` IN (177792,177844);

UPDATE `quest_poi` SET `WorldMapAreaId` = 11 WHERE `QuestID` = 30 AND `id` = 2;
UPDATE `quest_poi_points` SET `X` = 842, `Y` = 2208 WHERE `QuestID` = 30 AND `Idx1` = 1;
UPDATE `quest_poi_points` SET `X` = 1050, `Y` = -3119 WHERE `QuestID` = 30 AND `Idx1` = 2;

UPDATE `quest_poi` SET `MapID` = 0, `WorldMapAreaId` = 39 WHERE `QuestID` = 272 AND `id` = 2;
UPDATE `quest_poi_points` SET `X` = 7838, `Y` = -259 WHERE `QuestID` = 272 AND `Idx1` = 1;
UPDATE `quest_poi_points` SET `X` = -10172, `Y` = 2391 WHERE `QuestID` = 272 AND `Idx1` = 2;
