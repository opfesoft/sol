-- DB update 2021_11_30_00 -> 2021_12_01_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_30_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_30_00 2021_12_01_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1638383485683400966'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1638383485683400966');

-- Headless Horseman's Mount
UPDATE `creature_template` SET `modelid1` = 25958, `modelid2` = 25159 WHERE `entry` = 27153;

-- Invincible
UPDATE `creature_template` SET `modelid1` = 31248, `modelid2` = 31007 WHERE `entry` = 38545;
UPDATE `creature_model_info` SET `DisplayID_Other_Gender` = 0 WHERE `DisplayID` IN (31007,31248);

-- Celestial Steed
UPDATE `creature_template` SET `modelid1` = 31957, `modelid2` = 31958 WHERE `entry` = 40625;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
