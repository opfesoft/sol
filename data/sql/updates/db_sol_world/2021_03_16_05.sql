-- DB update 2021_03_16_04 -> 2021_03_16_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_03_16_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_03_16_04 2021_03_16_05 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1615901081439917437'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1615901081439917437');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 3204;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
(3204,28012,0,'Sapper Explode - Trigger ''Suicide''');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1052,1222) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (105200,122200) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1052,0,0,0,4,0,15,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Saboteur - On Aggro - Say Line 2'),
(1052,0,1,0,0,0,100,0,2100,7300,18000,26000,0,11,7891,2,0,0,0,0,5,0,0,0,0,0,0,0,0,'Dark Iron Saboteur - IC - Cast ''Gift of Ragnaros'''),
(1052,0,2,3,2,0,100,1,0,15,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Saboteur - Between 0-15% Health - Say Line 0 (No Repeat)'),
(1052,0,3,4,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Saboteur - Linked - Say Line 1'),
(1052,0,4,0,61,0,100,0,0,0,0,0,0,11,3204,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Saboteur - Linked - Cast ''Sapper Explode'''),
(1052,0,5,0,8,0,100,0,28012,0,0,0,0,80,105200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Saboteur - On Spellhit ''Suicide'' - Call Timed Action List'),

(105200,9,0,0,0,0,100,0,500,500,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Saboteur - On Script - Die'),

(1222,0,0,0,4,0,15,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Sapper - On Aggro - Say Line 0'),
(1222,0,1,2,2,0,100,1,0,15,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Sapper - Between 0-15% Health - Say Line 1 (No Repeat)'),
(1222,0,2,3,61,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Sapper - Linked - Say Line 2'),
(1222,0,3,0,61,0,100,0,0,0,0,0,0,11,3204,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Sapper - Linked - Cast ''Sapper Explode'''),
(1222,0,4,0,8,0,100,0,28012,0,0,0,0,80,122200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Sapper - On Spellhit ''Suicide'' - Call Timed Action List'),

(122200,9,0,0,0,0,100,0,500,500,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Sapper - On Script - Die');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
