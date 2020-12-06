-- DB update 2020_12_06_01 -> 2020_12_06_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_06_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_06_01 2020_12_06_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1607254662265438078'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1607254662265438078');

DELETE FROM `command` WHERE `name` = 'go creature';
INSERT INTO `command` (`name`, `security`, `help`)
VALUES
('go creature',1,'Syntax: .go creature [#creature_guid|ignore_orientation]\r\nTeleport your character to creature with guid #creature_guid.\r\n.go creature #creature_name\r\nTeleport your character to creature with this name.\r\n.go creature id #creature_id\r\nTeleport your character to a creature that was spawned from the template with this entry.\r\n*If* more than one creature is found, then you are teleported to the first that is found inside the database. If no creature is specified teleport to the selected creature. If "ignore_orientation" is specified teleport to the selected creature without adjusting the player''s orientation.');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
