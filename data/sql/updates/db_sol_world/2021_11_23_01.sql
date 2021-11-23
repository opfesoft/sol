-- DB update 2021_11_23_00 -> 2021_11_23_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_23_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_23_00 2021_11_23_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1637657160162918730'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1637657160162918730');

UPDATE `creature` SET `position_x` = -5708.56, `position_y` = 3375.82, `position_z` = 63.0856, `wander_distance` = 25, `MovementType` = 1 WHERE `guid` = 49970;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 12803;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 12803;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(12803,0,0,0,16,0,100,0,20545,1,15000,30000,0,11,20545,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Lakmaeran - On Friendly Unit Missing Buff ''Lightning Shield'' - Cast ''Lightning Shield'''),
(12803,0,1,0,0,0,100,0,3000,5000,12000,16000,0,11,20543,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lord Lakmaeran - IC - Cast ''Lightning Breath'''),
(12803,0,2,0,0,0,100,0,6000,12000,19000,21000,0,11,20542,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Lord Lakmaeran - IC - Cast ''Static Conduit'''),
(12803,0,3,4,2,0,100,1,0,20,0,0,0,11,8269,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Lakmaeran - Between 0-20% Health - Cast ''Frenzy'' (No Repeat)'),
(12803,0,4,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Lakmaeran - Linked - Say Line 0');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
