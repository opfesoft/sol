-- DB update 2020_06_18_00 -> 2020_06_18_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_06_18_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_06_18_00 2020_06_18_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1592516968840147264'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1592516968840147264');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (4655,4654,4657,4656,11686,11687,13718,11685);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (4655,4654,4657,4656,11686,11687,13718,11685);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4654,0,0,0,9,0,100,0,2,30,2000,3000,0,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Maraudine Scout - Within 2-30 Range - Cast ''Shoot'''),

(4655,0,0,0,0,0,100,0,2500,3000,13500,15000,0,11,8379,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Maraudine Wrangler - In Combat - Cast ''Disarm'''),
(4655,0,1,0,0,0,100,0,4000,10000,18000,34000,0,11,6533,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Maraudine Wrangler - In Combat - Cast ''Net'''),

(4656,0,0,0,0,0,100,0,1500,1500,7000,8000,0,11,3391,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Maraudine Mauler - In Combat - Cast ''Thrash'''),

(4657,0,0,0,0,0,100,0,0,0,4000,4500,0,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Maraudine Windchaser - In Combat - Cast ''Lightning Bolt'''),
(4657,0,1,0,2,0,100,1,15,45,0,0,0,11,11986,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maraudine Windchaser - Between 15-45% Health - Cast ''Healing Wave'' (No Repeat)'),

(11685,0,0,0,4,0,100,0,0,0,0,0,0,11,11639,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Maraudine Priest - On Aggro - Cast ''Shadow Word: Pain'''),
(11685,0,1,0,0,0,100,0,3400,4100,9200,10100,0,11,16568,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Maraudine Priest - In Combat - Cast ''Mind Flay'''),

(11686,0,0,0,4,0,100,0,0,0,0,0,0,11,6533,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ghostly Raider - On Aggro - Cast ''Net'''),
(11686,0,1,0,9,0,100,0,2,30,2000,3000,0,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ghostly Raider - Within 2-30 Range - Cast ''Shoot'''),
(11686,0,2,0,9,0,100,0,2,30,8000,12000,0,11,17174,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ghostly Raider - Within 2-30 Range - Cast ''Concussive Shot'''),

(11687,0,0,0,0,0,100,0,2700,3100,8500,9200,0,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ghostly Marauder - In Combat - Cast ''Strike'''),

(13718,0,0,0,0,0,100,0,5400,6200,25900,34600,0,11,15848,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'The Nameless Prophet - In Combat - Cast ''Festering Rash''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
