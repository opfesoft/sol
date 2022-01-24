-- DB update 2022_01_11_00 -> 2022_01_13_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2022_01_11_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2022_01_11_00 2022_01_13_00 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1641972530727711400'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1641972530727711400');

-- Goblin Rocket Fuel and Discombobulator Ray should have 100% drop chance from Mux's Quality Goods
UPDATE `item_loot_template` SET `Chance` = 100 WHERE `Item` IN (4388, 9061) AND `Entry` = 22320;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;