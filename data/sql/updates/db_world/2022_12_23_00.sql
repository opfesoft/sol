UPDATE `creature_text` SET `Emote` = 22, `Sound` = 0 WHERE `CreatureID` IN (3149,3150,9564,9566,12136,12137,26537,26538,26539,26540) AND `GroupID` = 0;

DELETE FROM `event_scripts` WHERE `id` IN (15312,15314,15318,15320,15322,15324,19126,19127,19137,19139);
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
-- "The Purple Princess", arrival in Tirisfal Glades
(15312,0,16,11804,2,0,0,0,0,0),
(15312,2,51,1,1,3150,50,0,0,0),
-- "The Purple Princess", arrival in Stranglethorn Vale
(15314,0,16,11804,2,0,0,0,0,0),
(15314,2,51,1,1,12137,50,0,0,0),
-- "The Thundercaller", arrival in Durotar
(15318,0,16,11804,2,0,0,0,0,0),
(15318,2,51,1,1,9564,50,0,0,0),
-- "The Thundercaller", arrival in Tirisfal Glades
(15320,0,16,11804,2,0,0,0,0,0),
(15320,2,51,1,1,9566,50,0,0,0),
-- "The Iron Eagle", arrival in Durotar
(15322,0,16,11804,2,0,0,0,0,0),
(15322,2,51,1,1,12136,50,0,0,0),
-- "The Iron Eagle", arrival in Stranglethorn Vale
(15324,0,16,11804,2,0,0,0,0,0),
(15324,2,51,1,1,3149,50,0,0,0),
-- "The Cloudkisser", arrival in Howling Fjord
(19126,0,16,11804,2,0,0,0,0,0),
(19126,2,51,1,1,26540,50,0,0,0),
-- "The Cloudkisser", arrival in Tirisfal Glades
(19127,0,16,11804,2,0,0,0,0,0),
(19127,2,51,1,1,26539,50,0,0,0),
-- "The Mighty Wind", arrival in Durotar
(19137,0,16,11804,2,0,0,0,0,0),
(19137,2,51,1,1,26537,50,0,0,0),
-- "The Mighty Wind", arrival in Borean Tundra
(19139,0,16,11804,2,0,0,0,0,0),
(19139,2,51,1,1,26538,50,0,0,0);
