-- DB update 2021_10_06_02 -> 2021_10_06_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_06_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_06_02 2021_10_06_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1633502548653426117'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1633502548653426117');

UPDATE `gameobject` SET `spawntimesecs` = 3600 WHERE `guid` IN (85756,85879,85745,87390,85746,85770,85747);

DELETE FROM `pool_template` WHERE `entry` IN (11665,11666,11667,11668,11669);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(11665,1,'Battered Chests - Murloc Encampment near Goldshire (1 out of 3)'),
(11666,1,'Battered Chests - Brackwell Pumpin Patch (1 out of 4)'),
(11667,1,'Battered Chests - Jerods Landing (1 out of 3)'),
(11668,1,'Battered Chests - Fargodepp Mine Entrance (1 out of 2)'),
(11669,1,'Battered Chests - Forests Edge (1 out of 3)');

DELETE FROM `pool_gameobject` WHERE `pool_entry` IN (11665,11666,11667,11668,11669);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(33616,11665,0,'Battered Chest, Murloc Encampment near Goldshire, Node 1'),
(26234,11665,0,'Battered Chest, Murloc Encampment near Goldshire, Node 2'),
(26978,11665,0,'Battered Chest, Murloc Encampment near Goldshire, Node 3'),

(85756,11666,0,'Battered Chest, Brackwell Pumpin Patch, Node 1'),
(85879,11666,0,'Battered Chest, Brackwell Pumpin Patch, Node 2'),
(85745,11666,0,'Battered Chest, Brackwell Pumpin Patch, Node 3'),
(26916,11666,0,'Battered Chest, Brackwell Pumpin Patch, Node 4'),

(26895,11667,0,'Battered Chest, Jerods Landing, Node 1'),
(87390,11667,0,'Battered Chest, Jerods Landing, Node 2'),
(85746,11667,0,'Battered Chest, Jerods Landing, Node 3'),

(30950,11668,0,'Battered Chest, Fargodepp Mine Entrance, Node 1'),
(85770,11668,0,'Battered Chest, Fargodepp Mine Entrance, Node 2'),

(26865,11669,0,'Battered Chest, Forests Edge, Node 1'),
(85747,11669,0,'Battered Chest, Forests Edge, Node 2'),
(34032,11669,0,'Battered Chest, Forests Edge, Node 3');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
