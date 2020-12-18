-- DB update 2020_12_18_03 -> 2020_12_19_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_18_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_18_03 2020_12_19_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1608332611863116906'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1608332611863116906');

UPDATE `creature_template` SET `unit_flags` = `unit_flags` & ~4 WHERE `entry` = 18689; -- Crippler
UPDATE `creature_template` SET `unit_flags` = `unit_flags` & ~4 WHERE `entry` = 18695; -- Ambassador Jerrikar
UPDATE `creature_template` SET `unit_flags` = `unit_flags` & ~4 WHERE `entry` = 18679; -- Vorakem Doomspeaker

UPDATE `creature_template` SET `speed_walk` = 1.1, `speed_run` = 1.14286 WHERE `entry` = 32422; -- Grocklar

UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 25 WHERE `guid` = 151903; -- Crippler
UPDATE `creature` SET `MovementType` = 1, `wander_distance` =  5 WHERE `id`   =  18693; -- Speaker Mar'grom
UPDATE `creature` SET `MovementType` = 0, `wander_distance` =  0 WHERE `guid` = 151902; -- Chief Engineer Lorthander
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 20 WHERE `id`   =  32357; -- Old Crystalbark
UPDATE `creature` SET `MovementType` = 1, `wander_distance` =  5 WHERE `id`   =  32398; -- King Ping
UPDATE `creature` SET `MovementType` = 1, `wander_distance` =  5 WHERE `id`   =  32438; -- Syreian the Bonecarver
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10 WHERE `id`   =  32471; -- Griegen
UPDATE `creature` SET `MovementType` = 0, `wander_distance` =  0 WHERE `id`   =  32501; -- High Thane Jorfus
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10 WHERE `id`   =  33776; -- Gondria

-- Ambassador Jerrikar
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0 WHERE `guid` = 151897;
UPDATE `creature` SET `wander_distance` = 10 WHERE `guid` IN (151898,151899);

-- Old Crystalbark
UPDATE `creature` SET `position_x` = 3586.22, `position_y` = 7186.19, `position_z` = 224.29 WHERE `guid` = 151934;
UPDATE `creature` SET `position_x` = 3745.11, `position_y` = 7332.16, `position_z` = 210.026 WHERE `guid` = 151935;

-- Aotona
UPDATE `creature` SET `position_x` = 5790.78, `position_y` = 4557.57, `position_z` = -133.7 WHERE `guid` = 152005;
UPDATE `creature` SET `position_x` = 5766.97, `position_y` = 4902.32, `position_z` = -132.126 WHERE `guid` = 152009;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
