-- DB update 2021_06_29_02 -> 2021_06_29_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_29_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_29_02 2021_06_29_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624960030032870872'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624960030032870872');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `ConditionTypeOrReference` = 47 AND `SourceEntry` = 926;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(19,0,926,0,0,47,0,924,8,0,0,0,0,'Flawed Power Stones - Can accept quest ''Flawed Power Stone'' only if quest ''The Demon Seed'' is in progress'),
(20,0,926,0,0,47,0,924,8,0,0,0,0,'Flawed Power Stones - Show mark for quest ''Flawed Power Stone'' only if quest ''The Demon Seed'' is in progress');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
