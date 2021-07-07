-- DB update 2021_07_07_01 -> 2021_07_08_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_07_07_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_07_07_01 2021_07_08_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1625698438367384423'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1625698438367384423');

UPDATE `creature` SET `MovementType` = 0 WHERE `guid` = 132984;
UPDATE `creature_addon` SET `path_id` = 0 WHERE `guid` = 132984;
DELETE FROM `waypoint_data` WHERE `id` = 1329840;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = -132984;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-132984,0,1,0,4,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'D.E.H.T.A. Enforcer - On Aggro - Say Line 0'),
(-132984,0,2,0,10,0,100,0,1,20,0,0,0,49,0,0,0,0,0,0,25,20,1,0,0,0,0,0,0,'D.E.H.T.A. Enforcer - Within 1-20 Range Out of Combat LoS - Start Attacking'),
(-132984,0,3,0,11,0,100,0,0,0,0,0,0,231,20,0,16,0,5,0,8,0,0,0,0,3208.75,5279.98,59.1743,0,'D.E.H.T.A. Enforcer - On Respawn - Start Circle Movement'),
(-132984,0,4,0,21,0,100,0,0,0,0,0,0,231,20,0,16,0,5,0,8,0,0,0,0,3208.75,5279.98,59.1743,0,'D.E.H.T.A. Enforcer - On Reached Home - Start Circle Movement');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
