-- DB update 2021_07_25_06 -> 2021_07_29_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_07_25_06';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_07_25_06 2021_07_29_00 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1627133872787794145'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1627133872787794145');

-- Set Bingles' tools to all have consistent respawn
UPDATE `gameobject` SET `spawntimesecs` = 2 WHERE `id` = 104564 AND `guid` = 12863;
UPDATE `gameobject` SET `spawntimesecs` = 2 WHERE `id` = 104569 AND `guid` = 12872;
UPDATE `gameobject` SET `spawntimesecs` = 2 WHERE `id` = 104574 AND `guid` = 12864;
UPDATE `gameobject` SET `spawntimesecs` = 2 WHERE `id` = 104575 AND `guid` = 12871;


--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
