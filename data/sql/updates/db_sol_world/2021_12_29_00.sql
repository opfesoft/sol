-- DB update 2021_12_28_00 -> 2021_12_29_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_28_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_28_00 2021_12_29_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1640734067776503991'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1640734067776503991');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` IN (1789,1790);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(19,0,1789,0,0,47,0,1783,10,0,0,0,0,'Quest ''The Symbol of Life (Dwarf)'' - Group 0: Can accept the quest only if quest ''The Tome of Divinity (6) (Dwarf)'' is completed or in progress'),
(19,0,1789,0,0,2,0,6866,1,1,1,0,0,'Quest ''The Symbol of Life (Dwarf)'' - Group 0: Can accept the quest only if the player does not have the item ''Symbol of Life'' in the inventory or in the bank'),
(20,0,1789,0,0,47,0,1783,10,0,0,0,0,'Quest ''The Symbol of Life (Dwarf)'' - Group 0: Show quest mark only if quest ''The Tome of Divinity (6) (Dwarf)'' is completed or in progress'),
(20,0,1789,0,0,2,0,6866,1,1,1,0,0,'Quest ''The Symbol of Life (Dwarf)'' - Group 0: Show quest mark only if the player does not have the item ''Symbol of Life'' in the inventory or in the bank'),

(19,0,1790,0,0,47,0,1786,10,0,0,0,0,'Quest ''The Symbol of Life (Human)'' - Group 0: Can accept the quest only if quest ''The Tome of Divinity (6) (Human)'' is completed or in progress'),
(19,0,1790,0,0,2,0,6866,1,1,1,0,0,'Quest ''The Symbol of Life (Human)'' - Group 0: Can accept the quest only if the player does not have the item ''Symbol of Life'' in the inventory or in the bank'),
(20,0,1790,0,0,47,0,1786,10,0,0,0,0,'Quest ''The Symbol of Life (Human)'' - Group 0: Show quest mark only if quest ''The Tome of Divinity (6) (Human)'' is completed or in progress'),
(20,0,1790,0,0,2,0,6866,1,1,1,0,0,'Quest ''The Symbol of Life (Human)'' - Group 0: Show quest mark only if the player does not have the item ''Symbol of Life'' in the inventory or in the bank');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
