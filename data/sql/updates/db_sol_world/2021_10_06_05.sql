-- DB update 2021_10_06_04 -> 2021_10_06_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_06_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_06_04 2021_10_06_05 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1633516670473822045'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1633516670473822045');

UPDATE `gameobject` SET `spawntimesecs` = 7200 WHERE `guid` IN (18572,33475,17033,18577,18562,18547);

DELETE FROM `pool_template` WHERE `entry` IN (11671,11672,11673,11674,11675);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(11671,1,'Solid Chests - Raven Hill Cementary (1 out of 5)'),
(11672,1,'Solid Chests - Woods of Duskwood (1 out of 2)'),
(11673,1,'Solid Chests - Ghost Mary (1 out of 3)'),
(11674,1,'Solid Chests - Woods north of Darkshire (1 out of 3)'),
(11675,1,'Solid Chests - VulGol Ogre Mound (1 out of 4)');

DELETE FROM `pool_gameobject` WHERE `pool_entry` IN (11671,11672,11673,11674,11675);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(85666,11671,0,'Solid Chest, Raven Hill Cementary, Node 1'),
(18572,11671,0,'Solid Chest, Raven Hill Cementary, Node 2'),
(85665,11671,0,'Solid Chest, Raven Hill Cementary, Node 3'),
(85667,11671,0,'Solid Chest, Raven Hill Cementary, Node 4'),
(85808,11671,0,'Solid Chest, Raven Hill Cementary, Node 5'),

(33475,11672,0,'Solid Chest, Woods of Duskwood, Node 1'),
(85807,11672,0,'Solid Chest, Woods of Duskwood, Node 2'),

(17033,11673,0,'Solid Chest, Ghost Mary, Node 1'),
(85809,11673,0,'Solid Chest, Ghost Mary, Node 2'),
(85810,11673,0,'Solid Chest, Ghost Mary, Node 3'),

(85663,11674,0,'Solid Chest, Woods north of Darkshire, Node 1'),
(85839,11674,0,'Solid Chest, Woods north of Darkshire, Node 2'),
(18577,11674,0,'Solid Chest, Woods north of Darkshire, Node 3'),

(18562,11675,0,'Solid Chest, VulGol Ogre Mound, Node 1'),
(18547,11675,0,'Solid Chest, VulGol Ogre Mound, Node 2'),
(85844,11675,0,'Solid Chest, VulGol Ogre Mound, Node 3'),
(85675,11675,0,'Solid Chest, VulGol Ogre Mound, Node 4');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
