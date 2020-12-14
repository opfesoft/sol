-- DB update 2020_12_14_06 -> 2020_12_14_07
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_14_06';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_14_06 2020_12_14_07 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1607985632605353219'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1607985632605353219');

UPDATE `creature_template` SET `InhabitType` = 4 WHERE `entry` = 20932;

UPDATE `creature_addon` SET `isLarge` = 1 WHERE `guid` = 86860;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 20932;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 20932 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20932,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nuramoc - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 868600;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(868600,1,3250.51,1961.25,137.635,0,0,0,0,100,0),
(868600,2,3228.29,2001.11,144.727,0,0,0,0,100,0),
(868600,3,3235.93,2084.18,142.385,0,0,0,0,100,0),
(868600,4,3239.06,2128.28,144.23,0,0,0,0,100,0),
(868600,5,3207.12,2151.5,140.847,0,0,0,0,100,0),
(868600,6,3213.69,2229.01,138.009,0,0,0,0,100,0),
(868600,7,3231.47,2305.03,124.795,0,0,0,0,100,0),
(868600,8,3231.7,2393.11,109.473,0,0,0,0,100,0),
(868600,9,3269.73,2434.75,93.6179,0,0,0,0,100,0),
(868600,10,3332.71,2467.68,85.8992,0,0,0,0,100,0),
(868600,11,3384.93,2532.03,113.704,0,0,0,0,100,0),
(868600,12,3438.84,2578.09,152.038,0,0,0,0,100,0),
(868600,13,3342.11,2593.94,188.744,0,0,0,0,100,0),
(868600,14,3214.78,2476.76,98.5975,0,0,0,0,100,0),
(868600,15,3258.1,2439.65,112.365,0,0,0,0,100,0),
(868600,16,3305.8,2397.5,135.329,0,0,0,0,100,0),
(868600,17,3379.15,2306.53,96.941,0,0,0,0,100,0),
(868600,18,3302.31,2171.94,123.625,0,0,0,0,100,0),
(868600,19,3274.61,2098.45,127.944,0,0,0,0,100,0),
(868600,20,3180.44,1989.87,164.138,0,0,0,0,100,0),
(868600,21,3160.3,1887,152.491,0,0,0,0,100,0),
(868600,22,3152.02,1758.62,160.324,0,0,0,0,100,0),
(868600,23,3155.54,1702.77,146.834,0,0,0,0,100,0),
(868600,24,3255.68,1751.95,124.196,0,0,0,0,100,0),
(868600,25,3290.94,1785.01,139.078,0,0,0,0,100,0),
(868600,26,3301.79,1853.55,131.618,0,0,0,0,100,0),
(868600,27,3283.64,1905.23,131.397,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
