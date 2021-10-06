-- DB update 2021_10_04_04 -> 2021_10_07_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_10_04_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_10_04_04 2021_10_07_00 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1633501534792643595'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1633501534792643595');

-- Change the spawn time of Incendosaur from 500 seconds (9 minutes) to 60 seconds (1 minute)
UPDATE `creature` SET `spawntimesecs` = 120 WHERE (`id` = 9318) AND (`guid` IN (5874 , 5876, 5878, 5879, 5883, 5899 ,5901, 5902, 5904, 5905, 5906, 5907, 5911));


--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
