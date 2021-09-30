-- DB update 2021_09_30_02 -> 2021_09_30_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_30_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_30_02 2021_09_30_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1632997839313848120'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1632997839313848120');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 5240;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(5240,0,0,0,0,0,100,0,0,0,3400,4800,0,11,20298,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gordunni Warlock - IC - Cast ''Shadow Bolt'''),
(5240,0,1,0,0,0,100,0,6000,11000,14000,21000,0,11,7289,32,0,0,0,0,5,0,0,0,0,0,0,0,0,'Gordunni Warlock - IC - Cast ''Shrink'''),
(5240,0,2,0,4,0,15,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Gordunni Warlock - On Aggro - Say Line 0');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
