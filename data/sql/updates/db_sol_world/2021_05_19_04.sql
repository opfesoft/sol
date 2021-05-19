-- DB update 2021_05_19_03 -> 2021_05_19_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_05_19_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_05_19_03 2021_05_19_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1621459265147546728'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1621459265147546728');

DELETE FROM `creature_loot_template`  WHERE `Reference` = 0 AND `Item` IN (5182,5183,4949,3018,3227,2166,2167,2168,1218,1220,1296,1299,1300,1448,1460,1934,2021);
DELETE FROM `reference_loot_template` WHERE `Reference` = 0 AND `Item` IN (5182,5183,4949,3018,3227,2166,2167,2168,1218,1220,1296,1299,1300,1448,1460,1934,2021);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(3398,5182,0,75,0,1,2,1,1,NULL),  -- Gesharahan - Shiver Blade
(3398,5183,0,25,0,1,2,1,1,NULL),  -- Gesharahan - Pulsating Hydra Heart
(7170,4949,0,100,0,1,0,1,1,NULL), -- Thragomm - Orcish Cleaver
(521,3018,0,75,0,1,2,1,1,NULL),   -- Lupos - Hide of Lupos
(521,3227,0,25,0,1,2,1,1,NULL),   -- Lupos - Nightbane Staff
(626,2166,0,1,0,1,2,1,1,NULL),    -- Foreman Thistlenettle - Foreman's Leggings
(626,2167,0,1,0,1,2,1,1,NULL),    -- Foreman Thistlenettle - Foreman's Gloves
(626,2168,0,1,0,1,2,1,1,NULL),    -- Foreman Thistlenettle - Foreman's Boots
(445,1218,0,3,0,1,0,1,1,NULL),    -- Redridge Alpha - Heavy Gnoll War Club
(580,1220,0,2,0,1,0,1,1,NULL),    -- Redridge Drudger - Lupine Axe
(437,1296,0,2,0,1,0,1,1,NULL),    -- Blackrock Renegade - Blackrock Mace
(4065,1296,0,4,0,1,0,1,1,NULL),   -- Blackrock Sentry - Blackrock Mace
(436,1299,0,2,0,1,0,1,1,NULL),    -- Blackrock Shadowcaster - Lesser Belt of the Spire
(436,1300,0,1,0,1,0,1,1,NULL),    -- Blackrock Shadowcaster - Lesser Staff of the Spire
(485,1448,0,2,0,1,0,1,1,NULL),    -- Blackrock Outrunner - Blackrock Gauntlets
(4064,1448,0,4,0,1,0,1,1,NULL),   -- Blackrock Scout - Blackrock Gauntlets
(434,1460,0,1,0,1,0,1,1,NULL),    -- Rabid Shadowhide Gnoll - Shadowhide Two-handed Sword
(636,1934,0,6,0,1,0,1,1,NULL),    -- Defias Blackguard - Stonemason Trousers
(569,2021,0,1,0,1,0,1,1,NULL);    -- Green Recluse - Green Carapace Shield

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
