-- DB update 2022_04_18_00 -> 2022_04_19_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_18_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_18_00 2022_04_19_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1650320421890158528'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1650320421890158528');

DELETE FROM `gossip_menu` WHERE `MenuID` = 6544 AND `TextID` = 7752;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(6544,7752);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 6544;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,6544,7752,0,0,47,0,8278,64,0,0,0,0,'Noggle Ficklespragg - Group 0: Show show gossip menu text 7752 if quest ''Noggle''s Last Hope'' is rewarded'),
(14,6544,7753,0,0,47,0,8278,64,0,1,0,0,'Noggle Ficklespragg - Group 0: Show show gossip menu text 7753 if quest ''Noggle''s Last Hope'' is not rewarded');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (15189,15190);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (15189,15190);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1519000,1519001,1519002);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(15189,0,0,0,1,0,100,0,1000,15000,180000,360000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Beetix Ficklespragg - OOC - Say Line 0'),
(15189,0,1,0,20,0,100,0,8277,0,0,0,0,80,1519000,0,0,0,0,0,19,15190,0,0,0,0,0,0,0,'Beetix Ficklespragg - On Quest ''Deadly Desert Venom'' Rewarded - Call Timed Action List (Noggle Ficklespragg)'),
(15189,0,2,0,20,0,100,0,8278,0,0,0,0,80,1519001,0,0,0,0,0,19,15190,0,0,0,0,0,0,0,'Beetix Ficklespragg - On Quest ''Noggle''s Last Hope'' Rewarded - Call Timed Action List (Noggle Ficklespragg)'),

(15190,0,0,0,20,0,100,0,8282,0,0,0,0,80,1519002,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Quest ''Noggle''s Lost Satchel'' Rewarded - Call Timed Action List'),

(1519000,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,19,15189,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'' (Beetix Ficklespragg)'),
(1519000,9,1,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(1519000,9,2,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Say Line 2'),
(1519000,9,3,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Clear Unit Stand State'),
(1519000,9,4,0,0,0,100,0,2000,2000,0,0,0,17,64,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Set Emote State ''STATE_STUN'''),
(1519000,9,5,0,0,0,100,0,5000,5000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Set Emote State ''ONESHOT_NONE'''),
(1519000,9,6,0,0,0,100,0,0,0,0,0,0,90,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Set ''UNIT_STAND_STATE_DEAD'''),
(1519000,9,7,0,0,0,100,0,5000,5000,0,0,0,82,2,0,0,0,0,0,19,15189,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Add ''GOSSIP_OPTION_QUESTGIVER'' (Beetix Ficklespragg)'),
(1519000,9,8,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),

(1519001,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,19,15189,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'' (Beetix Ficklespragg)'),
(1519001,9,1,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(1519001,9,2,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Clear Unit Stand State'),
(1519001,9,3,0,0,0,100,0,2000,2000,0,0,0,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Play Emote ''ONESHOT_CHEER(DNR)'''),
(1519001,9,4,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Say Line 0'),
(1519001,9,5,0,0,0,100,0,5000,5000,0,0,0,90,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Set ''UNIT_STAND_STATE_DEAD'''),
(1519001,9,6,0,0,0,100,0,5000,5000,0,0,0,82,2,0,0,0,0,0,19,15189,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Add ''GOSSIP_OPTION_QUESTGIVER'' (Beetix Ficklespragg)'),
(1519001,9,7,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),

(1519002,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,19,15189,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'' (Beetix Ficklespragg)'),
(1519002,9,1,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(1519002,9,2,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Clear Unit Stand State'),
(1519002,9,3,0,0,0,100,0,0,0,0,0,0,90,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Set ''UNIT_STAND_STATE_SIT'''),
(1519002,9,4,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Say Line 1'),
(1519002,9,5,0,0,0,100,0,5000,5000,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Clear Unit Stand State'),
(1519002,9,6,0,0,0,100,0,0,0,0,0,0,90,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Set ''UNIT_STAND_STATE_DEAD'''),
(1519002,9,7,0,0,0,100,0,5000,5000,0,0,0,82,2,0,0,0,0,0,19,15189,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Add ''GOSSIP_OPTION_QUESTGIVER'' (Beetix Ficklespragg)'),
(1519002,9,8,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noggle Ficklespragg - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
