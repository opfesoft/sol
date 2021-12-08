-- DB update 2021_12_08_00 -> 2021_12_08_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_08_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_08_00 2021_12_08_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1638978374206803150'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1638978374206803150');

DELETE FROM `event_scripts` WHERE `id` = 4975;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(4975,0,10,10737,30000,4,8074.45,-3816.49,690.339,4.59321);

UPDATE `creature_template` SET `faction` = 35 WHERE `entry` = 10741;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 10741;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (10737,10741);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1074100;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10737,0,0,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,0,0,0,0,0,0,0,0,'Shy-Rotam - On Just Summoned - Start Attack (Closest Player)'),
(10737,0,1,0,0,0,100,0,8000,11000,12000,18000,0,11,14100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shy-Rotam - IC - Cast ''Terrifying Roar'''),
(10737,0,2,0,0,0,100,0,5000,9000,13000,16000,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Shy-Rotam - IC - Cast ''Rend'''),
(10737,0,3,0,0,0,100,0,1000,2000,15000,20000,0,11,3604,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Shy-Rotam - IC - Cast ''Tendon Rip'''),
(10737,0,4,5,2,0,100,1,0,50,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shy-Rotam - Between 0-50% Health - Say Line 0 (No Repeat)'),
(10737,0,5,0,61,0,100,0,0,0,0,0,0,12,10741,4,30000,0,0,0,1,0,0,0,0,0,0,0,0,'Shy-Rotam - Linked - Summon Creature ''Sian-Rotam'''),
(10737,0,6,0,6,0,100,0,0,0,0,0,0,26,5056,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Shy-Rotam - On Death - Reward Quest ''Shy-Rotam'''),

(10741,0,0,0,54,0,100,0,0,0,0,0,0,80,1074100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sian-Rotam - On Just Summoned - Call Timed Action List'),
(10741,0,1,0,0,0,100,0,8000,11000,12000,18000,0,11,14100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sian-Rotam - IC - Cast ''Terrifying Roar'''),
(10741,0,2,0,0,0,100,0,5000,9000,13000,16000,0,11,13443,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sian-Rotam - IC - Cast ''Rend'''),
(10741,0,3,0,0,0,100,0,1000,2000,15000,20000,0,11,3604,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sian-Rotam - IC - Cast ''Tendon Rip'''),

(1074100,9,0,0,0,0,100,0,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sian-Rotam - On Script - Set Visibility Off'),
(1074100,9,1,0,0,0,100,0,0,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sian-Rotam - On Script - Enable Random Movement'),
(1074100,9,2,0,0,0,100,0,5000,10000,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sian-Rotam - On Script - Set Visibility On'),
(1074100,9,3,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sian-Rotam - On Script - Say Line 0'),
(1074100,9,4,0,0,0,100,0,0,0,0,0,0,2,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sian-Rotam - On Script - Set Faction ''Monster'''),
(1074100,9,5,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,0,0,0,0,0,0,0,0,'Sian-Rotam - On Script - Start Attack (Closest Player)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
