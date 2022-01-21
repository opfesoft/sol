-- DB update 2022_01_21_00 -> 2022_01_21_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_21_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_21_00 2022_01_21_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1642764376769872408'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1642764376769872408');

UPDATE `creature_template` SET `speed_walk` = 0.666668 WHERE `entry` = 12237;
UPDATE `creature` SET `id` = 12224, `curhealth` = 1 WHERE `guid` = 203506;
DELETE FROM `pool_template` WHERE `entry` = 1211;
DELETE FROM `pool_creature` WHERE `pool_entry` = 1211;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 12237 AND `source_type` = 0 AND `id` = 2;

DELETE FROM `creature_guid_chance` WHERE `id` = 12237;
INSERT INTO `creature_guid_chance` (`id`, `guid`, `chance`)
VALUES
(12237,54652,5),
(12237,160509,5),
(12237,203506,5);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
