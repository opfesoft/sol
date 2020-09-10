-- DB update 2020_09_09_00 -> 2020_09_10_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_09_09_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_09_09_00 2020_09_10_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1599724219726808557'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1599724219726808557');

UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0, `orientation` = 0.619574 WHERE `guid` = 9464; -- Edwina Monzor
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0, `orientation` = 5.4537 WHERE `guid` = 9527;   -- Murndan Derth

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
