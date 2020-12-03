-- DB update 2020_12_03_02 -> 2020_12_04_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_03_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_03_02 2020_12_04_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1607039479584098882'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1607039479584098882');

DELETE FROM `creature` WHERE `guid` = 45808;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 9707 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 10263 AND `source_type` = 0 AND `id` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (970700,970701) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(9707,0,0,0,11,0,100,0,0,0,0,0,0,80,970700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarshield Portal - On Respawn - Call Timed Action List'),
(9707,0,1,0,60,0,100,2,5000,5000,5000,5000,0,11,15126,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarshield Portal - On Update - Cast ''Summon Burning Imp'' (No Repeat) (Normal Dungeon)'),
(9707,0,2,0,60,0,100,2,11000,11000,11000,11000,0,11,16002,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarshield Portal - On Update - Cast ''Summon Burning Felhound'' (No Repeat) (Normal Dungeon)'),
(9707,0,3,0,60,0,100,259,20000,20000,0,0,0,80,970701,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarshield Portal - On Update - Call Timed Action List (No Repeat, No Reset) (Normal Dungeon)'),

(970700,9,0,0,0,0,100,0,1000,1000,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarshield Portal - On Script - Set Root On'),

(970701,9,0,0,0,0,10,0,0,0,0,0,0,11,16004,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarshield Portal - On Script - Cast ''Summon Burning Felguard'''),

(10263,0,0,0,1,0,100,2,10000,10000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Burning Felguard - Out of Combat - Force Despawn');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
