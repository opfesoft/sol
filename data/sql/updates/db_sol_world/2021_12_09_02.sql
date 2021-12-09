-- DB update 2021_12_09_01 -> 2021_12_09_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_09_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_09_01 2021_12_09_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1639076392313610515'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1639076392313610515');

UPDATE `creature_template_addon` SET `auras` = '9205' WHERE `entry` IN (15318,15521,2440);
UPDATE `creature_template_addon` SET `auras` = '11838' WHERE `entry` IN (7267,10478,14605);
UPDATE `creature_addon` SET `auras` = '11838' WHERE `guid` IN (49201,49202,49762,49763,49766,49767);
UPDATE `creature_template_addon` SET `auras` = '13767' WHERE `entry` = 9032;
UPDATE `creature_addon` SET `auras` = '13767 3417' WHERE `guid` = 47629;
UPDATE `creature_template_addon` SET `auras` = '25592' WHERE `entry` = 15323;

DELETE FROM `creature_template_addon` WHERE `entry` = 5714;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(5714,0,0,0,1,0,0,'9205 12782');

UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 10478;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 10478 AND `source_type` = 0;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
