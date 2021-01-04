-- DB update 2021_01_04_00 -> 2021_01_04_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_04_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_04_00 2021_01_04_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609783750812501967'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609783750812501967');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (11721,11724,11731,11726,11725);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (11721,11724,11731,11726,11725) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(11721,0,0,0,0,0,100,0,2700,3200,32700,33200,0,11,744,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Hive''Ashi Worker - IC - Cast ''Poison'''),

(11724,0,0,0,0,0,100,0,2600,3300,9600,12400,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hive''Ashi Swarmer - IC - Cast ''Thrash'''),

(11731,0,0,0,2,0,100,1,0,60,0,0,0,11,29506,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hive''Regal Burrower - Between 0-60% Health - Cast ''The Burrower''s Shell'' (No Repeat)'),

(11726,0,0,0,0,0,100,0,2700,3600,11700,14300,0,11,14120,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Hive''Zora Tunneler - IC - Cast ''Tunneler Acid'''),

(11725,0,0,0,0,0,100,0,2700,3800,9600,12800,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hive''Zora Waywatcher - IC - Cast ''Thrash''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
