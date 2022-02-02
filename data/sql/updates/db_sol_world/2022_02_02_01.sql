-- DB update 2022_02_02_00 -> 2022_02_02_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_02_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_02_00 2022_02_02_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1643800197412385526'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1643800197412385526');

UPDATE `quest_template_addon` SET `ExclusiveGroup` = 0 WHERE `ID` IN (1642,1646);
UPDATE `quest_template_addon` SET `SpecialFlags` = 1 WHERE `ID` IN (1641,1645);
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 0, `SpecialFlags` = 1 WHERE `ID` IN (1793,1794);
UPDATE `quest_template_addon` SET `NextQuestID` = 0 WHERE `ID` IN (2998,3681,2997,2999,3000);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` IN (1641,1645,1793,1794);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(19,0,1641,0,0,47,0,1642,1,0,0,0,0,'Quest ''The Tome of Divinity'' (Duthorian Rall) - Group 0: Can accept the quest only if quest ''The Tome of Divinity'' (Tome of Divinity) is not taken'),
(20,0,1641,0,0,47,0,1642,1,0,0,0,0,'Quest ''The Tome of Divinity'' (Duthorian Rall) - Group 0: Show quest mark only if quest ''The Tome of Divinity'' (Tome of Divinity) is not taken'),

(19,0,1645,0,0,47,0,1646,1,0,0,0,0,'Quest ''The Tome of Divinity'' (Duthorian Rall) - Group 0: Can accept the quest only if quest ''The Tome of Divinity'' (Tome of Divinity) is not taken'),
(20,0,1645,0,0,47,0,1646,1,0,0,0,0,'Quest ''The Tome of Divinity'' (Duthorian Rall) - Group 0: Show quest mark only if quest ''The Tome of Divinity'' (Tome of Divinity) is not taken'),

(19,0,1793,0,0,47,0,1649,1,0,0,0,0,'Quest ''The Tome of Valor'' (Duthorian Rall) - Group 0: Can accept the quest only if quest ''The Tome of Valor'' (Tome of Valor) is not taken'),
(20,0,1793,0,0,47,0,1649,1,0,0,0,0,'Quest ''The Tome of Valor'' (Duthorian Rall) - Group 0: Show quest mark only if quest ''The Tome of Valor'' (Tome of Valor) is not taken'),

(19,0,1794,0,0,47,0,1649,1,0,0,0,0,'Quest ''The Tome of Valor'' (Brandur Ironhammer) - Group 0: Can accept the quest only if quest ''The Tome of Valor'' (Tome of Valor) is not taken'),
(20,0,1794,0,0,47,0,1649,1,0,0,0,0,'Quest ''The Tome of Valor'' (Brandur Ironhammer) - Group 0: Show quest mark only if quest ''The Tome of Valor'' (Tome of Valor) is not taken');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
