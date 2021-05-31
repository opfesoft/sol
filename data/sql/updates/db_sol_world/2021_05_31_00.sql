-- DB update 2021_05_27_02 -> 2021_05_31_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_05_27_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_05_27_02 2021_05_31_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1622453218331616567'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1622453218331616567');

DELETE FROM `creature_loot_template`  WHERE `Reference` = 0 AND `Item` IN (880,1457,1458,2175,1462,1461,1459);
DELETE FROM `reference_loot_template` WHERE `Reference` = 0 AND `Item` IN (880,1457,1458,2175,1462,1461,1459);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(202,880,0,2,0,1,0,1,1,NULL),  -- Skeletal Horror - Staff of Horrors
(433,1457,0,2,0,1,0,1,1,NULL), -- Shadowhide Gnoll - Shadowhide Mace
(432,1458,0,2,0,1,0,1,1,NULL), -- Shadowhide Brute - Shadowhide Maul
(568,2175,0,2,0,1,0,1,1,NULL), -- Shadowhide Warrior - Shadowhide Battle Axe
(429,1462,0,2,0,1,0,1,1,NULL), -- Shadowhide Darkweaver - Ring of the Shadow
(431,1461,0,2,0,1,0,1,1,NULL), -- Shadowhide Slayer - Slayer's Battle Axe
(579,1459,0,2,0,1,0,1,1,NULL); -- Shadowhide Assassin - Shadowhide Scalper

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
