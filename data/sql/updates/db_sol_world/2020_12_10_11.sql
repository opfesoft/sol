-- DB update 2020_12_10_10 -> 2020_12_10_11
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_10_10';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_10_10 2020_12_10_11 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1607639880696025675'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1607639880696025675');

UPDATE `creature_addon` SET `bytes2` = 1 WHERE `guid` = 32872;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 10640 AND `source_type` = 0 AND `id` = 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10640,0,1,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Oakpaw - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 328720;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(328720,1,2261.44,-1529.24,88.7967,0,0,0,0,100,0),
(328720,2,2260.91,-1513.25,89.1092,0,0,0,0,100,0),
(328720,3,2259.85,-1495.38,88.9039,0,0,0,0,100,0),
(328720,4,2259.24,-1484.96,89.8733,0,0,0,0,100,0),
(328720,5,2259.09,-1476.55,90.8175,0,0,0,0,100,0),
(328720,6,2258.92,-1467.04,91.5167,0,0,0,0,100,0),
(328720,7,2258.7,-1458.41,91.0017,0,0,0,0,100,0),
(328720,8,2258.49,-1449.89,90.1639,0,0,0,0,100,0),
(328720,9,2259.41,-1438.03,88.8727,0,0,0,0,100,0),
(328720,10,2267.2,-1424.04,87.7098,0,0,0,0,100,0),
(328720,11,2280.5,-1422.29,87.1541,0,0,0,0,100,0),
(328720,12,2289.77,-1427.01,87.0854,0,0,0,0,100,0),
(328720,13,2288.78,-1441.93,87.9605,0,0,0,0,100,0),
(328720,14,2283.53,-1460.21,89.7627,0,0,0,0,100,0),
(328720,15,2278.52,-1475.52,89.7268,0,0,0,0,100,0),
(328720,16,2271.8,-1496.02,88.4314,0,0,0,0,100,0),
(328720,17,2267.49,-1510.56,88.5033,0,0,0,0,100,0),
(328720,18,2264.01,-1522.3,88.7028,0,0,0,0,100,0),
(328720,19,2259.72,-1536.8,89.0244,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
