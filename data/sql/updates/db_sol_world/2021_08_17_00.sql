-- DB update 2021_08_16_01 -> 2021_08_17_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_16_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_16_01 2021_08_17_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1629207382334882977'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1629207382334882977');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 3984;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (398400,398401);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3984,0,0,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Nancy Vishas - Between 0-15% Health - Flee For Assist (No Repeat)'),
(3984,0,1,0,11,0,100,0,0,0,0,0,0,80,398400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nancy Vishas - On Respawn - Call Timed Action List'),
(3984,0,2,0,40,0,100,0,6,398400,0,0,0,80,398401,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nancy Vishas - On WP 6 Reached - Call Timed Action List'),
(3984,0,3,0,40,0,100,0,6,398401,0,0,0,80,398400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nancy Vishas - On WP 6 Reached - Call Timed Action List'),

(398400,9,0,0,0,0,100,0,0,0,0,0,0,101,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nancy Vishas - On Script - Reset Home Position'),
(398400,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nancy Vishas - On Script - Reset Orientation'),
(398400,9,2,0,0,0,100,0,150000,300000,0,0,0,66,0,0,0,0,0,0,19,3985,15,0,0,0,0,0,0,'Nancy Vishas - On Script - Set Orientation (Grandpa Vishas)'),
(398400,9,3,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nancy Vishas - On Script - Say Line 0'),
(398400,9,4,0,0,0,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,19,3985,15,0,0,0,0,0,0,'Nancy Vishas - On Script - Say Line 0 (Grandpa Vishas)'),
(398400,9,5,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nancy Vishas - On Script - Say Line 1'),
(398400,9,6,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,19,3985,15,0,0,0,0,0,0,'Nancy Vishas - On Script - Say Line 1 (Grandpa Vishas)'),
(398400,9,7,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nancy Vishas - On Script - Say Line 2'),
(398400,9,8,0,0,0,100,0,4000,4000,0,0,0,53,0,398400,0,0,0,2,1,0,0,0,0,0,0,0,0,'Nancy Vishas - On Script - Start WP Movement'),

(398401,9,0,0,0,0,100,0,10000,10000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nancy Vishas - On Script - Say Line 3'),
(398401,9,1,0,0,0,100,0,15000,15000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nancy Vishas - On Script - Say Line 4'),
(398401,9,2,0,0,0,100,0,5000,5000,0,0,0,53,0,398401,0,0,0,2,1,0,0,0,0,0,0,0,0,'Nancy Vishas - On Script - Start WP Movement');

DELETE FROM `waypoints` WHERE `entry` IN (3984,398400,398401);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(398400,1,888.142,-121.85,38.3887,'Nancy Vishas Path 1'),
(398400,2,891.922,-114.613,38.3488,NULL),
(398400,3,893.231,-112.794,37.264,NULL),
(398400,4,897.387,-107.022,35.5247,NULL),
(398400,5,902.36,-100.114,33.7406,NULL),
(398400,6,908.933,-90.985,33.783,NULL),

(398401,1,908.933,-90.985,33.783,'Nancy Vishas Path 2'),
(398401,2,902.36,-100.114,33.7406,NULL),
(398401,3,897.387,-107.022,35.5247,NULL),
(398401,4,893.231,-112.794,37.264,NULL),
(398401,5,891.922,-114.613,38.3488,NULL),
(398401,6,888.142,-121.85,38.3887,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
