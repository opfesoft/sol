-- DB update 2021_05_19_01 -> 2021_05_19_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_05_19_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_05_19_01 2021_05_19_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1621419791290500213'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1621419791290500213');

UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 99155;
UPDATE `creature_addon` SET `path_id` = 991550 WHERE `guid` = 99155;

DELETE FROM `waypoint_data` WHERE `id` = 991550;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(991550,1,1366.8,-3327.05,173.928,5.03127,30000,0,0,100,0),
(991550,2,1365.41,-3322.14,174.402,0,0,0,0,100,0),
(991550,3,1365.49,-3305.29,174.401,0,0,0,0,100,0),
(991550,4,1365.56,-3287.97,174.33,0,0,0,0,100,0),
(991550,5,1354.14,-3270.04,174.256,0,0,0,0,100,0),
(991550,6,1355.03,-3269.41,174.256,0.678835,30000,0,0,100,0),
(991550,7,1347.89,-3260.37,174.255,0,0,0,0,100,0),
(991550,8,1328.04,-3248.22,174.287,0,0,0,0,100,0),
(991550,9,1327.79,-3248.83,174.287,4.40948,30000,0,0,100,0),
(991550,10,1335.24,-3252.49,174.256,0,0,0,0,100,0),
(991550,11,1347.89,-3260.37,174.255,0,0,0,0,100,0),
(991550,12,1360.37,-3279.25,174.286,0,0,0,0,100,0),
(991550,13,1359.63,-3279.76,174.284,3.62016,30000,0,0,100,0),
(991550,14,1365.56,-3287.97,174.33,0,0,0,0,100,0),
(991550,15,1365.49,-3305.29,174.401,0,0,0,0,100,0),
(991550,16,1365.41,-3322.14,174.402,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;