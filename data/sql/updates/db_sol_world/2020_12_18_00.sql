-- DB update 2020_12_17_05 -> 2020_12_18_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_17_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_17_05 2020_12_18_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1608288076398249873'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1608288076398249873');

UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 10817; -- Duggan Wildhammer
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 10822; -- Warlord Thresh'jin
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 12037; -- Ursol'lok
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 14224; -- 7:XT
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 14225; -- Prince Kellen
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 14226; -- Kaskk
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 14228; -- Giggler
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 14268; -- Lord Condar
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 14342; -- Ragepaw
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 14343; -- Olm the Wise
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 14344; -- Mongress
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 14345; -- The Ongar
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 14424; -- Mirelow
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 14427; -- Gibblesnik
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 14474; -- Zora
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 14476; -- Krellack
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 14488; -- Roloch
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 18677; -- Mekthorg the Wild

UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10 WHERE `guid` =  86605; -- Duggan Wildhammer
UPDATE `creature` SET `MovementType` = 1, `wander_distance` =  5 WHERE `guid` =  86606; -- Hed'mush the Rotting
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10 WHERE `guid` =  86607; -- Warlord Thresh'jin
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10 WHERE `guid` =  51869; -- Ursol'lok
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10 WHERE `guid` =  26125; -- Old Vicejaw
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10 WHERE `guid` =  17066; -- Araga
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10 WHERE `guid` =  51848; -- Prince Kellen
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10 WHERE `guid` =  51850; -- Kaskk
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 50 WHERE `guid` =  51849; -- Hissperak
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 35 WHERE `guid` =  51847; -- Giggler
UPDATE `creature` SET `MovementType` = 0, `wander_distance` =  0 WHERE `id`   =  14271; -- Ribchaser
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 30 WHERE `guid` =  90785; -- Creepthess
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 25 WHERE `guid` =  15839; -- Big Samras
UPDATE `creature` SET `MovementType` = 1, `wander_distance` =  5 WHERE `guid` =  40656; -- Death Howl
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 15 WHERE `guid` =  51893; -- Ragepaw
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 15 WHERE `guid` =  51897; -- Olm the Wise
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10 WHERE `guid` =  51895; -- Mongress
UPDATE `creature` SET `MovementType` = 1, `wander_distance` =  5 WHERE `guid` =  51896; -- The Ongar
UPDATE `creature` SET `MovementType` = 0, `wander_distance` =  0 WHERE `id`   =  14425; -- Gnawbone
UPDATE `creature` SET `MovementType` = 1, `wander_distance` =  5 WHERE `guid` =  51822; -- Gibblesnik
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10 WHERE `guid` =  46351; -- Duskstalker
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 25 WHERE `guid` =  51835; -- Zora
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 25 WHERE `guid` =  27825; -- Crusty
UPDATE `creature` SET `MovementType` = 1, `wander_distance` =  5 WHERE `guid` = 151921; -- Mekthorg the Wild
UPDATE `creature` SET `MovementType` = 0, `wander_distance` =  0 WHERE `id`   =  18679; -- Vorakem Doomspeaker

 -- Goretooth
UPDATE `creature` SET `position_x` = -1828.09, `position_y` = 8433.88, `position_z` = -62.5815, `orientation` = 5.52613 WHERE `guid` = 151916;
UPDATE `creature` SET `position_x` = -1026.21, `position_y` = 7108.56, `position_z` = -6.9881, `orientation` = 1.01952 WHERE `guid` = 151917;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
