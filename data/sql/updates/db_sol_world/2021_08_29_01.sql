-- DB update 2021_08_29_00 -> 2021_08_29_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_29_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_29_00 2021_08_29_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1630247866353491277'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1630247866353491277');

DELETE FROM `reference_loot_template` WHERE `Item` IN (1297,2234,4462,4724);

DELETE FROM `creature_loot_template` WHERE `Item` IN (1297,2234,4724);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(2553,1297,0,1,0,1,0,1,1,NULL), -- Witherbark Shadowcaster - Robes of the Shadowcaster
(2577,1297,0,1,0,1,0,1,1,NULL), -- Dark Iron Shadowcaster - Robes of the Shadowcaster
(920,2234,0,2,0,1,0,1,1,NULL),  -- Nightbane Tainted One - Nightwalker Armor
(2345,4724,0,4,0,1,0,1,1,NULL); -- Dun Garok Rifleman - Humbert's Helm

-- Lord Malathrom: Always drops either Spiked Collar (80%) or Cloak of Rot (20%)
UPDATE `creature_loot_template` SET `Chance` = 80 WHERE `Entry` = 503 AND `Item` = 1187 AND `GroupId` = 2;
UPDATE `creature_loot_template` SET `Chance` = 20 WHERE `Entry` = 503 AND `Item` = 4462 AND `GroupId` = 2;

DELETE FROM `reference_loot_template` WHERE `Item` IN (1998,3341);

DELETE FROM `creature_loot_template` WHERE `Item` IN (1998,3341);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(697,1998,0,1,0,1,0,1,1,NULL),  -- Bloodscalp Shaman - Bloodscalp Channeling Staff
(2562,3341,0,1,0,1,0,1,1,NULL), -- Boulderfist Ogre - Gauntlets of Ogre Strength
(2564,3341,0,1,0,1,0,1,1,NULL); -- Boulderfist Enforcer - Gauntlets of Ogre Strength

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
