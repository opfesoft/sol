-- DB update 2021_10_24_00 -> 2021_10_26_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_24_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_24_00 2021_10_26_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1635200783847868924'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1635200783847868924');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 45611;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(17,0,45611,0,0,31,1,3,25316,0,0,0,0,'Spell ''Arcane Chains'' - Group 0: Requires target ''Beryl Sorcerer'''),
(17,0,45611,0,0,29,1,25474,10,0,1,0,0,'Spell ''Arcane Chains'' - Group 0: Not near creature ''Captured Beryl Sorcerer'''),
(17,0,45611,0,0,38,1,25,4,0,0,0,0,'Spell ''Arcane Chains'' - Group 0: Requires health <= 25%');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
