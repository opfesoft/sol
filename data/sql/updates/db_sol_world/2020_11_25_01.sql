-- DB update 2020_11_25_00 -> 2020_11_25_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_11_25_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_11_25_00 2020_11_25_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1606260797360850920'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1606260797360850920');

-- Colossal Abomination: Fix typo for AIName
UPDATE `creature_template` SET `AIName` = 'AggressorAI' WHERE `entry` = 27605;

-- Add a few more soldiers to the battle
DELETE FROM `creature` WHERE `guid` BETWEEN 3008763 AND 3008774;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3008763,27518,571,0,0,1,1,24543,1,4746.28,1358.43,172.927,4.76721,30,10,47080,0,1,0,0,0,0),
(3008764,27518,571,0,0,1,1,24543,1,4742.13,1358.45,172.625,4.76721,30,10,47080,0,1,0,0,0,0),
(3008765,27518,571,0,0,1,1,24543,1,4738.82,1358.39,172.06,4.76721,30,10,47080,0,1,0,0,0,0),
(3008766,27518,571,0,0,1,1,24543,1,4735.74,1358.05,171.826,4.76721,30,10,47080,0,1,0,0,0,0),
(3008767,27518,571,0,0,1,1,24543,1,4732.96,1357.38,171.809,4.76721,30,10,47080,0,1,0,0,0,0),
(3008768,27677,571,0,0,1,1,24966,1,4715.05,1320.49,156.766,0.523599,30,10,28830,33090,1,0,0,0,0),
(3008769,27540,571,0,0,1,1,24968,1,4719.53,1320.47,156.074,1.69643,30,10,34137,0,1,0,0,0,0),
(3008770,27560,571,0,0,1,1,24092,1,4753.48,1308.21,163.255,1.15877,30,5,29820,0,1,0,0,0,0),
(3008771,27695,571,0,0,1,1,24553,0,4723.59,1381.63,172.293,5.25671,30,0,55005,3643,0,0,0,0,0),
(3008772,27540,571,0,0,1,1,24968,1,4730.13,1381.89,173.87,4.94648,30,0,34137,0,0,0,0,0,0),
(3008773,27540,571,0,0,1,1,24968,1,4738.34,1381.76,176.364,4.82867,30,0,34137,0,0,0,0,0,0),
(3008774,27695,571,0,0,1,1,24553,0,4745.06,1379.92,176.847,4.68338,30,0,55005,3643,0,0,0,0,0);

-- Reduce respawn time and set random movement for several NPCs
UPDATE `creature` SET `wander_distance` = 10, `MovementType` = 1, `spawntimesecs` = 30 WHERE `guid` IN (133135,133136,133137,133138,133139,133612,133623,133229,133485);
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1, `spawntimesecs` = 30 WHERE `guid` IN (113074,111223,133648,111219,111191);
UPDATE `creature` SET `spawntimesecs` = 30 WHERE `guid` IN (116137, 100211, 133232, 98824, 100833, 111192, 111221, 111821, 111843, 111849, 112875, 112891, 113109, 115913,
115914, 115915, 115916, 118492, 118546, 118547, 133613, 133614, 133615, 133874, 133882, 133242, 133331, 133378, 133379, 133380, 133437, 133660, 133718, 133736, 133872,
133873, 133875, 133876, 133877, 133879, 133886, 133888);

-- Remove obsolete fire
DELETE FROM `gameobject` WHERE `guid` = 265296;

-- SAI scripts
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 27695;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (27693,27695) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27693,0,0,1,11,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reconstructed Wyrm - On Respawn - Stop Auto Attack'),
(27693,0,1,2,61,0,100,0,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reconstructed Wyrm - Linked - Stop Combat Movement'),
(27693,0,2,0,61,0,100,0,0,0,0,0,0,53,0,27693,0,0,0,2,1,0,0,0,0,0,0,0,0,'Reconstructed Wyrm - Linked - Start WP Movement'),
(27693,0,3,0,58,0,100,0,0,27693,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reconstructed Wyrm - On WP Movement Ended - Force Despawn'),

(27695,0,0,0,25,0,100,0,0,0,0,0,0,11,35848,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fordragon Battle Mage - On Reset - Cast ''Coldflame'''),
(27695,0,1,0,0,0,100,0,3000,6000,12000,16000,0,11,49365,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Fordragon Battle Mage - IC - Cast ''Arcane Tempest'''),
(27695,0,2,0,0,0,100,0,0,2000,8000,12000,0,11,38064,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Fordragon Battle Mage - IC - Cast ''Blast Wave''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
