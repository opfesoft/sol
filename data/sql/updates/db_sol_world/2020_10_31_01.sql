-- DB update 2020_10_31_00 -> 2020_10_31_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_10_31_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_10_31_00 2020_10_31_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1604102047714565627'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1604102047714565627');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 17093;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 17093 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 1709300 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17093,0,0,0,20,0,100,0,9434,0,0,0,0,80,1709300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magistrix Elosai - On Reward Quest ''Testing the Tonic'' - Call Timed Action List'),

(1709300,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magistrix Elosai - On Script - Remove NPC Flag ''Quest Giver'''),
(1709300,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Magistrix Elosai - On Script - Say Line 0'),
(1709300,9,2,0,0,0,100,0,1000,1000,0,0,0,11,60888,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magistrix Elosai - On Script - Cast ''Cosmetic Enchant Cast'''),
(1709300,9,3,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Magistrix Elosai - On Script - Say Line 1'),
(1709300,9,4,0,0,0,100,0,7000,7000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magistrix Elosai - On Script - Say Line 2'),
(1709300,9,5,0,0,0,100,0,1000,1000,0,0,0,17,64,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magistrix Elosai - On Script - Set Emote State ''STATE_STUN'''),
(1709300,9,6,0,0,0,100,0,3000,3000,0,0,0,3,17162,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magistrix Elosai - On Script - Morph To Wretched Magistrix Elosai'),
(1709300,9,7,0,0,0,100,0,2000,2000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magistrix Elosai - On Script - Say Line 3'),
(1709300,9,8,0,0,0,100,0,5000,5000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magistrix Elosai - On Script - Say Line 4'),
(1709300,9,9,0,0,0,100,0,20000,20000,0,0,0,17,30,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magistrix Elosai - On Script - Set Emote State ''STATE_NONE'''),
(1709300,9,10,0,0,0,100,0,40000,40000,0,0,0,3,17093,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magistrix Elosai - On Script - Morph To Magistrix Elosai'),
(1709300,9,11,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magistrix Elosai - On Script - Add NPC Flag ''Quest Giver''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
