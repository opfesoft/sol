-- DB update 2021_08_03_02 -> 2021_08_03_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_03_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_03_02 2021_08_03_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1628009186812000742'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1628009186812000742');

DELETE FROM `gossip_menu` WHERE `MenuID` = 7403 AND `TextID` = 8869;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(7403,8869);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 7403;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,7403,8869,0,0,16,0,1024,0,0,1,0,0,'Cowlen - Show gossip text 8869 if player is not Draenei'),
(14,7403,8870,0,0,16,0,1024,0,0,0,0,0,'Cowlen - Show gossip text 8870 if player is Draenei'),
(15,7403,0,0,0,16,0,1024,0,0,0,0,0,'Cowlen - Show gossip option 0 if player is Draenei');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
