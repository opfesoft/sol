-- DB update 2022_01_21_01 -> 2022_01_22_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_21_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_21_01 2022_01_22_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1642866622215186351'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1642866622215186351');

DELETE FROM `reference_loot_template` WHERE `Item` IN (1680,1986,1677);
DELETE FROM `creature_loot_template` WHERE `Item` IN (1680,1986,1677);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(723,1680,0,5,0,1,0,1,1,NULL),
(680,1677,0,2,0,1,0,1,1,NULL),
(709,1986,0,3,0,1,0,1,1,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
