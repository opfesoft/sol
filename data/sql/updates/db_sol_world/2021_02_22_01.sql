-- DB update 2021_02_22_00 -> 2021_02_22_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_22_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_22_00 2021_02_22_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1614034146413649688'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1614034146413649688');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 17551 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1755100,1755101) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17551,0,0,0,25,0,100,0,0,0,0,0,0,232,1,0,20,0,0,0,1,0,0,0,0,0,0,0,0,'Tavara - On Reset - Set 20% Health'),
(17551,0,1,0,53,0,100,0,1,200000,30000,30000,0,80,1755100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tavara - On Receive Heal - Call Timed Action List'),
(17551,0,2,0,53,0,100,0,1,200000,30000,30000,0,80,1755101,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tavara - On Receive Heal - Call Timed Action List'),

(1755100,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tavara - On Script - Set Active On'),
(1755100,9,1,0,0,0,100,0,0,0,0,0,0,33,17551,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Tavara - On Script - Quest Credit ''Help Tavara'''),
(1755100,9,2,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tavara - On Script - Say Line 0'),
(1755100,9,3,0,0,0,100,0,28000,28000,0,0,0,232,1,0,20,0,0,0,1,0,0,0,0,0,0,0,0,'Tavara - On Script - Set 20% Health'),
(1755100,9,4,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tavara - On Script - Set Active Off'),

(1755101,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tavara - On Script - Set Active On'),
(1755101,9,1,0,0,0,100,0,30000,30000,0,0,0,232,1,0,20,0,0,0,1,0,0,0,0,0,0,0,0,'Tavara - On Script - Set 20% Health'),
(1755101,9,2,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tavara - On Script - Set Active Off');

DELETE FROM `creature_text` WHERE `CreatureID` = 17551;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(17551,0,0,'Please tell Guvan that I''ll be fine, thanks to you.',12,0,100,0,0,0,14224,0,'Tavara - Quest ''Help Tavara''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceGroup` IN (2,3) AND `SourceEntry` = 17551 AND `SourceId` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,2,17551,0,0,47,0,9586,8,0,0,0,0,'Tavara - Execute SAI only if quest ''Help Tavara'' is in progress'),
(22,3,17551,0,0,47,0,9586,8,0,1,0,0,'Tavara - Execute SAI only if quest ''Help Tavara'' is not in progress');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
