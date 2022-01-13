-- DB update 2022_01_13_00 -> 2022_01_13_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_13_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_13_00 2022_01_13_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1642073022767689887'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1642073022767689887');

UPDATE `creature` SET `equipment_id` = 1 WHERE `guid` = 247885;

DELETE FROM `creature_id_chance` WHERE `guid` IN (45763,247885);
INSERT INTO `creature_id_chance` (`guid`, `id`, `chance`)
VALUES
(45763,9692,70),
(247885,11471,70);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
