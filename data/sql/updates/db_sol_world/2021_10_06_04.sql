-- DB update 2021_10_06_03 -> 2021_10_06_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_06_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_06_03 2021_10_06_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1633503201524570973'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1633503201524570973');

UPDATE `gameobject` SET `spawntimesecs` = 3600 WHERE `guid` = 85887;

DELETE FROM `pool_template` WHERE `entry` = 11670;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(11670,1,'Battered Chests - Jangolode Mine (1 out of 3)');

DELETE FROM `pool_gameobject` WHERE `pool_entry` = 11670;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(42718,11670,0,'Battered Chest, Jangolode Mine, Node 1'),
(85887,11670,0,'Battered Chest, Jangolode Mine, Node 2'),
(42739,11670,0,'Battered Chest, Jangolode Mine, Node 3');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
