-- DB update 2021_10_05_01 -> 2021_10_05_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_05_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_05_01 2021_10_05_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1633467625671549497'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1633467625671549497');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` IN (2177,2178,2179);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,2177,0,0,0,47,0,4285,8,0,0,0,0,'Northern Crystal Pylon - Group 0: Show gossip option 0 only if quest ''The Northern Pylon'' is in progress'),
(15,2178,0,0,0,47,0,4287,8,0,0,0,0,'Eastern Crystal Pylon - Group 0: Show gossip option 0 only if quest ''The Eastern Pylon'' is in progress'),
(15,2179,0,0,0,47,0,4288,8,0,0,0,0,'Western Crystal Pylon - Group 0: Show gossip option 0 only if quest ''The Western Pylon'' is in progress'),

(14,2177,2933,0,0,47,0,4321,64,0,0,0,0,'Northern Crystal Pylon - Group 0: Show gossip text 2933 only if quest ''Making Sense of It'' is rewarded'),
(14,2178,2933,0,0,47,0,4321,64,0,0,0,0,'Eastern Crystal Pylon - Group 0: Show gossip text 2933 only if quest ''Making Sense of It'' is rewarded'),
(14,2179,2933,0,0,47,0,4321,64,0,0,0,0,'Western Crystal Pylon - Group 0: Show gossip text 2933 only if quest ''Making Sense of It'' is rewarded');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
