-- DB update 2021_06_04_01 -> 2021_06_07_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_04_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_04_01 2021_06_07_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1623058526940302365'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1623058526940302365');

UPDATE `creature_template` SET `faction` = 79 WHERE `entry` = 3568;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 3568;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (356800,356801);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3568,0,0,0,11,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mist - On Respawn - Add ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(3568,0,1,0,19,0,100,0,938,0,0,0,0,80,356800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mist - On Quest ''Mist'' Accepted - Call Timed Action List'),
(3568,0,2,0,75,0,100,1,0,3519,5,0,0,80,356801,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mist - On ''Sentinel Arynia Cloudsbreak'' Within 5y Distance - Call Timed Action List (No Repeat)'),
(3568,0,3,0,6,0,100,0,0,0,0,0,0,6,938,0,0,0,0,0,12,0,0,0,0,0,0,0,0,'Mist - On Death - Fail Quest ''Mist'''),
(3568,0,4,0,4,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mist - On Aggro - Set Home Position'),

(356800,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mist - On Script - Set Active On'),
(356800,9,1,0,0,0,100,0,0,0,0,0,0,64,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mist - On Script - Store Target ID 0 (Invoker)'),
(356800,9,2,0,0,0,100,0,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mist - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(356800,9,3,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mist - On Script - Remove ''UNIT_NPC_FLAG_QUESTGIVER'''),
(356800,9,4,0,0,0,100,0,0,0,0,0,0,29,1,180,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mist - On Script - Start Follow Invoker'),
(356800,9,5,0,0,0,100,0,540000,540000,0,0,0,6,928,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mist - On Script - Fail Quest ''Mist'''),
(356800,9,6,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mist - On Script - Force Despawn'),

(356801,9,0,0,0,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Mist - On Script - Stop Follow'),
(356801,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,19,3519,20,0,0,0,0,0,0,'Mist - On Script - Say Line 0 (Sentinel Arynia Cloudsbreak)'),
(356801,9,2,0,0,0,100,0,2000,2000,0,0,0,15,938,0,0,0,0,0,12,0,0,0,0,0,0,0,0,'Mist - On Script - Complete Quest ''Mist'' (Stored Target ID 0)'),
(356801,9,3,0,0,0,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mist - On Script - Say Line 0'),
(356801,9,4,0,0,0,100,0,4000,4000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mist - On Script - Despawn');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
