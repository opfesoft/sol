-- DB update 2021_10_01_00 -> 2021_10_01_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_01_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_01_00 2021_10_01_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1633040831577619241'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1633040831577619241');

UPDATE `gameobject_template` SET `Data3` = 60000 WHERE `entry` = 181964;

DELETE FROM `event_scripts` WHERE `id` = 11027;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(11027,2,10,17715,60000,4,-1896.13,-12861.1,87.1412,3.5412);

DELETE FROM `gameobject` WHERE `guid` BETWEEN 3008980 AND 3008984;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3008980,181965,530,0,0,1,1,-1943.62,-12878.9,88.3187,3.8366,0,0,0,0,-1,100,1,0),
(3008981,181965,530,0,0,1,1,-1945.27,-12881.7,91.1005,3.73761,0,0,0,0,-1,100,1,0),
(3008982,181965,530,0,0,1,1,-1944.73,-12887.7,88.1748,2.81869,0,0,0,0,-1,100,1,0),
(3008983,181965,530,0,0,1,1,-1951.88,-12881.8,88.8753,0.304646,0,0,0,0,-1,100,1,0),
(3008984,181965,530,0,0,1,1,-1944.95,-12882.5,99.2512,4.0282,0,0,0,0,-1,100,1,0);

DELETE FROM `creature_text` WHERE `CreatureId` = 17715;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(17715,0,0,'Who dares defile the statue of our beloved?',14,0,100,0,0,0,14366,0,'Atoph the Bloodcursed');

UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 181964;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 17715;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 17715;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 181964;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1771500;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(181964,1,0,0,70,0,100,0,2,0,0,0,0,70,60,0,0,0,0,0,15,181965,50,0,0,0,0,0,0,'Statue of Queen Azshara - On Gameobject State Changed - Respawn GO (Statue Fire)'),

(17715,0,0,0,54,0,100,0,0,0,0,0,0,80,1771500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Atoph the Bloodcursed - On Just Summoned - Call Timed Action List'),
(17715,0,1,0,0,0,100,0,2500,5000,15000,25000,0,11,11977,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Atoph the Bloodcursed - IC - Cast ''Rend'''),
(17715,0,2,0,0,0,100,0,2000,3000,9000,14000,0,11,11976,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Atoph the Bloodcursed - IC - Cast ''Strike'''),

(1771500,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Atoph the Bloodcursed - On Script - Say Line 0'),
(1771500,9,1,0,0,0,100,0,2000,2000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-1936.44,-12878.4,85.7825,3.5632,'Atoph the Bloodcursed - On Script - Move To Pos');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
