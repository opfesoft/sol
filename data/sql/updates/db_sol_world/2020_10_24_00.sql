-- DB update 2020_10_23_01 -> 2020_10_24_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_10_23_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_10_23_01 2020_10_24_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1603575199372731035'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1603575199372731035');

-- Disable L70ETC outside of Shattrath (this was a one time event during BlizzCon 2007)
UPDATE `game_event` SET `start_time` = '2007-08-03 08:00:00', `end_time` = '2007-08-04 17:00:00', `occurence` = 60 WHERE `eventEntry` = 32;

DELETE FROM `game_event` WHERE `eventEntry` IN (46,47);
INSERT INTO `game_event` (`eventEntry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `holidayStage`, `description`, `world_event`, `announce`)
VALUES
(46,'2010-09-07 20:50:00',NULL,180,16,0,0,'L70ETC Announcement - Shattrath (World''s End Tavern)',0,2),
(47,'2010-09-07 21:00:00',NULL,180,6,0,0,'L70ETC Performance - Shattrath (World''s End Tavern)',0,2);

DELETE FROM `creature_text` WHERE `CreatureID` = 19270 AND `GroupID` BETWEEN 1 AND 4;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(19270,1,0,'TAUREN CHIEFTAINS! Playing LIVE, in the WORLD''S END TAVERN! Be there, at the top of the hour! Banished from Shattrath? SNEAK BACK IN!',14,0,100,22,0,0,28504,2,'Shattrath Saul'),
(19270,2,0,'Are you ready to rock? Then head over to the World''s End Tavern! The Tauren Chieftains start their show at the top of the hour.',14,0,100,22,0,0,28496,2,'Shattrath Saul'),
(19270,3,0,'Who? The Tauren Chieftains! What? A live performance! Where? The World''s End Tavern! When? The top of the hour! BE THERE!',14,0,100,22,0,0,28502,2,'Shattrath Saul'),
(19270,4,0,'Now, in Shattrath City: The Tauren Chieftains! Playing in the World''s End Tavern at the top of the hour!',14,0,100,22,0,0,28481,2,'Shattrath Saul');

DELETE FROM `creature` WHERE `guid` = 124103;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(124103,28206,530,0,0,1,1,0,0,-1749.92,5134.53,-36.2611,1.85192,300,0,1,0,0,0,0,0,12340);

DELETE FROM `game_event_creature` WHERE `eventEntry` = 46;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`)
VALUES
(46,124103);

DELETE FROM `creature_summon_groups` WHERE `summonerId` = 19270;
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`)
VALUES
(19270,0,0,23850,-1750.72,5136.825,-36.17796,2.111848,3,360000),
(19270,0,0,23853,-1749.081,5137.796,-36.17796,2.076942,3,360000),
(19270,0,0,23855,-1749.921,5134.271,-36.17796,2.042035,3,360000),
(19270,0,0,23845,-1745.396,5136.415,-36.17797,2.024582,3,360000),
(19270,0,0,23854,-1752.908,5136.067,-36.17797,2.042035,3,360000),
(19270,0,0,23830,-1750.518,5136.135,-36.17796,2.076942,3,360000),
(19270,0,0,23852,-1754.977,5133.365,-36.17797,1.937315,3,360000),
(19270,0,0,23623,-1749.92,5134.53,-36.2611,1.85192,3,360000),
(19270,0,0,23625,-1749.28,5138.05,-36.2611,1.826,3,360000),
(19270,0,0,23626,-1752.7,5136.19,-36.2612,1.80244,3,360000),
(19270,0,0,23624,-1755.31,5133.44,-36.2612,1.77574,3,360000),
(19270,0,0,23619,-1745.25,5136.43,-36.2613,1.99015,3,360000);

DELETE FROM `smart_scripts` WHERE `entryorguid` = 19270 AND `source_type` = 0 AND `id` BETWEEN 2 AND 4;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (23619,23623,23624,23625,23626,23830) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1927001,1927002) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19270,0,2,0,68,0,100,0,46,0,0,0,0,80,1927001,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shattrath Saul - On Event 46 Start - Call Timed Action List'),
(19270,0,3,0,68,0,100,0,47,0,0,0,0,80,1927002,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shattrath Saul - On Event 47 Start - Call Timed Action List'),
(19270,0,4,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shattrath Saul - On Respawn - Set Active On'),

(1927001,9,0,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shattrath Saul - On Script - Say Line 1'),
(1927001,9,1,0,0,0,100,0,120000,120000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shattrath Saul - On Script - Say Line 2'),
(1927001,9,2,0,0,0,100,0,120000,120000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shattrath Saul - On Script - Say Line 3'),
(1927001,9,3,0,0,0,100,0,120000,120000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shattrath Saul - On Script - Say Line 4'),

(1927002,9,0,0,0,0,100,0,0,0,0,0,0,107,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Shattrath Saul - On Script - Summon Creature Group 0'),

(23619,0,0,0,11,0,100,1,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - On Respawn - Set Visibility Off'),
(23619,0,1,2,1,0,100,1,28000,28000,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Set Visibility On'),
(23619,0,2,0,61,0,100,1,0,0,0,0,0,11,42505,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - Linked - Cast ''L70ETC Flare Effect'''),
(23619,0,3,0,1,0,100,1,36500,36500,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Play Emote 402'),
(23619,0,4,0,1,0,100,1,42505,42505,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Play Emote 403'),
(23619,0,5,0,1,0,100,1,80500,80500,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Play Emote 404'),
(23619,0,6,0,1,0,100,1,94000,94000,0,0,0,5,405,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Play Emote 405'),
(23619,0,7,0,1,0,100,1,113500,113500,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Play Emote 402'),
(23619,0,8,0,1,0,100,1,137100,137100,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Play Emote 403'),
(23619,0,9,0,1,0,100,1,149000,149000,0,0,0,11,34126,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Cast ''Spotlight'''),
(23619,0,10,0,1,0,100,1,158300,158300,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Play Emote 404'),
(23619,0,11,0,1,0,100,1,172700,172700,0,0,0,5,405,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Play Emote 405'),
(23619,0,12,0,1,0,100,1,197500,197500,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Play Emote 402'),
(23619,0,13,0,1,0,100,1,213000,213000,0,0,0,28,34126,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Remove ''Spotlight'''),
(23619,0,14,0,1,0,100,1,220500,220500,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Play Emote 403'),
(23619,0,15,0,1,0,100,1,240500,240500,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Play Emote 404'),
(23619,0,16,0,1,0,100,1,256500,256500,0,0,0,5,405,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Play Emote 405'),
(23619,0,17,0,1,0,100,1,275500,275500,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Play Emote 402'),
(23619,0,18,0,1,0,100,1,280000,280000,0,0,0,11,42505,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Cast ''L70ETC Flare Effect'''),
(23619,0,19,0,1,0,100,1,280800,280800,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bergrisst - OOC - Set Visibility Off'),

(23623,0,0,0,11,0,100,1,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - On Respawn - Set Visibility Off'),
(23623,0,1,2,1,0,100,1,24000,24000,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Set Visibility On'),
(23623,0,2,3,61,0,100,1,0,0,0,0,0,47,0,0,0,0,0,0,11,28206,5,0,0,0,0,0,0,'Chief Thunder-Skins - Linked - Set Visibility Off ''[DND] L70ETC Drums'''),
(23623,0,3,0,61,0,100,1,0,0,0,0,0,11,42505,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - Linked - Cast ''L70ETC Flare Effect'''),
(23623,0,4,0,1,0,100,1,34200,34200,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Play Emote 402'),
(23623,0,5,0,1,0,100,1,48700,48700,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Play Emote 403'),
(23623,0,6,0,1,0,100,1,61000,61000,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Play Emote 404'),
(23623,0,7,0,1,0,100,1,73000,73000,0,0,0,5,405,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Play Emote 405'),
(23623,0,8,0,1,0,100,1,95700,95700,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Play Emote 402'),
(23623,0,9,0,1,0,100,1,120100,120100,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Play Emote 404'),
(23623,0,10,0,1,0,100,1,132000,132000,0,0,0,5,405,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Play Emote 405'),
(23623,0,11,0,1,0,100,1,152500,152500,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Play Emote 402'),
(23623,0,12,0,1,0,100,1,165600,165600,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Play Emote 403'),
(23623,0,13,0,1,0,100,1,178900,178900,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Play Emote 404'),
(23623,0,14,0,1,0,100,1,190300,190300,0,0,0,5,405,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Play Emote 405'),
(23623,0,15,0,1,0,100,1,209800,209800,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Play Emote 402'),
(23623,0,16,0,1,0,100,1,223600,223600,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Play Emote 403'),
(23623,0,17,0,1,0,100,1,237000,237000,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Play Emote 404'),
(23623,0,18,0,1,0,100,1,251300,251300,0,0,0,5,405,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Play Emote 405'),
(23623,0,19,0,1,0,100,1,271400,271400,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Play Emote 402'),
(23623,0,20,0,1,0,100,1,280000,280000,0,0,0,11,42505,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Cast ''L70ETC Flare Effect'''),
(23623,0,21,22,1,0,100,1,280800,280800,0,0,0,47,1,0,0,0,0,0,11,28206,5,0,0,0,0,0,0,'Chief Thunder-Skins - OOC - Set Visibility On ''[DND] L70ETC Drums'''),
(23623,0,22,0,61,0,100,1,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Thunder-Skins - Linked - Set Visibility Off'),

(23624,0,0,0,11,0,100,1,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - On Respawn - Set Visibility Off'),
(23624,0,1,2,1,0,100,1,13000,13000,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Set Visibility On'),
(23624,0,2,0,61,0,100,1,0,0,0,0,0,11,42505,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - Linked - Cast ''L70ETC Flare Effect'''),
(23624,0,3,0,1,0,100,1,24700,24700,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Play Emote 402'),
(23624,0,4,0,1,0,100,1,38600,38600,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Play Emote 403'),
(23624,0,5,0,1,0,100,1,52700,52700,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Play Emote 404'),
(23624,0,6,0,1,0,100,1,73700,73700,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Play Emote 402'),
(23624,0,7,0,1,0,100,1,90000,90000,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Play Emote 403'),
(23624,0,8,0,1,0,100,1,105200,105200,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Play Emote 404'),
(23624,0,9,0,1,0,100,1,108000,108000,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Play Emote 402'),
(23624,0,10,0,1,0,100,1,146400,146400,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Play Emote 403'),
(23624,0,11,0,1,0,100,1,160000,160000,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Play Emote 404'),
(23624,0,12,0,1,0,100,1,182000,182000,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Play Emote 402'),
(23624,0,13,0,1,0,100,1,199400,199400,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Play Emote 403'),
(23624,0,14,0,1,0,100,1,215200,215200,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Play Emote 404'),
(23624,0,15,0,1,0,100,1,234700,234700,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Play Emote 402'),
(23624,0,16,0,1,0,100,1,251200,251200,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Play Emote 403'),
(23624,0,17,0,1,0,100,1,265400,265400,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Play Emote 404'),
(23624,0,18,0,1,0,100,1,280000,280000,0,0,0,11,42505,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Cast ''L70ETC Flare Effect'''),
(23624,0,19,0,1,0,100,1,280800,280800,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mai''Kyl - OOC - Set Visibility Off'),

(23625,0,0,0,11,0,100,1,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - On Respawn - Set Visibility Off'),
(23625,0,1,2,1,0,100,1,10000,10000,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Set Visibility On'),
(23625,0,2,0,61,0,100,1,0,0,0,0,0,11,42505,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - Linked - Cast ''L70ETC Flare Effect'''),
(23625,0,3,0,1,0,100,1,29400,29400,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Play Emote 403'),
(23625,0,4,0,1,0,100,1,49500,49500,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Play Emote 404'),
(23625,0,5,0,1,0,100,1,72000,72000,0,0,0,5,405,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Play Emote 405'),
(23625,0,6,0,1,0,100,1,86400,86400,0,0,0,5,406,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Play Emote 406'),
(23625,0,7,0,1,0,100,1,95200,95200,0,0,0,5,407,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Play Emote 407'),
(23625,0,8,0,1,0,100,1,117400,117400,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Play Emote 402'),
(23625,0,9,0,1,0,100,1,124500,124500,0,0,0,11,42510,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Cast ''L70ETC Call Lightning'''),
(23625,0,10,0,1,0,100,1,128400,128400,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Play Emote 403'),
(23625,0,11,0,1,0,100,1,148000,148000,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Play Emote 404'),
(23625,0,12,0,1,0,100,1,171800,171800,0,0,0,5,405,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Play Emote 405'),
(23625,0,13,0,1,0,100,1,184500,184500,0,0,0,5,406,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Play Emote 406'),
(23625,0,14,0,1,0,100,1,196100,196100,0,0,0,5,407,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Play Emote 407'),
(23625,0,15,0,1,0,100,1,227500,227500,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Play Emote 403'),
(23625,0,16,0,1,0,100,1,246300,246300,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Play Emote 404'),
(23625,0,17,0,1,0,100,1,272800,272800,0,0,0,5,405,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Play Emote 405'),
(23625,0,18,0,1,0,100,1,280000,280000,0,0,0,11,42505,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Cast ''L70ETC Flare Effect'''),
(23625,0,19,0,1,0,100,1,280800,280800,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samuro - OOC - Set Visibility Off'),

(23626,0,0,0,11,0,100,1,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - On Respawn - Set Visibility Off'),
(23626,0,1,2,1,0,100,1,13000,13000,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Set Visibility On'),
(23626,0,2,0,61,0,100,1,0,0,0,0,0,11,42505,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - Linked - Cast ''L70ETC Flare Effect'''),
(23626,0,3,0,1,0,100,1,22700,22700,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Play Emote 402'),
(23626,0,4,0,1,0,100,1,38600,38600,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Play Emote 403'),
(23626,0,5,0,1,0,100,1,49700,49700,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Play Emote 404'),
(23626,0,6,0,1,0,100,1,63600,63600,0,0,0,5,405,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Play Emote 405'),
(23626,0,7,0,1,0,100,1,89700,89700,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Play Emote 402'),
(23626,0,8,0,1,0,100,1,102600,102600,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Play Emote 403'),
(23626,0,9,0,1,0,100,1,114900,114900,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Play Emote 404'),
(23626,0,10,0,1,0,100,1,129500,129500,0,0,0,5,405,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Play Emote 405'),
(23626,0,11,0,1,0,100,1,155800,155800,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Play Emote 402'),
(23626,0,12,0,1,0,100,1,170800,170800,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Play Emote 403'),
(23626,0,13,0,1,0,100,1,182300,182300,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Play Emote 404'),
(23626,0,14,0,1,0,100,1,196100,196100,0,0,0,5,405,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Play Emote 405'),
(23626,0,15,0,1,0,100,1,223500,223500,0,0,0,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Play Emote 402'),
(23626,0,16,0,1,0,100,1,239200,239200,0,0,0,5,403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Play Emote 403'),
(23626,0,17,0,1,0,100,1,251000,251000,0,0,0,5,404,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Play Emote 404'),
(23626,0,18,0,1,0,100,1,264600,264600,0,0,0,5,405,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Play Emote 405'),
(23626,0,19,0,1,0,100,1,280000,280000,0,0,0,11,42505,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Cast ''L70ETC Flare Effect'''),
(23626,0,20,0,1,0,100,1,280800,280800,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sig Nicious - OOC - Set Visibility Off'),

(23830,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DNT] L70ETC FX Controller - On Respawn - Set Active On'),
(23830,0,1,0,1,0,100,1,9400,9400,0,0,0,216,11803,1,0,0,0,0,18,40,0,0,0,0,0,0,0,'[DNT] L70ETC FX Controller - OOC - Play Music 11803'),
(23830,0,2,0,1,0,100,1,10000,10000,0,0,0,11,42500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DNT] L70ETC FX Controller - OOC - Cast ''L70ETC Lightning Cloud'''),
(23830,0,3,0,1,0,100,1,13600,13600,0,0,0,11,42499,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DNT] L70ETC FX Controller - OOC - Cast ''L70ETC Earthquake'''),
(23830,0,4,0,1,0,100,1,18000,18000,0,0,0,11,42501,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DNT] L70ETC FX Controller - OOC - Cast ''L70ETC Rain of Fire'''),
(23830,0,5,0,1,0,100,1,79100,79100,0,0,0,11,42500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DNT] L70ETC FX Controller - OOC - Cast ''L70ETC Lightning Cloud'''),
(23830,0,6,0,1,0,100,1,83500,83500,0,0,0,11,42499,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DNT] L70ETC FX Controller - OOC - Cast ''L70ETC Earthquake'''),
(23830,0,7,0,1,0,100,1,87900,87900,0,0,0,11,42501,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DNT] L70ETC FX Controller - OOC - Cast ''L70ETC Rain of Fire'''),
(23830,0,8,0,1,0,100,1,133200,133200,0,0,0,11,42500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DNT] L70ETC FX Controller - OOC - Cast ''L70ETC Lightning Cloud'''),
(23830,0,9,0,1,0,100,1,137600,137600,0,0,0,11,42499,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DNT] L70ETC FX Controller - OOC - Cast ''L70ETC Earthquake'''),
(23830,0,10,0,1,0,100,1,142300,142300,0,0,0,11,42501,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DNT] L70ETC FX Controller - OOC - Cast ''L70ETC Rain of Fire'''),
(23830,0,11,0,1,0,100,1,238500,238500,0,0,0,11,42500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DNT] L70ETC FX Controller - OOC - Cast ''L70ETC Lightning Cloud'''),
(23830,0,12,0,1,0,100,1,242900,242900,0,0,0,11,42499,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DNT] L70ETC FX Controller - OOC - Cast ''L70ETC Earthquake'''),
(23830,0,13,0,1,0,100,1,247300,247300,0,0,0,11,42501,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DNT] L70ETC FX Controller - OOC - Cast ''L70ETC Rain of Fire'''),
(23830,0,14,0,1,0,100,1,251700,251700,0,0,0,11,42500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DNT] L70ETC FX Controller - OOC - Cast ''L70ETC Lightning Cloud'''),
(23830,0,15,0,1,0,100,1,256100,256100,0,0,0,11,42499,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DNT] L70ETC FX Controller - OOC - Cast ''L70ETC Earthquake'''),
(23830,0,16,0,1,0,100,1,260500,260500,0,0,0,11,42501,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DNT] L70ETC FX Controller - OOC - Cast ''L70ETC Rain of Fire''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
