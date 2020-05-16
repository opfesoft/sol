-- DB update 2020_05_17_00 -> 2020_05_17_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_05_17_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_05_17_00 2020_05_17_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1589667232427587153'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1589667232427587153');

-- Tammra Windfield SAI: Plant the tree after finishing the quest "Cycle of Rebirth"
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 11864;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 11864 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 1186400 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(11864,0,0,0,20,0,100,0,6301,0,0,0,0,80,1186400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tammra Windfield - On Quest ''Cycle of Rebirth'' Finished - Run Script'),

(1186400,9,0,0,0,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,15,177927,5,0,0,0,0,0,0,'Tammra Windfield - On Script - Respawn ''Tammra Gaea Sapling'''),
(1186400,9,1,0,0,0,100,0,0,0,0,0,0,11,32618,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tammra Windfield - On Script - Cast Cosmetic Nature Cast'),
(1186400,9,2,0,0,0,100,0,5000,5000,0,0,0,9,0,0,0,0,0,0,14,33531,177927,0,0,0,0,0,0,'Tammra Windfield - On Script - Activate Gameobject'),
(1186400,9,3,0,0,0,100,0,1000,1000,0,0,0,5,25,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tammra Windfield - On Script - Play Emote ''ONESHOT_POINT(DNR)''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
