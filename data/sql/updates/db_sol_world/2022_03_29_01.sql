-- DB update 2022_03_29_00 -> 2022_03_29_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_29_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_29_00 2022_03_29_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648548813870051196'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648548813870051196');

UPDATE `creature_template` SET `gossip_menu_id` = 4013 WHERE `entry` = 3407;

DELETE FROM `gossip_menu` WHERE `MenuID` = 4013 AND `TextID` = 4870;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(4013,4870);

DELETE FROM `gossip_menu_option` WHERE `MenuID` = 4013;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(4013,0,3,'I''d like to train.',7149,5,16,0,0,0,0,'',0,0),
(4013,1,0,'I wish to unlearn my talents.',8271,16,16,4461,0,0,0,'',0,0),
(4013,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,10371,0,0,0,'',0,0);

UPDATE `gossip_menu_option` SET `OptionText` = 'I seek training in the ways of the Hunter.', `OptionBroadcastTextID` = 7643 WHERE `MenuID` = 4506 AND `OptionID` = 0;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` IN (4013,4506);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,4013,4870,0,0,15,0,4,0,0,0,0,0,'Sian''dur - Group 0: Show gossip menu text 4870 if player is a Hunter'),
(14,4013,5004,0,0,15,0,4,0,0,1,0,0,'Sian''dur - Group 0: Show gossip menu text 5004 if player is not a Hunter'),
(15,4013,0,0,0,15,0,4,0,0,0,0,0,'Sian''dur - Group 0: Show gossip option 0 if player is a Hunter'),
(15,4013,1,0,0,15,0,4,0,0,0,0,0,'Sian''dur - Group 0: Show gossip option 1 if player is a Hunter'),
(15,4013,2,0,0,15,0,4,0,0,0,0,0,'Sian''dur - Group 0: Show gossip option 2 if player is a Hunter'),

(14,4506,4987,0,0,15,0,4,0,0,0,0,0,'Xor''juul - Group 0: Show gossip menu text 4987 if player is a Hunter'),
(14,4506,5004,0,0,15,0,4,0,0,1,0,0,'Xor''juul - Group 0: Show gossip menu text 5004 if player is not a Hunter'),
(15,4506,0,0,0,15,0,4,0,0,0,0,0,'Xor''juul - Group 0: Show gossip option 0 if player is a Hunter'),
(15,4506,1,0,0,15,0,4,0,0,0,0,0,'Xor''juul - Group 0: Show gossip option 1 if player is a Hunter'),
(15,4506,2,0,0,15,0,4,0,0,0,0,0,'Xor''juul - Group 0: Show gossip option 2 if player is a Hunter');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
