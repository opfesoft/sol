-- DB update 2021_01_12_00 -> 2021_01_12_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_12_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_12_00 2021_01_12_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610453093974728615'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610453093974728615');

UPDATE `creature_template` SET `ScriptName` = '', `AIName` = 'SmartAI' WHERE `entry` = 3836;

DELETE FROM `gossip_menu` WHERE `MenuID` BETWEEN 1201 AND 1206;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(1201,1833),
(1202,1834),
(1203,1835),
(1204,1836),
(1205,1837),
(1206,1838);

DELETE FROM `conditions` WHERE `SourceGroup` = 1201 AND `SourceTypeOrReferenceId` = 15;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(15,1201,0,0,0,14,0,3181,0,0,0,0,0,'','Show gossip menu option only if quest ''The Horn of the Beast'' is not taken');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 3836 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3836,0,0,0,62,0,100,0,1206,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mountaineer Pebblebitty - On Gossip Menu Option 1206 Selected - Close Gossip'),
(3836,0,1,0,22,0,100,0,77,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Mountaineer Pebblebitty - On Emote ''Rude'' Received - Say Line 0');

DELETE FROM `creature_text` WHERE `CreatureID` = 3836;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(3836,0,0,'You''re pushing it, $n.',12,7,100,5,0,0,1402,0,'Mountaineer Pebblebitty - Say On Emote ''Rude'' 1'),
(3836,0,1,'Don''t make me go medieval on you.',12,7,100,5,0,0,1403,0,'Mountaineer Pebblebitty - Say On Emote ''Rude'' 2'),
(3836,0,2,'Keep it up, $n, and I''ll beat some manners into you.',12,7,100,5,0,0,1404,0,'Mountaineer Pebblebitty - Say On Emote ''Rude'' 3');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
