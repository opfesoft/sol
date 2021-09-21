-- DB update 2021_09_21_01 -> 2021_09_21_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_21_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_21_01 2021_09_21_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1632219507279010469'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1632219507279010469');

DELETE FROM `gossip_menu` WHERE `MenuID` IN (2991,2992,2993,2986,2987,2988,2989,2990);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
-- Malyfous Darkhammer
(2991,3674),
(2992,3675),
(2993,3676),
-- Malyfous's Catalogue
(2986,3695),
(2987,3696),
(2988,3697),
(2989,3699),
(2990,3698);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 10637;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 10637;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1063700;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10637,0,0,0,62,0,100,0,2993,0,0,0,0,80,1063700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Malyfous Darkhammer - On Gossip Option 0 Selected - Call Timed Action List'),

(1063700,9,0,0,0,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Malyfous Darkhammer - On Script - Close Gossip'),
(1063700,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,14,49074,0,0,0,0,0,0,0,'Malyfous Darkhammer - On Script - Set Orientation'),
(1063700,9,3,0,0,0,100,0,1000,1000,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Malyfous Darkhammer - On Script - Say Line 0'),
(1063700,9,4,0,0,0,100,0,4000,4000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Malyfous Darkhammer - On Script - Reset Orientation');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 2984;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,2984,0,0,0,47,0,5047,64,0,0,0,0,'Malyfous Darkhammer - Show gossip option 0 if quest ''Finkle Einhorn, At Your Service!'' is rewarded');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
