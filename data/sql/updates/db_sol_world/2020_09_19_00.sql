-- DB update 2020_09_14_00 -> 2020_09_19_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_09_14_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_09_14_00 2020_09_19_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1600528865301780287'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1600528865301780287');

UPDATE `creature` SET `MovementType` = 0 WHERE `guid` = 105492;
UPDATE `creature_addon` SET `path_id` = 0 WHERE `guid` = 105492;
DELETE FROM `waypoint_data` WHERE `id` = 1054920;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 29802 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 2980200 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(29802,0,0,0,11,0,100,0,0,0,0,0,0,80,2980200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cosmetic Toy Plane - On Respawn - Call Timed Action List'),

(2980200,9,0,0,0,0,100,0,2000,2000,0,0,0,60,1,35,1,0,0,0,1,0,0,0,0,0,0,0,0,'Cosmetic Toy Plane - On Script - Set Fly On Disable Gravity'),
(2980200,9,1,0,0,0,100,0,0,0,0,0,0,231,4,0,16,0,0,0,11,29807,5,0,0,0,0,-1.5,0,'Cosmetic Toy Plane - On Script - Start Circle Movement');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
