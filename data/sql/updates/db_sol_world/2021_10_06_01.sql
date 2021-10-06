-- DB update 2021_10_06_00 -> 2021_10_06_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_06_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_06_00 2021_10_06_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1633500265256009246'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1633500265256009246');

DELETE FROM `pool_template` WHERE `entry` IN (11660,11661,11662,11663,11664);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(11660,1,'Solid Chests - Winterspring (1 out of 2)'),
(11661,1,'Solid Chests - Winterfall Village (1 out of 4)'),
(11662,1,'Solid Chests - Lake KelTheril (1 out of 2)'),
(11663,1,'Solid Chests - Timbermaw Post (1 out of 2)'),
(11664,1,'Solid Chests - Frostfire Hot Springs (1 out of 2)');

DELETE FROM `pool_gameobject` WHERE `pool_entry` IN (11660,11661,11662,11663,11664);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(85800,11660,0,'Solid Chest, Winterspring, Node 1'),
(87393,11660,0,'Solid Chest, Winterspring, Node 2'),

(49091,11661,0,'Solid Chest, Winterfall Village, Node 1'),
(85798,11661,0,'Solid Chest, Winterfall Village, Node 2'),
(85799,11661,0,'Solid Chest, Winterfall Village, Node 3'),
(85803,11661,0,'Solid Chest, Winterfall Village, Node 4'),

(49088,11662,0,'Solid Chest, Lake KelTheril, Node 1'),
(85802,11662,0,'Solid Chest, Lake KelTheril, Node 2'),

(49089,11663,0,'Solid Chest, Timbermaw Post, Node 1'),
(85796,11663,0,'Solid Chest, Timbermaw Post, Node 2'),

(49090,11664,0,'Solid Chest, Frostfire Hot Springs, Node 1'),
(85801,11664,0,'Solid Chest, Frostfire Hot Springs, Node 2');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
