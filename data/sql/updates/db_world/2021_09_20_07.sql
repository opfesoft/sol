-- DB update 2021_09_20_06 -> 2021_09_20_07
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_09_20_06';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_09_20_06 2021_09_20_07 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1631782029155380281'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1631782029155380281');

-- Decreases the respawn time, so the quest chests are not despawning
UPDATE `gameobject` SET `spawntimesecs` = 0 WHERE `id` = 176344 AND `guid` IN (17201);
UPDATE `gameobject` SET `spawntimesecs` = 0 WHERE `id` = 190483 AND `guid` IN (17199);
UPDATE `gameobject` SET `spawntimesecs` = 0 WHERE `id` = 190484 AND `guid` IN (17200);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
