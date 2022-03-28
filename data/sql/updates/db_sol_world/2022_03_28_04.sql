-- DB update 2022_03_28_03 -> 2022_03_28_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_28_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_28_03 2022_03_28_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648485095181827666'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648485095181827666');

DELETE FROM `gossip_menu` WHERE `MenuID` in (4821,4822,4823,4824,4825,4826,4827,8268,8433,9578,9581,9777);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(4821,5873),
(4821,5874),
(4822,5875),
(4822,5876),
(4823,5877),
(4823,5878),
(4824,5879),
(4824,5880),
(4825,5881),
(4825,5882),
(4826,5883),
(4826,5884),
(4827,5885),
(4827,5886),
(8268,10291),
(8268,10292),
(8433,10291),
(8433,10292),
(9578,12926),
(9578,12927),
(9581,12932),
(9581,12933),
(9777,13455),
(9777,13456);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` IN (4821,4822,4823,4824,4825,4826,4827,8268,8433,9578,9581,9777);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,4821,5873,0,0,15,0,128,0,0,1,0,0,'Elissa Dumas - Group 0: Show gossip menu text 5873 if player is not a mage'),
(14,4821,5874,0,0,15,0,128,0,0,0,0,0,'Elissa Dumas - Group 0: Show gossip menu text 5874 if player is a mage'),

(14,4822,5875,0,0,15,0,128,0,0,1,0,0,'Larimaine Purdue - Group 0: Show gossip menu text 5875 if player is not a mage'),
(14,4822,5876,0,0,15,0,128,0,0,0,0,0,'Larimaine Purdue - Group 0: Show gossip menu text 5876 if player is a mage'),

(14,4823,5877,0,0,15,0,128,0,0,1,0,0,'Milstaff Stormeye - Group 0: Show gossip menu text 5877 if player is not a mage'),
(14,4823,5878,0,0,15,0,128,0,0,0,0,0,'Milstaff Stormeye - Group 0: Show gossip menu text 5878 if player is a mage'),

(14,4824,5879,0,0,15,0,128,0,0,1,0,0,'Narinth/Lunaraa - Group 0: Show gossip menu text 5879 if player is not a mage'),
(14,4824,5880,0,0,15,0,128,0,0,0,0,0,'Narinth/Lunaraa - Group 0: Show gossip menu text 5880 if player is a mage'),

(14,4825,5881,0,0,15,0,128,0,0,0,0,0,'Birgitte Cranston - Group 0: Show gossip menu text 5881 if player is a mage'),
(14,4825,5882,0,0,15,0,128,0,0,1,0,0,'Birgitte Cranston - Group 0: Show gossip menu text 5882 if player is not a mage'),

(14,4826,5883,0,0,15,0,128,0,0,1,0,0,'Thuul - Group 0: Show gossip menu text 5883 if player is not a mage'),
(14,4826,5884,0,0,15,0,128,0,0,0,0,0,'Thuul - Group 0: Show gossip menu text 5884 if player is a mage'),

(14,4827,5885,0,0,15,0,128,0,0,1,0,0,'Lexington Mortaim - Group 0: Show gossip menu text 5885 if player is not a mage'),
(14,4827,5886,0,0,15,0,128,0,0,0,0,0,'Lexington Mortaim - Group 0: Show gossip menu text 5886 if player is a mage'),

(14,8268,10291,0,0,15,0,128,0,0,1,0,0,'Iorioa - Group 0: Show gossip menu text 10291 if player is not a mage'),
(14,8268,10292,0,0,15,0,128,0,0,0,0,0,'Iorioa - Group 0: Show gossip menu text 10292 if player is a mage'),

(14,8433,10291,0,0,15,0,128,0,0,1,0,0,'Mi''irku Farstep - Group 0: Show gossip menu text 10291 if player is not a mage'),
(14,8433,10292,0,0,15,0,128,0,0,0,0,0,'Mi''irku Farstep - Group 0: Show gossip menu text 10292 if player is a mage'),

(14,9578,12926,0,0,15,0,128,0,0,0,0,0,'Lorrin Foxfire - Group 0: Show gossip menu text 12926 if player is a mage'),
(14,9578,12927,0,0,15,0,128,0,0,1,0,0,'Lorrin Foxfire - Group 0: Show gossip menu text 12927 if player is not a mage'),

(14,9581,12932,0,0,15,0,128,0,0,1,0,0,'Ysuria - Group 0: Show gossip menu text 12932 if player is not a mage'),
(14,9581,12933,0,0,15,0,128,0,0,0,0,0,'Ysuria - Group 0: Show gossip menu text 12933 if player is a mage'),

(14,9777,13455,0,0,15,0,128,0,0,1,0,0,'Archmage Celindra - Group 0: Show gossip menu text 13455 if player is not a mage'),
(14,9777,13456,0,0,15,0,128,0,0,0,0,0,'Archmage Celindra - Group 0: Show gossip menu text 13456 if player is a mage');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
