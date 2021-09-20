-- DB update 2021_09_20_03 -> 2021_09_21_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_20_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_20_03 2021_09_21_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1632177006012211336'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1632177006012211336');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` > 1 AND `entryorguid` = 24914;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2491400;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(24914,0,2,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sorlof - On Respawn - Set Active On'),
(24914,0,3,0,8,0,100,0,45008,0,10000,10000,0,80,2491400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sorlof - On Spellhit ''Cannon Assault'' - Call Timed Action List'),
(24914,0,4,0,36,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,15,187238,50,0,0,0,0,0,0,'Sorlof - On Corpse Removed - Delete GO ''Sorlof''s Booty'''),

(2491400,9,0,0,0,0,100,0,0,0,0,0,0,102,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sorlof - On Script - Set Health Regeneration Off'),
(2491400,9,1,0,0,0,100,0,15000,15000,0,0,0,102,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sorlof - On Script - Set Health Regeneration On');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
