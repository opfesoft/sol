-- DB update 2022_03_22_02 -> 2022_03_22_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_22_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_22_02 2022_03_22_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1647984246016017772'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1647984246016017772');

DELETE FROM `gossip_menu` WHERE `MenuID` = 7376;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(7376,8824),
(7376,8825),
(7376,8826),
(7376,8827);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 7376;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,7376,8824,0,0,15,0,64,0,0,1,0,0,'Spirit of the Vale - Group 0: Show gossip text 8824 if the player is not a Shaman'),
(14,7376,8824,0,0,16,0,1024,0,0,1,0,0,'Spirit of the Vale - Group 0: Show gossip text 8824 if the player is not a Draenei'),
(14,7376,8824,0,0,47,0,9450,64,0,1,0,0,'Spirit of the Vale - Group 0: Show gossip text 8824 if quest ''Call of Earth'' (Part 2) is not rewarded'),

(14,7376,8825,0,0,15,0,64,0,0,1,0,0,'Spirit of the Vale - Group 0: Show gossip text 8825 if the player is not a Shaman'),
(14,7376,8825,0,0,16,0,1024,0,0,0,0,0,'Spirit of the Vale - Group 0: Show gossip text 8825 if the player is a Draenei'),
(14,7376,8825,0,0,47,0,9450,64,0,1,0,0,'Spirit of the Vale - Group 0: Show gossip text 8825 if quest ''Call of Earth'' (Part 2) is not rewarded'),

(14,7376,8826,0,0,15,0,64,0,0,0,0,0,'Spirit of the Vale - Group 0: Show gossip text 8826 if the player is a Shaman'),
(14,7376,8826,0,0,16,0,1024,0,0,1,0,0,'Spirit of the Vale - Group 0: Show gossip text 8826 if the player is not a Draenei'),
(14,7376,8826,0,0,47,0,9450,64,0,0,0,0,'Spirit of the Vale - Group 0: Show gossip text 8826 if quest ''Call of Earth'' (Part 2) is rewarded'),

(14,7376,8827,0,0,15,0,64,0,0,0,0,0,'Spirit of the Vale - Group 0: Show gossip text 8827 if the player is a Shaman'),
(14,7376,8827,0,0,16,0,1024,0,0,0,0,0,'Spirit of the Vale - Group 0: Show gossip text 8827 if the player is a Draenei'),
(14,7376,8827,0,0,47,0,9450,64,0,0,0,0,'Spirit of the Vale - Group 0: Show gossip text 8827 if quest ''Call of Earth'' (Part 2) is rewarded');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
