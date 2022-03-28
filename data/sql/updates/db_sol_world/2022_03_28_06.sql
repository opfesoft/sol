-- DB update 2022_03_28_05 -> 2022_03_28_06
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_28_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_28_05 2022_03_28_06 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648487812495635410'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648487812495635410');

UPDATE `creature_template` SET `gossip_menu_id` = 2871, `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 10668;

DELETE FROM `gossip_menu` WHERE `MenuID` IN (2871,2872);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(2871,3557),
(2872,3558);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 10668;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10668,0,0,0,62,0,100,0,2871,0,0,0,0,33,10668,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Beaten Corpse - On Gossip Option 0 Selected - Quest Credit ''Lost in Battle''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 2871;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,2871,0,0,0,47,0,4921,8,0,0,0,0,'Beaten Corpse - Group 0: Show gossip option 0 if quest ''Lost in Battle'' is in progress');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
