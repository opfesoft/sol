-- DB update 2022_03_29_03 -> 2022_03_29_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_29_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_29_03 2022_03_29_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648564811346289833'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648564811346289833');

UPDATE `creature_loot_template` SET `QuestRequired` = 0 WHERE `Entry` = 36538 AND `Item` = 21108;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 1 AND `SourceEntry` IN (21103,21104,21105,21108,21110);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(1,15552,21103,0,0,47,0,8620,8,0,0,0,0,'Doctor Weavil - Group 0: Item ''Draconic for Dummies (Chapter I)'' can only be looted if quest ''The Only Prescription'' is in progress'),
(1,8716,21104,0,0,47,0,8620,8,0,0,0,0,'Dreadlord - Group 0: Item ''Draconic for Dummies (Chapter II)'' can only be looted if quest ''The Only Prescription'' is in progress'),
(1,8717,21104,0,0,47,0,8620,8,0,0,0,0,'Felguard Elite - Group 0: Item ''Draconic for Dummies (Chapter II)'' can only be looted if quest ''The Only Prescription'' is in progress'),
(1,12396,21104,0,0,47,0,8620,8,0,0,0,0,'Doomguard Commander - Group 0: Item ''Draconic for Dummies (Chapter II)'' can only be looted if quest ''The Only Prescription'' is in progress'),
(1,7463,21105,0,0,47,0,8620,8,0,0,0,0,'Hederine Slayer - Group 0: Item ''Draconic for Dummies (Chapter III)'' can only be looted if quest ''The Only Prescription'' is in progress'),
(1,7461,21105,0,0,47,0,8620,8,0,0,0,0,'Hederine Initiate - Group 0: Item ''Draconic for Dummies (Chapter III)'' can only be looted if quest ''The Only Prescription'' is in progress'),
(1,10184,21108,0,0,47,0,8620,8,0,0,0,0,'Onyxia - Group 0: Item ''Draconic for Dummies (Chapter VI)'' can only be looted if quest ''The Only Prescription'' is in progress'),
(1,36538,21108,0,0,47,0,8620,8,0,0,0,0,'Onyxia (1) - Group 0: Item ''Draconic for Dummies (Chapter VI)'' can only be looted if quest ''The Only Prescription'' is in progress'),
(1,11502,21110,0,0,47,0,8620,8,0,0,0,0,'Ragnaros - Group 0: Item ''Draconic for Dummies (Chapter VIII)'' can only be looted if quest ''The Only Prescription'' is in progress');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
