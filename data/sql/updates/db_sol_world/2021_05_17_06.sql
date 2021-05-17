-- DB update 2021_05_17_05 -> 2021_05_17_06
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_05_17_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_05_17_05 2021_05_17_06 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1621286424514079157'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1621286424514079157');

UPDATE `creature_loot_template` SET `Comment` = NULL WHERE `Comment` IS NOT NULL;
UPDATE `spell_loot_template` SET `Comment` = NULL WHERE `Comment` IS NOT NULL;
UPDATE `item_loot_template` SET `Comment` = NULL WHERE `Comment` IS NOT NULL;

DELETE FROM `reference_loot_template` WHERE `Entry` = 24068 AND `Item` IN (897,1351,2015,2017,3053,3336,4723);
DELETE FROM `creature_loot_template` WHERE `Item` IN (897,1351,2015,2017,3053,3336,4723);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(206,897,0,0.1,0,1,0,1,1,NULL),   -- Nightbane Vile Fang - Madwolf Bracers
(3808,1351,0,0.1,0,1,0,1,1,NULL), -- Forsaken Dark Stalker - Fingerbone Bracers
(570,2015,0,1,0,1,0,1,1,NULL),    -- Brain Eater - Black Metal War Axe
(785,2017,0,1,0,1,0,1,1,NULL),    -- Skeletal Warder - Glowing Leather Bracers
(2344,3053,0,2.5,0,1,0,1,1,NULL), -- Dun Garok Mountaineer - Humbert's Chestpiece
(2368,3336,0,0.1,0,1,0,1,1,NULL), -- Daggerspine Shorestalker - Flesh Piercer
(2370,3336,0,0.1,0,1,0,1,1,NULL), -- Daggerspine Screamer - Flesh Piercer
(2346,4723,0,2.5,0,1,0,1,1,NULL); -- Dun Garok Priest - Humbert's Pants

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
