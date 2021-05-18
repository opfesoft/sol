-- DB update 2021_05_17_06 -> 2021_05_18_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_05_17_06';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_05_17_06 2021_05_18_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1621320753904678968'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1621320753904678968');

UPDATE `item_template` SET `minMoneyLoot` = 20, `maxMoneyLoot` = 200 WHERE `entry` = 16882; -- Battered Junkbox   (Level 20)
UPDATE `item_template` SET `minMoneyLoot` = 30, `maxMoneyLoot` = 300 WHERE `entry` = 16883; -- Worn Junkbox       (Level 30)
UPDATE `item_template` SET `minMoneyLoot` = 40, `maxMoneyLoot` = 400 WHERE `entry` = 16884; -- Sturdy Junkbox     (Level 40)
UPDATE `item_template` SET `minMoneyLoot` = 50, `maxMoneyLoot` = 500 WHERE `entry` = 16885; -- Heavy Junkbox      (Level 50)
UPDATE `item_template` SET `minMoneyLoot` = 60, `maxMoneyLoot` = 600 WHERE `entry` = 29569; -- Strong Junkbox     (Level 60)
UPDATE `item_template` SET `minMoneyLoot` = 70, `maxMoneyLoot` = 700 WHERE `entry` = 43575; -- Reinforced Junkbox (Level 70)

-- Reinforced Junkbox: Add missing epics
DELETE FROM `item_loot_template` WHERE `Entry` = 43575 AND `Item` IN (43611,43612,43613);
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(43575,43611,0,0.05,0,1,1,1,1,NULL), -- Krol Cleaver
(43575,43612,0,0.05,0,1,1,1,1,NULL), -- Spineslicer
(43575,43613,0,0.05,0,1,1,1,1,NULL); -- The Dusk Blade

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
