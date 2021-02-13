-- DB update 2021_02_13_00 -> 2021_02_13_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_13_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_13_00 2021_02_13_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1613255026300583768'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1613255026300583768');

DELETE FROM `command` WHERE `name` = 'player setskill';
INSERT INTO `command` (`name`, `security`, `help`)
VALUES
('player setskill',2,'Syntax: .player setskill #playername #skill #level [#max]\nSet a skill of id #skill with a current skill value of #level and a maximum value of #max (or equal current maximum if not provide) for the specified character.');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
