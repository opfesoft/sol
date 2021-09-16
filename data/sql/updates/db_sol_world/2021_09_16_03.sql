-- DB update 2021_09_16_02 -> 2021_09_16_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_16_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_16_02 2021_09_16_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1631813038462020541'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1631813038462020541');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (23772,24677,24676,24673,24789);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (23772,24677,24676,24673,24789);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23772,0,0,0,0,0,100,0,5000,9000,9000,14000,0,11,49865,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Spotted Hippogryph - IC - Cast ''Eye Peck'''),

(24677,0,0,0,0,0,100,0,2000,6000,6000,9000,0,11,50075,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Spearfang Worg - IC - Cast ''Maim Flesh'''),

(24676,0,0,0,2,0,100,0,0,50,60000,60000,0,11,5915,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crazed Northsea Slaver - Between 0-50% Health - Cast ''Crazed'''),

(24673,0,0,0,0,0,100,0,4000,6000,8000,12000,0,11,16552,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Frostwing Chimaera - IC - Cast ''Venom Spit'''),

(24789,0,0,0,0,0,100,0,3000,5000,7000,11000,0,11,16583,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Forlorn Soul - IC - Cast ''Shadow Shock''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
