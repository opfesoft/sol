-- DB update 2022_01_22_01 -> 2022_01_23_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_22_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_22_01 2022_01_23_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1642951576983748271'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1642951576983748271');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 8115;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 8115;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (811500,811501,811502,811503);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8115,0,0,0,20,0,100,0,3122,0,0,0,0,80,811500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Quest ''Return to Witch Doctor Uzer''i'' Rewarded - Call Timed Action List'),
(8115,0,1,0,19,0,100,0,3129,0,0,0,0,80,811501,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Quest ''Weapons of Spirit'' Accepted - Call Timed Action List'),
(8115,0,2,0,40,0,100,0,3,8115,0,0,0,80,811502,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On WP 3 Reached - Call Timed Action List'),
(8115,0,3,0,40,0,100,0,6,8115,0,0,0,80,811503,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On WP 6 Reached - Call Timed Action List'),

(811500,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(811500,9,1,0,0,0,100,0,1000,1000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-4388.65,274.297,25.4396,0,'Witch Doctor Uzer''i - On Script - Move to Position'),
(811500,9,2,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Script - Say Line 0'),
(811500,9,3,0,0,0,100,0,0,0,0,0,0,17,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Script - Set Emote State ''ONESHOT_CHEER'''),
(811500,9,4,0,0,0,100,0,6500,6500,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Script - Set Emote State ''ONESHOT_NONE'''),
(811500,9,5,0,0,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-4391.53,274.703,25.6304,0,'Witch Doctor Uzer''i - On Script - Move to Position'),
(811500,9,6,0,0,0,100,0,1500,1500,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,5.59658,'Witch Doctor Uzer''i - On Script - Set Orientation'),
(811500,9,7,0,0,0,100,0,500,500,0,0,0,17,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Script - Set Emote State ''STATE_DANCE'''),
(811500,9,8,0,0,0,100,0,10000,10000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Script - Set Emote State ''ONESHOT_NONE'''),
(811500,9,9,0,0,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-4375.68,269.717,25.4947,0,'Witch Doctor Uzer''i - On Script - Move to Position'),
(811500,9,10,0,0,0,100,0,3000,3000,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Script - Say Line 1'),
(811500,9,11,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,4.72984,'Witch Doctor Uzer''i - On Script - Set Orientation'),
(811500,9,12,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),

(811501,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(811501,9,1,0,0,0,100,0,1000,1000,0,0,0,53,1,8115,0,0,0,2,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Script - Start WP Movement'),

(811502,9,0,0,0,0,100,0,0,0,0,0,0,54,16000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Script - Pause WP Movement'),
(811502,9,1,0,0,0,100,0,500,500,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,1.75709,'Witch Doctor Uzer''i - On Script - Set Orientation'),
(811502,9,2,0,0,0,100,0,1000,1000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(811502,9,3,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Script - Say Line 2'),
(811502,9,4,0,0,0,100,0,13000,13000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),

(811503,9,0,0,0,0,100,0,500,500,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,4.72984,'Witch Doctor Uzer''i - On Script - Set Orientation'),
(811503,9,1,0,0,0,100,0,0,0,0,0,0,1,3,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Script - Say Line 3'),
(811503,9,2,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Uzer''i - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER''');

DELETE FROM `waypoints` WHERE `entry` = 8115;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(8115,1,-4375.1,259.339,26.584,'Witch Doctor Uzer''i - Quest ''Weapons of Spirit'''),
(8115,2,-4378.28,255.898,26.3856,NULL),
(8115,3,-4383,256.683,25.8833,NULL),
(8115,4,-4378.28,255.898,26.3856,NULL),
(8115,5,-4375.1,259.339,26.584,NULL),
(8115,6,-4375.68,269.717,25.4947,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
