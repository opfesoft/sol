-- DB update 2022_03_29_05 -> 2022_03_29_06
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_29_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_29_05 2022_03_29_06 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648566378097130899'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648566378097130899');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 9262;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,9262,12576,0,0,47,0,11946,64,0,0,0,0,'Keristrasza - Group 0: Show gossip menu text 12576 if quest ''Keristrasza'' is rewarded'),
(14,9262,12577,0,0,47,0,11946,64,0,1,0,0,'Keristrasza - Group 0: Show gossip menu text 12577 if quest ''Keristrasza'' is not rewarded'),
(15,9262,0,0,0,47,0,11957,10,0,0,0,0,'Keristrasza - Group 0: Show gossip option 0 if quest ''Saragosa''s End'' is in progress or completed'),
(15,9262,1,0,0,47,0,11967,10,0,0,0,0,'Keristrasza - Group 0: Show gossip option 1 if quest ''Mustering the Reds'' is in progress or completed');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
