-- DB update 2022_03_18_02 -> 2022_03_18_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_18_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_18_02 2022_03_18_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1647618338394826959'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1647618338394826959');

UPDATE `command` SET `help` = 'Syntax: .morph #displayid\r\nChange your current model id or the model id of the targeted unit to #displayid. If no #displayid is specified take over the model id of the targeted unit.' WHERE `name` = 'morph';

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
