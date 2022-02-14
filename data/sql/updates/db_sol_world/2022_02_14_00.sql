-- DB update 2022_02_12_01 -> 2022_02_14_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_12_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_12_01 2022_02_14_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1644844228493589930'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1644844228493589930');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 15552;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1555200;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(15552,0,0,1,11,0,100,1,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,5086.29,-5108.8,929.24,0,'Doctor Weavil - On Respawn - Move To Point 1 (only executed in Winterspring, see conditions)'),
(15552,0,1,0,61,0,100,0,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Weavil - Linked - Set Faction ''Friendly'''),
(15552,0,2,0,34,0,100,1,8,1,0,0,0,80,1555200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Weavil - On Point 1 Reached - Call Timed Action List'),
(15552,0,3,4,34,0,100,1,8,2,0,0,0,45,1,1,0,0,0,0,19,15553,30,0,0,0,0,0,0,'Doctor Weavil - On Point 2 Reached - Set Data 1 1 (Doctor Weavil''s Flying Machine)'),
(15552,0,4,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Weavil - Linked - Force Despawn'),
(15552,0,5,0,0,0,100,0,8000,14000,8000,14000,0,11,25774,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Weavil - IC - Cast ''Mind Shatter'''),
(15552,0,6,0,0,0,100,0,15000,15000,120000,120000,0,11,25772,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Doctor Weavil - IC - Cast ''Mental Domination'''),

(1555200,9,0,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,1.4,'Doctor Weavil - On Script - Set Orientation'),
(1555200,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Weavil - On Script - Say Line 0'),
(1555200,9,2,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Weavil - On Script - Say Line 1'),
(1555200,9,3,0,0,0,100,0,3000,3000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Weavil - On Script - Say Line 2'),
(1555200,9,4,0,0,0,100,0,9000,9000,0,0,0,1,3,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Doctor Weavil - On Script - Say Line 3'),
(1555200,9,5,0,0,0,100,0,7000,7000,0,0,0,69,2,0,0,0,0,0,8,0,0,0,0,5087.87,-5079.19,921.96,0,'Doctor Weavil - On Script - Move To Point 2'),
(1555200,9,6,0,0,0,100,0,3000,3000,0,0,0,12,15554,4,60000,0,0,0,8,0,0,0,0,5101,-5085.6,926.2,4.1,'Doctor Weavil - On Script - Summon Creature (Number Two)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 15552;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,15552,0,0,4,1,618,0,0,0,0,0,'Doctor Weavil - Group 0: Execute SAI ID 0 only in Winterspring');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
