-- DB update 2020_12_11_02 -> 2020_12_11_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_11_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_11_02 2020_12_11_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1607725925421184481'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1607725925421184481');

UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 12237;

DELETE FROM `pool_creature` WHERE `guid` = 203506 AND `pool_entry` = 1211;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 12237 AND `source_type` = 0 AND `id` = 2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(12237,0,2,0,37,0,70,0,0,0,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Meshlok the Harvester - On AI Init - Despawn');

DELETE FROM `waypoint_data` WHERE `id` = 2035060;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(2035060,1,769.635,-74.2763,-56.2423,0,0,0,0,100,0),
(2035060,2,762.397,-75.5568,-56.7774,0,0,0,0,100,0),
(2035060,3,754.353,-76.98,-57.3833,0,0,0,0,100,0),
(2035060,4,735.053,-80.3947,-57.4985,0,0,0,0,100,0),
(2035060,5,715.063,-83.9313,-57.1144,0,0,0,0,100,0),
(2035060,6,699.906,-86.613,-57.4987,0,0,0,0,100,0),
(2035060,7,688.226,-91.3219,-57.4987,0,0,0,0,100,0),
(2035060,8,678.17,-95.3765,-57.4987,0,0,0,0,100,0),
(2035060,9,667.482,-91.6509,-57.4987,0,0,0,0,100,0),
(2035060,10,652.927,-86.5775,-57.4987,0,0,0,0,100,0),
(2035060,11,640.591,-91.5507,-57.4987,0,0,0,0,100,0),
(2035060,12,623.816,-98.3144,-57.4987,0,0,0,0,100,0),
(2035060,13,640.591,-91.5507,-57.4987,0,0,0,0,100,0),
(2035060,14,652.927,-86.5775,-57.4987,0,0,0,0,100,0),
(2035060,15,667.482,-91.6509,-57.4987,0,0,0,0,100,0),
(2035060,16,678.17,-95.3765,-57.4987,0,0,0,0,100,0),
(2035060,17,688.226,-91.3219,-57.4987,0,0,0,0,100,0),
(2035060,18,699.906,-86.613,-57.4987,0,0,0,0,100,0),
(2035060,19,715.063,-83.9313,-57.1144,0,0,0,0,100,0),
(2035060,20,735.053,-80.3947,-57.4985,0,0,0,0,100,0),
(2035060,21,754.353,-76.98,-57.3833,0,0,0,0,100,0),
(2035060,22,762.397,-75.5568,-56.7774,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
