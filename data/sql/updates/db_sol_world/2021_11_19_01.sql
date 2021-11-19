-- DB update 2021_11_19_00 -> 2021_11_19_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_19_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_19_00 2021_11_19_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1637360619928236016'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1637360619928236016');

UPDATE `creature_template` SET `unit_flags` = 898 WHERE `entry` IN (5772,5773);
UPDATE `creature_template` SET `unit_class` = 2, `AIName` = 'SmartAI' WHERE `entry` = 4498;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 4498;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 449800;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4498,0,0,0,20,0,100,0,1482,0,0,0,0,80,449800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maurin Bonesplitter - On Quest ''The Corruptor'' Rewarded - Call Timed Action List'),

(449800,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maurin Bonesplitter - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(449800,9,1,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maurin Bonesplitter - On Script - Say Line 0'),
(449800,9,2,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maurin Bonesplitter - On Script - Say Line 1'),
(449800,9,3,0,0,0,100,0,0,0,0,0,0,11,7960,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maurin Bonesplitter - On Script - Cast ''Scry on Azrethoc'''),
(449800,9,4,0,0,0,100,0,2500,2500,0,0,0,12,5773,1,24000,0,0,0,8,0,0,0,0,-1152.95,1887.87,88.8724,5.4946,'Maurin Bonesplitter - On Script - Summon Creature ''Jugkar Grim''rod''s Image'''),
(449800,9,5,0,0,0,100,0,0,0,0,0,0,2,90,0,0,0,0,0,19,5773,0,0,0,0,0,0,0,'Maurin Bonesplitter - On Script - Set Faction ''Demon'' (Jugkar Grim''rod''s Image)'),
(449800,9,6,0,0,0,100,0,0,0,0,0,0,86,51347,0,19,5773,0,0,1,0,0,0,0,0,0,0,0,'Maurin Bonesplitter - On Script - Cross Cast ''Teleport Visual Only'' (Jugkar Grim''rod''s Image)'),
(449800,9,7,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,19,5773,0,0,0,0,0,0,0,'Maurin Bonesplitter - On Script - Say Line 0 (Jugkar Grim''rod''s Image)'),
(449800,9,8,0,0,0,100,0,5000,5000,0,0,0,12,5772,1,16000,0,0,0,8,0,0,0,0,-1154.38,1892.2,88.871,5.1961,'Maurin Bonesplitter - On Script - Summon Creature ''Lord Azrethoc''s Image'''),
(449800,9,9,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,19,5772,0,0,0,0,0,0,0,'Maurin Bonesplitter - On Script - Say Line 0 (Lord Azrethoc''s Image)'),
(449800,9,10,0,0,0,100,0,3000,3000,0,0,0,1,1,0,0,0,0,0,19,5772,0,0,0,0,0,0,0,'Maurin Bonesplitter - On Script - Say Line 1 (Lord Azrethoc''s Image)'),
(449800,9,11,0,0,0,100,0,0,0,0,0,0,86,7961,0,19,5772,0,0,1,0,0,0,0,0,0,0,0,'Maurin Bonesplitter - On Script - Crosscast Spell ''Azrethoc''s Stomp'' (Lord Azrethoc''s Image)'),
(449800,9,12,0,0,0,100,0,3000,3000,0,0,0,1,2,0,0,0,0,0,19,5772,0,0,0,0,0,0,0,'Maurin Bonesplitter - On Script - Say Line 2 (Lord Azrethoc''s Image)'),
(449800,9,13,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,19,5773,0,0,0,0,0,0,0,'Maurin Bonesplitter - On Script - Say Line 1 (Jugkar Grim''rod''s Image)'),
(449800,9,14,0,0,0,100,0,4000,4000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maurin Bonesplitter - On Script - Say Line 2'),
(449800,9,15,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maurin Bonesplitter - On Script - Add ''GOSSIP_OPTION_QUESTGIVER''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
