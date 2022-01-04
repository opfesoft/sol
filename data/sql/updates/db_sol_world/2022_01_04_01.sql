-- DB update 2022_01_04_00 -> 2022_01_04_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_04_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_04_00 2022_01_04_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1641311813946110635'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1641311813946110635');

UPDATE `creature_loot_template` SET `Chance` = 20 WHERE `Entry` = 4371 AND `Item` = 22094;
DELETE FROM `creature_loot_template` WHERE `Item` = 22094 AND `Entry` IN (4368,16072);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(4368,22094,0,20,1,1,0,1,2,NULL),
(16072,22094,0,20,1,1,0,1,2,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
