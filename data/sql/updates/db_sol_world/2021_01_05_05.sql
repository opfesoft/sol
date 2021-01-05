-- DB update 2021_01_05_04 -> 2021_01_05_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_05_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_05_04 2021_01_05_05 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609859385544465125'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609859385544465125');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (10896,10758,10760,10759,10756,10757);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (10896,10758,10760,10759,10756,10757) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10896,0,0,0,0,0,100,0,2500,3000,18000,18500,0,11,11977,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Arnak Grimtotem - IC - Cast ''Rend'''),
(10896,0,1,0,2,0,100,1,0,60,0,0,0,11,10966,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Arnak Grimtotem - Between 0-60% Health - Cast ''Uppercut'' (No Repeat)'),

(10758,0,0,0,0,0,100,0,2000,4000,12000,16000,0,11,34802,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Grimtotem Bandit - IC - Cast ''Kick'''),
(10758,0,1,0,2,0,100,1,0,40,0,0,0,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Grimtotem Bandit - Between 0-40% Health - Cast ''Disarm'' (No Repeat)'),

(10760,0,0,0,0,0,100,1,0,0,0,0,0,11,11436,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Grimtotem Geomancer - IC - Cast ''Slow'' (No Repeat)'),
(10760,0,1,0,0,0,100,0,0,0,8600,9100,0,11,8400,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Grimtotem Geomancer - IC - Cast ''Fireball'''),
(10760,0,2,0,2,0,100,1,0,60,0,0,0,11,2121,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Grimtotem Geomancer - Between 0-60% Health - Cast ''Flamestrike'' (No Repeat)'),

(10759,0,0,0,0,0,100,0,2100,3900,9600,12300,0,11,8046,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Grimtotem Stomper - IC - Cast ''Earth Shock'''),
(10759,0,1,0,2,0,100,1,0,40,0,0,0,11,5605,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimtotem Stomper - Between 0-40% Health - Cast ''Healing Ward'' (No Repeat)'),

(10756,0,0,0,2,0,100,1,0,80,0,0,0,11,17276,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scalding Elemental - Between 0-80% Health - Cast ''Scald'' (No Repeat)'),

(10757,0,0,0,2,0,100,1,0,60,0,0,0,11,11983,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Boiling Elemental - Between 0-60% Health - Cast ''Steam Jet'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
