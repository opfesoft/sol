-- DB update 2022_03_23_00 -> 2022_03_23_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_23_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_23_00 2022_03_23_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648051270456940160'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648051270456940160');

DELETE FROM `gameobject` WHERE `guid` = 3009025;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3009025,177705,1,0,0,1,1,252.547,2963.69,1.64267,5.58505,0,0,0,0,-1,100,1,0);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 12369;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 177673;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (17767300,1236900);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(177673,1,0,0,70,0,100,0,2,0,0,0,0,80,17767300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Serpent Statue - On GO State Changed ''GO_ACTIVATED'' - Call Timed Action List'),

(17767300,9,0,0,0,0,100,0,0,0,0,0,0,70,5,0,0,0,0,0,14,3009025,177705,0,0,0,0,0,0,'Serpent Statue - On Script - Respawn Target (Naga Beam)'),
(17767300,9,1,0,0,0,100,0,5000,5000,0,0,0,12,12369,4,30000,0,0,0,8,0,0,0,0,254.167,2966.88,1.36733,0.957399,'Serpent Statue - On Script - Summon Creature ''Lord Kragaru'''),

(12369,0,0,0,54,0,100,0,0,0,0,0,0,80,1236900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Kragaru - On Just Summoned - Call Timed Action List'),
(12369,0,1,0,0,0,100,0,3000,4000,3000,4000,0,11,15496,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Lord Kragaru - IC - Cast ''Cleave'''),
(12369,0,2,0,13,0,100,0,10000,15000,0,0,0,11,12555,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lord Kragaru - On Victim Casting - Cast ''Pummel'''),

(1236900,9,0,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Kragaru - On Script - Add ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1236900,9,1,0,0,0,100,0,0,0,0,0,0,11,8609,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Kragaru - On Script - Cast ''Cyclone Visual Spawn (DND)'''),
(1236900,9,2,0,0,0,100,0,3000,3000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Kragaru - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1236900,9,3,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Lord Kragaru - Linked - Start Attack (Closest Player)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
