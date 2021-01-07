-- DB update 2021_01_06_00 -> 2021_01_07_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_06_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_06_00 2021_01_07_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610011820869880982'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610011820869880982');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (17878,15162,8606,11290,8596,12387);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (17878,15162,8606,11290,8596,12387) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17878,0,0,0,0,0,100,1,0,0,0,0,0,11,7978,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scourge Siege Engineer - IC - Cast ''Throw Dynamite'' (No Repeat)'),

(15162,0,0,0,0,0,100,1,0,0,0,0,0,11,20294,2,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Inquisitor - IC - Cast ''Immolate'' (No Repeat)'),

(8606,0,0,0,2,0,100,1,0,80,0,0,0,11,11442,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Living Decay - Between 0-80% Health - Cast ''Withered Touch'' (No Repeat)'),

(11290,0,0,0,0,0,100,0,2300,3400,9800,12600,0,11,3234,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mossflayer Zombie - IC - Cast ''Disease Touch'''),

(8596,0,0,0,0,0,100,0,2700,3400,11200,13700,0,11,31279,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Plaguehound Runt - IC - Cast ''Swipe'''),

(12387,0,0,0,0,0,100,1,0,0,0,0,0,11,13901,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Large Vile Slime - IC - Cast ''Arcane Bolt'' (No Repeat)'),
(12387,0,1,0,2,0,100,1,0,60,0,0,0,11,16843,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Large Vile Slime - Between 0-60% Health - Cast ''Crimson Fury'' (No Repeat)'),
(12387,0,2,0,2,0,100,1,0,20,0,0,0,11,11975,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Large Vile Slime - Between 0-20% Health - Cast ''Arcane Explosion'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
