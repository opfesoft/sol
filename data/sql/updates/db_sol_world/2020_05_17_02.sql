-- DB update 2020_05_17_01 -> 2020_05_17_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_05_17_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_05_17_01 2020_05_17_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1589667438855267467'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1589667438855267467');

-- Witch Doctor Jin'Zil, Prisoner of Jin'Zil, Wisp SAI: Play small event after finishing the quest "Jin'Zil's Forest Magic"
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (3995,4072,3681);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3995,4072,3681) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 399500 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3995,0,0,0,20,0,100,0,1058,0,0,0,0,80,399500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Jin''Zil - On Quest ''Jin''Zil''s Forest Magic'' Finished - Run Script'),
(3995,0,1,0,40,0,100,0,4,3995,0,0,0,54,8000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Jin''Zil - On Waypoint 4 Reached - Pause Waypoint'),
(3995,0,2,0,40,0,100,0,7,3995,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Jin''Zil - On Waypoint 7 Reached - Add NPC Flag Questgiver'),

(399500,9,0,0,0,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,9,4072,0,30,0,0,0,0,0,'Witch Doctor Jin''Zil - On Script - Respawn ''Prisoner of Jin''Zil'''),
(399500,9,1,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Jin''Zil - On Script - Remove NPC Flag Questgiver'),
(399500,9,2,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,4.0078,'Witch Doctor Jin''Zil - On Script - Set Orientation'),
(399500,9,3,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Jin''Zil - On Script - Say Line 0'),
(399500,9,4,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Jin''Zil - On Script - Say Line 1'),
(399500,9,5,0,0,0,100,0,0,0,0,0,0,86,6584,0,9,4072,0,30,1,0,0,0,0,0,0,0,0,'Witch Doctor Jin''Zil - On Script - Cross Cast ''Jin''Zil''s Curse'''),
(399500,9,6,0,0,0,100,0,4000,4000,0,0,0,53,0,3995,0,0,0,1,1,0,0,0,0,0,0,0,0,'Witch Doctor Jin''Zil - On Script - Start Waypoint'),
(399500,9,7,0,0,0,100,0,6000,6000,0,0,0,51,0,0,0,0,0,0,9,4072,0,30,0,0,0,0,0,'Witch Doctor Jin''Zil - On Script - Kill Target'),
(399500,9,8,0,0,0,100,0,1000,1000,0,0,0,45,1,1,0,0,0,0,9,3681,0,30,0,0,0,0,0,'Witch Doctor Jin''Zil - On Script - Set Data'),
(399500,9,9,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0.406747,'Witch Doctor Jin''Zil - On Script - Set Orientation'),
(399500,9,10,0,0,0,100,0,1000,1000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Jin''Zil - On Script - Say Line 2'),

(4072,0,0,1,6,0,100,0,0,0,0,0,0,12,3681,3,30000,0,0,0,1,0,0,0,0,0,0,0,0,'Prisoner of Jin''Zil - On Just Died - Summon Creature ''Wisp'''),
(4072,0,1,0,61,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prisoner of Jin''Zil - Linked - Despawn In 5000 ms'),

(3681,0,0,0,38,0,100,0,1,1,0,0,0,53,1,3681,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wisp - On Data Set - Start Waypoint'),
(3681,0,1,0,40,0,100,0,3,3681,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wisp - On Waypoint Reached - Despawn');

DELETE FROM `waypoints` WHERE `entry` IN (3995,3681);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(3995,1,-270.459,-396.037,17.1122,''),
(3995,2,-270.305,-398.913,17.0809,''),
(3995,3,-272.921,-400.553,17.4664,''),
(3995,4,-277.705,-397.426,18.2977,''),
(3995,5,-277.037,-394.406,18.493,''),
(3995,6,-275.021,-393.218,17.9251,''),
(3995,7,-272.48,-394.084,17.2051,''),

(3681,1,-265.345,-393.202,16.9917,''),
(3681,2,-241.765,-376.753,17.8912,''),
(3681,3,-194.646,-335.997,10.0757,'');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
