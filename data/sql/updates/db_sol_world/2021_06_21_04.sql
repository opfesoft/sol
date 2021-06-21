-- DB update 2021_06_21_03 -> 2021_06_21_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_21_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_21_03 2021_06_21_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624276379097732579'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624276379097732579');

DELETE FROM `pool_template` WHERE entry IN (501,502,503,504,505,506);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(501, 1, 'Water Barrel and Food Crate1'),
(502, 1, 'Water Barrel and Food Crate2'),
(503, 1, 'Water Barrel and Food Crate3'),
(504, 1, 'Water Barrel and Food Crate4'),
(505, 1, 'Water Barrel and Food Crate5'),
(506, 1, 'Water Barrel and Food Crate6');

DELETE FROM `pool_gameobject` WHERE pool_entry IN (501,502,503,504,505,506);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(29275,501, 0, 'Water Barrel and Food Crate - Spawn 1'),
(30758,501, 0, 'Water Barrel and Food Crate - Spawn 1'),
(32754,502, 0, 'Water Barrel and Food Crate - Spawn 2'),
(32313,502, 0, 'Water Barrel and Food Crate - Spawn 2'),
(30839,503, 0, 'Water Barrel and Food Crate - Spawn 3'),
(30677,503, 0, 'Water Barrel and Food Crate - Spawn 3'),
(29276,504, 0, 'Water Barrel and Food Crate - Spawn 4'),
(30687,504, 0, 'Water Barrel and Food Crate - Spawn 4'),
(10677,505, 0, 'Water Barrel and Food Crate - Spawn 5'),
(1462, 505, 0, 'Water Barrel and Food Crate - Spawn 5'),
(29609,506, 0, 'Water Barrel and Food Crate - Spawn 6'),
(29306,506, 0, 'Water Barrel and Food Crate - Spawn 6');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
