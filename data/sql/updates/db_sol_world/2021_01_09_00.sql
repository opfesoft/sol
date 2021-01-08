-- DB update 2021_01_08_08 -> 2021_01_09_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_08_08';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_08_08 2021_01_09_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610149956005881063'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610149956005881063');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (7669,6011,7671,5984,5974,751,5976,285,13159,735,525,6093,118,880,822);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (7669,6011,5977,7671,5984,5974,751,5976,285,13159,735,525,6093,118,880,822) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7669,0,0,0,0,0,100,0,3600,4200,9800,12700,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Grol - IC - Cast ''Thrash'''),

(6011,0,0,0,0,0,100,1,0,0,0,0,0,11,22120,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Felguard Sentry - IC - Cast ''Charge'' (No Repeat)'),
(6011,0,1,0,0,0,100,0,2700,4100,9800,12900,0,11,15496,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Felguard Sentry - IC - Cast ''Cleave'''),

(5977,0,0,0,0,0,100,1,0,0,0,0,0,11,11960,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Dreadmaul Mauler - IC - Cast ''Curse of the Dreadmaul'' (No Repeat)'),
(5977,0,1,0,0,0,100,0,2700,4300,9800,12400,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dreadmaul Mauler - IC - Cast ''Thrash'''),
(5977,0,2,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dreadmaul Mauler - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(7671,0,0,0,0,0,100,0,3600,4200,9800,12700,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Sevine - IC - Cast ''Thrash'''),

(5984,0,0,0,0,0,100,0,2700,4300,32700,34300,0,11,7367,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Starving Snickerfang - IC - Cast ''Infected Bite'''),

(5974,0,0,0,0,0,100,1,0,0,0,0,0,11,11960,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Dreadmaul Ogre - IC - Cast ''Curse of the Dreadmaul'' (No Repeat)'),
(5974,0,1,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dreadmaul Ogre - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(751,0,0,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marsh Flesheater - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(5976,0,0,0,0,0,100,1,0,0,0,0,0,11,11960,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Dreadmaul Brute - IC - Cast ''Curse of the Dreadmaul'' (No Repeat)'),
(5976,0,1,0,0,0,100,0,2700,4300,9800,12400,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dreadmaul Brute - IC - Cast ''Thrash'''),
(5976,0,2,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dreadmaul Brute - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(285,0,0,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Murloc - Between 0-15% Health - Flee For Assist (No Repeat)'),

(13159,0,0,0,0,0,100,0,4800,6900,11700,14500,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'James Clark - IC - Cast ''Thrash'''),

(735,0,0,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Murloc Streamrunner - Between 0-15% Health - Flee For Assist (No Repeat)'),

(525,0,0,0,2,0,100,1,0,60,0,0,0,11,3604,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mangy Wolf - Between 0-60% Health - Cast ''Tendon Rip'' (No Repeat)'),

(6093,0,0,0,0,0,100,0,4800,6900,11700,14500,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dead-Tooth Jack - IC - Cast ''Thrash'''),

(118,0,0,0,2,0,100,1,0,60,0,0,0,11,3604,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Prowler - Between 0-60% Health - Cast ''Tendon Rip'' (No Repeat)'),

(880,0,0,0,0,0,100,0,4800,6900,11700,14500,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Erlan Drudgemoor - IC - Cast ''Thrash''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
