-- DB update 2021_04_29_00 -> 2021_04_29_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_04_29_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_04_29_00 2021_04_29_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1619729903429739888'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1619729903429739888');

-- Flying creatures: Set wander distance to 10y if lower than 10
UPDATE `creature` SET `wander_distance` = 10 WHERE `wander_distance` < 10 AND `MovementType` = 1 AND `map` NOT IN (SELECT `map` FROM `instance_template`) AND `id` IN (SELECT `entry` FROM `creature_template` WHERE `InhabitType` & 4 = 4);

-- Non-flying creatures: Set wander distance to 5y if lower than 5
UPDATE `creature` SET `wander_distance` = 5 WHERE `wander_distance` < 5 AND `MovementType` = 1 AND `map` NOT IN (SELECT `map` FROM `instance_template`) AND `id` IN (SELECT `entry` FROM `creature_template` WHERE `InhabitType` & 4 = 0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
