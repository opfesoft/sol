-- DB update 2022_02_18_00 -> 2022_02_18_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_18_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_18_00 2022_02_18_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1645180106888910594'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1645180106888910594');

-- Wildthorn Stalker
UPDATE `creature` SET `position_x` = 2405.11, `position_y` = 608.211, `position_z` = 132.785, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 34804;

-- Ghostpaw Runner
UPDATE `creature` SET `position_z` = 119.459 WHERE `guid` = 34954;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
