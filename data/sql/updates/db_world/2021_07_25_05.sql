-- DB update 2021_07_25_04 -> 2021_07_25_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_07_25_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_07_25_04 2021_07_25_05 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1626861668380896800'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1626861668380896800');

-- Changed the spawn timer from 2 hours to 10 minutes for the item Waterlogged Letter
UPDATE `gameobject` SET `spawntimesecs` = 600 WHERE (`id` = 2656) AND (`guid` IN (14656));


--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
