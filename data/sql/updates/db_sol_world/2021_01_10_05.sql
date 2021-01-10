-- DB update 2021_01_10_04 -> 2021_01_10_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_10_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_10_04 2021_01_10_05 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610316250277902407'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610316250277902407');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (232,2385,2384,2354,2408,2406,2407,2356,2680,2929,2505,12496,12478,12479,12477,2924);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (232,2385,2384,2354,2408,2406,14276,2407,14278,14275,2356,2680,2929,2505,12496,12478,12479,12477,2924) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(232,0,0,0,0,0,100,0,2400,2900,8600,9200,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Farmer Ray - IC - Cast ''Thrash'''),

(2385,0,0,0,0,0,100,0,2300,2700,8700,9700,0,11,51772,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Feral Mountain Lion - IC - Cast ''Claw'''),

(2384,0,0,0,0,0,100,0,2700,3400,8600,11400,0,11,31279,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Starving Mountain Lion - IC - Cast ''Swipe'''),

(2354,0,0,0,0,0,100,0,2200,2600,7400,8100,0,11,31279,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vicious Gray Bear - IC - Cast ''Swipe'''),

(2408,0,0,0,2,0,100,1,0,40,0,0,0,11,26064,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Snapjaw - Between 0-40% Health - Cast ''Shell Shield'' (No Repeat)'),

(2406,0,0,0,0,0,100,0,2300,2700,8700,9700,0,11,51772,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mountain Lion - IC - Cast ''Claw'''),

(14276,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scargil - On Respawn - Set Active On'),
(14276,0,1,0,0,0,100,0,2700,3000,8400,8700,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scargil - IC - Cast ''Thrash'''),

(2407,0,0,0,0,0,100,0,2400,2600,11400,11600,0,11,36332,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Hulking Mountain Lion - IC - Cast ''Rake'''),

(14278,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ro''Bark - On Respawn - Set Active On'),
(14278,0,1,0,0,0,100,0,2400,4100,10800,13700,0,11,48288,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ro''Bark - IC - Cast ''Mace Smash'''),

(14275,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tamra Stormpike - On Respawn - Set Active On'),
(14275,0,1,0,0,0,100,0,2400,2900,8600,9400,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tamra Stormpike - IC - Cast ''Thrash'''),

(2356,0,0,0,0,0,100,0,2200,2600,7400,8100,0,11,31279,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Elder Gray Bear - IC - Cast ''Swipe'''),

(2680,0,0,0,2,0,100,1,0,80,0,0,0,11,3149,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Wolf Pup - Between 0-80% Health - Cast ''Furious Howl'' (No Repeat)'),

(2929,0,0,0,0,0,100,0,3200,3900,9200,9800,0,11,54663,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Savage Owlbeast - IC - Cast ''Fatal Bite'''),

(2505,0,0,0,2,0,100,1,0,40,0,0,0,11,26064,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Saltwater Snapjaw - Between 0-40% Health - Cast ''Shell Shield'' (No Repeat)'),

(12496,0,0,0,0,0,100,0,2700,3100,12700,13100,0,11,16359,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dreamtracker - IC - Cast ''Corrosive Acid Breath'''),
(12496,0,1,0,2,0,100,1,0,30,0,0,0,11,6605,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dreamtracker - Between 0-30% Health - Cast ''Terrifying Screech'' (No Repeat)'),

(12478,0,0,0,2,0,100,1,0,60,0,0,0,11,38657,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Verdantine Oracle - Between 0-60% Health - Cast ''Rejuvenation'' (No Repeat)'),

(12479,0,0,0,0,0,100,1,0,0,0,0,0,11,16498,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Verdantine Tree Warder - IC - Cast ''Faerie Fire'' (No Repeat)'),
(12479,0,1,0,2,0,100,1,0,80,0,0,0,11,12747,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Verdantine Tree Warder - Between 0-80% Health - Cast ''Entangling Roots'' (No Repeat)'),

(12477,0,0,0,0,0,100,0,2700,3000,12700,15600,0,11,12021,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Verdantine Boughguard - IC - Cast ''Fixate'''),

(2924,0,0,0,2,0,100,1,0,80,0,0,0,11,3149,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silvermane Wolf - Between 0-80% Health - Cast ''Furious Howl'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
