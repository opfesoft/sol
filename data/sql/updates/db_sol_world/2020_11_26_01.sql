-- DB update 2020_11_26_00 -> 2020_11_26_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_11_26_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_11_26_00 2020_11_26_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1606372695202865954'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1606372695202865954');

DELETE FROM `pool_template` WHERE `entry` = 203340;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(203340,1,'Big Roy Spawn (1 out 2)');

DELETE FROM `pool_creature` WHERE `pool_entry` = 203340;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(203340,203340,0,'Big Roy 1'),
(203496,203340,0,'Big Roy 2');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
