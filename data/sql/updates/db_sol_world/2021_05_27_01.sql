-- DB update 2021_05_27_00 -> 2021_05_27_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_05_27_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_05_27_00 2021_05_27_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1622150410466762579'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1622150410466762579');

UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 180771;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (-21159,-21160,-21161,-21162);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` BETWEEN 18077100 AND 18077111;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-21159,1,0,0,60,0,100,0,15000,30000,15000,30000,0,88,18077100,18077111,0,0,0,0,1,0,0,0,0,0,0,0,0,'Firework Launcher - On Update - Call Random Range Timed Action List'),
(-21160,1,0,0,60,0,100,0,15000,30000,15000,30000,0,88,18077100,18077111,0,0,0,0,1,0,0,0,0,0,0,0,0,'Firework Launcher - On Update - Call Random Range Timed Action List'),
(-21161,1,0,0,60,0,100,0,15000,30000,15000,30000,0,88,18077100,18077111,0,0,0,0,1,0,0,0,0,0,0,0,0,'Firework Launcher - On Update - Call Random Range Timed Action List'),
(-21162,1,0,0,60,0,100,0,15000,30000,15000,30000,0,88,18077100,18077111,0,0,0,0,1,0,0,0,0,0,0,0,0,'Firework Launcher - On Update - Call Random Range Timed Action List'),

(18077100,9,0,0,0,0,100,0,0,0,0,0,0,11,26344,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Firework Launcher - On Script - Cast ''Rocket, BLUE'''),
(18077101,9,0,0,0,0,100,0,0,0,0,0,0,11,26345,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Firework Launcher - On Script - Cast ''Rocket, GREEN'''),
(18077102,9,0,0,0,0,100,0,0,0,0,0,0,11,26346,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Firework Launcher - On Script - Cast ''Rocket, PURPLE'''),
(18077103,9,0,0,0,0,100,0,0,0,0,0,0,11,26347,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Firework Launcher - On Script - Cast ''Rocket, RED'''),
(18077104,9,0,0,0,0,100,0,0,0,0,0,0,11,26348,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Firework Launcher - On Script - Cast ''Rocket, WHITE'''),
(18077105,9,0,0,0,0,100,0,0,0,0,0,0,11,26349,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Firework Launcher - On Script - Cast ''Rocket, YELLOW'''),
(18077106,9,0,0,0,0,100,0,0,0,0,0,0,11,26351,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Firework Launcher - On Script - Cast ''Rocket, BLUE BIG'''),
(18077107,9,0,0,0,0,100,0,0,0,0,0,0,11,26352,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Firework Launcher - On Script - Cast ''Rocket, GREEN BIG'''),
(18077108,9,0,0,0,0,100,0,0,0,0,0,0,11,26353,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Firework Launcher - On Script - Cast ''Rocket, PURPLE BIG'''),
(18077109,9,0,0,0,0,100,0,0,0,0,0,0,11,26354,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Firework Launcher - On Script - Cast ''Rocket, RED BIG'''),
(18077110,9,0,0,0,0,100,0,0,0,0,0,0,11,26355,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Firework Launcher - On Script - Cast ''Rocket, WHITE BIG'''),
(18077111,9,0,0,0,0,100,0,0,0,0,0,0,11,26356,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Firework Launcher - On Script - Cast ''Rocket, YELLOW BIG''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
