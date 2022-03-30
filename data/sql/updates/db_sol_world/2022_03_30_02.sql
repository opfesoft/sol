-- DB update 2022_03_30_01 -> 2022_03_30_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_30_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_30_01 2022_03_30_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648632821659707440'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648632821659707440');

DELETE FROM `gameobject` WHERE `guid` IN (3009026,3009027,3009028);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3009026,182817,1,0,0,1,1,-3700.91,-3470.21,42.2827,0.957751,0,0,0.460781,0.887514,-1,0,1,0),
(3009027,182817,1,0,0,1,1,-3662.1,-3455.62,42.2112,2.38107,0,0,0.928567,0.371165,-1,0,1,0),
(3009028,182817,1,0,0,1,1,-3640.92,-3421.74,42.1979,3.21097,0,0,0.999398,-0.0346795,-1,0,1,0);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (23751,23752,23753);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23751,0,0,1,8,0,100,0,42356,0,0,0,0,33,23751,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'North Tent - On Spellhit ''Burn Direhorn Post'' - Quest Credit ''North Tent'''),
(23751,0,1,0,61,0,100,0,0,0,0,0,0,70,300,0,0,0,0,0,14,3009028,182817,0,0,0,0,0,0,'North Tent - Linked - Respawn GO ''Burning Horde Siege Engine'''),

(23752,0,0,1,8,0,100,0,42356,0,0,0,0,33,23752,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Northeast Tent - On Spellhit ''Burn Direhorn Post'' - Quest Credit ''Northeast Tent'''),
(23752,0,1,0,61,0,100,0,0,0,0,0,0,70,300,0,0,0,0,0,14,3009027,182817,0,0,0,0,0,0,'Northeast Tent - Linked - Respawn GO ''Burning Horde Siege Engine'''),

(23753,0,0,1,8,0,100,0,42356,0,0,0,0,33,23753,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'East Tent - On Spellhit ''Burn Direhorn Post'' - Quest Credit ''East Tent'''),
(23753,0,1,0,61,0,100,0,0,0,0,0,0,70,300,0,0,0,0,0,14,3009026,182817,0,0,0,0,0,0,'East Tent - Linked - Respawn GO ''Burning Horde Siege Engine''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
