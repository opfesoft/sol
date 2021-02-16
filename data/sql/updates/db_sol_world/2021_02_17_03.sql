-- DB update 2021_02_17_02 -> 2021_02_17_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_17_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_17_02 2021_02_17_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1613519286524853543'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1613519286524853543');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (20238,-96992,-96993,-96994) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-96992,0,0,0,1,0,100,0,1000,3000,3000,7000,0,11,35063,0,0,0,0,0,19,20251,20,0,0,0,0,0,0,'Honor Hold Scout - OOC - Cast ''Shoot Honor Hold Scout Archery Target'''),
(-96993,0,0,0,1,0,100,0,1000,3000,3000,7000,0,11,35063,0,0,0,0,0,19,20251,20,0,0,0,0,0,0,'Honor Hold Scout - OOC - Cast ''Shoot Honor Hold Scout Archery Target'''),
(-96994,0,0,0,1,0,100,0,1000,3000,3000,7000,0,11,35063,0,0,0,0,0,19,20251,20,0,0,0,0,0,0,'Honor Hold Scout - OOC - Cast ''Shoot Honor Hold Scout Archery Target''');

DELETE FROM `waypoint_data` WHERE `id` = 969900;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(969900,1,273.556,1451.37,-13.1796,0,0,0,0,100,0),
(969900,2,276.37,1443.57,-11.3915,0,0,0,0,100,0),
(969900,3,282.938,1425.12,-7.92788,0,0,0,0,100,0),
(969900,4,293.718,1417.53,-4.1559,0,0,0,0,100,0),
(969900,5,301.447,1412.1,-3.0832,0,0,0,0,100,0),
(969900,6,317.648,1400.7,-3.46094,0,0,0,0,100,0),
(969900,7,328.798,1406.6,-1.92297,0,0,0,0,100,0),
(969900,8,338.622,1408.63,-0.748149,0,0,0,0,100,0),
(969900,9,346.958,1410.35,-0.133867,0,0,0,0,100,0),
(969900,10,353.07,1424.86,-0.514408,0,0,0,0,100,0),
(969900,11,353.893,1437.09,-0.91202,0,0,0,0,100,0),
(969900,12,354.967,1453.04,1.139,0,0,0,0,100,0),
(969900,13,349.592,1460.52,0.00613802,0,0,0,0,100,0),
(969900,14,341.971,1471.13,-2.91468,0,0,0,0,100,0),
(969900,15,335.879,1479.61,-5.46288,0,0,0,0,100,0),
(969900,16,326.931,1485.1,-7.05852,0,0,0,0,100,0),
(969900,17,315.942,1491.85,-10.0777,0,0,0,0,100,0),
(969900,18,306.277,1493.55,-12.6298,0,0,0,0,100,0),
(969900,19,293.123,1485.15,-13.0635,0,0,0,0,100,0),
(969900,20,285.726,1478.04,-12.1873,0,0,0,0,100,0),
(969900,21,279.242,1471.8,-13.2138,0,0,0,0,100,0),
(969900,22,276.306,1461.25,-13.057,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
