-- DB update 2021_10_23_01 -> 2021_10_24_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_23_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_23_01 2021_10_24_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1635111662391702936'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1635111662391702936');

-- Quest "The Prophecy of Akida" has to be finished before "The Kessel Run" becomes available
UPDATE `quest_template_addon` SET `PrevQuestID` = 9544 WHERE `ID` = 9663;

DELETE FROM `gossip_menu` WHERE `MenuID` IN (7432,7433,7434,7370,7399);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(7432,8983),
(7432,8994),

(7433,8983),
(7433,8996),

(7434,8983),
(7434,8997),
(7434,9039),
(7434,9145),
(7434,9146),

(7370,8806),
(7370,9040),
(7370,9153),
(7370,9154),

(7399,8864),
(7399,8865),
(7399,9038),
(7399,9148),
(7399,9149);

DELETE FROM `npc_text` WHERE `ID` IN (9153,9148);
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`)
VALUES
(9153,'We are here to support our hero!','',14680,0,1,0),
(9148,'A glorious victory!','',14674,0,1,5);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 17445;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 17445;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 17443 AND `id` > 2;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 17116 AND `source_type` = 0 AND `id` = 3;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 17240 AND `source_type` = 0 AND `id` = 4;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17445,0,0,0,54,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine the Younger - On Just Summoned - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),

(17443,0,3,0,54,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kurz the Revelator - On Just Summoned - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),

(17116,0,3,0,54,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Exarch Menelaous - On Just Summoned - Remove ''GOSSIP_OPTION_QUESTGIVER'''),

(17240,0,4,0,54,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Odesyus - On Just Summoned - Remove ''GOSSIP_OPTION_QUESTGIVER''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` IN (7432,7433,7434,7370,7399);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,7432,8983,0,0,47,0,9544,64,0,1,0,0,'Kurz the Revelator - Group 0: Show gossip text 8983 if quest ''The Prophecy of Akida'' is not rewarded'),
(14,7432,8994,0,0,47,0,9544,64,0,0,0,0,'Kurz the Revelator - Group 0: Show gossip text 8994 if quest ''The Prophecy of Akida'' is rewarded'),

(14,7433,8983,0,0,47,0,9544,64,0,1,0,0,'Stillpine the Younger - Group 0: Show gossip text 8983 if quest ''The Prophecy of Akida'' is not rewarded'),
(14,7433,8996,0,0,47,0,9544,64,0,0,0,0,'Stillpine the Younger - Group 0: Show gossip text 8996 if quest ''The Prophecy of Akida'' is rewarded'),

(14,7434,8983,0,0,47,0,9544,64,0,1,0,0,'High Chief Stillpine - Group 0: Show gossip text 8983 if quest ''The Prophecy of Akida'' is not rewarded'),
(14,7434,8997,0,0,47,0,9544,64,0,0,0,0,'High Chief Stillpine - Group 0: Show gossip text 8997 if quest ''The Prophecy of Akida'' is rewarded'),
(14,7434,8997,0,0,47,0,9759,64,0,1,0,0,'High Chief Stillpine - Group 0: Show gossip text 8997 if quest ''Ending Their World'' is not rewarded'),
(14,7434,8997,0,0,47,0,9663,10,0,1,0,0,'High Chief Stillpine - Group 0: Show gossip text 8997 if quest ''The Kessel Run'' is not in progress or completed'),
(14,7434,9039,0,0,47,0,9663,10,0,0,0,0,'High Chief Stillpine - Group 0: Show gossip text 9039 if quest ''The Kessel Run'' is in progress or completed'),
(14,7434,9145,0,0,47,0,9759,64,0,0,0,0,'High Chief Stillpine - Group 0: Show gossip text 9145 if quest ''Ending Their World'' is rewarded'),
(14,7434,9145,0,0,23,1,3584,0,0,0,0,0,'High Chief Stillpine - Group 0: Show gossip text 9145 if creature is located in Blood Watch'),
(14,7434,9146,0,0,47,0,9759,64,0,0,0,0,'High Chief Stillpine - Group 0: Show gossip text 9146 if quest ''Ending Their World'' is rewarded'),
(14,7434,9146,0,0,23,1,3584,0,0,1,0,0,'High Chief Stillpine - Group 0: Show gossip text 9146 if creature is not located in Blood Watch'),

(14,7370,8806,0,0,47,0,9663,10,0,1,0,0,'Exarch Menelaous - Group 0: Show gossip text 8806 if quest ''The Kessel Run'' is not in progress or completed'),
(14,7370,8806,0,0,47,0,9759,64,0,1,0,0,'Exarch Menelaous - Group 0: Show gossip text 8806 if quest ''Ending Their World'' is not rewarded'),
(14,7370,9040,0,0,47,0,9663,10,0,0,0,0,'Exarch Menelaous - Group 0: Show gossip text 9040 if quest ''The Kessel Run'' is in progress or completed'),
(14,7370,9153,0,0,47,0,9759,64,0,0,0,0,'Exarch Menelaous - Group 0: Show gossip text 9153 if quest ''Ending Their World'' is rewarded'),
(14,7370,9153,0,0,23,1,3584,0,0,0,0,0,'Exarch Menelaous - Group 0: Show gossip text 9153 if creature is located in Blood Watch'),
(14,7370,9154,0,0,47,0,9759,64,0,0,0,0,'Exarch Menelaous - Group 0: Show gossip text 9154 if quest ''Ending Their World'' is rewarded'),
(14,7370,9154,0,0,23,1,3584,0,0,1,0,0,'Exarch Menelaous - Group 0: Show gossip text 9154 if creature is not located in Blood Watch'),
(15,7370,0,0,0,47,0,9456,8,0,0,0,0,'Exarch Menelaous - Group 0: Show gossip option 0 if quest ''Nightstalker Clean Up, Isle 2...'' is in progress'),

(14,7399,8864,0,0,47,0,9663,10,0,1,0,0,'Admiral Odesyus - Group 0: Show gossip text 8864 if quest ''The Kessel Run'' is not in progress or completed'),
(14,7399,8864,0,0,47,0,9759,64,0,1,0,0,'Admiral Odesyus - Group 0: Show gossip text 8864 if quest ''Ending Their World'' is not rewarded'),
(14,7399,8864,0,0,47,0,9506,64,0,1,0,0,'Admiral Odesyus - Group 0: Show gossip text 8864 if quest ''A Small Start'' is not rewarded'),
(14,7399,8865,0,0,47,0,9663,10,0,1,0,0,'Admiral Odesyus - Group 0: Show gossip text 8865 if quest ''The Kessel Run'' is not in progress or completed'),
(14,7399,8865,0,0,47,0,9759,64,0,1,0,0,'Admiral Odesyus - Group 0: Show gossip text 8865 if quest ''Ending Their World'' is not rewarded'),
(14,7399,8865,0,0,47,0,9506,64,0,0,0,0,'Admiral Odesyus - Group 0: Show gossip text 8865 if quest ''A Small Start'' is rewarded'),
(14,7399,9038,0,0,47,0,9663,10,0,0,0,0,'Admiral Odesyus - Group 0: Show gossip text 9038 if quest ''The Kessel Run'' is in progress or completed'),
(14,7399,9148,0,0,47,0,9759,64,0,0,0,0,'Admiral Odesyus - Group 0: Show gossip text 9148 if quest ''Ending Their World'' is rewarded'),
(14,7399,9148,0,0,23,1,3584,0,0,0,0,0,'Admiral Odesyus - Group 0: Show gossip text 9148 if creature is located in Blood Watch'),
(14,7399,9149,0,0,47,0,9759,64,0,0,0,0,'Admiral Odesyus - Group 0: Show gossip text 9149 if quest ''Ending Their World'' is rewarded'),
(14,7399,9149,0,0,23,1,3584,0,0,1,0,0,'Admiral Odesyus - Group 0: Show gossip text 9149 if creature is not located in Blood Watch');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
