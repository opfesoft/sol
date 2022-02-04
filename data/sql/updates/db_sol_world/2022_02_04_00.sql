-- DB update 2022_02_03_01 -> 2022_02_04_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_03_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_03_01 2022_02_04_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1643985248723520041'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1643985248723520041');

DELETE FROM `creature_text` WHERE `CreatureId` = 10666;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(10666,0,0,'%s reaps the Gloom Weed violently from the ground.',16,0,100,35,0,0,6893,0,'Gordo');

UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 175566;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (-45292,-45284,-45275);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-45292,1,0,0,60,0,100,0,5000,5000,5000,5000,1,45,1,1,0,0,0,0,19,10666,30,0,0,0,0,0,0,'Gloom Weed - On Update (Spawned Only) - Set Data 1 1 (Gordo)'),

(-45284,1,0,0,60,0,100,0,5000,5000,5000,5000,1,45,1,1,0,0,0,0,19,10666,30,0,0,0,0,0,0,'Gloom Weed - On Update (Spawned Only) - Set Data 1 1 (Gordo)'),

(-45275,1,0,0,60,0,100,0,5000,5000,5000,5000,1,45,1,1,0,0,0,0,19,10666,30,0,0,0,0,0,0,'Gloom Weed - On Update (Spawned Only) - Set Data 1 1 (Gordo)');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 10666 AND `id` > 0;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1066600,1066601);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10666,0,1,0,38,0,100,0,1,1,300000,300000,0,80,1066600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gordo - On Data Set 1 1 - Call Timed Action List'),
(10666,0,2,0,34,0,100,0,8,1,0,0,0,80,1066601,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gordo - On Point 1 Reached - Call Timed Action List'),
(10666,0,3,4,59,0,100,0,1,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gordo - On Timed Event 1 Triggered - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(10666,0,4,0,61,0,100,0,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gordo - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),

(1066600,9,0,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Gordo - On Script - Store Target 1 (Invoker)'),
(1066600,9,1,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gordo - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(1066600,9,2,0,0,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gordo - On Script - Add ''UNIT_FLAG_IMMUNE_TO_PC'''),
(1066600,9,3,0,0,0,100,0,0,0,0,0,0,67,1,15000,15000,0,0,0,1,0,0,0,0,0,0,0,0,'Gordo - On Script - Create Timed Event 1'),
(1066600,9,4,0,0,0,100,0,0,0,0,0,0,239,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gordo - On Script - Stop WP Path'),
(1066600,9,5,0,0,0,100,0,1000,1000,0,0,0,69,1,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Gordo - On Script - Move To Position (Stored Target 1)'),

(1066601,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gordo - On Script - Say Line 0'),
(1066601,9,1,0,0,0,100,0,2000,2000,0,0,0,233,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Gordo - On Script - Despawn GO (Stored Target 1)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
