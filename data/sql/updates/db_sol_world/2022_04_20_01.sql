-- DB update 2022_04_20_00 -> 2022_04_20_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_20_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_20_00 2022_04_20_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1650488230343536984'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1650488230343536984');

DELETE FROM `acore_string` WHERE `entry` IN (31078,31079);
INSERT INTO `acore_string` (`entry`, `content_default`)
VALUES
(31078,'Field %i data is now set to %i.'),
(31079,'Field %i data is %i.');

DELETE FROM `command` WHERE `name` IN ('instance setdata','instance getdata');
INSERT INTO `command` (`name`, `security`, `help`)
VALUES
('instance setdata',1,'Syntax: .instance setdata $field $data [$Name]\r\nSet $data for the instance $field.\r\nIf no character name is provided, the current map will be used as target.'),
('instance getdata',1,'Syntax: .instance getdata $field [$Name]\r\nGet the current data for the instance $field.\r\nIf no character name is provided, the current map will be used as target.');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
