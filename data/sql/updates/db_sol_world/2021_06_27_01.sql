-- DB update 2021_06_27_00 -> 2021_06_27_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_27_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_27_00 2021_06_27_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624745935279217926'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624745935279217926');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `ConditionTypeOrReference` IN (8,28,47) AND `SourceEntry` = 254;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(19,0,254,0,0,47,0,253,8,0,0,0,0,'Eliza''s Grave Dirt - Can accept quest ''Digging Through the Dirt'' only if quest ''Bride of the Embalmer'' is in progress'),
(20,0,254,0,0,47,0,253,8,0,0,0,0,'Eliza''s Grave Dirt - Show mark for quest ''Digging Through the Dirt'' only if quest ''Bride of the Embalmer'' is in progress');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
