-- DB update 2020_11_01_00 -> 2020_11_02_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_11_01_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_11_01_00 2020_11_02_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1604273748331012473'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1604273748331012473');

UPDATE `creature` SET `position_z` = 79.48 WHERE `guid` IN (110837,111476,111477,111478,111479);
UPDATE `gameobject` SET `position_z` = 79.48 WHERE `guid` IN (56602,58836);

DELETE FROM `smart_scripts` WHERE `entryorguid` = 23967 AND `source_type` = 0 AND `id` IN (1,4,5,6,7);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23967,0,1,0,4,0,80,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deranged Explorer - On Aggro - Say Line 0'),
(23967,0,4,5,1,0,100,0,2000,2000,30000,30000,0,17,233,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deranged Explorer - OOC - Set Emote State ''STATE_WORK_MINING'''),
(23967,0,5,0,61,0,100,0,0,0,0,0,0,71,0,0,1910,0,0,0,1,0,0,0,0,0,0,0,0,'Deranged Explorer - Linked - Set Equip'),
(23967,0,6,7,4,0,100,0,0,0,0,0,0,17,30,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deranged Explorer - On Aggro - Set Emote State ''STATE_NONE'''),
(23967,0,7,0,61,0,100,0,0,0,0,0,0,71,0,0,1910,2081,0,0,1,0,0,0,0,0,0,0,0,'Deranged Explorer - Linked - Set Equip');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceGroup` = 5 AND `SourceEntry` = 23967;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(22,5,23967,0,0,30,1,186403,3,0,0,0,0,'','Deranged Explorer - Execute SAI only if near Whisper Gulch Ore');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
