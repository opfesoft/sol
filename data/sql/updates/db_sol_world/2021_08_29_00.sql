-- DB update 2021_08_28_00 -> 2021_08_29_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_28_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_28_00 2021_08_29_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1630247424050473284'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1630247424050473284');

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 2499;
UPDATE `creature_addon` SET `path_id` = 24990 WHERE `guid` = 2499;

DELETE FROM `waypoint_data` WHERE `id` = 24990;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(24990,1,11077.9,1902.37,1342.63,0,12000,0,0,100,0),
(24990,2,11074.8,1906.22,1339.68,0,0,0,0,100,0),
(24990,3,11070.4,1912,1335.9,0,0,0,0,100,0),
(24990,4,11064.5,1915.1,1334.27,0,0,0,0,100,0),
(24990,5,11059.4,1917.83,1332.84,0,0,0,0,100,0),
(24990,6,11056.6,1919.3,1333.59,0,0,0,0,100,0),
(24990,7,11052.3,1921.55,1332.64,0,0,0,0,100,0),
(24990,8,11043.6,1918.08,1330.18,0,0,0,0,100,0),
(24990,9,11031.8,1913.38,1328.7,0,0,0,0,100,0),
(24990,10,11021.3,1909.22,1327.03,0,12000,0,0,100,0),
(24990,11,11031.8,1913.38,1328.7,0,0,0,0,100,0),
(24990,12,11043.6,1918.08,1330.18,0,0,0,0,100,0),
(24990,13,11052.3,1921.55,1332.64,0,0,0,0,100,0),
(24990,14,11056.6,1919.3,1333.59,0,0,0,0,100,0),
(24990,15,11059.4,1917.83,1332.84,0,0,0,0,100,0),
(24990,16,11064.5,1915.1,1334.27,0,0,0,0,100,0),
(24990,17,11070.4,1912,1335.9,0,0,0,0,100,0),
(24990,18,11074.8,1906.22,1339.68,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;