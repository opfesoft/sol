-- DB update 2021_10_13_01 -> 2021_10_13_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_13_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_13_01 2021_10_13_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1634120517108324553'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1634120517108324553');

UPDATE `gameobject_loot_template` SET `Chance` = 100, `GroupId` = 0 WHERE `Entry` = 2264 AND `Item` = 4611;
UPDATE `gameobject_loot_template` SET `Chance` = 35, `GroupId` = 0 WHERE `Entry` = 2264 AND `Item` = 4655;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
