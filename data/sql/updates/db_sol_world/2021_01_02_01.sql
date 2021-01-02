-- DB update 2021_01_02_00 -> 2021_01_02_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_02_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_02_00 2021_01_02_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609571203939542500'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609571203939542500');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (7442,2212,4070,3382,3384,3282,2951,2968) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7442,0,0,0,25,0,100,1,0,0,0,0,0,11,17205,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Winterfall Pathfinder - On Reset - Cast ''Winterfall Firewater'' (No Repeat)'),
(7442,0,1,0,0,0,100,1,0,0,0,0,0,11,16498,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Winterfall Pathfinder - IC - Cast ''Faerie Fire'' (No Repeat)'),
(7442,0,2,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Winterfall Pathfinder - Within 5-30 Range - Cast ''Shoot'''),

(2212,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Deth''ryll Satyr - Within 5-30 Range - Cast ''Shoot'''),

(4070,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Venture Co. Builder - Within 5-30 Range - Cast ''Shoot'''),

(3382,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Southsea Cannoneer - Within 5-30 Range - Cast ''Shoot'''),

(3384,0,0,0,0,0,100,1,0,0,0,0,0,11,3011,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Southsea Privateer - IC - Cast ''Fire Shot'' (No Repeat)'),
(3384,0,1,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Southsea Privateer - Within 5-30 Range - Cast ''Shoot'''),

(3282,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Venture Co. Mercenary - Within 5-30 Range - Cast ''Shoot'''),

(2951,0,0,0,0,0,100,1,0,0,0,0,0,11,1516,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Palemane Poacher - IC - Cast ''Quick Shot'' (No Repeat)'),
(2951,0,1,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Palemane Poacher - Within 5-30 Range - Cast ''Shoot'''),

(2968,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Galak Outrunner - Within 5-30 Range - Cast ''Shoot''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
