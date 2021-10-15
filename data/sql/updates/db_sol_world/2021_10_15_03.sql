-- DB update 2021_10_15_02 -> 2021_10_15_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_15_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_15_02 2021_10_15_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1634308534297968428'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1634308534297968428');

DELETE FROM `creature` WHERE `guid` IN (866050,866051,866052);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(866050,10817,0,0,0,1,1,0,1,2123.51,-2943.19,100.95,0,72000,10,3398,0,1,0,0,0,0),
(866051,10817,0,0,0,1,1,0,1,1740.96,-2796.5,64.34,0,72000,10,3398,0,1,0,0,0,0),
(866052,10817,0,0,0,1,1,0,1,1691.04,-3569.03,123.4,0,72000,10,3398,0,1,0,0,0,0);

DELETE FROM `pool_template` WHERE `entry` = 369;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(369,1,'Duggan Wildhammer Spawns (1 out of 4)');

DELETE FROM `pool_creature` WHERE `pool_entry` = 369;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(86605,369,0,'Duggan Wildhammer Spawn 1'),
(866050,369,0,'Duggan Wildhammer Spawn 2'),
(866051,369,0,'Duggan Wildhammer Spawn 3'),
(866052,369,0,'Duggan Wildhammer Spawn 4');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 10817 AND `id` > 2;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1081700;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10817,0,3,4,4,0,100,0,0,0,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duggan Wildhammer - On Aggro - Say Line 9'),
(10817,0,4,0,61,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duggan Wildhammer - Linked - Set Root Off'),
(10817,0,5,0,1,0,100,0,30000,60000,180000,240000,0,80,1081700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duggan Wildhammer - OOC - Call Timed Action List'),

(1081700,9,0,0,0,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duggan Wildhammer - On Script - Set Root On'),
(1081700,9,1,0,0,0,100,0,5000,5000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duggan Wildhammer - On Script - Say Line 0'),
(1081700,9,2,0,0,0,100,0,3000,3000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duggan Wildhammer - On Script - Say Line 1'),
(1081700,9,3,0,0,0,100,0,6000,6000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duggan Wildhammer - On Script - Say Line 2'),
(1081700,9,4,0,0,0,100,0,6000,6000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duggan Wildhammer - On Script - Say Line 3'),
(1081700,9,5,0,0,0,100,0,5000,5000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duggan Wildhammer - On Script - Say Line 4'),
(1081700,9,6,0,0,0,100,0,5000,5000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duggan Wildhammer - On Script - Say Line 5'),
(1081700,9,7,0,0,0,100,0,6000,6000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duggan Wildhammer - On Script - Say Line 6'),
(1081700,9,8,0,0,0,100,0,5000,5000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duggan Wildhammer - On Script - Say Line 7'),
(1081700,9,9,0,0,0,100,0,5000,5000,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duggan Wildhammer - On Script - Say Line 8'),
(1081700,9,10,0,0,0,100,0,10000,10000,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duggan Wildhammer - On Script - Set Root Off');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
