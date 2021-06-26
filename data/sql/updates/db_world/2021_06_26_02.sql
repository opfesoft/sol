-- DB update 2021_06_26_01 -> 2021_06_26_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_06_26_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_06_26_01 2021_06_26_02 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1624172983045469393'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1624172983045469393');

-- Relocate Wild Gryphon spawn and enable random movement
UPDATE `creature` 
SET `position_x` = -269.935, `position_y` = -1409.396, `position_z` = 91.607, `orientation` = 1.929, `wander_distance` = 15, `MovementType` = 1
WHERE `guid`= 14851;

UPDATE `creature` SET `wander_distance` = 15, `MovementType` = 1 WHERE `guid` = 15974;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
