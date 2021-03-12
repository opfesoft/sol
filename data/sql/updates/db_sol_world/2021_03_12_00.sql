-- DB update 2021_03_11_00 -> 2021_03_12_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_03_11_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_03_11_00 2021_03_12_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1615574245099925671'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1615574245099925671');

UPDATE `creature_template` SET `InhabitType` = `InhabitType` | 4 WHERE `entry` = 6141;
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 32317;
UPDATE `creature_addon` SET `path_id` = 323170 WHERE `guid` = 32317;

DELETE FROM `waypoint_data` WHERE `id` = 323170;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(323170,1,1376.92,948.651,176.785,0,0,0,0,100,0),
(323170,2,1355.16,898.244,178.581,0,0,0,0,100,0),
(323170,3,1438.06,857.081,166.777,0,0,0,0,100,0),
(323170,4,1442.23,933.453,162.101,0,0,0,0,100,0),
(323170,5,1417.35,995.975,180.832,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
