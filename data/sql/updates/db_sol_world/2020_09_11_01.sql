-- DB update 2020_09_11_00 -> 2020_09_11_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_09_11_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_09_11_00 2020_09_11_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1599855588549082481'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1599855588549082481');

-- Nethestrasz
UPDATE `creature_addon` SET `isLarge` = 1 WHERE `guid` = 131094;

-- Dragonbone Condor
UPDATE `creature_template_addon` SET `isLarge` = 0 WHERE `entry` = 26483;
UPDATE `creature_addon` SET `isLarge` = 0 WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` = 26483);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
