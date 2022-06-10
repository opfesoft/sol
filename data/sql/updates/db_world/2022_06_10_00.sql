-- "Tipsy" McManus: Remove obsolete SAI and condition (handled via creature script)
UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 28566;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 28566;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` BETWEEN 2856601 AND 2856608;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 9713;

DELETE FROM `gameobject` WHERE `guid` = 3009033;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3009033,190643,571,0,0,1,1,5546.55,5768.0,-78.03,0,0,0,0,0,-1,100,1,0); -- Thunderbrew's Jungle Punch
