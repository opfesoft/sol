-- DB update 2022_04_08_04 -> 2022_04_08_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_08_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_08_04 2022_04_08_05 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1649452358679636873'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1649452358679636873');

DELETE FROM `gameobject` WHERE `guid` = 3009029;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3009029,176573,0,0,0,1,1,-9231.62,-2199.07,65.2779,-0.872665,0,0,0.422618,-0.906308,181,100,1,0);

DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = -3009029;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-3009029,1,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Respawn - Set Active On'),
(-3009029,1,1,0,61,0,100,0,0,0,0,0,0,67,1,0,0,4000,4000,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - Linked - Create Timed Event 1'),
(-3009029,1,2,3,59,4095,100,0,1,0,0,0,0,4,6594,1,0,0,0,0,18,150,0,0,0,0,0,0,0,'Alliance Bell - On Timed Event 1 Triggered - Play Direct Sound ''BellTollAlliance'' (Phase 1-12) (All Players Within 150y)'),
(-3009029,1,3,0,61,0,100,0,0,0,0,0,0,23,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - Linked - Decrease Phase'),
(-3009029,1,4,0,68,0,100,0,112,0,0,0,0,22,12,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 00'' Started - Set Phase 12'),
(-3009029,1,5,0,68,0,100,0,113,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 01'' Started - Set Phase 1'),
(-3009029,1,6,0,68,0,100,0,114,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 02'' Started - Set Phase 2'),
(-3009029,1,7,0,68,0,100,0,115,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 03'' Started - Set Phase 3'),
(-3009029,1,8,0,68,0,100,0,116,0,0,0,0,22,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 04'' Started - Set Phase 4'),
(-3009029,1,9,0,68,0,100,0,117,0,0,0,0,22,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 05'' Started - Set Phase 5'),
(-3009029,1,10,0,68,0,100,0,118,0,0,0,0,22,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 06'' Started - Set Phase 6'),
(-3009029,1,11,0,68,0,100,0,119,0,0,0,0,22,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 07'' Started - Set Phase 7'),
(-3009029,1,12,0,68,0,100,0,120,0,0,0,0,22,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 08'' Started - Set Phase 8'),
(-3009029,1,13,0,68,0,100,0,121,0,0,0,0,22,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 09'' Started - Set Phase 9'),
(-3009029,1,14,0,68,0,100,0,122,0,0,0,0,22,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 10'' Started - Set Phase 10'),
(-3009029,1,15,0,68,0,100,0,123,0,0,0,0,22,11,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 11'' Started - Set Phase 11'),
(-3009029,1,16,0,68,0,100,0,124,0,0,0,0,22,12,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 12'' Started - Set Phase 12'),
(-3009029,1,17,0,68,0,100,0,125,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 13'' Started - Set Phase 1'),
(-3009029,1,18,0,68,0,100,0,126,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 14'' Started - Set Phase 2'),
(-3009029,1,19,0,68,0,100,0,127,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 15'' Started - Set Phase 3'),
(-3009029,1,20,0,68,0,100,0,128,0,0,0,0,22,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 16'' Started - Set Phase 4'),
(-3009029,1,21,0,68,0,100,0,129,0,0,0,0,22,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 17'' Started - Set Phase 5'),
(-3009029,1,22,0,68,0,100,0,130,0,0,0,0,22,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 18'' Started - Set Phase 6'),
(-3009029,1,23,0,68,0,100,0,131,0,0,0,0,22,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 19'' Started - Set Phase 7'),
(-3009029,1,24,0,68,0,100,0,132,0,0,0,0,22,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 20'' Started - Set Phase 8'),
(-3009029,1,25,0,68,0,100,0,133,0,0,0,0,22,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 21'' Started - Set Phase 9'),
(-3009029,1,26,0,68,0,100,0,134,0,0,0,0,22,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 22'' Started - Set Phase 10'),
(-3009029,1,27,0,68,0,100,0,135,0,0,0,0,22,11,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Event ''Hour 23'' Started - Set Phase 11');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
