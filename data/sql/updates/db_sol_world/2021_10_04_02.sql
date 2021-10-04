-- DB update 2021_10_04_01 -> 2021_10_04_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_04_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_04_01 2021_10_04_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1633356022521836246'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1633356022521836246');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` IN (7102,56707) AND `ConditionTypeOrReference` = 1;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (7103,56708) AND `ConditionTypeOrReference` = 1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(17,0,7102,0,0,1,1,7102,0,0,1,0,0,'Spell ''Contagion of Rot'' - Group 0: Spell target must not have aura ''Contagion of Rot'''),
(17,0,7102,0,0,1,1,7103,0,0,1,0,0,'Spell ''Contagion of Rot'' - Group 0: Spell target must not have aura ''Contagion of Rot'''),
(17,0,7102,0,0,1,1,56707,0,0,1,0,0,'Spell ''Contagion of Rot'' - Group 0: Spell target must not have aura ''Contagion of Rot'''),
(17,0,7102,0,0,1,1,56708,0,0,1,0,0,'Spell ''Contagion of Rot'' - Group 0: Spell target must not have aura ''Contagion of Rot'''),

(13,7,7103,0,0,1,0,7102,0,0,1,0,0,'Spell ''Contagion of Rot'' - Group 0: Implicit Target: Has no aura ''Contagion of Rot'''),
(13,7,7103,0,0,1,0,7103,0,0,1,0,0,'Spell ''Contagion of Rot'' - Group 0: Implicit Target: Has no aura ''Contagion of Rot'''),
(13,7,7103,0,0,1,0,56707,0,0,1,0,0,'Spell ''Contagion of Rot'' - Group 0: Implicit Target: Has no aura ''Contagion of Rot'''),
(13,7,7103,0,0,1,0,56708,0,0,1,0,0,'Spell ''Contagion of Rot'' - Group 0: Implicit Target: Has no aura ''Contagion of Rot'''),

(17,0,56707,0,0,1,1,56707,0,0,1,0,0,'Spell ''Contagion of Rot'' - Group 0: Spell target must not have aura ''Contagion of Rot'''),
(17,0,56707,0,0,1,1,56708,0,0,1,0,0,'Spell ''Contagion of Rot'' - Group 0: Spell target must not have aura ''Contagion of Rot'''),
(17,0,56707,0,0,1,1,7102,0,0,1,0,0,'Spell ''Contagion of Rot'' - Group 0: Spell target must not have aura ''Contagion of Rot'''),
(17,0,56707,0,0,1,1,7103,0,0,1,0,0,'Spell ''Contagion of Rot'' - Group 0: Spell target must not have aura ''Contagion of Rot'''),

(13,7,56708,0,0,1,0,56707,0,0,1,0,0,'Spell ''Contagion of Rot'' - Group 0: Implicit Target: Has no aura ''Contagion of Rot'''),
(13,7,56708,0,0,1,0,56708,0,0,1,0,0,'Spell ''Contagion of Rot'' - Group 0: Implicit Target: Has no aura ''Contagion of Rot'''),
(13,7,56708,0,0,1,0,7102,0,0,1,0,0,'Spell ''Contagion of Rot'' - Group 0: Implicit Target: Has no aura ''Contagion of Rot'''),
(13,7,56708,0,0,1,0,7103,0,0,1,0,0,'Spell ''Contagion of Rot'' - Group 0: Implicit Target: Has no aura ''Contagion of Rot''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
