-- DB update 2022_02_27_00 -> 2022_02_27_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_27_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_27_00 2022_02_27_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1645969262473223935'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1645969262473223935');

UPDATE `quest_template` SET `RewardNextQuest` = 0 WHERE `ID` = 9443;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 17099;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 17099;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1709900;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17099,0,0,0,20,0,100,0,9443,0,0,0,0,80,1709900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mehlar Dawnblade - On Quest ''The So-Called Mark of the Lightbringer'' Rewarded - Call Timed Action List'),

(1709900,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mehlar Dawnblade - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(1709900,9,1,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mehlar Dawnblade - On Script - Say Line 0'),
(1709900,9,2,0,0,0,100,0,3000,3000,0,0,0,11,16633,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mehlar Dawnblade - On Script - Cast ''Create Item Visual (DND)'''),
(1709900,9,3,0,0,0,100,0,7000,7000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mehlar Dawnblade - On Script - Say Line 1'),
(1709900,9,4,0,0,0,100,0,5000,5000,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mehlar Dawnblade - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
