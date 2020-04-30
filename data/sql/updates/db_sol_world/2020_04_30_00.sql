-- DB update 2020_04_29_01 -> 2020_04_30_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_04_29_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_04_29_01 2020_04_30_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1588255890203852530'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1588255890203852530');

-- Sahvan Bloodshadow: Fix waypoint movement and add a few fitting emotes
UPDATE `waypoint_data` SET `move_type` = 0, `delay` = 1000 WHERE `id` = 319190 AND `point` = 4;
UPDATE `waypoint_data` SET `action` = 3191900 WHERE `id` = 319190 AND `point` = 8;
UPDATE `waypoint_data` SET `action` = 3191901 WHERE `id` = 319190 AND `point` = 11;
UPDATE `waypoint_data` SET `action` = 3191902 WHERE `id` = 319190 AND `point` = 18;

DELETE FROM `waypoint_scripts` WHERE `guid` IN (938,939,940);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`)
VALUES
(3191900,1,1,1,0,0,0,0,0,0,938),  -- Waypoint  8: Talk
(3191901,1,1,1,0,0,0,0,0,0,939),  -- Waypoint 11: Talk
(3191902,1,1,16,0,0,0,0,0,0,940); -- Waypoint 18: Kneel

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
