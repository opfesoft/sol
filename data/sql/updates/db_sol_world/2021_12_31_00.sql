-- DB update 2021_12_30_01 -> 2021_12_31_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_30_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_30_01 2021_12_31_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1640964653995353867'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1640964653995353867');

UPDATE `creature` SET `spawntimesecs` = 150, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` IN (102713,102714,102738); -- Fleeing Cultist
UPDATE `creature` SET `position_x` = 3384.07, `position_y` = 3697.57, `position_z` = 21.7053 WHERE `guid` = 104161; -- Ziggurat Defender

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 26189;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 26189;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(26189,0,0,0,11,0,33,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fleeing Cultist - On Respawn - Say Line 0'),
(26189,0,1,2,11,0,100,0,0,0,0,0,0,53,1,26189,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fleeing Cultist - On Respawn - Start WP Movement'),
(26189,0,2,0,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fleeing Cultist - Linked - Set Active On'),
(26189,0,3,0,58,0,100,0,0,26189,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fleeing Cultist - On WP Path Ended - Force Despawn');

DELETE FROM `waypoints` WHERE `entry` = 26189;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(26189,1,3392.06,3630.6,19.459,'Fleeing Cultist'),
(26189,2,3399.11,3623.95,17.8284,NULL),
(26189,3,3405.81,3617.62,15.9434,NULL),
(26189,4,3408.07,3609.28,14.9871,NULL),
(26189,5,3407.64,3603.35,14.352,NULL),
(26189,6,3407.09,3596.25,13.3096,NULL),
(26189,7,3406.49,3588.45,13.1446,NULL),
(26189,8,3403.79,3582.51,14.4007,NULL),
(26189,9,3401.33,3577.1,14.5142,NULL),
(26189,10,3397.52,3568.71,14.4331,NULL),
(26189,11,3396.61,3560.96,15.3359,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
