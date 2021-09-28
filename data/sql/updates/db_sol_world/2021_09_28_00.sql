-- DB update 2021_09_27_03 -> 2021_09_28_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_27_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_27_03 2021_09_28_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1632811993770320364'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1632811993770320364');

DELETE FROM `gossip_menu` WHERE `MenuID` = 6573 AND `TextID` = 7788;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(6573,7788);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 6573;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,6573,7788,0,0,47,0,8350,64,0,1,0,0,'Outrunner Alarion - Group 0: Show gossip text 7788 only if quest ''Completing the Delivery'' is not rewarded'),
(14,6573,7788,0,0,47,0,8347,74,0,0,0,0,'Outrunner Alarion - Group 0: Show gossip text 7788 only if quest ''Aiding the Outrunners'' is completed, in progress or rewarded'),

(14,6573,7821,0,0,47,0,8350,64,0,0,0,0,'Outrunner Alarion - Group 0: Show gossip text 7821 only if quest ''Completing the Delivery'' is rewarded'),
(14,6573,7821,0,0,47,0,8347,74,0,0,0,0,'Outrunner Alarion - Group 0: Show gossip text 7821 only if quest ''Aiding the Outrunners'' is completed, in progress or rewarded');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
