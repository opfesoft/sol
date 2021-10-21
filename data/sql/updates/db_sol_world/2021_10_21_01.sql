-- DB update 2021_10_21_00 -> 2021_10_21_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_21_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_21_00 2021_10_21_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1634812525756482000'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1634812525756482000');

DELETE FROM `gossip_menu` WHERE `MenuID` IN (5346,5347,5349,5354,5355,5361);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(5346,6381),
(5347,6380),
(5349,6354),
(5349,6373),
(5349,6375),
(5354,6384),
(5355,6385),
(5361,6393);

DELETE FROM `gossip_menu_option` WHERE `MenuID` IN (5351,5352,5346,5347,5349,5354);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(5346,0,0,'Tell me more about the history of Remulos and Zaetar.',8961,1,1,5361,0,0,0,'',0,0),
(5347,0,0,'Please tell me more about Zaetar.',8940,1,1,5346,0,0,0,'',0,0),
(5349,0,0,'How can I find the two parts of your scepter?',8957,1,1,5354,0,0,0,'',0,0),
(5349,1,0,'Please tell me more about Maraudon.',8938,1,1,5347,0,0,0,'',0,0),
(5354,0,0,'Why didn''t Lord Vyletongue unite both parts of the scepter into one?',8959,1,1,5355,0,0,0,'',0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 5349;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,5349,6375,0,0,47,0,7044,66,0,0,0,0,'Celebras the Redeemed - Group 0: Show gossip text 6375 if the quest ''Legends of Maraudon'' is completed or rewarded'),
(14,5349,6373,0,0,47,0,7046,64,0,0,0,0,'Celebras the Redeemed - Group 0: Show gossip text 6373 if the quest ''The Scepter of Celebras'' is rewarded'),
(14,5349,6354,0,0,47,0,7044,66,0,1,0,0,'Celebras the Redeemed - Group 0: Show gossip text 6354 if the quest ''Legends of Maraudon'' is not completed or rewarded'),
(15,5349,0,0,0,47,0,7044,8,0,0,0,0,'Celebras the Redeemed - Group 0: Show gossip option 0 if the quest ''Legends of Maraudon'' is in progress'),
(15,5349,1,0,0,47,0,7044,64,0,0,0,0,'Celebras the Redeemed - Group 0: Show gossip option 1 if the quest ''Legends of Maraudon'' is rewarded');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
