-- DB update 2022_02_21_00 -> 2022_02_21_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_21_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_21_00 2022_02_21_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1645427867155550998'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1645427867155550998');

UPDATE `creature_template` SET `skinloot` = 3124 WHERE `entry` = 3124;
DELETE FROM `skinning_loot_template` WHERE `entry` = 3124;
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(3124,2318,0,10,0,1,1,1,1,NULL),
(3124,2934,0,90,0,1,1,1,1,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
