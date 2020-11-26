-- DB update 2020_11_26_01 -> 2020_11_26_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_11_26_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_11_26_01 2020_11_26_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1606425671928493979'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1606425671928493979');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 574 AND `source_type` = 0 AND `id` = 2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(574,0,2,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Naraxis - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 50150;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(50150,1,-10567.5,-1497.46,92.024,0,0,0,0,100,0),
(50150,2,-10573.5,-1498.21,91.4401,0,90000,0,0,100,0),
(50150,3,-10581.9,-1499.62,92.0555,0,0,0,0,100,0),
(50150,4,-10591.4,-1501.23,91.3076,0,0,0,0,100,0),
(50150,5,-10597.9,-1502.32,92.5709,0,0,0,0,100,0),
(50150,6,-10603.2,-1503.78,92.631,0,0,0,0,100,0),
(50150,7,-10608.1,-1505.1,92.1992,0,0,0,0,100,0),
(50150,8,-10610.4,-1505.75,91.4171,0,0,0,0,100,0),
(50150,9,-10614.2,-1506.79,91.0415,0,0,0,0,100,0),
(50150,10,-10620.3,-1502.29,90.6159,0,0,0,0,100,0),
(50150,11,-10626.5,-1497.71,90.5083,0,0,0,0,100,0),
(50150,12,-10632.5,-1493.29,90.5234,0,10000,0,0,100,0),
(50150,13,-10636.2,-1503.74,90.7391,0,0,0,0,100,0),
(50150,14,-10640,-1514.55,90.5081,0,6000,0,0,100,0),
(50150,15,-10628.2,-1522.73,90.5088,0,0,0,0,100,0),
(50150,16,-10620.6,-1512.71,90.5123,0,0,0,0,100,0),
(50150,17,-10614,-1504.09,91.0183,0,0,0,0,100,0),
(50150,18,-10610,-1503.53,91.4101,0,0,0,0,100,0),
(50150,19,-10608,-1503.23,92.0744,0,0,0,0,100,0),
(50150,20,-10600.7,-1502.19,92.6074,0,0,0,0,100,0),
(50150,21,-10594.9,-1501.37,92.2849,0,0,0,0,100,0),
(50150,22,-10590.1,-1500.68,91.2654,0,0,0,0,100,0),
(50150,23,-10585.8,-1500.07,91.6194,0,0,0,0,100,0),
(50150,24,-10580.7,-1499.34,91.9548,0,0,0,0,100,0),
(50150,25,-10575.1,-1498.54,91.3825,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
