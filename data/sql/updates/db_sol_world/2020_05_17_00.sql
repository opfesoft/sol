-- DB update 2020_05_15_00 -> 2020_05_17_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_05_15_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_05_15_00 2020_05_17_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1589667119657326841'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1589667119657326841');

-- Bael Modan Flying Machine: Set time before the initial state is restored (otherwise the plane won't explode and disappear)
UPDATE `gameobject_template` SET `Data3` = 3000 WHERE `entry` = 3644;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
