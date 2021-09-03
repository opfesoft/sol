-- DB update 2021_09_03_01 -> 2021_09_03_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_03_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_03_01 2021_09_03_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1630678605180694281'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1630678605180694281');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 4969;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (4961,4969);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (496100,496101);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4961,0,0,1,25,0,100,0,0,0,0,0,0,2,84,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dashel Stonefist - On Reset - Set Faction 84'),
(4961,0,1,0,61,0,100,0,0,0,0,0,0,42,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dashel Stonefist - Linked - Reset Invincibility HP Level'),
(4961,0,2,0,13,0,100,0,6000,21000,0,0,0,11,12555,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dashel Stonefist - On Victim Casting - Cast ''Pummel'''),
(4961,0,3,4,19,0,100,0,1447,0,0,0,0,2,17,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dashel Stonefist - On Quest ''The Missing Diplomat'' Accepted - Set Faction 17'),
(4961,0,4,5,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Dashel Stonefist - Linked - Start Attack (Invoker)'),
(4961,0,5,0,61,0,100,0,0,0,0,0,0,80,496100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dashel Stonefist - Linked - Call Timed Action List'),
(4961,0,6,0,2,0,100,0,0,15,0,0,0,80,496101,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dashel Stonefist - Between 0-15% Health - Call Timed Action List'),

(496100,9,0,0,0,0,100,0,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dashel Stonefist - On Script - Set Invincibility HP Level 1'),
(496100,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dashel Stonefist - On Script - Say Line 0'),
(496100,9,2,0,0,0,100,0,2000,2000,0,0,0,12,4969,4,10000,0,0,0,8,0,0,0,0,-8678.25,440.953,99.6209,4.36482,'Dashel Stonefist - On Script - Summon Creature ''Old Town Thug'''),
(496100,9,3,0,0,0,100,0,0,0,0,0,0,12,4969,4,10000,0,0,0,8,0,0,0,0,-8682.47,441.471,99.5313,4.87139,'Dashel Stonefist - On Script - Summon Creature ''Old Town Thug'''),
(496100,9,4,0,0,0,100,0,1000,1000,0,0,0,39,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dashel Stonefist - On Script - Call For Help'),

(496101,9,0,0,0,0,100,0,0,0,0,0,0,15,1447,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Dashel Stonefist - On Script - Quest Credit ''The Missing Diplomat'''),
(496101,9,1,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,11,4969,10,0,0,0,0,0,0,'Dashel Stonefist - On Script - Set Data 1 1 (Old Town Thug)'),
(496101,9,2,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dashel Stonefist - On Script - Evade'),
(496101,9,3,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dashel Stonefist - On Script - Say Line 1'),
(496101,9,4,0,0,0,100,0,6000,6000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dashel Stonefist - On Script - Say Line 2'),

(4969,0,0,0,38,0,100,0,1,1,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Old Town Thug - On Data Set 1 1 - Set Faction 35');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
