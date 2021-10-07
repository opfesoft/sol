-- DB update 2021_10_07_01 -> 2021_10_07_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_07_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_07_01 2021_10_07_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1633613968823319384'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1633613968823319384');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 6181;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 6181;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (618100,618101);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6181,0,0,1,19,0,100,0,1806,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jordan Stilwell - On Quest ''The Test of Righteousness (Part 3)'' Accepted - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(6181,0,1,2,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jordan Stilwell - Linked - Say Line 0'),
(6181,0,2,0,61,0,100,0,0,0,0,0,0,53,0,6181,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jordan Stilwell - Linked - Start WP Movement'),
(6181,0,3,0,40,0,100,0,1,6181,0,0,0,80,618100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jordan Stilwell - On WP 1 Reached - Call Timed Action List'),
(6181,0,4,0,40,0,100,0,2,6181,0,0,0,80,618101,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jordan Stilwell - On WP 2 Reached - Call Timed Action List'),

(618100,9,0,0,0,0,100,0,0,0,0,0,0,54,23000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jordan Stilwell - On Script - Pause Waypoint'),
(618100,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,2.90077,'Jordan Stilwell - On Script - Set Orientation'),
(618100,9,2,0,0,0,100,0,1000,1000,0,0,0,17,233,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jordan Stilwell - On Script - Set Emote State ''STATE_WORK_MINING'''),
(618100,9,3,0,0,0,100,0,21000,21000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jordan Stilwell - On Script - Set Emote State ''ONESHOT_NONE'''),

(618101,9,0,0,0,0,100,0,1000,1000,0,0,0,101,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jordan Stilwell - On Script - Reset Home Position'),
(618101,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jordan Stilwell - On Script - Reset Orientation'),
(618101,9,2,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jordan Stilwell - On Script - Say Line 1'),
(618101,9,3,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jordan Stilwell - On Script - Add ''GOSSIP_OPTION_QUESTGIVER''');

DELETE FROM `waypoints` WHERE `entry` = 6181;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(6181,1,-5094.12,-786.116,495.226,'Jordan Stilwell - Quest ''The Test of Righteousness (Part 3)'''),
(6181,2,-5089.28,-782.95,495.279,'');

DELETE FROM `gameobject_addon` WHERE `guid` = 987;
INSERT INTO `gameobject_addon` (`guid`, `invisibilityType`, `invisibilityValue`, `useRotation`)
VALUES
(987,0,0,1);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
