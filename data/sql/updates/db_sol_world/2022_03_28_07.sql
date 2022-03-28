-- DB update 2022_03_28_06 -> 2022_03_28_07
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_28_06';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_28_06 2022_03_28_07 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648489625979684807'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648489625979684807');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 11361;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,11361,7116,0,0,47,0,7003,64,0,0,0,0,'Zorbin Fandazzle - Group 0: Show gossip menu text 7116 if quest ''Zapped Giants'' is rewarded'),
(14,11361,7116,0,0,47,0,7721,64,0,0,0,0,'Zorbin Fandazzle - Group 0: Show gossip menu text 7116 if quest ''Fuel for the Zapping'' is rewarded'),

(14,11361,7114,0,0,47,0,7003,64,0,1,0,0,'Zorbin Fandazzle - Group 0: Show gossip menu text 7114 if quest ''Zapped Giants'' is not rewarded'),
(14,11361,7114,0,1,47,0,7721,64,0,1,0,0,'Zorbin Fandazzle - Group 1: Show gossip menu text 7114 if quest ''Fuel for the Zapping'' is not rewarded'),

(15,11361,0,0,0,47,0,7003,64,0,0,0,0,'Zorbin Fandazzle - Group 0: Show gossip option 0 if quest ''Zapped Giants'' is rewarded'),
(15,11361,0,0,0,47,0,7721,64,0,0,0,0,'Zorbin Fandazzle - Group 0: Show gossip option 0 if quest ''Fuel for the Zapping'' is rewarded');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
