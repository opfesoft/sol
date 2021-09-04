-- DB update 2021_09_03_03 -> 2021_09_04_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_03_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_03_03 2021_09_04_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1630790691896134185'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1630790691896134185');

-- Copper Vein
UPDATE `gameobject_loot_template` SET `MaxCount` = 6, `Chance` = 50 WHERE `Item` = 2835 AND `Entry` IN (1502,1735,2626,18092); -- Rough Stone
UPDATE `gameobject_loot_template` SET `MaxCount` = 4 WHERE `Item` = 2770 AND `Entry` IN (1502,1735,2626,18092); -- Copper Ore

-- Tin Vein
UPDATE `gameobject_loot_template` SET `MaxCount` = 8, `Chance` = 50 WHERE `Item` = 2836 AND `Entry` IN (1503,1736,2627,18093); -- Coarse Stone
UPDATE `gameobject_loot_template` SET `MaxCount` = 4 WHERE `Item` = 2771 AND `Entry` IN (1503,1736,2627,18093); -- Tin Ore

-- Iron Deposit
UPDATE `gameobject_loot_template` SET `Chance` = 50 WHERE `Item` = 2838 AND `Entry` = 1505; -- Heavy Stone

-- Mithril Deposit
UPDATE `gameobject_loot_template` SET `MaxCount` = 8, `Chance` = 50 WHERE `Item` = 7912 AND `Entry` IN (1742,13961); -- Solid Stone
UPDATE `gameobject_loot_template` SET `MaxCount` = 4, `MinCount` = 2 WHERE `Item` = 3858 AND `Entry` IN (1742,13961); -- Mithril Ore

-- Small Thorium Veins
UPDATE `gameobject_loot_template` SET `MaxCount` = 5, `MinCount` = 1, `Chance` = 50 WHERE `Item` = 12365 AND `Entry` IN (9597,13960); -- Dense Stone
UPDATE `gameobject_loot_template` SET `MaxCount` = 3, `MinCount` = 2 WHERE `Item` = 10620 AND `Entry` IN (9597,13960); -- Thorium Ore

-- Hakkari Thorium Vein / Rich Thorium Vein
UPDATE `gameobject_loot_template` SET `MaxCount` = 10, `MinCount` = 1, `Chance` = 50 WHERE `Item` = 12365 AND `Entry` IN (17241,12883); -- Dense Stone
UPDATE `gameobject_loot_template` SET `MaxCount` = 5, `MinCount` = 3 WHERE `Item` = 10620 AND `Entry` IN (17241,12883); -- Thorium Ore

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
