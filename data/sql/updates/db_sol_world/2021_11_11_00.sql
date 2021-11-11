-- DB update 2021_11_10_05 -> 2021_11_11_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_10_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_10_05 2021_11_11_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1636616084806074601'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1636616084806074601');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (21787,21912,21652,21651,18595,21636,22045,18449,22265);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (21787,21912,21652,21651,18595,21636,22045,18449,22265);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(21787,0,0,0,25,0,100,0,0,0,0,0,0,11,16592,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Time-Lost Skettis High Priest - On Reset - Cast ''Shadowform'''),
(21787,0,1,0,4,0,100,0,0,0,0,0,0,11,11639,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Time-Lost Skettis High Priest - On Aggro - Cast ''Shadow Word: Pain'''),
(21787,0,2,0,0,0,100,0,500,1000,7800,9000,0,11,9734,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Time-Lost Skettis High Priest - IC - Cast ''Holy Smite'''),
(21787,0,3,0,2,0,100,1,0,30,0,0,0,11,42420,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Time-Lost Skettis High Priest - Between 0-30% Health - Cast ''Flash Heal'' (No Repeat)'),

(21912,0,0,0,0,0,100,0,2500,5000,10000,15000,0,11,37577,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Skettis Sentinel - IC - Cast ''Debilitating Strike'''),
(21912,0,1,0,2,0,100,1,0,80,0,0,0,11,30619,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Skettis Sentinel - Between 0-80% Health - Cast ''Cleave'' (No Repeat)'),
(21912,0,2,0,2,0,100,1,0,30,0,0,0,11,23537,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skettis Sentinel - Between 0-30% Health - Cast ''Frenzy'' (No Repeat)'),

(21652,0,0,0,0,0,100,0,2500,5000,9000,19000,0,11,37589,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Skettis Time-Shifter - IC - Cast ''Shriveling Gaze'''),
(21652,0,1,0,0,0,100,0,500,1000,8500,10000,0,11,16006,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Skettis Time-Shifter - IC - Cast ''Chain Lightning'''),

(21651,0,0,0,4,0,100,0,0,0,0,0,0,11,42247,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Time-Lost Skettis Reaver - On Aggro - Cast ''Battle Shout'''),
(21651,0,1,0,0,0,100,0,2500,5000,10000,15000,0,11,15496,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Time-Lost Skettis Reaver - IC - Cast ''Cleave'''),
(21651,0,2,0,2,0,100,1,0,30,0,0,0,11,3019,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Time-Lost Skettis Reaver - Between 0-30% Health - Cast ''Frenzy'' (No Repeat)'),

(18595,0,0,0,2,0,100,1,0,30,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Warped Peon - Between 0-30% Health - Flee For Assist (No Repeat)'),

(21636,0,0,0,25,0,100,0,0,0,0,0,0,11,3417,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vengeful Draenei - On Reset - Cast ''Thrash'''),

(22045,0,0,0,0,0,100,0,5000,10000,15000,20000,0,11,38621,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vengeful Husk - IC - Cast ''Debilitating Strike'''),

(18449,0,0,0,11,0,100,0,0,0,0,0,0,11,674,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shienor Talonite - On Respawn - Cast ''Dual Wield'''),

(22265,0,0,0,0,0,100,0,2000,6000,9000,14000,0,11,30285,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Shadowwing Owl - IC - Cast ''Eagle Claw''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
