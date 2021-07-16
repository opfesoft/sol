-- DB update 2021_07_09_00 -> 2021_07_12_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_07_09_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_07_09_00 2021_07_12_00 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1625663426005917331'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1625663426005917331');

-- Move 5 ore nodes up by 6 units so they do not spawn underground
UPDATE `gameobject` SET `position_z` = 263.1 WHERE `id` = 1735 AND `guid` = 71090;
UPDATE `gameobject` SET `position_z` = 263.1 WHERE `id` = 2040 AND `guid` = 71091;
UPDATE `gameobject` SET `position_z` = 263.1 WHERE `id` = 1734 AND `guid` = 71092;
UPDATE `gameobject` SET `position_z` = 263.1 WHERE `id` = 1733 AND `guid` = 71093;
UPDATE `gameobject` SET `position_z` = 263.1 WHERE `id` = 2047 AND `guid` = 71094;


--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;