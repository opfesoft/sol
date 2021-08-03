-- DB update 2021_08_01_01 -> 2021_08_03_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_01_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_01_01 2021_08_03_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1627988746639894741'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1627988746639894741');

UPDATE `creature` SET `wander_distance` = 10, `MovementType` = 1 WHERE `guid` IN (93550,93612);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (2658,2659);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (2658,2659,-93615);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2658,0,0,0,0,0,100,0,1000,2000,14000,14000,0,11,3147,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Razorbeak Gryphon - IC - Cast ''Rend Flesh'''),
(2658,0,1,0,0,0,100,0,5000,6000,10000,10000,0,11,11019,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Razorbeak Gryphon - IC - Cast ''Wing Flap'''),

(2659,0,0,0,0,0,100,0,1000,2000,14000,14000,0,11,3147,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Razorbeak Skylord - IC - Cast ''Rend Flesh'''),
(2659,0,1,0,0,0,100,0,5000,6000,10000,10000,0,11,11019,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Razorbeak Skylord - IC - Cast ''Wing Flap'''),

(-93615,0,0,0,0,0,100,0,1000,2000,14000,14000,0,11,3147,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Razorbeak Skylord - IC - Cast ''Rend Flesh'''),
(-93615,0,1,0,0,0,100,0,5000,6000,10000,10000,0,11,11019,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Razorbeak Skylord - IC - Cast ''Wing Flap'''),
(-93615,0,2,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Razorbeak Skylord - On Respawn - Set Active On');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
