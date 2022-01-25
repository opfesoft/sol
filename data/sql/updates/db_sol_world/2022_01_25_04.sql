-- DB update 2022_01_25_03 -> 2022_01_25_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_25_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_25_03 2022_01_25_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1643123080862836534'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1643123080862836534');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 2985;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,2985,0,0,0,8,0,5047,0,0,0,0,0,'Malyfous''s Catalogue - Group 0: Show gossip option 0 if quest ''Finkle Einhorn, At Your Service!'' is rewarded'),
(15,2985,1,0,0,8,0,5047,0,0,0,0,0,'Malyfous''s Catalogue - Group 0: Show gossip option 1 if quest ''Finkle Einhorn, At Your Service!'' is rewarded'),
(15,2985,2,0,0,8,0,5047,0,0,0,0,0,'Malyfous''s Catalogue - Group 0: Show gossip option 2 if quest ''Finkle Einhorn, At Your Service!'' is rewarded'),
(15,2985,3,0,0,8,0,5047,0,0,0,0,0,'Malyfous''s Catalogue - Group 0: Show gossip option 3 if quest ''Finkle Einhorn, At Your Service!'' is rewarded'),
(15,2985,4,0,0,8,0,5047,0,0,0,0,0,'Malyfous''s Catalogue - Group 0: Show gossip option 4 if quest ''Finkle Einhorn, At Your Service!'' is rewarded');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
