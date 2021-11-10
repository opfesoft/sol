-- DB update 2021_11_10_00 -> 2021_11_10_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_10_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_10_00 2021_11_10_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1636581768751911483'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1636581768751911483');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `type_flags` = `type_flags` | 8388608 WHERE `entry` = 34320;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 34320;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(34320,0,0,0,54,0,100,0,0,0,0,0,0,3,0,29251,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venomhide Hatchling - On Just Summoned - Morph To Model ''Venomhide Hatchling'''),
(34320,0,1,0,54,0,100,0,0,0,0,0,0,3,0,29274,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venomhide Hatchling - On Just Summoned - Morph To Model ''Venomhide Hatchling (1.25)'''),
(34320,0,2,0,54,0,100,0,0,0,0,0,0,3,0,29275,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venomhide Hatchling - On Just Summoned - Morph To Model ''Venomhide Hatchling (1.50)'''),
(34320,0,3,0,54,0,100,0,0,0,0,0,0,3,0,29276,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venomhide Hatchling - On Just Summoned - Morph To Model ''Venomhide Hatchling (1.75)'''),
(34320,0,4,0,8,0,100,0,65200,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venomhide Hatchling - On Spellhit ''Feed Venomhide Hatchling'' - Say Line 0'),
(34320,0,5,0,8,0,100,0,65258,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venomhide Hatchling - On Spellhit ''Feed Venomhide Hatchling'' - Say Line 0'),
(34320,0,6,0,8,0,100,0,65265,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venomhide Hatchling - On Spellhit ''Feed Venomhide Hatchling'' - Say Line 0');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 34320;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (13,17) AND `SourceEntry` IN (65200,68358,65258,68360,65265,68359);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,34320,0,0,2,0,47196,6,1,1,0,0,'Venomhide Hatchling - Group 0: Execute SAI ID 0 only if the player does not have 6 ''Venomhide Baby Tooth'' in the inventory or in the bank'),
(22,1,34320,0,0,2,0,47196,11,1,1,0,0,'Venomhide Hatchling - Group 0: Execute SAI ID 0 only if the player does not have 11 ''Venomhide Baby Tooth'' in the inventory or in the bank'),
(22,1,34320,0,0,2,0,47196,16,1,1,0,0,'Venomhide Hatchling - Group 0: Execute SAI ID 0 only if the player does not have 16 ''Venomhide Baby Tooth'' in the inventory or in the bank'),

(22,2,34320,0,0,2,0,47196,6,1,0,0,0,'Venomhide Hatchling - Group 0: Execute SAI ID 1 only if the player does have 6 ''Venomhide Baby Tooth'' in the inventory or in the bank'),
(22,2,34320,0,0,2,0,47196,11,1,1,0,0,'Venomhide Hatchling - Group 0: Execute SAI ID 1 only if the player does not have 11 ''Venomhide Baby Tooth'' in the inventory or in the bank'),
(22,2,34320,0,0,2,0,47196,16,1,1,0,0,'Venomhide Hatchling - Group 0: Execute SAI ID 1 only if the player does not have 16 ''Venomhide Baby Tooth'' in the inventory or in the bank'),

(22,3,34320,0,0,2,0,47196,11,1,0,0,0,'Venomhide Hatchling - Group 0: Execute SAI ID 2 only if the player does have 11 ''Venomhide Baby Tooth'' in the inventory or in the bank'),
(22,3,34320,0,0,2,0,47196,16,1,1,0,0,'Venomhide Hatchling - Group 0: Execute SAI ID 2 only if the player does not have 16 ''Venomhide Baby Tooth'' in the inventory or in the bank'),

(22,4,34320,0,0,2,0,47196,16,1,0,0,0,'Venomhide Hatchling - Group 0: Execute SAI ID 3 only if the player does have 16 ''Venomhide Baby Tooth'' in the inventory or in the bank'),

(13,1,65200,0,0,31,0,3,34320,0,0,0,0,'Feed Venomhide Hatchling - Group 0: Explicit spell target ''Venomhide Hatchling'''),
(13,1,68358,0,0,31,0,3,34320,0,0,0,0,'Feed Meat Visual - Group 0: Explicit spell target ''Venomhide Hatchling'''),
(17,0,65200,0,0,29,0,34320,5,0,0,0,0,'Feed Venomhide Hatchling - Group 0: Needs nearby ''Venomhide Hatchling'''),

(13,1,65258,0,0,31,0,3,34320,0,0,0,0,'Feed Venomhide Hatchling - Group 0: Explicit spell target ''Venomhide Hatchling'''),
(13,1,68360,0,0,31,0,3,34320,0,0,0,0,'Feed Silithid Meat Visual - Group 0: Explicit spell target ''Venomhide Hatchling'''),
(17,0,65258,0,0,29,0,34320,5,0,0,0,0,'Feed Venomhide Hatchling - Group 0: Needs nearby ''Venomhide Hatchling'''),

(13,1,65265,0,0,31,0,3,34320,0,0,0,0,'Feed Venomhide Hatchling - Group 0: Explicit spell target ''Venomhide Hatchling'''),
(13,1,68359,0,0,31,0,3,34320,0,0,0,0,'Feed Silithid Egg Visual - Group 0: Explicit spell target ''Venomhide Hatchling'''),
(17,0,65265,0,0,29,0,34320,5,0,0,0,0,'Feed Venomhide Hatchling - Group 0: Needs nearby ''Venomhide Hatchling''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
