-- DB update 2021_07_13_00 -> 2021_07_13_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_07_13_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_07_13_00 2021_07_13_01 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1625925059779148449'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1625925059779148449');

-- Licillin
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 7 WHERE `id` = 2191 AND `guid` = 52009;
-- Carnivous the Breaker
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 7  WHERE `id` = 2186 AND `guid` = 51900;

-- Correct speeds for Kregg and Licillin
UPDATE `creature_template` SET `speed_walk` = 1 WHERE `entry`IN (8203, 2191);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
