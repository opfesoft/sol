-- DB update 2021_11_10_03 -> 2021_11_10_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_10_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_10_03 2021_11_10_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1636583520630295468'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1636583520630295468');

DELETE FROM `creature_loot_template` WHERE `Item` = 3819 AND `Entry` IN (2044,2250,2251,2252,2253,2254,2256,2287,2655,2656,4504,6557,7086,10981,10982,11678,12051,13419);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
