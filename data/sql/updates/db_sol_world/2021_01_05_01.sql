-- DB update 2021_01_05_00 -> 2021_01_05_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_05_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_05_00 2021_01_05_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609848478751508350'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609848478751508350');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (15967,15949,15635,15649,15651,15937,15668,15669,15652,16353,16347);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (15967,15949,15635,15649,15651,15937,15668,15669,15652,16353,16347) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(15967,0,0,0,2,0,100,1,0,40,0,0,0,11,7994,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ether Fiend - Between 0-40% Health - Cast ''Nullify Mana'' (No Repeat)'),

(15949,0,0,0,0,0,100,0,2500,3000,9500,10000,0,11,6818,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thaelis the Hungerer - IC - Cast ''Corrupted Intellect'''),

(15635,0,0,0,2,0,100,1,0,60,0,0,0,11,12160,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Tender - Between 0-60% Health - Cast ''Rejuvenation'' (No Repeat)'),

(15649,0,0,0,2,0,100,1,0,30,0,0,0,11,29117,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Feral Dragonhawk Hatchling - Between 0-30% Health - Cast ''Feather Burst'' (No Repeat)'),

(15651,0,0,0,4,0,100,0,0,0,0,0,0,11,22863,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Springpaw Stalker - On Aggro - Cast ''Speed'''),

(15937,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mmmrrrggglll - On Respawn - Set Active On'),
(15937,0,1,0,0,0,100,0,0,0,9000,12000,0,11,12058,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mmmrrrggglll - IC - Cast ''Chain Lightning'''),
(15937,0,2,0,0,0,100,0,4000,6000,12000,16000,0,11,21030,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mmmrrrggglll - IC - Cast ''Frost Shock'''),
(15937,0,3,0,2,0,100,0,0,50,12000,15000,0,11,12491,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mmmrrrggglll - Between 0-50% Health - Cast ''Healing Wave'''),
(15937,0,4,5,6,0,100,0,0,0,0,0,0,45,0,1,0,0,0,0,9,15668,0,60,0,0,0,0,0,'Mmmrrrggglll - On Just Died - Set Data 0 1'),
(15937,0,5,0,61,0,100,0,0,0,0,0,0,45,0,1,0,0,0,0,9,15669,0,60,0,0,0,0,0,'Mmmrrrggglll - On Just Died - Set Data 0 1'),

(15668,0,0,0,38,0,100,1,0,1,0,0,0,11,26661,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimscale Murloc - On Data Set 0 1 - Cast ''Fear'' (No Repeat)'),
(15668,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Grimscale Murloc - Between 0-15% Health - Flee For Assist (No Repeat)'),

(15669,0,0,0,74,0,100,0,0,50,12000,16000,40,11,17137,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Grimscale Oracle - On Friendly Between 0-50% Health - Cast ''Flash Heal'''),
(15669,0,1,0,38,0,100,1,0,1,0,0,0,11,26661,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimscale Oracle - On Data Set 0 1 - Cast ''Fear'' (No Repeat)'),
(15669,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Grimscale Oracle - Between 0-15% Health - Flee For Assist (No Repeat)'),

(15652,0,0,0,4,0,100,0,0,0,0,0,0,11,22863,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Elder Springpaw - On Aggro - Cast ''Speed'''),

(16353,0,0,0,2,0,100,1,0,80,0,0,0,11,8281,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mistbat - Between 0-80% Health - Cast ''Sonic Burst'' (No Repeat)'),

(16347,0,0,0,9,0,100,1,0,5,0,0,1,11,32918,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Starving Ghostclaw - Within 0-5 Range - Cast ''Chilling Howl'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
