-- DB update 2020_11_02_01 -> 2020_11_02_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_11_02_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_11_02_01 2020_11_02_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1604354793897413961'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1604354793897413961');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (32233,32247,32248);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (32233,32247,32248) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 3223300 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(32233,0,0,0,1,0,100,1,0,0,0,0,0,80,3223300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Trusty Copper Racer - OOC - Call Timed Action List (No Repeat)'),

(32247,0,0,0,1,0,100,1,0,0,0,0,0,80,3223300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zippy Copper Racer - OOC - Call Timed Action List (No Repeat)'),

(32248,0,0,0,1,0,100,1,0,0,0,0,0,80,3223300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heavy Copper Racer - OOC - Call Timed Action List (No Repeat)'),

(3223300,9,0,0,0,0,100,0,3000,3000,0,0,0,11,60081,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Trusty Copper Racer - On Script - Cast ''Cosmetic - Explosion'''),
(3223300,9,1,0,0,0,100,0,0,0,0,0,0,75,61364,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Trusty Copper Racer - On Script - Add Aura ''[DND] Smoke Trail'''),
(3223300,9,2,0,0,0,100,0,0,0,0,0,0,46,20,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Trusty Copper Racer - On Script - Move Forward 20y'),
(3223300,9,3,0,0,0,100,0,3000,3000,0,0,0,28,61364,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Trusty Copper Racer - On Script - Remove Aura ''[DND] Smoke Trail'''),
(3223300,9,4,0,0,0,100,0,7000,7000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Trusty Copper Racer - On Script - Force Despawn');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
