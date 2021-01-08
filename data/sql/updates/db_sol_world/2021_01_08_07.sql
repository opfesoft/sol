-- DB update 2021_01_08_06 -> 2021_01_08_07
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_08_06';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_08_06 2021_01_08_07 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610117297773070380'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610117297773070380');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (922,1082,757,9916,750,752,5477,1088,768,1087,5622,763,761,17115,862,14448,1084,858,767,764,1081,765);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (922,1082,757,14447,9916,750,752,5477,1088,768,1087,5622,763,761,17115,862,14448,1084,858,767,764,1081,765) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(922,0,0,0,0,0,100,0,2800,3400,8800,9400,0,11,50245,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Silt Crawler - IC - Cast ''Pin'''),

(1082,0,0,0,4,0,100,1,0,0,0,0,0,11,50433,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sawtooth Crocolisk - On Aggro - Cast ''Bad Attitude'' (No Repeat)'),

(757,0,0,0,0,0,100,0,2800,4400,9200,9900,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lost One Fisherman - IC - Cast ''Thrash'''),

(14447,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gilmorian - On Respawn - Set Active On'),
(14447,0,1,0,0,0,100,0,2700,4800,9600,12700,0,11,13579,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Gilmorian - IC - Cast ''Gouge'''),

(9916,0,0,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jarquia - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(750,0,0,0,0,0,100,0,2700,3400,11700,13400,0,11,9612,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Marsh Inkspewer - IC - Cast ''Ink Spray'''),

(752,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marsh Oracle - OOC - Cast ''Lightning Shield'''),
(752,0,1,0,0,0,100,0,0,0,8700,9600,0,11,9532,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Marsh Oracle - IC - Cast ''Lightning Bolt'''),
(752,0,2,0,2,0,100,1,0,40,0,0,0,11,11986,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marsh Oracle - Between 0-40% Health - Cast ''Healing Wave'' (No Repeat)'),

(5477,0,0,0,0,0,100,0,2800,4400,9200,9900,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noboru the Cudgel - IC - Cast ''Thrash'''),

(1088,0,0,0,0,0,100,0,2800,3400,8800,9400,0,11,50245,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Monstrous Crawler - IC - Cast ''Pin'''),

(768,0,0,0,0,0,100,0,2300,2700,9700,12700,0,11,51772,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Shadow Panther - IC - Cast ''Claw'''),

(1087,0,0,0,2,0,100,1,0,60,0,0,0,11,3604,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sawtooth Snapper - Between 0-60% Health - Cast ''Tendon Rip'' (No Repeat)'),

(5622,0,0,0,0,0,100,0,2800,4400,9200,9900,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ongeku - IC - Cast ''Thrash'''),

(763,0,0,0,0,0,100,0,2700,3400,17700,18400,0,11,11977,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Lost One Chieftain - IC - Cast ''Rend'''),

(761,0,0,0,2,0,100,1,0,90,0,0,0,11,8376,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lost One Seer - Between 0-90% Health - Cast ''Earthgrab Totem'' (No Repeat)'),
(761,0,1,0,2,0,100,1,0,45,0,0,0,11,4971,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lost One Seer - Between 0-45% Health - Cast ''Healing Ward'' (No Repeat)'),

(17115,0,0,0,0,0,100,1,0,0,0,0,0,11,14868,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cursed Lost One - IC - Cast ''Curse of Agony'' (No Repeat)'),
(17115,0,1,0,2,0,100,1,0,80,0,0,0,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cursed Lost One - Between 0-80% Health - Cast ''Disarm'' (No Repeat)'),

(862,0,0,0,0,0,100,0,2800,4400,9200,9900,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stonard Explorer - IC - Cast ''Thrash'''),

(14448,0,0,0,0,0,100,0,3800,4600,9800,13400,0,11,21748,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Molt Thorn - IC - Cast ''Thorn Volley'''),

(1084,0,0,0,4,0,100,1,0,0,0,0,0,11,50433,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Young Sawtooth Crocolisk - On Aggro - Cast ''Bad Attitude'' (No Repeat)'),

(858,0,0,0,0,0,100,1,0,0,0,0,0,11,745,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Sorrow Spinner - IC - Cast ''Web'' (No Repeat)'),
(858,0,1,0,0,0,100,0,2700,3100,32700,33100,0,11,744,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Sorrow Spinner - IC - Cast ''Poison'''),

(767,0,0,0,0,0,100,0,2300,2700,9700,12700,0,11,51772,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Swamp Jaguar - IC - Cast ''Claw'''),

(764,0,0,0,2,0,100,1,0,60,0,0,0,11,9616,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Swampwalker - Between 0-60% Health - Cast ''Wild Regeneration'' (No Repeat)'),

(1081,0,0,0,2,0,100,1,0,80,0,0,0,11,8138,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mire Lord - Between 0-80% Health - Cast ''Mirkfallon Fungus'' (No Repeat)'),

(765,0,0,0,2,0,100,1,0,60,0,0,0,11,9616,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Swampwalker Elder - Between 0-60% Health - Cast ''Wild Regeneration'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
