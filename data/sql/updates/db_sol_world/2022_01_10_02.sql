-- DB update 2022_01_10_01 -> 2022_01_10_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_10_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_10_01 2022_01_10_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1641836399294370140'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1641836399294370140');

DELETE FROM `acore_string` WHERE `entry` = 31077;
INSERT INTO `acore_string` (`entry`, `content_default`)
VALUES
(31077,'Warning: Gameobject found more than once - you will be teleported to the first one found in DB.');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
