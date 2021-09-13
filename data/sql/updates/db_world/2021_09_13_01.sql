-- DB update 2021_09_13_00 -> 2021_09_13_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_09_13_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_09_13_00 2021_09_13_01 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1631329691460885909'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1631329691460885909');

-- Set Felix's Box respawn to 10 seconds
UPDATE `gameobject` SET `spawntimesecs` = 10 WHERE `id` = 148499 AND `guid`= 1380;

-- Set Felix's Chest respawn to 10 seconds
UPDATE `gameobject` SET `spawntimesecs` = 10 WHERE `id` = 178084 AND `guid`= 1386;

-- Set Felix's Bucket of Bolts respawn to 10 seconds
UPDATE `gameobject` SET `spawntimesecs` = 10 WHERE `id` = 178085 AND `guid`= 1394;


--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
