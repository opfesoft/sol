-- DB update 2022_01_09_00 -> 2022_01_10_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_09_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_09_00 2022_01_10_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1641797303159474381'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1641797303159474381');

UPDATE `creature_model_info` SET `DisplayID_Other_Gender` = 15306 WHERE `DisplayID` = 15304;
UPDATE `creature_model_info` SET `DisplayID_Other_Gender` = 15307 WHERE `DisplayID` = 15305;
UPDATE `creature_model_info` SET `DisplayID_Other_Gender` = 15304 WHERE `DisplayID` = 15306;
UPDATE `creature_model_info` SET `DisplayID_Other_Gender` = 15305 WHERE `DisplayID` = 15307;
UPDATE `creature_template` SET `modelid1` = 15304, `modelid2` = 15305, `modelid3` = 0, `modelid4` = 0 WHERE `entry` IN (15184,15545,15961,16139);
UPDATE `creature` SET `modelid` = 0 WHERE `id` IN (15184,15545,15961,16139);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
