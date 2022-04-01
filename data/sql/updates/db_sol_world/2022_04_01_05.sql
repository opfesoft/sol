-- DB update 2022_04_01_04 -> 2022_04_01_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_01_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_01_04 2022_04_01_05 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648834982984002318'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648834982984002318');

DELETE FROM `creature` WHERE `guid` IN (3008955,3008956,3008957,3008958);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3008955,14496,0,0,0,1,1,0,0,-8608.98,743.702,101.902,0.664279,180,0,42,0,0,0,0,0,0),
(3008956,14496,0,0,0,1,1,0,0,-8607.64,744.749,101.902,3.80621,180,0,42,0,0,0,0,0,0),
(3008957,14496,0,0,0,1,1,0,0,-8606.56,734.655,101.903,0,180,2,42,0,1,0,0,0,0),
(3008958,14496,0,0,0,1,1,0,0,-8613.16,728.979,101.903,0,180,2,42,0,1,0,0,0,0);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = -3008955;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-3008955,0,0,0,1,0,100,0,90000,180000,90000,180000,0,1,1,0,0,0,0,0,19,14497,0,0,0,0,0,0,0,'Stormwind Orphan - OOC - Say Line 1 (Shellene)');

DELETE FROM `game_event_creature` WHERE `guid` IN (79702,79700,79815,79816,79817,84028,87023,87090,87088,87092,87089,87082,87091,79812,3008952,3008953,3008954,79720,79721,89294,86596,86597,90439,90443,90440,80320,80317,80321,86159,86158,86157,86354,86156,45501,23427,3008955,3008956,3008957,3008958);
INSERT INTO `game_event_creature` (`eventEntry`, `guid`)
VALUES
(79,79702),
(79,79700),
(79,79815),
(79,79816),
(79,79817),
(79,84028),
(79,87023),
(79,87090),
(79,87088),
(79,87092),
(79,87089),
(79,87082),
(79,87091),
(79,79812),
(79,3008952),
(79,3008953),
(79,3008954),
(79,79720),
(79,79721),
(79,89294),
(79,86596),
(79,86597),
(79,90439),
(79,90443),
(79,90440),
(79,80320),
(79,80317),
(79,80321),
(79,86159),
(79,86158),
(79,86157),
(79,86354),
(79,86156),
(79,45501),
(79,23427),

(-79,3008955),
(-79,3008956),
(-79,3008957),
(-79,3008958);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
