-- DB update 2020_07_11_00 -> 2020_07_11_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_07_11_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_07_11_00 2020_07_11_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1594501766474785075'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1594501766474785075');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `flags_extra` = 0 WHERE `entry` = 11836;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 21210;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 9457;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 3701;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(15,21210,0,0,0,2,0,7586,1,1,1,0,0,'','Show gossip option if player does not have item ''Tharnariun''s Hope'''),
(15,21210,0,0,0,9,0,2118,0,0,0,0,0,'','Show gossip option if player has quest ''Plagued Lands'' taken'),
(13,1,9457,0,0,31,0,3,11836,0,0,0,0,'','Tharnariun''s Heal - Can only target ''Captured Rabid Thistle Bear'''),
(22,3,3701,0,0,29,1,11836,10,0,0,0,0,'','Tharnariun Treetender - Execute SAI 2 only if within 10 yards of Captured Rabid Thistle Bear');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 3701;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 3701 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 370100 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3701,0,0,1,62,0,100,0,21210,0,0,0,0,85,22837,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Tharnariun Treetender - On Gossip Option 0 Selected - Invoker Cast ''Conjure Tharnariun''s Hope'''),
(3701,0,1,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Tharnariun Treetender - Linked - Close Gossip'),
(3701,0,2,0,20,0,100,0,2118,0,0,0,0,80,370100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tharnariun Treetender - On Quest ''Plagued Lands'' Finished - Call Timed Action List'),

(370100,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tharnariun Treetender - On Script - Remove NPC Flag Questgiver+Gossip'),
(370100,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,19,11836,0,0,0,0,0,0,0,'Tharnariun Treetender - On Script - Set Orientation'),
(370100,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tharnariun Treetender - On Script - Say Line 0'),
(370100,9,3,0,0,0,100,0,2000,2000,0,0,0,11,9457,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tharnariun Treetender - On Script - Cast ''Tharnariun''s Heal'''),
(370100,9,4,0,0,0,100,0,2000,2000,0,0,0,45,2,2,0,0,0,0,19,11836,0,0,0,0,0,0,0,'Tharnariun Treetender - On Script - Set Data'),
(370100,9,5,0,0,0,100,0,2000,2000,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tharnariun Treetender - On Script - Add NPC Flag Questgiver+Gossip');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 2164 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (216400,216401) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2164,0,0,0,0,0,100,0,6000,12000,12000,18000,0,11,3150,32,0,0,0,0,5,0,0,0,0,0,0,0,0,'Rabid Thistle Bear - In Combat - Cast ''Rabies'''),
(2164,0,1,2,38,0,100,1,1,1,0,0,0,67,1,300000,300000,0,0,0,1,0,0,0,0,0,0,0,0,'Rabid Thistle Bear - On Data Set - Create Timed Event ID 1 (No Repeat)'),
(2164,0,2,0,61,0,100,0,0,0,0,0,0,80,216400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rabid Thistle Bear - Linked - Call Timed Action List'),
(2164,0,3,0,4,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Rabid Thistle Bear - On Aggro - Store Targetlist'),
(2164,0,4,5,75,0,100,1,0,3701,10,0,0,29,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rabid Thistle Bear - On ''Tharnariun Treetender'' in Range - Stop Following (No Repeat)'),
(2164,0,5,6,61,0,100,0,0,0,0,0,0,89,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rabid Thistle Bear - Linked - Stop Random Movement'),
(2164,0,6,0,61,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,6436.65,401.832,11.4904,4.88665,'Rabid Thistle Bear - Linked - Move to Position'),
(2164,0,7,0,38,0,100,0,2,2,0,0,0,80,216401,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rabid Thistle Bear - On Data Set - Call Timed Action List'),
(2164,0,8,0,59,0,100,0,1,0,0,0,0,80,216401,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rabid Thistle Bear - On Timed Event ID 1 - Call Timed Action List'),

(216400,9,0,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rabid Thistle Bear - On Script - Evade'),
(216400,9,1,0,0,0,100,0,0,0,0,0,0,33,11836,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Rabid Thistle Bear - On Script - Quest Credit ''Plagued Lands'''),
(216400,9,2,0,0,0,100,0,0,0,0,0,0,29,1,180,0,0,0,0,12,1,0,0,0,0,0,0,0,'Rabid Thistle Bear - On Script - Follow Target'),
(216400,9,3,0,0,0,100,0,0,0,0,0,0,41,420000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rabid Thistle Bear - On Script - Despawn in 7 min'),
(216400,9,4,0,0,0,100,0,0,0,0,0,0,36,11836,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rabid Thistle Bear - On Script - Update Template to ''Captured Rabid Thistle Bear'''),

(216401,9,0,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rabid Thistle Bear - On Script - Set Home Position'),
(216401,9,1,0,0,0,100,0,0,0,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rabid Thistle Bear - On Script - Set Faction 14'),
(216401,9,2,0,0,0,100,0,1000,1000,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Rabid Thistle Bear - On Script - Start Attacking');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
