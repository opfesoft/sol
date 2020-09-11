-- DB update 2020_09_10_03 -> 2020_09_11_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_09_10_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_09_10_03 2020_09_11_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1599854277556949044'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1599854277556949044');

UPDATE `smart_scripts` SET `action_param6` = 1 WHERE `entryorguid` IN (18146,26290) AND `source_type` = 0 AND `action_type` = 53;
UPDATE `smart_scripts` SET `action_param6` = 1 WHERE `entryorguid` IN (2629000,2629001) AND `source_type` = 9 AND `action_type` = 53;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
