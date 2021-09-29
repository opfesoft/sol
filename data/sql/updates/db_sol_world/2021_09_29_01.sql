-- DB update 2021_09_29_00 -> 2021_09_29_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_29_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_29_00 2021_09_29_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1632951851767348986'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1632951851767348986');

-- Remove obsolete WP paths / scripts
UPDATE `creature` SET `MovementType` = 0 WHERE `guid` = 58691;
UPDATE `creature_addon` SET `path_id` = 0 WHERE `guid` IN (58691,58702);
DELETE FROM `waypoint_data` WHERE `id` IN (586910,587020);
DELETE FROM `waypoint_scripts` WHERE `id` IN (66,67,68,69,71);

UPDATE `creature` SET `orientation` = 4.17894 WHERE `guid` = 58691; -- Wretched Captive

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (16916,16924);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1692400;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16916,0,0,1,38,0,100,0,1,1,0,0,0,5,20,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wretched Captive - On Data Set 1 1 - Play Emote ''ONESHOT_BEG'''),
(16916,0,1,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wretched Captive - Linked - Say Line 0'),
(16916,0,2,0,38,0,100,0,2,2,0,0,0,5,18,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wretched Captive - On Data Set 2 2 - Play Emote ''ONESHOT_CRY'''),

(16924,0,0,0,1,0,100,0,0,240000,180000,240000,0,80,1692400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sergeant Kan''ren - OOC - Call Timed Action List'),

(1692400,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sergeant Kan''ren - On Script - Say Line 0'),
(1692400,9,1,0,0,0,100,0,4000,4000,0,0,0,45,1,1,0,0,0,0,19,16916,15,0,0,0,0,0,0,'Sergeant Kan''ren - On Script - Set Data 1 1 (Wretched Captive)'),
(1692400,9,2,0,0,0,100,0,6000,6000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sergeant Kan''ren - On Script - Say Line 1'),
(1692400,9,3,0,0,0,100,0,5000,5000,0,0,0,45,2,2,0,0,0,0,19,16916,15,0,0,0,0,0,0,'Sergeant Kan''ren - On Script - Set Data 2 2 (Wretched Captive)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
