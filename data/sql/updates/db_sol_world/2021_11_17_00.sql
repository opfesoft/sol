-- DB update 2021_11_16_00 -> 2021_11_17_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_16_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_16_00 2021_11_17_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1637104983879809195'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1637104983879809195');

DELETE FROM `creature` WHERE `guid` = 78933; -- Remove Zeppit spawn

DELETE FROM `creature_text` WHERE `CreatureId` = 22484;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(22484,0,0,'%s gathers the warp chaser''s blood.',16,0,100,0,0,0,20371,0,'Zeppit');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (18884,22484);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2248400;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18884,0,0,0,0,0,100,0,500,2000,7000,15000,0,11,37417,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warp Chaser - IC - Cast ''Warp Charge'''),
(18884,0,1,0,0,0,100,0,3000,5000,10000,15000,0,11,32739,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warp Chaser - IC - Cast ''Venomous Bite'''),
(18884,0,2,0,6,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,11,22484,30,0,0,0,0,0,0,'Warp Chaser - On Death - Set Data 1 1 (Zeppit)'),

(22484,0,0,0,38,0,100,0,1,1,4000,4000,0,69,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Zeppit - On Data Set 1 1 - Move To Position (Invoker)'),
(22484,0,1,0,34,0,100,0,8,1,0,0,0,80,2248400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zeppit - On WP 1 Reached - Call Timed Action List'),

(2248400,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zeppit - On Script - Say Line 0'),
(2248400,9,1,0,0,0,100,0,1000,1000,0,0,0,11,39244,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Zeppit - On Script - Cast ''Gather Warp Chaser Blood'' (Owner)'),
(2248400,9,2,0,0,0,100,0,2000,2000,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zeppit - On Script - Evade');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
