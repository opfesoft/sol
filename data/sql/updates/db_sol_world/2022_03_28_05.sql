-- DB update 2022_03_28_04 -> 2022_03_28_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_28_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_28_04 2022_03_28_05 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648486660540591530'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648486660540591530');

UPDATE `gameobject_loot_template` SET `Chance` = 100 WHERE `Entry` IN (11524,11525,13721,13722) AND `Item` IN (11614,11615,12827,12830);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 4 AND `SourceGroup` IN (11524,11525,13721,13722);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(4,11524,11614,0,0,7,0,164,285,0,0,0,0,'Blacksmithing Plans - Group 0: Item ''Plans: Dark Iron Mail'' can only be looted if at least 285 Blacksmithing'),
(4,11525,11615,0,0,7,0,164,285,0,0,0,0,'Blacksmithing Plans - Group 0: Item ''Plans: Dark Iron Shoulders'' can only be looted if at least 285 Blacksmithing'),
(4,13721,12827,0,0,7,0,164,285,0,0,0,0,'Blacksmithing Plans - Group 0: Item ''Plans: Serenity'' can only be looted if at least 285 Blacksmithing'),
(4,13722,12830,0,0,7,0,164,285,0,0,0,0,'Blacksmithing Plans - Group 0: Item ''Plans: Corruption'' can only be looted if at least 285 Blacksmithing');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
