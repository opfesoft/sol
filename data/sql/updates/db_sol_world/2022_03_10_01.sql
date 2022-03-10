-- DB update 2022_03_10_00 -> 2022_03_10_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_10_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_10_00 2022_03_10_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1646950001729697429'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1646950001729697429');

DELETE FROM `gossip_menu` WHERE `MenuID` IN (4761,4762,5855,5856,7380,8522);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(4761,7028),
(4762,7028),
(5855,7028),
(5856,7028),
(7380,7028),
(8522,7028);

DELETE FROM `gossip_menu` WHERE `MenuID` = 657 AND `TextID` = 7026;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 657;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,657,1220,0,0,7,0,129,1,0,0,0,0,'Shaina Fuller - Group 0: Show gossip text 1220 if skill ''First Aid'' is greater than 1'),
(14,657,1221,0,0,7,0,129,1,0,1,0,0,'Shaina Fuller - Group 0: Show gossip text 1221 if skill ''First Aid'' is not greater than 1');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
