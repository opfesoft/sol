-- DB update 2022_04_26_00 -> 2022_04_26_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_26_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_26_00 2022_04_26_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1650968486246338910'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1650968486246338910');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 5962;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,5962,7121,0,0,5,0,59,224,0,0,0,0,'Master Smith Burninate - Group 0: Show gossip text 7121 if at least honored with the Thorium Brotherhood'),
(14,5962,7121,0,0,47,0,7722,64,0,0,0,0,'Master Smith Burninate - Group 0: Show gossip text 7121 if quest ''What the Flux?'' is rewarded'),

(14,5962,7115,0,0,5,0,59,224,0,1,0,0,'Master Smith Burninate - Group 0: Show gossip text 7115 if not at least honored with the Thorium Brotherhood'),
(14,5962,7115,0,1,47,0,7722,64,0,1,0,0,'Master Smith Burninate - Group 1: Show gossip text 7115 if quest ''What the Flux?'' is not rewarded');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
