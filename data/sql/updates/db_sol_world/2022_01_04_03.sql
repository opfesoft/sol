-- DB update 2022_01_04_02 -> 2022_01_04_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_04_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_04_02 2022_01_04_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1641333792489594631'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1641333792489594631');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` IN (7483,7484,7485);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(19,0,7483,0,0,47,0,7481,64,0,0,0,0,'Libram of Rapidity - Group 0: Can accept the quest only if quest ''Elven Legends (Horde)'' is rewarded'),
(19,0,7483,0,1,47,0,7482,64,0,0,0,0,'Libram of Rapidity - Group 1: Can accept the quest only if quest ''Elven Legends (Alliance)'' is rewarded'),
(20,0,7483,0,0,47,0,7481,64,0,0,0,0,'Libram of Rapidity - Group 0: Show quest mark only if quest ''Elven Legends (Horde)'' is rewarded'),
(20,0,7483,0,1,47,0,7482,64,0,0,0,0,'Libram of Rapidity - Group 1: Show quest mark only if quest ''Elven Legends (Alliance)'' is rewarded'),

(19,0,7484,0,0,47,0,7481,64,0,0,0,0,'Libram of Focus - Group 0: Can accept the quest only if quest ''Elven Legends (Horde)'' is rewarded'),
(19,0,7484,0,1,47,0,7482,64,0,0,0,0,'Libram of Focus - Group 1: Can accept the quest only if quest ''Elven Legends (Alliance)'' is rewarded'),
(20,0,7484,0,0,47,0,7481,64,0,0,0,0,'Libram of Focus - Group 0: Show quest mark only if quest ''Elven Legends (Horde)'' is rewarded'),
(20,0,7484,0,1,47,0,7482,64,0,0,0,0,'Libram of Focus - Group 1: Show quest mark only if quest ''Elven Legends (Alliance)'' is rewarded'),

(19,0,7485,0,0,47,0,7481,64,0,0,0,0,'Libram of Protection - Group 0: Can accept the quest only if quest ''Elven Legends (Horde)'' is rewarded'),
(19,0,7485,0,1,47,0,7482,64,0,0,0,0,'Libram of Protection - Group 1: Can accept the quest only if quest ''Elven Legends (Alliance)'' is rewarded'),
(20,0,7485,0,0,47,0,7481,64,0,0,0,0,'Libram of Protection - Group 0: Show quest mark only if quest ''Elven Legends (Horde)'' is rewarded'),
(20,0,7485,0,1,47,0,7482,64,0,0,0,0,'Libram of Protection - Group 1: Show quest mark only if quest ''Elven Legends (Alliance)'' is rewarded');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
