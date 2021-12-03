-- DB update 2021_12_03_00 -> 2021_12_03_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_03_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_03_00 2021_12_03_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1638535898737855299'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1638535898737855299');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 2916;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 2916;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 291600;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2916,0,0,0,20,0,100,0,724,0,0,0,0,80,291600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Historian Karnik - On Quest ''Prospect of Faith'' Rewarded - Call Timed Action List'),

(291600,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Historian Karnik - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(291600,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,2.30863,'Historian Karnik - On Script - Set Orientation'),
(291600,9,2,0,0,0,100,0,1000,1000,0,0,0,11,4985,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Historian Karnik - On Script - Cast ''Summon Hammertoe''s Spirit'''),
(291600,9,3,0,0,0,100,0,0,0,0,0,0,12,2915,3,21000,0,0,0,8,0,0,0,0,-4633.14,-1324.99,503.383,5.44702,'Historian Karnik - On Script - Summon Creature ''Hammertoe''s Spirit'''),
(291600,9,4,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,19,2915,0,0,0,0,0,0,0,'Historian Karnik - On Script - Say Line 0 (Hammertoe''s Spirit)'),
(291600,9,5,0,0,0,100,0,7000,7000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Historian Karnik - On Script - Say Line 0'),
(291600,9,6,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,19,2915,0,0,0,0,0,0,0,'Historian Karnik - On Script - Say Line 1 (Hammertoe''s Spirit)'),
(291600,9,7,0,0,0,100,0,8000,8000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Historian Karnik - On Script - Say Line 1'),
(291600,9,8,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Historian Karnik - On Script - Reset Orientation'),
(291600,9,9,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Historian Karnik - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
