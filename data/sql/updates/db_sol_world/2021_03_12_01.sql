-- DB update 2021_03_12_00 -> 2021_03_12_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_03_12_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_03_12_00 2021_03_12_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1615574364825321180'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1615574364825321180');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `InhabitType` = 4 WHERE `entry` = 18257;

UPDATE `creature` SET `position_z` = 44.3916, `MovementType` = 2 WHERE `guid` = 65525;

DELETE FROM `creature_addon` WHERE `guid` = 65525;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(65525,655250,0,0,0,0,1,NULL);

DELETE FROM `smart_scripts` WHERE `entryorguid` = 18257 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18257,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gutripper - On Respawn - Set Active On'),
(18257,0,1,0,0,0,100,0,6000,6000,10000,10000,0,11,32022,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gutripper - IC - Cast ''Gut Rip''');

DELETE FROM `waypoint_data` WHERE `id` = 655250;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(655250,1,-696.603,8469.75,44.3916,4.77493,30000,0,0,100,0),
(655250,2,-678.6,8352.9,62.3759,0,0,0,0,100,0),
(655250,3,-671.925,8294.39,60.7813,0,0,0,0,100,0),
(655250,4,-714.818,8269.72,64.1102,0,0,0,0,100,0),
(655250,5,-831.208,8259.62,38.7113,0,0,0,0,100,0),
(655250,6,-971.299,8302.16,47.8362,0,0,0,0,100,0),
(655250,7,-1108.99,8434.62,46.8515,0,0,0,0,100,0),
(655250,8,-991.013,8477.95,61.2243,0,0,0,0,100,0),
(655250,9,-859.065,8482.37,69.7453,0,0,0,0,100,0);

-- Greater Windroc: Fix position
UPDATE `creature` SET `position_x` = -797.563, `position_y` = 8477.38, `position_z` = 38.1612 WHERE `guid` = 59582;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
