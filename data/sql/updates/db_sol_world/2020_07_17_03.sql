-- DB update 2020_07_17_02 -> 2020_07_17_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_07_17_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_07_17_02 2020_07_17_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1594995264592785010'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1594995264592785010');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 23163 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23163,0,0,0,11,0,100,1,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gezzarak the Huntress - On Respawn - Say Line 0'),
(23163,0,1,0,0,0,100,0,4000,7000,17500,20000,0,11,40434,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gezzarak the Huntress - In Combat - Cast ''Knock Away'''),
(23163,0,2,3,0,0,100,0,16000,19000,22000,25000,0,64,1,0,0,0,0,0,17,0,40,1,0,0,0,0,0,'Gezzarak the Huntress - In Combat - Store Target'),
(23163,0,3,4,61,0,100,0,0,0,0,0,0,11,40432,1,0,0,0,0,12,1,0,0,0,0,0,0,0,'Gezzarak the Huntress - In Combat - Cast ''Warp'''),
(23163,0,4,0,61,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Gezzarak the Huntress - In Combat - Say Line 1'),
(23163,0,5,6,23,0,100,0,40432,1,5000,5000,0,11,40542,1,0,0,0,0,12,1,0,0,0,0,0,0,0,'Gezzarak the Huntress - On Has Aura ''Warp'' - Cast ''Warped Armor'''),
(23163,0,6,0,61,0,100,0,0,0,0,0,0,11,40433,1,0,0,0,0,12,1,0,0,0,0,0,0,0,'Gezzarak the Huntress - In Combat - Cast ''Warp Rift''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
