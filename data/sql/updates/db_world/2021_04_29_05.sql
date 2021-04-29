-- DB update 2021_04_29_04 -> 2021_04_29_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_04_29_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_04_29_04 2021_04_29_05 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1619641851979377067'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1619641851979377067');

SET
@POOL            = 11659,
@POOLSIZE        = 5,
@POOLDESC        = 'Treasures - Tanaris',
@RESPAWN         = 900,
@GUID = '17298,17299,17300,17329,17330,17331,85717,85720,85729,85731,85733,85736,85737,85738,85781,85782,85783,85784,85895,85896';

-- Create pool(s)
DELETE FROM `pool_template` WHERE `entry`=@POOL;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES (@POOL,@POOLSIZE,@POOLDESC);

-- Add gameobjects to pools
DELETE FROM `pool_gameobject` WHERE FIND_IN_SET (`guid`,@GUID);
INSERT INTO `pool_gameobject` (`guid`,`pool_entry`,`chance`,`description`) VALUES
(17298,@POOL,0,'Solid Chest, Tanaris, node 1'),
(17299,@POOL,0,'Solid Chest, Tanaris, node 2'),
(17300,@POOL,0,'Solid Chest, Tanaris, node 3'),
(17329,@POOL,0,'Solid Chest, Tanaris, node 4'),
(17330,@POOL,0,'Solid Chest, Tanaris, node 5'),
(17331,@POOL,0,'Solid Chest, Tanaris, node 6'),
(85717,@POOL,0,'Solid Chest, Tanaris, node 7'),
(85720,@POOL,0,'Solid Chest, Tanaris, node 8'),
(85729,@POOL,0,'Solid Chest, Tanaris, node 9'),
(85731,@POOL,0,'Solid Chest, Tanaris, node 10'),
(85733,@POOL,0,'Solid Chest, Tanaris, node 11'),
(85736,@POOL,0,'Solid Chest, Tanaris, node 12'),
(85737,@POOL,0,'Solid Chest, Tanaris, node 13'),
(85738,@POOL,0,'Solid Chest, Tanaris, node 14'),
(85781,@POOL,0,'Solid Chest, Tanaris, node 15'),
(85782,@POOL,0,'Solid Chest, Tanaris, node 16'),
(85783,@POOL,0,'Solid Chest, Tanaris, node 17'),
(85784,@POOL,0,'Solid Chest, Tanaris, node 18'),
(85895,@POOL,0,'Solid Chest, Tanaris, node 19'),
(85896,@POOL,0,'Solid Chest, Tanaris, node 20');



-- Respawn rates of gameobjects
UPDATE `gameobject` SET `spawntimesecs`=@RESPAWN WHERE FIND_IN_SET (`guid`,@GUID);


--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
