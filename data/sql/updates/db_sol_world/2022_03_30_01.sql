-- DB update 2022_03_30_00 -> 2022_03_30_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_30_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_30_00 2022_03_30_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648623068930913624'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648623068930913624');

UPDATE `quest_template` SET `RewardNextQuest` = 2608 WHERE `ID` = 2607;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 7207;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (720700,720701);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7207,0,0,0,19,0,100,0,2608,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - On Quest ''The Touch of Zanzil (Part 2)'' Accepted - Say Line 0'),
(7207,0,1,0,22,0,100,0,61,15000,15000,0,0,80,720700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - On Received Emote ''LAYDOWN'' - Call Timed Action List'),
(7207,0,2,3,20,0,100,0,2608,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - On Quest ''The Touch of Zanzil (Part 2)'' Rewarded - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(7207,0,3,4,61,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - Linked - Set Run Off'),
(7207,0,4,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,-8806.36,338.259,95.0989,0,'Doc Mixilpixil - Linked - Move To Position 1'),
(7207,0,5,0,34,0,100,0,8,1,0,0,0,80,720701,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - On Position 1 Reached - Call Timed Action List'),
(7207,0,6,7,34,0,100,0,8,2,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - On Position 2 Reached - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(7207,0,7,8,61,0,100,0,0,0,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - Linked - Say Line 5'),
(7207,0,8,0,61,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - Linked - Evade'),

(720700,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(720700,9,1,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - On Script - Say Line 1'),
(720700,9,2,0,0,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(720700,9,3,0,0,0,100,0,6000,6000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(720700,9,4,0,0,0,100,0,2000,2000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - On Script - Say Line 2'),
(720700,9,5,0,0,0,100,0,3000,3000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - On Script - Say Line 3'),
(720700,9,6,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(720700,9,7,0,0,0,100,0,0,0,0,0,0,15,2608,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Doc Mixilpixil - On Script - Complete Quest ''The Touch of Zanzil (Part 2)'''),

(720701,9,0,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0.291581,'Doc Mixilpixil - On Script - Set Orientation'),
(720701,9,1,0,0,0,100,0,1000,1000,0,0,0,17,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - On Script - Set Emote State ''ONESHOT_TALK(DNR)'''),
(720701,9,2,0,0,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - On Script - Say Line 4'),
(720701,9,3,0,0,0,100,0,15000,15000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doc Mixilpixil - On Script - Set Emote State ''ONESHOT_NONE'''),
(720701,9,4,0,0,0,100,0,1000,1000,0,0,0,69,2,0,0,0,0,0,8,0,0,0,0,-8805.56,331.968,95.0986,0,'Doc Mixilpixil - On Script - Move To Position 2');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 7207;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,2,7207,0,0,47,0,2608,8,0,0,0,0,'Doc Mixilpixil - Group 0: Execute SAI ID 1 only if quest ''The Touch of Zanzil'' (Part 2) is in progress');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
