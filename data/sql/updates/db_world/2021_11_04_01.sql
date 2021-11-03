-- DB update 2021_11_04_00 -> 2021_11_04_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_11_04_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_11_04_00 2021_11_04_01 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1635459481686892682'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1635459481686892682');

-- Removed bad SAI from Snapjaw, Saltwater Snapjaw, Surf Glider, Ironback, Steeljaw Snapper, Cranky Benj
UPDATE `creature_template` SET `AIName`='' WHERE `entry` IN (2408,2505,5431,8213,14123);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2408,2505,5431,8213,14123) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 14223 AND `source_type` = 0 AND `id` = 1;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
