-- DB update 2021_01_31_01 -> 2021_01_31_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_31_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_31_01 2021_01_31_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1612129949530578389'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1612129949530578389');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 24713;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2471300;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(24713,0,0,0,9,0,100,0,0,5,5000,8000,0,80,2471300,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Crowleg" Dan - Within 0-5 Range - Call Timed Action List'),
(24713,0,1,2,62,0,100,0,9335,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'"Crowleg" Dan - On Gossip Option 0 Selected - Close Gossip'),
(24713,0,2,3,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Crowleg" Dan - Linked - Say Line 0'),
(24713,0,3,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'"Crowleg" Dan - Linked - Start Attack'),

(2471300,9,0,0,0,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Crowleg" Dan - On Script - Disable Auto Attack'),
(2471300,9,1,0,0,0,100,0,1000,1000,0,0,0,11,50306,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'"Crowleg" Dan - On Script - Cast ''Thrash Kick'''),
(2471300,9,2,0,0,0,100,0,1000,1000,0,0,0,11,50306,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'"Crowleg" Dan - On Script - Cast ''Thrash Kick'''),
(2471300,9,3,0,0,0,100,0,1000,1000,0,0,0,11,50306,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'"Crowleg" Dan - On Script - Cast ''Thrash Kick'''),
(2471300,9,4,0,0,0,100,0,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Crowleg" Dan - On Script - Enable Auto Attack');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 9335;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(15,9335,0,0,0,47,0,11479,8,0,0,0,0,'','"Crowleg" Dan - Show gossip option 0 if quest ''"Crowleg" Dan'' is in progress');

UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 108258;
DELETE FROM `creature_addon` WHERE `guid` = 108258;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(108258,1082580,0,0,0,0,0,NULL);

DELETE FROM `waypoint_data` WHERE `id` = 1082580;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(1082580,1,-235.44,-3573.36,13.2425,0,0,0,0,100,0),
(1082580,2,-221.604,-3579.58,13.287,0,10000,0,0,100,0),
(1082580,3,-235.44,-3573.36,13.2425,0,0,0,0,100,0),
(1082580,4,-240.388,-3571.48,17.7698,0,0,0,0,100,0),
(1082580,5,-243.701,-3570.35,18.1827,0,10000,0,0,100,0),
(1082580,6,-240.388,-3571.48,17.7698,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
