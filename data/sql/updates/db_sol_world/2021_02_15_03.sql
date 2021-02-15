-- DB update 2021_02_15_02 -> 2021_02_15_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_15_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_15_02 2021_02_15_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1613386203968030221'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1613386203968030221');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 3894;
DELETE FROM `smart_scripts` WHERE `source_type`= 0 AND `entryorguid` = 3894;
DELETE FROM `smart_scripts` WHERE `source_type`= 9 AND `entryorguid` IN (389400,389401,389402,389403);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3894,0,0,0,20,0,100,0,1020,0,0,0,0,80,389400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Quest ''Orendil''s Cure'' Finished - Call Timed Action List'),
(3894,0,1,0,20,0,100,0,1033,0,0,0,0,80,389401,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Quest ''Elune''s Tear'' Finished - Call Timed Action List'),
(3894,0,2,0,20,0,100,0,1034,0,0,0,0,80,389402,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Quest ''The Ruins of Stardust'' Finished - Call Timed Action List'),
(3894,0,3,0,20,0,100,0,1035,0,0,0,0,80,389403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Quest ''Fallen Sky Lake'' Finished - Call Timed Action List'),

(389400,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Remove NPC Flag ''Questgiver'''),
(389400,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,19,3892,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Set Orientation'),
(389400,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 0'),
(389400,9,3,0,0,0,100,0,2000,2000,0,0,0,100,1,0,0,0,0,0,19,3892,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Send Target'),
(389400,9,4,0,0,0,100,0,0,0,0,0,0,45,0,1,0,0,0,0,19,3892,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Set Data'),
(389400,9,5,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Set Orientation'),
(389400,9,6,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,19,3892,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 1 (Relara Whitemoon)'),
(389400,9,7,0,0,0,100,0,3000,3000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 1'),
(389400,9,8,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,19,3892,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Set Orientation'),
(389400,9,9,0,0,0,100,0,2000,2000,0,0,0,1,2,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 2'),
(389400,9,10,0,0,0,100,0,3000,3000,0,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Set Orientation'),
(389400,9,11,0,0,0,100,0,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Play Emote ''ONESHOT_BOW'''),
(389400,9,12,0,0,0,100,0,3000,3000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Set Orientation'),
(389400,9,13,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Add NPV Flag ''Questgiver'''),

(389401,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Remove NPC Flag ''Questgiver'''),
(389401,9,1,0,0,0,100,0,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 3'),
(389401,9,2,0,0,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Set Run Off'),
(389401,9,3,0,0,0,100,0,2000,2000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,2682.65,-456.624,109.234,0,'Pelturas Whitemoon - On Script - Move to Position'),
(389401,9,4,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,19,3892,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Set Orientation'),
(389401,9,5,0,0,0,100,0,1000,1000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 4'),
(389401,9,6,0,0,0,100,0,4000,4000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 5'),
(389401,9,7,0,0,0,100,0,3000,3000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,2682.14,-454.808,109.233,0,'Pelturas Whitemoon - On Script - Move to Position'),
(389401,9,8,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,19,3892,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 2 (Relara Whitemoon)'),
(389401,9,9,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Set Orientation'),
(389401,9,10,0,0,0,100,0,1000,1000,0,0,0,1,3,0,0,0,0,0,19,3892,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 3 (Relara Whitemoon)'),
(389401,9,11,0,0,0,100,0,1000,1000,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Add NPC Flag ''Questgiver'''),

(389402,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Remove NPC Flag ''Questgiver'''),
(389402,9,1,0,0,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Set Run Off'),
(389402,9,2,0,0,0,100,0,1000,1000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,2682.65,-456.624,109.234,0,'Pelturas Whitemoon - On Script - Move to Position'),
(389402,9,3,0,0,0,100,0,1500,1500,0,0,0,66,0,0,0,0,0,0,19,3892,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Set Orientation'),
(389402,9,4,0,0,0,100,0,1000,1000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 6'),
(389402,9,5,0,0,0,100,0,3000,3000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,2682.14,-454.808,109.233,0,'Pelturas Whitemoon - On Script - Move to Position'),
(389402,9,6,0,0,0,100,0,1500,1500,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Set Orientation'),
(389402,9,7,0,0,0,100,0,0,0,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 7'),
(389402,9,8,0,0,0,100,0,1000,1000,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Add NPC Flag ''Questgiver'''),

(389403,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Remove NPC Flag ''Questgiver'''),
(389403,9,1,0,0,0,100,0,0,0,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 8'),
(389403,9,2,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,19,3892,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Set Orientation'),
(389403,9,3,0,0,0,100,0,500,500,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 9'),
(389403,9,4,0,0,0,100,0,4000,4000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Set Orientation'),
(389403,9,5,0,0,0,100,0,2000,2000,0,0,0,1,4,0,0,0,0,0,19,3892,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 4 (Relara Whitemoon)'),
(389403,9,6,0,0,0,100,0,3000,3000,0,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 10'),
(389403,9,7,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,19,3892,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Set Orientation'),
(389403,9,8,0,0,0,100,0,4000,4000,0,0,0,1,11,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 11'),
(389403,9,9,0,0,0,100,0,2000,2000,0,0,0,1,12,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 12'),
(389403,9,10,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Set Orientation'),
(389403,9,11,0,0,0,100,0,0,0,0,0,0,1,13,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Say Line 13'),
(389403,9,12,0,0,0,100,0,2000,2000,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Play Emote ''ONESHOT_BOW'''),
(389403,9,13,0,0,0,100,0,3000,3000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Set Orientation'),
(389403,9,14,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pelturas Whitemoon - On Script - Add NPC Flag ''Questgiver''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
