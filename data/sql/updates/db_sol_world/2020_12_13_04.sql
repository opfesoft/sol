-- DB update 2020_12_13_03 -> 2020_12_13_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_13_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_13_03 2020_12_13_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1607818536330406757'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1607818536330406757');

UPDATE `creature_template` SET `modelid1` = 31174 WHERE `entry` = 18762;

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 67042;

DELETE FROM `creature_addon` WHERE `guid` = 67042;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(67042,670420,0,0,0,0,0,NULL);

DELETE FROM `waypoint_data` WHERE `id` = 670420;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(670420,1,-1740.91,5144.25,-37.2044,0,0,0,0,100,0),
(670420,2,-1738.9,5141.24,-37.2426,0,30000,0,0,100,0),
(670420,3,-1731.19,5145.4,-37.2044,0,30000,0,0,100,0),
(670420,4,-1739.26,5145.86,-37.2044,0,0,0,0,100,0),
(670420,5,-1739.35,5148.08,-37.2044,0,30000,0,0,100,0);

UPDATE `creature` SET `orientation` = 0.482994 WHERE `guid` = 68635;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
