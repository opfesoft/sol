-- DB update 2022_01_04_05 -> 2022_01_05_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_04_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_04_05 2022_01_05_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1641381809304925304'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1641381809304925304');

DELETE FROM `reference_loot_template` WHERE `Item` IN (827,1214,1219,1405,1925,1928,1958,1959,4676) AND `Entry` = 24077;
DELETE FROM `creature_loot_template` WHERE `Item` IN (827,1214,1219,1405,1925,1928,1958,1959,4676);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(122,827,0,2,0,1,0,1,1,NULL),   -- Defias Highwayman - Wicked Blackjack
(449,827,0,2,0,1,0,1,1,NULL),   -- Defias Knuckleduster - Wicked Blackjack
(426,1214,0,2,0,1,0,1,1,NULL),  -- Redridge Brute - Gnoll Punisher
(424,1219,0,2,0,1,0,1,1,NULL),  -- Redridge Poacher - Redridge Machete
(517,1405,0,2,0,1,0,1,1,NULL),  -- Murloc Oracle - Foamspittle Staff
(1725,1925,0,2,0,1,0,1,1,NULL), -- Defias Watchman - Defias Rapier
(1726,1928,0,2,0,1,0,1,1,NULL), -- Defias Magician - Defias Mage Staff
(623,1958,0,2,0,1,0,1,1,NULL),  -- Skeletal Miner - Petrified Shinbone
(623,1959,0,2,0,1,0,1,1,NULL),  -- Skeletal Miner - Cold Iron Pick
(624,1958,0,2,0,1,0,1,1,NULL),  -- Undead Excavator - Petrified Shinbone
(624,4676,0,2,0,1,0,1,1,NULL),  -- Undead Excavator - Skeletal Gauntlets
(625,1958,0,2,0,1,0,1,1,NULL);  -- Undead Dynamiter - Petrified Shinbone

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
