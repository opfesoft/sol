-- DB update 2021_11_18_00 -> 2021_11_19_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_18_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_18_00 2021_11_19_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1637357632688228845'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1637357632688228845');

DELETE FROM `command` WHERE `name` = 'unaura';
INSERT INTO `command` (`name`, `security`, `help`)
VALUES
('unaura',2,'Syntax: .unaura #spellid\r\nRemove aura due to spell #spellid from the selected Unit. If using "all" as #spellid all auras will be removed. If using "debuffs" as #spellid all debuffs will be removed.');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
