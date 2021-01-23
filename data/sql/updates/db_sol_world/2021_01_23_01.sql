-- DB update 2021_01_23_00 -> 2021_01_23_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_23_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_23_00 2021_01_23_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1611439063859000228'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1611439063859000228');

DELETE FROM `areatrigger_involvedrelation` WHERE `id` = 171;
DELETE FROM `areatrigger_scripts` WHERE `entry` = 171;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`)
VALUES
(171,'SmartTrigger');

UPDATE `creature_template` SET `faction` = 35, `AIName` = 'SmartAI' WHERE `entry` = 1380;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (2057,1981);
DELETE FROM `smart_scripts` WHERE `entryorguid` = 171 AND `source_type` = 2;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2057,1380,1981,1379) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (205700,205701,138000,137900) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(171,2,0,0,46,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,8279,2057,0,0,0,0,0,0,'Areatrigger - On Trigger - Set Data to Huldar'),

(2057,0,0,0,11,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Huldar - On Respawn - Set Event Phase 1'),
(2057,0,1,0,38,1,100,0,1,1,0,0,0,80,205700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Huldar - On Data Set 1 1 - Call Timed Action List (Phase 1)'),
(2057,0,2,0,38,0,100,0,2,2,0,0,0,80,205701,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Huldar - On Data Set 2 2 - Call Timed Action List'),

(205700,9,0,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Huldar - On Script - Set Event Phase 0'),
(205700,9,1,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Huldar - On Script - Remove NPC Flags Gossip & Questgiver'),
(205700,9,2,0,0,0,100,0,0,0,0,0,0,12,1380,6,10000,0,0,0,8,0,0,0,0,-5762.05,-3437.35,305.971,2.01641,'Huldar - On Script - Summon Creature ''Saean'''),

(205701,9,0,0,0,0,100,0,1000,1000,0,0,0,15,273,0,0,0,0,0,18,50,0,0,0,0,0,0,0,'Huldar - On Script - Complete Quest ''Resupplying the Excavation'''),
(205701,9,1,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Huldar - On Script - Set NPC Flags Gossip & Questgiver'),
(205701,9,2,0,0,0,100,0,30000,30000,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Huldar - On Script - Set Event Phase 1'),

(1380,0,0,0,54,0,100,0,0,0,0,0,0,80,138000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Saean - Just Summoned - Call Timed Action List'),
(1380,0,1,0,6,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,19,2057,0,0,0,0,0,0,0,'Saean - On Just Died - Set Data to Huldar'),

(138000,9,0,0,0,0,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Saean - On Script - Say Line 0'),
(138000,9,1,0,0,0,100,0,2000,2000,0,0,0,2,54,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Saean - On Script - Set Faction 54'),
(138000,9,2,0,0,0,100,0,0,0,0,0,0,12,1981,6,10000,0,0,0,8,0,0,0,0,-5759.24,-3442.57,305.453,2.00286,'Saean - On Script - Summon Creature ''Dark Iron Ambusher'''),
(138000,9,3,0,0,0,100,0,0,0,0,0,0,12,1981,6,10000,0,0,0,8,0,0,0,0,-5771.42,-3437.31,306.013,0.518455,'Saean - On Script - Summon Creature ''Dark Iron Ambusher'''),
(138000,9,4,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,19,2057,0,0,0,0,0,0,0,'Saean - On Script - Attack ''Huldar'''),
(138000,9,5,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,19,1379,0,0,0,0,0,0,0,'Saean - On Script - Say Line 0 (Miran)'),

(1981,0,0,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,25,20,0,0,0,0,0,0,0,'Dark Iron Ambusher - On Just Summoned - Attack Closest Player'),

(1379,0,0,0,19,0,100,0,309,0,0,0,0,53,0,1379,0,309,10000,2,7,0,0,0,0,0,0,0,0,'Miran - On Quest ''Protecting the Shipment'' Accepted - Start WP Movement'),
(1379,0,1,2,40,0,100,0,12,0,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miran - On WP 12 Reached - Pause WP Movement'),
(1379,0,2,0,61,0,100,0,0,0,0,0,0,80,137900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miran - Linked - Call Timed Action List'),
(1379,0,3,0,40,0,100,0,24,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miran - On WP 24 Reached - Say Line 3'),
(1379,0,4,0,5,0,100,0,30000,30000,0,2149,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miran - On Kill ''Dark Iron Raider'' - Say Line 2'),

(137900,9,0,0,0,0,100,0,0,0,0,0,0,12,2149,4,30000,0,1,0,8,0,0,0,0,-5683.13,-3618.7,312.98,1.3,'Miran - Linked - Summon Creature ''Dark Iron Raider'''),
(137900,9,1,0,0,0,100,0,0,0,0,0,0,12,2149,4,30000,0,1,0,8,0,0,0,0,-5661.2,-3609.89,312.5,2.65,'Miran - Linked - Summon Creature ''Dark Iron Raider'''),
(137900,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,19,2149,40,0,0,0,0,0,0,'Miran - Linked - Say Line 0 (Dark Iron Raider)'),
(137900,9,3,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miran - Linked - Say Line 1');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 171;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(22,1,171,2,0,9,0,273,0,0,0,0,0,'','SAI triggers only if quest ''Resupplying the Excavation'' is taken');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
