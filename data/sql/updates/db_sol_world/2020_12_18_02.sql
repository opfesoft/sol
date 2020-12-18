-- DB update 2020_12_18_01 -> 2020_12_18_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_18_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_18_01 2020_12_18_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1608302430046593247'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1608302430046593247');

UPDATE `creature` SET `position_x` = -493.161, `position_y` = 6444.8, `position_z` = 19.5882, `orientation` = 1.13647 WHERE `guid` = 86744;
UPDATE `creature` SET `position_x` = -1021.9, `position_y` = 5115.91, `position_z` = 18.4546, `orientation` = 2.23211 WHERE `guid` = 86745;

DELETE FROM `pool_template` WHERE `entry` = 86744;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(86744,1,'Bog Lurker (1 out 3)');

DELETE FROM `pool_creature` WHERE `pool_entry` = 86744;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(86744,86744,0,'Bog Lurker 1'),
(86745,86744,0,'Bog Lurker 2'),
(86746,86744,0,'Bog Lurker 3');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
