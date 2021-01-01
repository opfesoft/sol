-- DB update 2021_01_01_01 -> 2021_01_02_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_01_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_01_01 2021_01_02_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609542340332151967'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609542340332151967');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (2972,2989,2973,2969,2975,2958,2951,2949,2950,2974,2963,2962,2968,2967,2956,3051,2977,2976,2959,2970,3035,2978,2971,2957,2960,2964,2965);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2972,2989,2973,2969,2975,2958,2951,2949,2950,2974,2963,2962,2968,2967,2956,3051,2977,2976,2959,2970,3035,2978,2971,2957,2960,2964,2965) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2972,0,0,0,4,0,100,0,0,0,0,0,0,11,6268,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kodo Calf - On Aggro - Cast ''Rushing Charge'''),

(2989,0,0,0,0,0,100,1,2700,8900,0,0,0,11,6016,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Bael''dun Digger - IC - Cast ''Pierce Armor'' (No Repeat)'),

(2973,0,0,0,0,0,100,1,2300,8600,0,0,0,11,5568,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kodo Bull - IC - Cast ''Trample'' (No Repeat)'),

(2969,0,0,0,2,0,100,1,0,80,0,0,0,11,5708,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wiry Swoop - Between 0-80% Health - Cast ''Swoop'' (No Repeat)'),

(2975,0,0,0,2,0,100,1,0,10,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venture Co. Hireling - Between 0-10% Health - Flee For Assist (No Repeat)'),

(2958,0,0,0,0,0,100,0,2300,4200,45000,45500,0,11,5781,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Prairie Wolf - IC - Cast ''Threatening Growl'''),

(2951,0,0,0,0,0,100,1,0,0,0,0,0,11,1516,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Palemane Poacher - IC - Cast ''Quick Shot'' (No Repeat)'),
(2951,0,1,0,9,0,100,0,2,30,2000,3000,0,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Palemane Poacher - Within 2-30 Range - Cast ''Shoot'''),

(2949,0,0,0,0,0,100,0,0,0,9800,13400,0,11,9739,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Palemane Tanner - IC - Cast ''Wrath'''),

(2950,0,0,0,2,0,100,1,0,40,0,0,0,11,774,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Palemane Skinner - Between 0-40% Health - Cast ''Rejuvenation'' (No Repeat)'),

(2974,0,0,0,0,0,100,1,2300,8700,0,0,0,11,5568,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kodo Matriarch - IC - Cast ''Trample'' (No Repeat)'),

(2963,0,0,0,0,0,100,0,0,0,9800,14900,0,11,9532,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Windfury Wind Witch - IC - Cast ''Lightning Bolt'''),
(2963,0,1,0,2,0,100,1,0,30,0,0,0,11,6982,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Windfury Wind Witch - Between 0-30% Health - Cast ''Gust of Wind'' (No Repeat)'),

(2962,0,0,0,1,0,100,0,0,0,1000,1000,0,11,19514,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Windfury Harpy - OOC - Cast ''Lightning Shield'''),

(2968,0,0,0,9,0,100,0,2,30,2000,3000,0,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Galak Outrunner - Within 2-30 Range - Cast ''Shoot'''),

(2967,0,0,0,4,0,100,0,0,0,0,0,0,11,3419,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Galak Centaur - On Aggro - Cast ''Improved Blocking'''),

(2956,0,0,0,2,0,100,1,0,40,0,0,0,11,7272,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Adult Plainstrider - Between 0-40% Health - Cast ''Dust Cloud'' (No Repeat)'),

(3051,0,0,0,0,0,100,1,2700,6900,0,0,0,11,6016,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Supervisor Fizsprocket - IC - Cast ''Pierce Armor'' (No Repeat)'),

(2977,0,0,0,2,0,100,1,0,80,0,0,0,11,5679,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Venture Co. Taskmaster - Between 0-80% Health - Cast ''Torch Burn'' (No Repeat)'),

(2976,0,0,0,2,0,100,1,0,80,0,0,0,11,6016,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Venture Co. Laborer - Between 0-80% Health - Cast ''Pierce Armor'' (No Repeat)'),

(2959,0,0,0,0,0,100,1,2700,8600,0,0,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Prairie Stalker - IC - Cast ''Tendon Rip'' (No Repeat)'),

(2970,0,0,0,2,0,100,1,0,60,0,0,0,11,5708,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Swoop - Between 0-60% Health - Cast ''Swoop'' (No Repeat)'),

(3035,0,0,0,0,0,100,1,2800,6400,0,0,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Flatland Cougar - IC - Cast ''Tendon Rip'' (No Repeat)'),

(2978,0,0,0,0,0,100,1,2700,9800,0,0,0,11,6016,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Venture Co. Worker - IC - Cast ''Pierce Armor'' (No Repeat)'),

(2971,0,0,0,2,0,100,1,0,60,0,0,0,11,5708,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Taloned Swoop - Between 0-60% Health - Cast ''Swoop'' (No Repeat)'),

(2957,0,0,0,2,0,100,1,0,40,0,0,0,11,7272,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Elder Plainstrider - Between 0-40% Health - Cast ''Dust Cloud'' (No Repeat)'),

(2960,0,0,0,0,0,100,1,2400,8900,0,0,0,11,5781,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Prairie Wolf Alpha - IC - Cast ''Threatening Growl'' (No Repeat)'),

(2964,0,0,0,0,0,100,0,0,0,12100,13400,0,11,13322,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Windfury Sorceress - IC - Cast ''Frostbolt'''),

(2965,0,0,0,0,0,100,0,0,0,10800,13200,0,11,9532,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Windfury Matriarch - IC - Cast ''Lightning Bolt'''),
(2965,0,1,0,2,0,100,1,0,40,0,0,0,11,332,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Windfury Matriarch - Between 0-40% Health - Cast ''Healing Wave'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
