UPDATE `creature_text` SET `Sound` = 0 WHERE `CreatureID` IN (34765,34766) AND `GroupID` = 0;

DELETE FROM `creature` WHERE `guid` = 3009162; -- Add Invisible Stalker
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009162,15214,647,0,0,1,1,0,0,6.57,-7.82,-16.21,3.15,120,0,1,0,0,0,0,0,0);

DELETE FROM `event_scripts` WHERE `id` IN (21868,21870) AND `command` = 16;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
-- Arrival in Orgrimmar (Durotar)
(21868,0,16,11804,0,15214,50,0,0,0),
-- Arrival in Thunder Bluff (Mulgore)
(21870,0,16,11804,0,15214,50,0,0,0);
