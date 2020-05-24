-- DB update 2020_05_24_00 -> 2020_05_24_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_05_24_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_05_24_00 2020_05_24_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1590323243938541248'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1590323243938541248');

DELETE FROM `acore_string_locale` WHERE `entry` IN (30077,30078,30079);
INSERT INTO `acore_string_locale` (`entry`, `locale`, `content`)
VALUES
(30077, 'deDE', 'Sofortflug umschalten'),
(30078, 'deDE', 'Sofortflug EIN'),
(30079, 'deDE', 'Sofortflug AUS');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
