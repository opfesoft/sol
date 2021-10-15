-- DB update 2021_10_15_03 -> 2021_10_15_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_15_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_15_03 2021_10_15_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1634334668875770961'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1634334668875770961');

UPDATE `creature` SET `position_x` = -1645.15, `position_y` = -1936.15, `position_z` = 68.1503, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 14652;

DELETE FROM `creature` WHERE `guid` = 146520;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(146520,2783,0,0,0,1,1,4031,0,-1673.29,-1927.05,80.6284,0,400,5,1676,0,1,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` = 146520;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(146520,0,0,0,4097,0,0,'');

DELETE FROM `pool_template` WHERE `entry` = 370;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(370,1,'Marez Cowl Spawns (1 out of 2)');

DELETE FROM `pool_creature` WHERE `pool_entry` = 370;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(14652,370,0,'Marez Cowl Spawn 1'),
(146520,370,0,'Marez Cowl Spawn 2');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 2783;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 278300;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2783,0,0,0,1,0,100,0,5000,15000,50000,150000,0,80,278300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marez Cowl - OOC - Call Timed Action List'),
(2783,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marez Cowl - Between 0-15% Health - Flee For Assist'),

(278300,9,0,0,0,0,100,0,0,0,0,0,0,11,43897,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marez Cowl - On Script - Cast ''Shadow Channeling'''),
(278300,9,1,0,0,0,100,0,5000,10000,0,0,0,92,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marez Cowl - On Script - Interrupt Spell');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
