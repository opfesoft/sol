-- DB update 2021_01_10_01 -> 2021_01_10_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_10_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_10_01 2021_01_10_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610277005324348625'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610277005324348625');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (2753,7057,2751,2829,2727,2850,2749,2732,2734);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2753,7057,2751,2829,2727,2850,2749,2732,2754,2944,2734) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2753,0,0,0,2,0,100,1,0,80,0,0,0,11,3149,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Barnabus - Between 0-80% Health - Cast ''Furious Howl'' (No Repeat)'),

(7057,0,0,0,4,0,100,1,0,0,0,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Digmaster Shovelphlange - On Aggro - Cast ''Defensive Stance'' (No Repeat)'),
(7057,0,1,0,0,0,100,0,2700,3100,8600,9400,0,11,8380,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Digmaster Shovelphlange - IC - Cast ''Sunder Armor'''),

(2751,0,0,0,2,0,100,1,0,60,0,0,0,11,9576,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'War Golem - Between 0-60% Health - Cast ''Lock Down'' (No Repeat)'),

(2829,0,0,0,0,0,100,0,2700,3200,32700,33200,0,11,3427,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Starving Buzzard - IC - Cast ''Infected Wound'''),

(2727,0,0,0,2,0,100,1,0,80,0,0,0,11,3149,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crag Coyote - Between 0-80% Health - Cast ''Furious Howl'' (No Repeat)'),

(2850,0,0,0,0,0,100,0,2800,3600,17800,18600,0,11,36590,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Broken Tooth - IC - Cast ''Rip'''),
(2850,0,1,0,2,0,100,1,0,30,0,0,0,11,18501,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Broken Tooth - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(2749,0,0,0,0,0,100,0,3400,4200,9600,12800,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Siege Golem - IC - Cast ''Thrash'''),
(2749,0,1,0,2,0,100,1,0,30,0,0,0,11,9576,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Siege Golem - Between 0-30% Health - Cast ''Lock Down'' (No Repeat)'),

(2732,0,0,0,0,0,100,0,2300,2700,8700,9700,0,11,51772,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ridge Huntress - IC - Cast ''Claw'''),

(2754,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anathemus - On Respawn - Set Active On'),
(2754,0,1,0,9,0,100,0,5,30,3000,4000,1,11,23392,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Anathemus - Within 5-30 Range - Cast ''Boulder'''),
(2754,0,2,0,2,0,100,1,0,60,0,0,0,11,21909,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anathemus - Between 0-60% Health - Cast ''Dust Field'' (No Repeat)'),

(2944,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Boss Tho''grun - On Respawn - Set Active On'),
(2944,0,1,0,0,0,100,0,2800,4400,9200,9900,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Boss Tho''grun - IC - Cast ''Thrash'''),

(2734,0,0,0,0,0,100,0,2300,3700,15200,17700,0,11,36590,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ridge Stalker Patriarch - IC - Cast ''Rip''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
