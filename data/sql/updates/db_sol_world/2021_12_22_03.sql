-- DB update 2021_12_22_02 -> 2021_12_22_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_22_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_22_02 2021_12_22_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1640211220255372693'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1640211220255372693');

DELETE FROM `creature_loot_template` WHERE `Item` = 9361 AND `Entry` IN (5432,7899,7901,7902);
DELETE FROM `item_loot_template` WHERE `Item` IN (9360,9361) AND `Entry` = 9265;
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(9265,9360,0,90,0,1,1,1,1,NULL),
(9265,9361,0,10,0,1,1,1,1,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
