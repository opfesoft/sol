-- DB update 2021_01_08_07 -> 2021_01_08_08
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_08_07';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_08_07 2021_01_08_08 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610130388393387516'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610130388393387516');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (14272,898,213,1871,521,923,7053,7056,6250,7052,831,830,596,1216,199);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (14273,14272,898,213,1871,521,923,7053,7056,6250,7052,831,830,596,1216,199) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14273,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Boulderheart - On Respawn - Set Active On'),
(14273,0,1,0,9,0,100,0,5,30,3000,4000,1,11,9483,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Boulderheart - Within 5-30 Range - Cast ''Boulder'''),

(14272,0,0,0,0,0,100,0,2800,3400,9600,11200,0,11,8873,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Snarlflare - IC - Cast ''Flame Breath'''),

(898,0,0,0,0,0,100,1,0,0,0,0,0,11,58867,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Nightbane Worgen - IC - Cast ''Spirit Wolf Leap'' (No Repeat)'),

(213,0,0,0,2,0,100,1,0,80,0,0,0,11,3149,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Starving Dire Wolf - Between 0-80% Health - Cast ''Furious Howl'' (No Repeat)'),

(1871,0,0,0,0,0,100,0,5700,6900,14500,17800,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eliza''s Guard - IC - Cast ''Thrash'''),

(521,0,0,0,2,0,100,1,0,80,0,0,0,11,3149,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lupos - Between 0-80% Health - Cast ''Furious Howl'' (No Repeat)'),

(923,0,0,0,2,0,100,1,0,80,0,0,0,11,3149,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Young Black Ravager - Between 0-80% Health - Cast ''Furious Howl'' (No Repeat)'),

(7053,0,0,0,0,0,100,0,3100,4700,9600,12500,0,11,14873,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Klaven Mortwake - IC - Cast ''Sinister Strike'''),

(7056,0,0,0,1,0,100,1,1000,1500,0,0,0,11,22766,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Defias Tower Sentry - Out of Combat - Cast ''Sneak'' (No Repeat)'),

(6250,0,0,0,0,0,100,0,2800,3400,8800,9400,0,11,50245,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Crawler - IC - Cast ''Pin'''),

(7052,0,0,0,0,0,100,0,3100,4700,8600,10100,0,11,5679,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Defias Tower Patroller - IC - Cast ''Torch Burn'''),

(831,0,0,0,0,0,100,0,2800,3400,8800,9400,0,11,50245,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Sea Crawler - IC - Cast ''Pin'''),

(830,0,0,0,0,0,100,0,2800,3400,8800,9400,0,11,50245,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Sand Crawler - IC - Cast ''Pin'''),

(596,0,0,0,1,0,100,0,0,0,1000,1000,0,11,6117,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brainwashed Noble - OOC - Cast ''Mage Armor'''),
(596,0,1,0,0,0,100,0,2300,4100,7400,9800,0,11,20883,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Brainwashed Noble - IC - Cast ''Arcane Blast'''),

(1216,0,0,0,0,0,100,0,2800,3400,8800,9400,0,11,50245,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Shore Crawler - IC - Cast ''Pin'''),

(199,0,0,0,2,0,100,1,0,60,0,0,0,11,31273,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Young Fleshripper - Between 0-60% Health - Cast ''Screech'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
