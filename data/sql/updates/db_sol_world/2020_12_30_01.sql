-- DB update 2020_12_30_00 -> 2020_12_30_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_30_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_30_00 2020_12_30_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609317484691253746'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609317484691253746');

UPDATE `creature_template` SET `unit_class` = 8 WHERE `entry` = 4619;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (3931,3736,6072,4619,3825,3815,3730,4789,4788,3812,3814,3809);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3931,3736,6072,4619,3825,3815,3730,4789,4788,3812,3814,3809) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3931,0,0,0,2,0,100,1,0,60,0,0,0,11,12160,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shadethicket Oracle - Between 0-60% Health - Cast ''Rejuvenation'' (No Repeat)'),

(3736,0,0,0,0,0,100,0,2100,2400,9800,12600,0,11,3602,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Darkslayer Mordenthal - IC - Cast ''Torch Burst'''),

(6072,0,0,0,0,0,100,0,2700,3400,11600,12400,0,11,37624,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Diathorus the Seeker - IC - Cast ''Carrion Swarm'''),
(6072,0,1,0,2,0,100,1,0,60,0,0,0,11,12542,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Diathorus the Seeker - Between 0-60% Health - Cast ''Fear'' (No Repeat)'),
(6072,0,2,0,2,0,100,1,0,30,0,0,0,11,17620,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Diathorus the Seeker - Between 0-30% Health - Cast ''Drain Life'' (No Repeat)'),

(4619,0,0,0,0,0,100,1,0,0,0,0,0,11,7098,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Geltharis - IC - Cast ''Curse of Mending'' (No Repeat)'),
(4619,0,1,0,0,0,100,0,0,0,10700,11300,0,11,35913,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Geltharis - IC - Cast ''Fel Fireball'''),
(4619,0,2,0,2,0,100,1,0,80,0,0,0,11,37628,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Geltharis - Between 0-80% Health - Cast ''Fel Immolate'' (No Repeat)'),
(4619,0,3,0,2,0,100,1,0,30,0,0,0,11,6925,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geltharis - Between 0-30% Health - Cast ''Gift of the Xavian'' (No Repeat)'),

(3825,0,0,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghostpaw Alpha - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(3815,0,0,0,2,0,100,1,0,60,0,0,0,11,8611,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blink Dragon - Between 0-60% Health - Cast ''Phase Shift'' (No Repeat)'),

(3730,0,0,0,0,0,100,0,1700,1900,8700,9600,0,11,3602,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Dark Strand Excavator - IC - Cast ''Torch Burst'''),

(4789,0,0,0,25,0,100,1,0,0,0,0,0,11,30991,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fallenroot Rogue - On Reset - Cast ''Stealth'' (No Repeat)'),
(4789,0,1,0,0,0,100,1,0,0,0,0,0,11,6205,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Fallenroot Rogue - IC - Cast ''Curse of Weakness'' (No Repeat)'),
(4789,0,2,0,67,0,100,0,8700,9600,0,0,0,11,6595,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Fallenroot Rogue - Is Behind Target - Cast ''Exploit Weakness'''),

(4788,0,0,0,4,0,100,0,0,0,0,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fallenroot Satyr - On Aggro - Cast ''Defensive Stance'''),
(4788,0,1,0,2,0,100,1,0,60,0,0,0,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Fallenroot Satyr - Between 0-60% Health - Cast ''Disarm'' (No Repeat)'),

(3812,0,0,0,0,0,100,0,2400,3100,8600,9900,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Clattering Crawler - IC - Cast ''Thrash'''),

(3814,0,0,0,0,0,100,0,2400,3100,8600,9900,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spined Crawler - IC - Cast ''Thrash'''),

(3809,0,0,0,0,0,100,0,2100,2400,9400,10800,0,11,15793,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ashenvale Bear - IC - Cast ''Maul''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
