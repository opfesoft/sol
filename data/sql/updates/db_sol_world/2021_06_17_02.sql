-- DB update 2021_06_17_01 -> 2021_06_17_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_17_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_17_01 2021_06_17_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1623944132920249440'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1623944132920249440');

-- "The Missing Diplomat", part 12, was missing, add it to the quest chain:
UPDATE `quest_template_addon` SET `NextQuestID` = 1250 WHERE `id`=1249;
UPDATE `quest_template_addon` SET `PrevQuestID` = 1250 WHERE `id`=1264;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` IN (4963,4962);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (4963,4962,4971);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (496300,496200,497100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4963,0,0,0,64,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,10873,4962,1,0,0,0,0,0,'Mikhail - On Gossip Hello - Respawn Target (Tapoke "Slim" Jahn)'),
(4963,0,1,2,19,0,100,0,1249,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mikhail - On Quest ''The Missing Diplomat (Part 11)'' Taken - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(4963,0,2,3,61,0,100,0,1249,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mikhail - Linked - Set Active On'),
(4963,0,3,4,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,10873,0,0,0,0,0,0,0,'Mikhail - Linked - Set Data 1 1 (Tapoke "Slim" Jahn)'),
(4963,0,4,5,61,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mikhail - Linked - Store Target ID 1'),
(4963,0,5,0,61,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,10,10873,0,0,0,0,0,0,0,'Mikhail - Linked - Send Stored Target ID 1 (Tapoke "Slim" Jahn)'),
(4963,0,6,0,38,0,100,0,1,1,0,0,0,80,496300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mikhail - On Data Set 1 1 - Call Timed Action List'),

(496300,9,0,0,0,0,100,0,10000,10000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mikhail - On Script - Say Line 0'),
(496300,9,1,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mikhail - On Script - Add ''GOSSIP_OPTION_QUESTGIVER'''),
(496300,9,2,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mikhail - On Script - Set Active Off'),

(4962,0,0,0,11,0,100,0,0,0,0,0,0,42,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - On Respawn - Reset Invincibility HP'),
(4962,0,1,2,38,0,100,0,1,1,0,0,0,53,0,4962,0,0,0,2,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - On Data Set 1 1 - Start WP Movement'),
(4962,0,2,3,61,0,100,0,0,0,0,0,0,11,1785,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - Linked - Cast ''Stealth'''),
(4962,0,3,4,61,0,100,0,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - Linked - Set Invincibility at 1 HP'),
(4962,0,4,0,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - Linked - Set Active On'),
(4962,0,5,6,40,0,100,0,4,4962,0,0,0,2,168,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - On WP 4 Reached - Set Faction 168'),
(4962,0,6,7,61,0,100,0,0,0,0,0,0,28,1785,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - Linked - Remove Aura ''Stealth'''),
(4962,0,7,0,61,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - Linked - Set Run On'),
(4962,0,8,9,40,0,100,0,14,4962,0,0,0,6,1249,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - On WP 14 Reached - Fail Quest ''The Missing Diplomat (Part 11)'''),
(4962,0,9,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - Linked - Force Despawn'),
(4962,0,10,11,4,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - On Aggro - Say Line 0'),
(4962,0,11,0,61,0,100,0,0,0,0,0,0,11,16457,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - Linked - Cast ''Call Friends'''),
(4962,0,12,0,2,0,100,1,0,20,0,0,0,80,496200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - Between 0-20% Health - Call Timed Action List'),
(4962,0,13,0,36,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,9432,4963,1,0,0,0,0,0,'Tapoke "Slim" Jahn - On Corpse Removed - Set Data 1 1 (Mikhail)'),

(496200,9,0,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,4971,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - On Script - Set Data 1 1 (Slim''s Friend)'),
(496200,9,1,0,0,0,100,0,0,0,0,0,0,2,123,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - On Script - Set Faction 123'),
(496200,9,2,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - On Script - Evade'),
(496200,9,3,0,0,0,100,0,0,0,0,0,0,55,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - On Script - Stop WP Movement'),
(496200,9,4,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - On Script - Set Orientation'),
(496200,9,5,0,0,0,100,0,1000,1000,0,0,0,5,20,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - On Script - Play Emote ''ONESHOT_BEG'''),
(496200,9,6,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - On Script - Say Line 1'),
(496200,9,7,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - On Script - Say Line 2'),
(496200,9,8,0,0,0,100,0,6000,6000,0,0,0,15,1249,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - On Script - Complete Quest ''The Missing Diplomat (Part 11)'''),
(496200,9,9,0,0,0,100,0,1000,1000,0,0,0,45,1,1,0,0,0,0,10,9432,4963,1,0,0,0,0,0,'Tapoke "Slim" Jahn - On Script - Set Data 1 1 (Mikhail)'),
(496200,9,10,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tapoke "Slim" Jahn - On Script - Force Despawn'),

(4971,0,0,1,54,0,100,0,0,0,0,0,0,75,3616,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slim''s Friend - On Just Summoned - Add Aura ''Poison Proc'''),
(4971,0,1,0,61,0,100,0,0,0,0,0,0,75,8601,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slim''s Friend - Linked - Add Aura ''Slowing Poison'''),
(4971,0,2,0,67,0,100,0,3000,6000,0,0,0,11,2589,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Slim''s Friend - On Behind Target - Cast ''Backstab'''),
(4971,0,3,0,38,0,100,0,1,1,0,0,0,80,497100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slim''s Friend - On Data Set 1 1 - Call Timed Action List'),
(4971,0,4,0,1,0,100,0,6000,6000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slim''s Friend - OOC - Force Despawn'),

(497100,9,0,0,0,0,100,0,0,0,0,0,0,2,123,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slim''s Friend - On Script - Set Faction 123'),
(497100,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slim''s Friend - On Script - Say Line 0'),
(497100,9,2,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slim''s Friend - On Script - Evade');

DELETE FROM `script_waypoint` WHERE `entry` = 4962;
DELETE FROM `waypoints` WHERE `entry` = 4962;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(4962,1,-3804.44,-828.048,10.0931,'Tapoke "Slim" Jahn'),
(4962,2,-3803.93,-835.772,10.0777,NULL),
(4962,3,-3795.21,-835.694,10.0777,NULL),
(4962,4,-3792.63,-835.671,9.65566,NULL),
(4962,5,-3772.43,-835.346,10.869,NULL),
(4962,6,-3765.94,-840.129,10.8856,NULL),
(4962,7,-3761.3,-838.577,10.9738,NULL),
(4962,8,-3750.29,-834.895,10.0476,NULL),
(4962,9,-3738.63,-830.997,11.0574,NULL),
(4962,10,-3729.16,-837.111,12.4805,NULL),
(4962,11,-3721.36,-842.152,11.6185,NULL),
(4962,12,-3713.67,-847.115,10.1668,NULL),
(4962,13,-3706.18,-851.958,10.7293,NULL),
(4962,14,-3690.22,-862.262,9.96045,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
