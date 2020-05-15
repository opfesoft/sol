-- DB update 2020_05_07_03 -> 2020_05_15_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_05_07_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_05_07_03 2020_05_15_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1589551883968828389'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1589551883968828389');

-- Silithid Invader / Silithid Hive Drone SAI: Call for help if below 20% (30 yards radius; without emote; force neutral / defensive creatures to also attack the player)
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (4131,4133) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4131,0,0,0,0,0,100,0,4000,7000,22000,25000,0,11,6016,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Silithid Invader - IC - Cast ''Pierce Armor'''),
(4131,0,1,0,0,0,100,1,10000,16000,0,0,0,11,8137,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Silithid Invader - IC - Cast ''Silithid Pox'' (No Repeat)'),
(4131,0,2,0,2,0,100,1,0,20,0,0,0,39,30,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Silithid Invader - On Health Below 20% - Call For Help (No Repeat)'),

(4133,0,0,0,2,0,100,1,0,20,0,0,0,39,30,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Silithid Hive Drone - On Health Below 20% - Call For Help (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
