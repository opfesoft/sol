-- DB update 2020_06_16_03 -> 2020_06_16_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_06_16_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_06_16_03 2020_06_16_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1592342900527282459'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1592342900527282459');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 20 AND `SourceEntry` = 1191;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(20,0,1191,0,0,28,0,1190,0,0,0,0,0,'','Show quest mark ''Zamek''s Distraction'' only if quest ''Keeping Pace'' is taken but not rewarded'),
(20,0,1191,0,1,8,0,1190,0,0,0,0,0,'','Show quest mark ''Zamek''s Distraction'' only if quest ''Keeping Pace'' is rewarded'),
(20,0,1191,0,1,14,0,1194,0,0,0,0,0,'','Show quest mark ''Zamek''s Distraction'' only if quest ''Rizzle''s Schematics'' is not taken and not rewarded');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
