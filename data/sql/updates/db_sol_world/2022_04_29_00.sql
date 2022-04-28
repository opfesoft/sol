-- DB update 2022_04_28_00 -> 2022_04_29_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_28_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_28_00 2022_04_29_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1651183859633001577'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1651183859633001577');

UPDATE `creature_text` SET `Text` = 'The goblins win! The goblins win!', `BroadcastTextId` = 1522 WHERE `CreatureID` = 4419 AND `GroupID` = 1;
UPDATE `creature_text` SET `Text` = 'And crossing the line is the gnome car! The gnomes win!', `BroadcastTextId` = 1518 WHERE `CreatureID` = 4419 AND `GroupID` = 2;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
