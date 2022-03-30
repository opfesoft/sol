-- DB update 2022_03_30_03 -> 2022_03_30_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_30_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_30_03 2022_03_30_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648677180915932311'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648677180915932311');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (17214,17215);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1721400,1721500);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17214,0,0,0,20,0,100,0,9463,0,0,0,0,80,1721400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Fateema - On Quest ''Medicinal Purpose'' Rewarded - Call Timed Action List'),
(17214,0,1,2,54,0,100,0,0,0,0,0,0,17,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Fateema - On Just Summoned - Set Emote State ''STATE_DANCE'''),
(17214,0,2,0,61,0,100,0,0,0,0,0,0,83,83,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Fateema - Linked - Remove NPC Flags'),

(1721400,9,0,0,0,0,100,0,0,0,0,0,0,83,83,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Fateema - On Script - Remove NPC Flags'),
(1721400,9,1,0,0,0,100,0,0,0,0,0,0,83,83,0,0,0,0,0,19,17215,0,0,0,0,0,0,0,'Anchorite Fateema - On Script - Remove NPC Flags (Daedal)'),
(1721400,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Fateema - On Script - Say Line 0'),
(1721400,9,3,0,0,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Fateema - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(1721400,9,4,0,0,0,100,0,7000,7000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Fateema - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(1721400,9,5,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Fateema - On Script - Say Line 1'),
(1721400,9,6,0,0,0,100,0,9000,9000,0,0,0,1,0,0,0,0,0,0,19,17215,0,0,0,0,0,0,0,'Anchorite Fateema - On Script - Say Line 0 (Daedal)'),
(1721400,9,7,0,0,0,100,0,5000,5000,0,0,0,82,83,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Fateema - On Script - Add NPC Flags'),
(1721400,9,8,0,0,0,100,0,0,0,0,0,0,82,83,0,0,0,0,0,19,17215,0,0,0,0,0,0,0,'Anchorite Fateema - On Script - Add NPC Flags (Daedal)'),

(17215,0,0,1,20,0,100,0,9473,2,0,0,0,83,83,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Daedal - On Quest ''An Alternative Alternative'' Rewarded - Remove NPC Flags'),
(17215,0,1,2,61,0,100,0,0,0,0,0,0,83,83,0,0,0,0,0,19,17214,0,0,0,0,0,0,0,'Daedal - Linked - Remove NPC Flags (Anchorite Fateema)'),
(17215,0,2,3,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Daedal - Linked - Say Line 1'),
(17215,0,3,0,61,0,100,0,0,0,0,0,0,53,0,17215,0,0,0,0,1,0,0,0,0,0,0,0,0,'Daedal - Linked - Start WP Movement'),
(17215,0,4,0,58,0,100,0,0,17215,0,0,0,80,1721500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Daedal - WP Path Ended - Call Timed Action List'),
(17215,0,5,6,54,0,100,0,0,0,0,0,0,67,1,3000,3000,5000,8000,0,1,0,0,0,0,0,0,0,0,'Daedal - On Just Summoned - Create Timed Event 1'),
(17215,0,6,0,61,0,100,0,0,0,0,0,0,83,83,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Daedal - Linked - Remove NPC Flags'),
(17215,0,7,0,59,0,100,0,1,0,0,0,0,10,4,21,0,0,0,0,1,0,0,0,0,0,0,0,0,'Daedal - On Timed Event 1 Triggered - Play Random Emote'),

(1721500,9,0,0,0,0,100,0,1000,1000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Daedal - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(1721500,9,1,0,0,0,100,0,7000,7000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Daedal - On Script - Say Line 2'),
(1721500,9,2,0,0,0,100,0,1000,1000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Daedal - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(1721500,9,3,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,19,17117,0,0,0,0,0,0,0,'Daedal - On Script - Say Line 0 (Injured Night Elf Priestess)'),
(1721500,9,4,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,19,17117,0,0,0,0,0,0,0,'Daedal - On Script - Say Line 1 (Injured Night Elf Priestess)'),
(1721500,9,5,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,17117,0,0,0,0,0,0,0,'Daedal - On Script - Set Data 1 1 (Injured Night Elf Priestess)'),
(1721500,9,6,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,19,17117,0,0,0,0,0,0,0,'Daedal - On Script - Say Line 2 (Injured Night Elf Priestess)'),
(1721500,9,7,0,0,0,100,0,7000,7000,0,0,0,1,3,0,0,0,0,0,19,17117,0,0,0,0,0,0,0,'Daedal - On Script - Say Line 3 (Injured Night Elf Priestess)'),
(1721500,9,8,0,0,0,100,0,7000,7000,0,0,0,1,4,0,0,0,0,0,19,17117,0,0,0,0,0,0,0,'Daedal - On Script - Say Line 4 (Injured Night Elf Priestess)'),
(1721500,9,9,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,19,17117,0,0,0,0,0,0,0,'Daedal - On Script - Set Data 2 2 (Injured Night Elf Priestess)'),
(1721500,9,10,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,19,17214,0,0,0,0,0,0,0,'Daedal - On Script - Say Line 2 (Anchorite Fateema)'),
(1721500,9,11,0,0,0,100,0,7000,7000,0,0,0,82,83,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Daedal - On Script - Add NPC Flags'),
(1721500,9,12,0,0,0,100,0,0,0,0,0,0,82,83,0,0,0,0,0,19,17214,0,0,0,0,0,0,0,'Daedal - On Script - Add NPC Flags (Anchorite Fateema)'),
(1721500,9,13,0,0,0,100,0,0,0,0,0,0,101,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Daedal - On Script - Reset Home Position'),
(1721500,9,14,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Daedal - On Script - Evade');

DELETE FROM `waypoints` WHERE `entry` = 17215;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(17215,1,-4193.95,-12471.9,45.6252,'Daedal - Quest ''An Alternative Alternative'''),
(17215,2,-4197.57,-12472.7,45.6283,NULL),
(17215,3,-4199.54,-12471.4,45.6283,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
