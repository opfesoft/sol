-- DB update 2021_06_24_03 -> 2021_06_24_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_24_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_24_03 2021_06_24_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624549051876697711'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624549051876697711');

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 27433;

DELETE FROM `creature_addon` WHERE `guid` = 27433;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(27433,274330,0,0,4097,0,1,NULL);

DELETE FROM `waypoint_data` WHERE `id` = 274330;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(274330,1,-835.87,-419.49,-33.8904,0,0,0,0,100,0),
(274330,2,-833.91,-391.22,-33.8904,1.928,20000,0,0,100,0),
(274330,3,-835.87,-419.49,-33.8904,0,0,0,0,100,0),
(274330,4,-832.57,-461.36,-34.0912,0,0,0,0,100,0),
(274330,5,-850.49,-467.74,-34.0226,0,0,0,0,100,0),
(274330,6,-848.45,-453.86,-33.8922,1.253,20000,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
