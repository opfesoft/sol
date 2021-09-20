-- DB update 2021_09_20_02 -> 2021_09_20_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_20_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_20_02 2021_09_20_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1632174324750446103'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1632174324750446103');

UPDATE `reference_loot_template` SET `Chance` = 25 WHERE `Entry` = 35010 AND `Item` = 10788; -- Atal'ai Girdle
UPDATE `reference_loot_template` SET `Chance` = 22 WHERE `Entry` = 35010 AND `Item` = 10786; -- Atal'ai Boots
UPDATE `reference_loot_template` SET `Chance` = 19 WHERE `Entry` = 35010 AND `Item` = 10787; -- Atal'ai Gloves
UPDATE `reference_loot_template` SET `Chance` = 16 WHERE `Entry` = 35010 AND `Item` = 10785; -- Atal'ai Leggings
UPDATE `reference_loot_template` SET `Chance` = 13 WHERE `Entry` = 35010 AND `Item` = 10783; -- Atal'ai Spaulders
UPDATE `reference_loot_template` SET `Chance` =  5 WHERE `Entry` = 35010 AND `Item` = 10784; -- Atal'ai Breastplate

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
