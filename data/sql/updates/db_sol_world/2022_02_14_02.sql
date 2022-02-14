-- DB update 2022_02_14_01 -> 2022_02_14_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_14_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_14_01 2022_02_14_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1644878338009510939'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1644878338009510939');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (3258,3260,3261,3263);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3258,0,0,0,9,0,100,0,5,30,2300,3900,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bristleback Hunter - Within 5-30 Range - Cast ''Shoot'''),
(3258,0,1,0,0,0,100,0,9000,14000,9000,14000,0,11,8806,32,0,0,0,0,5,0,0,0,0,0,0,0,0,'Bristleback Hunter - IC - Cast ''Poisoned Shot'''),
(3258,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Bristleback Hunter - Between 0-15% Health - Flee For Assist (No Repeat)'),

(3260,0,0,0,0,0,100,0,5000,13000,10000,16000,0,11,12748,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bristleback Water Seeker - IC - Cast ''Frost Nova'''),
(3260,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Bristleback Water Seeker - Between 0-15% Health - Flee For Assist (No Repeat)'),

(3261,0,0,0,4,0,100,0,0,0,0,0,0,11,782,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bristleback Thornweaver - On Aggro - Cast ''Thorns'''),
(3261,0,1,0,0,0,100,0,5000,9000,10000,16000,0,11,12747,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Bristleback Thornweaver - IC - Cast ''Entangling Roots'''),
(3261,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Bristleback Thornweaver - Between 0-15% Health - Flee For Assist (No Repeat)'),

(3263,0,0,0,0,0,100,0,0,0,3400,4800,0,11,20793,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bristleback Geomancer - IC - Cast ''Fireball'''),
(3263,0,1,0,0,0,100,0,5000,6500,17000,22000,0,11,4979,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bristleback Geomancer - IC - Cast ''Quick Flame Ward'''),
(3263,0,2,0,0,0,100,0,8000,13000,18000,25000,0,11,20794,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bristleback Geomancer - IC - Cast ''Flamestrike'''),
(3263,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Bristleback Geomancer - Between 0-15% Health - Flee For Assist (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
