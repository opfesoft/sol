-- DB update 2020_11_30_03 -> 2020_11_30_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_11_30_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_11_30_03 2020_11_30_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1606772541822883306'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1606772541822883306');

DELETE FROM `pool_template` WHERE `entry` = 1022;
DELETE FROM `pool_creature` WHERE `pool_entry` = 1022;

DELETE FROM `creature` WHERE `guid` = 134220;
UPDATE `creature` SET `position_x` = -13807.7, `position_y` = 379.781, `position_z` = 94.488, `MovementType` = 2 WHERE `guid` = 32043;

DELETE FROM `creature_addon` WHERE `guid` = 32043;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(32043,320430,0,0,1,0,0,NULL);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 2541;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 2541 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2541,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Sakrasis - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 320430;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(320430,1,-13807.7,379.781,94.488,2.14783,60000,0,0,100,0),
(320430,2,-13809.4,381.717,94.6764,0,0,0,0,100,0),
(320430,3,-13814.3,389.438,89.217,0,0,0,0,100,0),
(320430,4,-13818.9,396.468,86.5581,0,0,0,0,100,0),
(320430,5,-13823.5,402.931,85.7407,0,0,0,0,100,0),
(320430,6,-13827.6,409.323,86.24,0,0,0,0,100,0),
(320430,7,-13832.7,417.115,88.7387,0,0,0,0,100,0),
(320430,8,-13836.6,423.11,92.1478,0,0,0,0,100,0),
(320430,9,-13838,425.191,91.6924,0,30000,0,0,100,0),
(320430,10,-13836.7,423.38,92.0456,0,0,0,0,100,0),
(320430,11,-13832.4,416.564,88.5122,0,0,0,0,100,0),
(320430,12,-13827.3,408.334,86.0611,0,0,0,0,100,0),
(320430,13,-13822.5,401.616,85.8104,0,0,0,0,100,0),
(320430,14,-13817.5,393.823,87.325,0,0,0,0,100,0),
(320430,15,-13813.2,387.202,90.234,0,0,0,0,100,0),
(320430,16,-13809.5,381.667,94.651,0,0,0,0,100,0),
(320430,17,-13807.7,379.781,94.488,0,60000,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
