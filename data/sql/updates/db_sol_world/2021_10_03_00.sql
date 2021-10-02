-- DB update 2021_10_02_00 -> 2021_10_03_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_02_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_02_00 2021_10_03_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1633212632525896124'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1633212632525896124');

UPDATE `gameobject` SET `position_x` = 5800.89, `position_y` = -985.82, `position_z` = 409.78 WHERE `guid` = 99894;
UPDATE `creature` SET `position_x` = 5800.89, `position_y` = -985.82, `position_z` = 409.78, `orientation` = 3.50811, `spawntimesecs` = 10 WHERE `guid` = 39715;
UPDATE `creature_addon` SET `bytes1` = 0 WHERE `guid` = 39715;

DELETE FROM `gameobject` WHERE `guid` = 7078;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(7078,179676,1,0,0,1,1,5800.89,-985.82,409.78,2.24779,0,0,-0.90179,-0.432175,-1,255,1,0);

DELETE FROM `event_scripts` WHERE `id` = 8328;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(8328,0,9,7078,3,0,0,0,0,0);

UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 179676;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 14467;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 179676;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1446700;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(179676,1,0,0,70,0,100,0,1,0,0,0,0,45,1,1,0,0,0,0,10,39715,14467,0,0,0,0,0,0,'Fel Fire - On State Changed - Set Data 1 1 (Kroshius)'),

(14467,0,0,1,25,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kroshius - On Reset - Set Phase 1'),
(14467,0,1,2,61,0,100,0,0,0,0,0,0,75,58951,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kroshius - Linked - Add Aura ''Permanent Feign Death'''),
(14467,0,2,3,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kroshius - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(14467,0,3,0,61,0,100,0,0,0,0,0,0,2,1194,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kroshius - Linked - Set Faction ''Battleground Neutral'''),
(14467,0,4,0,38,1,100,0,1,1,0,0,0,80,1446700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kroshius - On Data Set 1 1 - Call Timed Action List (Phase 1)'),
(14467,0,5,0,0,0,100,0,5000,8000,9000,12000,0,11,10101,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kroshius - IC - Cast ''Knock Away'''),

(1446700,9,0,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kroshius - On Script - Set Phase 0'),
(1446700,9,1,0,0,0,100,0,3000,3000,0,0,0,28,58951,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kroshius - On Script - Remove Aura ''Permanent Feign Death'''),
(1446700,9,2,0,0,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kroshius - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1446700,9,3,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kroshius - On Script - Say Line 0'),
(1446700,9,4,0,0,0,100,0,0,0,0,0,0,2,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kroshius - On Script - Set Faction ''Monster'''),
(1446700,9,5,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Kroshius - On Script - Start Attack (Closest Player)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
