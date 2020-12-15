-- DB update 2020_12_15_05 -> 2020_12_16_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_15_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_15_05 2020_12_16_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1608073771689945055'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1608073771689945055');

UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 5935; -- Ironeye the Invincible
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 6646; -- Monnos the Elder
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 6648; -- Antilos
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 8204; -- Soriid the Devourer
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 8205; -- Haarka the Ravenous
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 8213; -- Ironback

UPDATE `creature` SET `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 51683; -- Snarler
UPDATE `creature` SET `wander_distance` =  5, `MovementType` = 1 WHERE `guid` = 12322; -- Death Flayer
UPDATE `creature` SET `wander_distance` = 20, `MovementType` = 1 WHERE `guid` = 65607; -- Humar the Pridelord
UPDATE `creature` SET `wander_distance` = 35, `MovementType` = 1 WHERE `guid` = 51813; -- Azzere the Skyblade
UPDATE `creature` SET `wander_distance` = 30, `MovementType` = 1 WHERE `guid` = 51810; -- Dishu
UPDATE `creature` SET `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 51888; -- Sentinel Amarassan
UPDATE `creature` SET `wander_distance` = 35, `MovementType` = 1 WHERE `guid` = 51824; -- Ironeye the Invincible
UPDATE `creature` SET `wander_distance` = 15, `MovementType` = 1 WHERE `guid` = 51823; -- Vile Sting
UPDATE `creature` SET `wander_distance` = 25, `MovementType` = 1 WHERE `guid` = 24435; -- Gruff
UPDATE `creature` SET `wander_distance` = 30, `MovementType` = 1 WHERE `guid` = 51862; -- Monnos the Elder
UPDATE `creature` SET `wander_distance` = 20, `MovementType` = 1 WHERE `guid` = 51851; -- Antilos
UPDATE `creature` SET `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 51828; -- Warleader Krazzilak
UPDATE `creature` SET `wander_distance` = 30, `MovementType` = 1 WHERE `guid` = 51831; -- Omgorn the Lost
UPDATE `creature` SET `wander_distance` = 35, `MovementType` = 1 WHERE `guid` = 51830; -- Soriid the Devourer
UPDATE `creature` SET `wander_distance` = 25, `MovementType` = 1 WHERE `guid` = 51833; -- Haarka the Ravenous
UPDATE `creature` SET `wander_distance` = 25, `MovementType` = 1 WHERE `guid` = 51825; -- Murderous Blisterpaw
UPDATE `creature` SET `wander_distance` =  5, `MovementType` = 1 WHERE `guid` = 69117; -- Old Cliff Jumper
UPDATE `creature` SET `wander_distance` =  5, `MovementType` = 1 WHERE `guid` = 69119; -- Ironback

UPDATE `creature` SET `position_x` = -55.8079, `position_y` = -1635.41, `position_z` = 91.6667 WHERE `guid` = 20635; -- Stonearm
UPDATE `creature` SET `position_x` =  4530.82, `position_y` = -7129.93, `position_z` =  102.07 WHERE `guid` = 51862; -- Monnos the Elder
UPDATE `creature` SET `position_x` =  88.4454, `position_y` =  -2028.6, `position_z` = 116.208 WHERE `guid` = 69117; -- Old Cliff Jumper

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
