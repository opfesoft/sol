-- DB update 2021_06_03_02 -> 2021_06_03_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_06_03_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_06_03_02 2021_06_03_03 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1622106798992540218'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1622106798992540218');

-- Noblegarden items:
-- 6833: White Tuxedo Shirt
-- 6835: Black Tuxedo Pants
-- 7806: Lollipop
-- 7807: Candy Bar
-- 7808: Chocolate Square
-- 7809: Easter Dress
-- 19028: Elegant Dress

-- Creatures who drop Noblegarden items:
-- 423: Redridge Mongrel
-- 2020: Bloodfeather Wind Witch
-- 3197: Burning Blade Fanatic
-- 3448: Tonga Runetotem
DELETE FROM `creature_loot_template` WHERE `entry` IN (423, 2020, 3197, 3448) AND `item` IN (6833, 6835, 7806, 7807, 7808, 7809, 19028);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
