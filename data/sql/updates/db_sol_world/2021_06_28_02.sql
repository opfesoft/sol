-- DB update 2021_06_28_01 -> 2021_06_28_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_28_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_28_01 2021_06_28_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624880547618600384'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624880547618600384');

UPDATE `smart_scripts` SET `action_param1` = 2799000 WHERE `entryorguid` = 27990 AND `source_type` = 0 AND `id` = 0;
UPDATE `smart_scripts` SET `action_param1` = 2799001 WHERE `entryorguid` = 27990 AND `source_type` = 0 AND `id` = 1;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
