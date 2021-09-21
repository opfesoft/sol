-- DB update 2021_09_21_00 -> 2021_09_21_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_21_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_21_00 2021_09_21_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1632206654725965179'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1632206654725965179');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (3752,3754,3755,3757,10647);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3752,0,0,0,67,0,100,0,10000,13000,0,0,0,11,6595,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Xavian Rogue - Behind Target - Cast ''Exploit Weakness'''),
(3752,0,1,0,2,0,100,0,0,30,12000,19000,0,11,6925,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Xavian Rogue - Between 0-30% Health - Cast ''Gift of the Xavian'''),

(3754,0,0,0,0,0,100,0,7100,9400,23900,37400,0,11,5242,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Xavian Betrayer - IC - Cast ''Battle Shout'''),
(3754,0,1,0,2,0,100,0,0,30,12000,19000,0,11,6925,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Xavian Betrayer - Between 0-30% Health - Cast ''Gift of the Xavian'''),

(3755,0,0,0,0,0,100,0,1000,2200,2300,6100,0,11,6223,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Xavian Felsworn - IC - Cast ''Corruption'''),
(3755,0,1,0,2,0,100,0,0,30,12000,19000,0,11,6925,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Xavian Felsworn - Between 0-30% Health - Cast ''Gift of the Xavian'''),

(3757,0,0,0,0,0,100,0,0,0,3400,4800,0,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Xavian Hellcaller - IC - Cast ''Fireball'''),
(3757,0,1,0,2,0,100,0,0,30,12000,19000,0,11,6925,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Xavian Hellcaller - Between 0-30% Health - Cast ''Gift of the Xavian'''),

(10647,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Raze - On Respawn - Set Active On'),
(10647,0,1,0,0,0,100,0,0,0,3400,4800,0,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Prince Raze - IC - Cast ''Fireball'''),
(10647,0,2,0,0,0,100,0,8000,9000,21000,25000,0,11,16570,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Prince Raze - IC - Cast ''Charged Arcane Bolt'''),
(10647,0,3,0,9,0,100,0,0,8,12000,18000,0,11,11969,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Raze - Within 0-8 Range - Cast ''Fire Nova'''),
(10647,0,4,0,2,0,100,0,0,30,12000,19000,0,11,6925,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Raze - Between 0-30% Health - Cast ''Gift of the Xavian''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
