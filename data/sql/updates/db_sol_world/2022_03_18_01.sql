-- DB update 2022_03_18_00 -> 2022_03_18_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_18_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_18_00 2022_03_18_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1647600269763010081'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1647600269763010081');

UPDATE `event_scripts` SET `datalong2` = 40000 WHERE `id` = 15385 AND `command` = 10;

UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 23769;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (23768,23769);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2376800;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23768,0,0,0,54,0,100,0,0,0,0,0,0,80,2376800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lynn Hyal - On Just Summoned - Call Timed Action List'),

(2376800,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lynn Hyal - On Script - Set Active On'),
(2376800,9,1,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lynn Hyal - On Script - Say Line 1'),
(2376800,9,2,0,0,0,100,0,4000,4000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lynn Hyal - On Script - Say Line 2'),
(2376800,9,3,0,0,0,100,0,4000,4000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lynn Hyal - On Script - Say Line 3'),
(2376800,9,4,0,0,0,100,0,6000,6000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lynn Hyal - On Script - Say Line 4'),
(2376800,9,5,0,0,0,100,0,8000,8000,0,0,0,1,1,0,0,0,0,0,19,23769,20,0,0,0,0,0,0,'Lynn Hyal - On Script - Say Line 1 (Jimmy Hyal)'),
(2376800,9,6,0,0,0,100,0,3000,3000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lynn Hyal - On Script - Say Line 5'),
(2376800,9,7,0,0,0,100,0,7000,7000,0,0,0,33,23768,0,0,0,0,0,18,5,0,0,0,0,0,0,0,'Lynn Hyal - On Script - Reward Quest ''Peace at Last''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
