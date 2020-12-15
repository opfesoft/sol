-- DB update 2020_12_15_01 -> 2020_12_15_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_15_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_15_01 2020_12_15_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1608017658591571416'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1608017658591571416');

DELETE FROM `pool_template` WHERE `entry` IN (86300,77280,44863,29981);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(86300,1,'Sewer Beast Spawn (1 out 2)'),
(77280,1,'Fenissa the Assassin Spawn (1 out 2)'),
(44863,1,'Lost Soul Spawn (1 out 2)'),
(29981,1,'Pridewing Patriarch Spawn (1 out 2)');

DELETE FROM `pool_creature` WHERE `pool_entry` IN (86300,77280,44863,29981);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(86300,86300,0,'Sewer Beast 1'),
(86301,86300,0,'Sewer Beast 2'),

(77280,77280,0,'Fenissa the Assassin 1'),
(77281,77280,0,'Fenissa the Assassin 2'),

(44863,44863,0,'Lost Soul 1'),
(44864,44863,0,'Lost Soul 2'),

(29981,29981,0,'Pridewing Patriarch 1'),
(29982,29981,0,'Pridewing Patriarch 2');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
