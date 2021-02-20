-- DB update 2021_02_19_02 -> 2021_02_20_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_19_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_19_02 2021_02_20_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1613806317557658667'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1613806317557658667');

-- Replace the mailboxes in Brill, The Sepulcher and Tarren Mill with the Undercity mailbox model
UPDATE `gameobject` SET `id` = 177044 WHERE `guid` IN (44775,33370,17022);

-- Increase drop chance for "Shoveltusk Ligament" to 35% to make the quest "Parts for the Job" less cumbersome
UPDATE `creature_loot_template` SET `Chance` = 35 WHERE `Item` = 33611;

-- Set Party Loot for "Searing Tongue" and "Searing Heart" to make the quest "Identifying the Brood" less cumbersome for groups
UPDATE `item_template` SET `flags` = `flags` | 2048 WHERE `entry` IN (5840,5841);

-- Increase drop chance for "Bloodshot Spider Eye" and "Thick Black Claw" to 50% to make the quest "Spirit Totem" less cumbersome
UPDATE `creature_loot_template` SET `Chance` = 30 WHERE `Item` IN (20610,20611);

-- Decrease respawn time for "Riven Widow Cocoon" to make the quest "Rivenwood Captives" less cumbersome
UPDATE `creature` SET `spawntimesecs` = 150 WHERE `id` = 24210;

-- Increase drop chance for "Scout Jyoba's Report" to 10% to make the quest "Jyoba's Report" less cumbersome
UPDATE `creature_loot_template` SET `Chance` = 10 WHERE `Item` = 24373;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
