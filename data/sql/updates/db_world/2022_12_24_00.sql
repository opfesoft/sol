DELETE FROM `creature` WHERE `guid` BETWEEN 3009149 AND 3009152; -- Add Invisible Stalkers
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009149,15214,590,0,0,1,1,0,0,6.62,-7.72,-16.22,3.15,120,0,1,0,0,0,0,0,0), -- "The Purple Princess"
(3009150,15214,589,0,0,1,1,0,0,6.57,-7.76,-16.23,3.19,120,0,1,0,0,0,0,0,0), -- "The Iron Eagle"
(3009151,15214,610,0,0,1,1,0,0,6.55,-7.72,-17.80,3.18,120,0,1,0,0,0,0,0,0), -- "The Cloudkisser"
(3009152,15214,613,0,0,1,1,0,0,6.55,-7.72,-17.80,3.20,120,0,1,0,0,0,0,0,0); -- "The Mighty Wind"

DELETE FROM `event_scripts` WHERE `id` IN (15312,15314,15318,15320,15322,15324,19126,19127,19137,19139) AND `command` = 16;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
-- "The Purple Princess", arrival in Tirisfal Glades
(15312,0,16,11804,0,15214,50,0,0,0),
-- "The Purple Princess", arrival in Stranglethorn Vale
(15314,0,16,11804,0,15214,50,0,0,0),
-- "The Thundercaller", arrival in Durotar
(15318,0,16,11804,0,15214,50,0,0,0),
-- "The Thundercaller", arrival in Tirisfal Glades
(15320,0,16,11804,0,15214,50,0,0,0),
-- "The Iron Eagle", arrival in Durotar
(15322,0,16,11804,0,15214,50,0,0,0),
-- "The Iron Eagle", arrival in Stranglethorn Vale
(15324,0,16,11804,0,15214,50,0,0,0),
-- "The Cloudkisser", arrival in Howling Fjord
(19126,0,16,11804,0,15214,50,0,0,0),
-- "The Cloudkisser", arrival in Tirisfal Glades
(19127,0,16,11804,0,15214,50,0,0,0),
-- "The Mighty Wind", arrival in Durotar
(19137,0,16,11804,0,15214,50,0,0,0),
-- "The Mighty Wind", arrival in Borean Tundra
(19139,0,16,11804,0,15214,50,0,0,0);
