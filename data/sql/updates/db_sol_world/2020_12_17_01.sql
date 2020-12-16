-- DB update 2020_12_17_00 -> 2020_12_17_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_17_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_17_00 2020_12_17_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1608161167357038636'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1608161167357038636');

UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` =  8299; -- Spiteflayer
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` =  8300; -- Ravage
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` =  8301; -- Clack the Reaver
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` =  8302; -- Deatheye
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` =  8303; -- Grunter
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 10077; -- Deathmaw

-- Highlord Mastrogonde
UPDATE `creature` SET `wander_distance` = 5 WHERE `guid` = 6240;
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` IN (134427,134428);

-- Slave Master Blackheart
UPDATE `creature` SET `position_x` = -6483.09, `position_y` = -1270.63, `position_z` = 180.542 WHERE `guid` = 86603;
UPDATE `creature` SET `position_x` = -6481.67, `position_y` = -1365.4, `position_z` = 212.107, `orientation` = 0.726291, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 134435;
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` IN (134436,134437,134438);

-- Gibblewilt
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 2470;

-- Gruklash
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` IN (134390,134392,134393,134394);

-- Terrorspark
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `id` = 10078;

-- Mezzir the Howler
UPDATE `creature` SET `wander_distance` = 20, `MovementType` = 1 WHERE `guid` = 42304;

-- Bayne
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 42142;

-- Ressan the Needler
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 42141;

-- Sri'skulk
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 86604;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
