-- DB update 2020_12_02_04 -> 2020_12_02_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_02_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_02_04 2020_12_02_05 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1606923050028269606'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1606923050028269606');

UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 14221;

UPDATE `creature_model_info` SET `DisplayID_Other_Gender` = 0 WHERE `DisplayID` = 2582;
UPDATE `creature_equip_template` SET `ItemID1` = 4560, `VerifiedBuild` = 0 WHERE `CreatureID` = 14221 AND `ID` = 1;

UPDATE `creature` SET `position_x` = 710.176, `position_y` = -847.23, `position_z` = 158.978, `MovementType` = 2 WHERE `guid` = 86756;

DELETE FROM `creature_addon` WHERE `guid` = 86756;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(86756,867560,0,0,1,0,0,NULL);

DELETE FROM `smart_scripts` WHERE `entryorguid` = 14221 AND `source_type` = 0 AND `id` = 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14221,0,1,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gravis Slipknot - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 867560;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(867560,1,710.176,-847.23,158.978,0,0,0,0,100,0),
(867560,2,705.031,-850.219,158.398,0,0,0,0,100,0),
(867560,3,700.134,-853.063,158.516,0,0,0,0,100,0),
(867560,4,693.181,-850.681,158.545,0,0,0,0,100,0),
(867560,5,684.42,-847.68,158.498,0,0,0,0,100,0),
(867560,6,678.208,-851.609,158.448,0,0,0,0,100,0),
(867560,7,672.511,-855.213,158.397,0,0,0,0,100,0),
(867560,8,666.937,-858.739,158.498,0,0,0,0,100,0),
(867560,9,663.885,-866.644,158.499,0,0,0,0,100,0),
(867560,10,663.135,-874.307,158.399,0,0,0,0,100,0),
(867560,11,662.637,-879.389,158.291,0,0,0,0,100,0),
(867560,12,659.842,-884.845,158.617,0,0,0,0,100,0),
(867560,13,661.647,-888.761,159.517,0,0,0,0,100,0),
(867560,14,663.447,-892.668,161.809,0,0,0,0,100,0),
(867560,15,664.912,-895.846,163.288,0,0,0,0,100,0),
(867560,16,666.729,-899.79,164.624,0,0,0,0,100,0),
(867560,17,669.022,-904.201,164.414,0,0,0,0,100,0),
(867560,18,668.178,-912.559,164.29,0,0,0,0,100,0),
(867560,19,667.229,-921.961,164.414,0,0,0,0,100,0),
(867560,20,667.02,-930.127,164.305,0,0,0,0,100,0),
(867560,21,666.778,-939.546,164.85,0,0,0,0,100,0),
(867560,22,669.966,-944.57,164.536,0,0,0,0,100,0),
(867560,23,673.587,-950.274,164.35,0,0,0,0,100,0),
(867560,24,679.588,-955.286,164.29,0,0,0,0,100,0),
(867560,25,684.347,-959.261,164.35,0,0,0,0,100,0),
(867560,26,692.401,-963.22,164.32,0,0,0,0,100,0),
(867560,27,698.708,-966.321,164.653,0,0,0,0,100,0),
(867560,28,703.974,-971.939,164.959,0,0,0,0,100,0),
(867560,29,708.321,-976.576,165.562,0,30000,0,0,100,0),
(867560,30,705.877,-970.769,164.88,0,0,0,0,100,0),
(867560,31,703.297,-964.64,164.344,0,0,0,0,100,0),
(867560,32,700.121,-957.096,164.68,0,0,0,0,100,0),
(867560,33,703.816,-951.291,164.974,0,0,0,0,100,0),
(867560,34,706.394,-947.241,164.972,0,0,0,0,100,0),
(867560,35,710.593,-940.645,164.356,0,0,0,0,100,0),
(867560,36,715.224,-933.369,164.344,0,0,0,0,100,0),
(867560,37,715.523,-925.794,164.727,0,0,0,0,100,0),
(867560,38,715.867,-917.051,165.301,0,0,0,0,100,0),
(867560,39,716.194,-908.769,165.88,0,0,0,0,100,0),
(867560,40,716.543,-899.917,166.366,0,0,0,0,100,0),
(867560,41,716.211,-891.643,165.849,0,0,0,0,100,0),
(867560,42,715.897,-883.83,165.046,0,0,0,0,100,0),
(867560,43,715.565,-875.579,164.1,0,0,0,0,100,0),
(867560,44,715.204,-866.595,161.66,0,0,0,0,100,0),
(867560,45,716.034,-859.764,160.87,0,0,0,0,100,0),
(867560,46,716.877,-852.822,160.645,0,0,0,0,100,0),
(867560,47,717.657,-846.403,160.754,3.35103,30000,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
