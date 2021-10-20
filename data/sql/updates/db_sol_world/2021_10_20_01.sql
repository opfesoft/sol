-- DB update 2021_10_20_00 -> 2021_10_20_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_20_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_20_00 2021_10_20_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1634759799702021440'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1634759799702021440');

-- Rizzle Brassbolts: Ensure that Rizzle's Guarded Plans respawn
UPDATE `smart_scripts` SET `action_type` = 233, `action_param1` = 60, `action_param2` = 0 WHERE `entryorguid` = 472000 AND `source_type` = 9 AND `id` = 3;

-- Rizzle Brassbolts: Fix orientation after reaching the last waypoint
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 4720 AND `id` > 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4720,0,2,3,40,0,100,0,10,4720,0,0,0,101,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rizzle Brassbolts - On Waypoint 10 Reached - Reset Home Position'),
(4720,0,3,0,61,0,100,0,0,0,0,0,0,66,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rizzle Brassbolts - Linked - Set Orientation');

-- Rizzle's Unguarded Plans: Set same position/orientation/rotation as Rizzle's Guarded Plans
UPDATE `gameobject` SET `position_x` = -6236.64, `position_y` = -3830.48, `position_z` = -58.1364, `orientation` = -0.907571, `rotation2` = 0.438371, `rotation3` = -0.898794 WHERE `guid` = 13621;

-- Zamek: Fix GO exploding 2 times (it already plays the explode animation on despawn, so the action to activate the GO is not necessary)
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 470900;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(470900,9,0,0,0,0,100,0,0,0,0,0,0,54,7000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zamek - On Script - Pause Waypoint'),
(470900,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0.943443,'Zamek - On Script - Set Orientation'),
(470900,9,2,0,0,0,100,0,2000,2000,0,0,0,50,144065,7,0,0,0,0,8,0,0,0,0,-6265.67,-3845.57,-58.75,0.943443,'Zamek - On Script - Summon Gameobject ''Explosive Charge'''),
(470900,9,3,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zamek - On Script - Say Line 0'),
(470900,9,4,0,0,0,100,0,8000,8000,0,0,0,45,1,1,0,0,0,0,19,4720,0,0,0,0,0,0,0,'Zamek - On Script - Set Data to Rizzle Brassbolts'),
(470900,9,5,0,0,0,100,0,60000,60000,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zamek - On Script - Add NPC Flag Questgiver');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
