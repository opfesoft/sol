-- DB update 2021_09_12_00 -> 2021_09_12_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_12_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_12_00 2021_09_12_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1631399191055525747'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1631399191055525747');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 20248;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,20248,0,0,152,1,21267,1,0,1,0,0,'Sunfury Nethermancer - Execute SAI only if has no alive minion ''Mana Beast''');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 21267;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (20248,21267);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2024800,2024801);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20248,0,0,0,1,0,100,0,5000,5000,5000,5000,0,11,36477,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Nethermancer - OOC - Cast ''Summon Mana Beast'''),
(20248,0,1,0,9,0,100,0,0,30,3400,4800,0,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Nethermancer - Within 0-30 Range - Cast ''Shadow Bolt'''),
(20248,0,2,0,0,0,100,0,0,0,30000,35000,0,11,35778,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Nethermancer - IC - Cast ''Bloodcrystal Surge'''),
(20248,0,3,0,2,0,100,0,0,75,15000,20000,0,11,17173,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Nethermancer - Between 0-75% Health - Cast ''Drain Life'''),
(20248,0,4,5,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Sunfury Nethermancer - Between 0-15% Health - Flee For Assist (No Repeat)'),
(20248,0,5,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,11,21267,30,1,0,0,0,0,0,'Sunfury Nethermancer - Linked - Set Data 1 1 (Mana Beast)'),
(20248,0,6,0,1,0,100,0,10000,20000,15000,30000,0,87,2024800,2024801,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Nethermancer - OOC - Call Random Timed Action List'),

(2024800,9,0,0,0,0,100,0,0,0,0,0,0,11,34397,0,0,0,0,0,19,19421,30,0,0,0,0,0,0,'Sunfury Nethermancer - On Script - Cast ''Red Beam'''),
(2024801,9,0,0,0,0,100,0,0,0,0,0,0,92,0,34397,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Nethermancer - On Script - Interrupt ''Red Beam'''),

(21267,0,0,0,38,0,100,0,1,1,5000,5000,0,11,36484,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mana Beast - On Data Set 1 1 - Cast ''Mana Burn''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
