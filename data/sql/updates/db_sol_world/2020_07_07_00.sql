-- DB update 2020_07_01_00 -> 2020_07_07_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_07_01_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_07_01_00 2020_07_07_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1594134634513480723'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1594134634513480723');

DELETE FROM `command` WHERE `name` LIKE 'modify speed%';
INSERT INTO `command` (`name`, `security`, `help`)
VALUES
('modify speed',2,'Syntax: .modify speed $speedtype #rate\r\nModify the speed of the selected player or creature to \"normal base speed\"*rate. If no target is selected, modify your speed.\r\n$speedtypes may be walk, backwalk (only for players), swim or fly.\r\n#rate may range from 0.1 to 50.'),
('modify speed all',2,'Syntax: .modify speed all #rate\r\nModify all speeds -walk,run,swim,fly- of the selected player or creature to \"normal base speed\"*rate. If no target is selected, modify your speed.\r\n#rate may range from 0.1 to 50.'),
('modify speed backwalk',2,'Syntax: .modify speed backwalk #rate\r\nModify the speed of the selected player while running backwards to \"normal backwalk speed\"*rate. If no player is selected, modify your speed.\r\n#rate may range from 0.1 to 50.'),
('modify speed fly',2,'Syntax: .modify speed fly #rate\r\nModify the flying speed of the selected player or creature to \"normal flying speed\"*rate. If no target is selected, modify your speed.\r\n#rate may range from 0.1 to 50.'),
('modify speed swim',2,'Syntax: .modify speed swim #rate\r\nModify the swim speed of the selected player or creature to \"normal swim speed\"*rate. If no target is selected, modify your speed.\r\n#rate may range from 0.1 to 50.'),
('modify speed walk',2,'Syntax: .modify speed walk #rate\r\nModify the walk and run speed of the selected player or creature to \"normal walk/run speed\"*rate. If no target is selected, modify your speed.\r\n#rate may range from 0.1 to 50.');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
