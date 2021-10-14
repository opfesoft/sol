-- DB update 2021_10_13_06 -> 2021_10_14_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_13_06';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_13_06 2021_10_14_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1634209533277595548'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1634209533277595548');

ALTER TABLE `graveyard_zone` ADD COLUMN `GhostArea` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0 AFTER `GhostZone`;
ALTER TABLE `graveyard_zone` DROP PRIMARY KEY, ADD PRIMARY KEY(`ID`, `GhostZone`, `GhostArea`);

DELETE FROM `graveyard_zone` WHERE `ID` = 1471 AND `GhostZone` = 1 AND `GhostArea` = 135;
INSERT INTO `graveyard_zone` (`ID`, `GhostZone`, `GhostArea`, `Faction`, `ClassMask`, `Comment`)
VALUES
(1471,1,135,0,0,'Frostmane Hold, Iceflow Lake GY - Dun Morogh');

DELETE FROM `acore_string` WHERE `entry` = 459;
INSERT INTO `acore_string` (`entry`, `content_default`)
VALUES
(459,'Graveyard #%u (faction: %s, subzone #%u) is nearest linked to zone #%u, subzone #%u.');

DELETE FROM `acore_string_locale` WHERE `entry` = 459;
INSERT INTO `acore_string_locale` (`entry`, `locale`, `content`)
VALUES
(459,'deDE','Friedhof #%u (Fraktion: %s, Subzone #%u) ist der nächste der zur Zone #%u, Subzone #%u gehört.');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
