-- DB update 2022_03_26_00 -> 2022_03_27_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_26_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_26_00 2022_03_27_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648339599124659145'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648339599124659145');

UPDATE `quest_template_addon` SET `SpecialFlags` = 1 WHERE `ID` = 3375;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 6826;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (682600,682601,682602);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6826,0,0,1,22,0,100,0,264,0,0,0,0,33,6826,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Talvash del Kissel - On Received Emote ''TRAIN'' - Quest Credit ''Incoming Gumdrop'''),
(6826,0,1,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Talvash del Kissel - Linked - Say Line 0'),
(6826,0,2,3,20,0,100,0,2204,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talvash del Kissel - On Quest ''Restoring the Necklace'' Rewarded - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(6826,0,3,4,61,0,100,0,0,0,0,0,0,53,0,6826,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talvash del Kissel - Linked - Start WP Movement'),
(6826,0,4,0,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talvash del Kissel - Linked - Say Line 1'),
(6826,0,5,0,40,0,100,0,3,6826,0,0,0,80,682600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talvash del Kissel - On WP 3 Reached - Call Timed Action List'),
(6826,0,6,0,40,0,100,0,5,6826,0,0,0,80,682601,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talvash del Kissel - On WP 5 Reached - Call Timed Action List'),
(6826,0,7,0,40,0,100,0,10,6826,0,0,0,80,682602,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talvash del Kissel - On WP 10 Reached - Call Timed Action List'),

(682600,9,0,0,0,0,100,0,0,0,0,0,0,54,8000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talvash del Kissel - On Script - Pause WP Movement'),
(682600,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,5.02135,'Talvash del Kissel - On Script - Set Orientation'),
(682600,9,2,0,0,0,100,0,3000,3000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talvash del Kissel - On Script - Say Line 2'),
(682600,9,3,0,0,0,100,0,5000,5000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talvash del Kissel - On Script - Say Line 3'),

(682601,9,0,0,0,0,100,0,0,0,0,0,0,54,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talvash del Kissel - On Script - Pause WP Movement'),
(682601,9,1,0,0,0,100,0,4000,4000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talvash del Kissel - On Script - Say Line 4'),

(682602,9,0,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,3.31613,'Talvash del Kissel - On Script - Set Orientation'),
(682602,9,1,0,0,0,100,0,1000,1000,0,0,0,11,9795,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talvash del Kissel - On Script - Cast ''Talvash''s Necklace Repair'''),
(682602,9,2,0,0,0,100,0,6000,6000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talvash del Kissel - On Script - Say Line 5'),
(682602,9,3,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talvash del Kissel - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` = 3375;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 6826;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(19,0,3375,0,0,2,0,7667,1,1,1,0,0,'Quest ''Replacement Phial'' - Group 0: Can accept the quest only if the item ''Talvash''s Phial of Scrying'' is not in the inventory or in the bank'),
(19,0,3375,0,0,47,0,2200,74,0,0,0,0,'Quest ''Replacement Phial'' - Group 0: Can accept the quest only if quest ''Back to Uldaman'' is completed, in progress or rewarded'),
(19,0,3375,0,0,47,0,2204,66,0,1,0,0,'Quest ''Replacement Phial'' - Group 0: Can accept the quest only if quest ''Restoring the Necklace'' is not completed or rewarded'),

(20,0,3375,0,0,2,0,7667,1,1,1,0,0,'Quest ''Replacement Phial'' - Group 0: Show quest mark only if the item ''Talvash''s Phial of Scrying'' is not in the inventory or in the bank'),
(20,0,3375,0,0,47,0,2200,74,0,0,0,0,'Quest ''Replacement Phial'' - Group 0: Show quest mark only if quest ''Back to Uldaman'' is completed, in progress or rewarded'),
(20,0,3375,0,0,47,0,2204,66,0,1,0,0,'Quest ''Replacement Phial'' - Group 0: Show quest mark only if quest ''Restoring the Necklace'' is not completed or rewarded'),

(22,1,6826,0,0,47,0,8355,8,0,0,0,0,'Talvash del Kissel - Group 0: Execute SAI 0 only if quest ''Incoming Gumdrop'' is in progress');

DELETE FROM `waypoints` WHERE `entry` = 6826;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(6826,1,-4586.89,-997.797,503.658,'Talvash del Kissel - Quest ''Restoring the Necklace'''),
(6826,2,-4582.68,-996.563,503.658,NULL),
(6826,3,-4575.23,-998.552,503.658,NULL),
(6826,4,-4575.04,-995.529,503.657,NULL),
(6826,5,-4576.11,-992.451,503.657,NULL),
(6826,6,-4575.04,-995.529,503.657,NULL),
(6826,7,-4575.64,-997.129,503.657,NULL),
(6826,8,-4578.79,-998.015,503.657,NULL),
(6826,9,-4586.89,-997.797,503.658,NULL),
(6826,10,-4588.3,-1001.21,503.657,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
