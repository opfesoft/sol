-- DB update 2020_07_11_01 -> 2020_07_14_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_07_11_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_07_11_01 2020_07_14_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1594712253810562319'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1594712253810562319');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (31310,31313,31328,31330) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 3131009 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(31310,0,0,0,11,0,100,0,0,0,0,0,0,80,3131009,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fleeing Alliance Soldier - On Respawn - Call Timed Action List'),
(31310,0,1,0,1,0,100,0,3000,6000,3000,6000,0,87,3131000,3131001,3131002,3131003,3131004,0,1,0,0,0,0,0,0,0,0,'Fleeing Alliance Soldier - OOC - Run Random Script'),

(31313,0,0,0,11,0,100,0,0,0,0,0,0,80,3131009,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fleeing Alliance Soldier - On Respawn - Call Timed Action List'),
(31313,0,1,0,1,0,100,0,3000,6000,3000,6000,0,87,3131005,3131006,3131007,3131008,0,0,1,0,0,0,0,0,0,0,0,'Fleeing Alliance Soldier - OOC - Run Random Script'),

(31328,0,0,0,11,0,100,0,0,0,0,0,0,80,3131009,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fleeing Horde Soldier - On Respawn - Call Timed Action List'),
(31328,0,1,0,1,0,100,0,3000,6000,3000,6000,0,87,3131000,3131001,3131002,3131003,3131004,0,1,0,0,0,0,0,0,0,0,'Fleeing Horde Soldier - OOC - Run Random Script'),

(31330,0,0,0,11,0,100,0,0,0,0,0,0,80,3131009,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fleeing Horde Soldier - On Respawn - Call Timed Action List'),
(31330,0,1,0,1,0,100,0,3000,6000,3000,6000,0,87,3131005,3131006,3131007,3131008,0,0,1,0,0,0,0,0,0,0,0,'Fleeing Horde Soldier - OOC - Run Random Script'),

(3131009,9,0,0,0,0,100,0,0,0,0,0,0,17,431,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fleeing Soldier - On Script - Set Emote State ''STATE_COWER'''),
(3131009,9,1,0,0,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fleeing Soldier - On Script - Set Run On'),
(3131009,9,2,0,0,0,100,0,0,0,0,0,0,89,30,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fleeing Soldier - On Script - Set Random Movement');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
