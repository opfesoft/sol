-- DB update 2021_01_05_02 -> 2021_01_05_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_05_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_05_02 2021_01_05_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609858724421803171'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609858724421803171');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (9396,5428,5422,5425,14123,7883,8196,8197,8198,5431,5426,5469,5430,5490);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (9396,5428,5422,5425,14123,7883,8196,8197,8198,5431,5426,5469,5430,5490) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(9396,0,0,0,2,0,100,1,0,60,0,0,0,11,6524,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ground Pounder - Between 0-60% Health - Cast ''Ground Tremor'' (No Repeat)'),

(5428,0,0,0,2,0,100,1,0,80,0,0,0,11,5708,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Roc - Between 0-80% Health - Cast ''Swoop'' (No Repeat)'),

(5422,0,0,0,0,0,100,0,2100,2700,25300,28000,0,11,7992,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scorpid Hunter - IC - Cast ''Slowing Poison'''),

(5425,0,0,0,0,0,100,0,1700,2400,9800,12600,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Starving Blisterpaw - IC - Cast ''Tendon Rip'''),

(14123,0,0,0,2,0,100,1,0,80,0,0,0,11,26064,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Steeljaw Snapper - Between 0-80% Health - Cast ''Shell Shield'' (No Repeat)'),

(7883,0,0,0,0,0,100,0,1700,2300,8600,9400,0,11,5679,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Andre Firebeard - IC - Cast ''Torch Burn'''),

(8196,0,0,0,0,0,100,0,2700,3200,10500,11600,0,11,10833,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Occulus - IC - Cast ''Arcane Blast'''),
(8196,0,1,0,2,0,100,1,0,80,0,0,0,11,20717,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Occulus - Between 0-80% Health - Cast ''Sand Breath'' (No Repeat)'),
(8196,0,2,0,2,0,100,1,0,30,0,0,0,11,18144,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Occulus - Between 0-30% Health - Cast ''Swoop'' (No Repeat)'),

(8197,0,0,0,0,0,100,0,0,0,9600,12800,0,11,13748,2,0,1,0,0,2,0,0,0,0,0,0,0,0,'Chronalis - IC - Cast ''Arcane Bolt'''),
(8197,0,1,0,12,0,100,1,0,60,0,0,0,11,40504,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Chronalis - Target Between 0-60% Health - Cast ''Cleave'' (No Repeat)'),
(8197,0,2,0,2,0,100,1,0,80,0,0,0,11,20717,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Chronalis - Between 0-80% Health - Cast ''Sand Breath'' (No Repeat)'),
(8197,0,3,0,2,0,100,1,0,30,0,0,0,11,18144,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Chronalis - Between 0-30% Health - Cast ''Swoop'' (No Repeat)'),

(8198,0,0,0,9,0,100,0,0,10,9700,11300,1,11,21073,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Tick - Within 0-10 Range - Cast ''Arcane Explosion'''),
(8198,0,1,0,2,0,100,1,0,80,0,0,0,11,20717,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Tick - Between 0-80% Health - Cast ''Sand Breath'' (No Repeat)'),
(8198,0,2,0,2,0,100,1,0,30,0,0,0,11,18144,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Tick - Between 0-30% Health - Cast ''Swoop''  (No Repeat)'),

(5431,0,0,0,2,0,100,1,0,80,0,0,0,11,26064,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Surf Glider - Between 0-80% Health - Cast ''Shell Shield'' (No Repeat)'),

(5426,0,0,0,0,0,100,0,2700,3200,8900,12100,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Blisterpaw Hyena - IC - Cast ''Tendon Rip'''),

(5469,0,0,0,0,0,100,0,2500,3000,22500,23000,0,11,9791,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Dune Smasher - IC - Cast ''Head Crack'''),

(5430,0,0,0,4,0,100,0,0,0,0,0,0,11,16843,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Searing Roc - On Aggro - Cast ''Crimson Fury'''),
(5430,0,1,0,2,0,100,1,0,80,0,0,0,11,8139,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Searing Roc - Between 0-80% Health - Cast ''Fevered Fatigue'' (No Repeat)'),

(5490,0,0,0,2,0,100,1,0,60,0,0,0,11,7948,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gnarled Thistleshrub - Between 0-60% Health - Cast ''Wild Regeneration'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
