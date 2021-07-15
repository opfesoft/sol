-- DB update 2021_07_15_01 -> 2021_07_15_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_07_15_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_07_15_01 2021_07_15_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1626384954848814561'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1626384954848814561');

UPDATE `creature_template` SET `gossip_menu_id` = 6572 WHERE `entry` = 15296;

DELETE FROM `gossip_menu` WHERE `MenuID` = 6572;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(6572,7787),
(6572,7855);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `ConditionTypeOrReference` = 47 AND `SourceGroup` = 6572 AND `SourceEntry` = 7855;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,6572,7855,0,0,47,0,8336,64,0,0,0,0,'Arcanist Ithanas - Show gossip text 7855 if quest ''A Fistful of Slivers'' is rewarded');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
