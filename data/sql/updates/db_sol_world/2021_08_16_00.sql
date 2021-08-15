-- DB update 2021_08_15_02 -> 2021_08_16_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_15_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_15_02 2021_08_16_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1629067120844075140'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1629067120844075140');

DELETE FROM `creature_text` WHERE `CreatureId` = 9598;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(9598,0,0,'Please, help me to get through this cursed forest, $r.',12,0,100,0,0,0,5004,0,'Arei'),
(9598,1,0,'The corruption of Felwood has trapped my spirit here... I may never rest...',12,0,100,0,0,0,5037,0,'Arei'),
(9598,2,0,'That I must fight against my own kind deeply saddens me.',12,0,100,0,0,0,5008,0,'Arei'),
(9598,3,0,'The corruption of the fel has not left any of the creatures of Felwood untouched, $n. Please, be on your guard.',12,0,100,0,0,0,5005,0,'Arei'),
(9598,4,0,'I can sense it now, $n. Ashenvale lies down this path.',12,0,100,0,0,0,5023,0,'Arei'),
(9598,5,0,'I feel... something strange...',12,0,100,0,0,0,5026,0,'Arei'),
(9598,6,0,'$n, my form has now changed! The true strength of my spirit is returning to me now... The cursed grasp of the forest is leaving me.',12,0,100,0,0,0,5029,0,'Arei'),
(9598,7,0,'Thank you, $n. Now my spirit will finally be at peace.',12,0,100,0,0,0,5036,0,'Arei'),
(9598,8,0,'I sense the taint of corruption upon this $n. Help me destroy it!',12,0,100,0,0,0,5473,0,'Arei'),
(9598,8,1,'This creature suffers from the effects of the fel... We must end its misery.',12,0,100,0,0,0,5474,0,'Arei'),
(9598,8,2,'This $n has been driven mad from the corruption!',12,0,100,0,0,0,5475,0,'Arei');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 9598;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (959800,959801);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(9598,0,0,1,19,0,100,0,4261,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Arei - On Quest ''Ancient Spirit'' Accepted - Store Targetlist 1 (Invoker)'),
(9598,0,1,2,61,0,100,0,0,0,0,0,0,64,2,0,0,0,0,0,16,0,0,0,0,0,0,0,0,'Arei - Linked - Store Targetlist 2 (Invoker Party)'),
(9598,0,2,0,61,0,100,0,0,0,0,0,0,80,959800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arei - Linked - Call Timed Action List'),
(9598,0,3,4,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Arei - On Death - Say Line 1'),
(9598,0,4,0,61,0,100,0,0,0,0,0,0,6,4261,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Arei - Linked - Fail Quest ''Ancient Spirit'''),
(9598,0,5,6,40,0,100,0,13,9598,0,0,0,54,8000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arei - On WP 13 Reached - Pause WP Movement'),
(9598,0,6,0,61,0,100,0,0,0,0,0,0,1,3,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Arei - Linked - Say Line 3'),
(9598,0,7,0,40,0,100,0,22,9598,0,0,0,1,2,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Arei - On WP 22 Reached - Say Line 2'),
(9598,0,8,9,40,0,100,0,34,0,0,0,0,12,7138,4,30000,0,1,0,8,0,0,0,0,6534.9,-1203.5,436.73,3.14,'Arei - On WP 34 Reached - Summon Creature ''Irontree Wanderer'''),
(9598,0,9,10,61,0,100,0,0,0,0,0,0,12,7138,4,30000,0,1,0,8,0,0,0,0,6527.64,-1196.54,435.9,3.9,'Arei - Linked - Summon Creature ''Irontree Wanderer'''),
(9598,0,10,0,61,0,100,0,0,0,0,0,0,12,7138,4,30000,0,1,0,8,0,0,0,0,6532.7,-1216.04,434.4,2.4,'Arei - Linked - Summon Creature ''Irontree Wanderer'''),
(9598,0,11,12,40,0,100,0,38,9598,0,0,0,54,23000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arei - On Waypoint 38 Reached - Pause WP Movement'),
(9598,0,12,0,61,0,100,0,0,0,0,0,0,80,959801,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arei - Linked - Call Timed Action List'),
(9598,0,13,0,4,0,50,0,0,0,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arei - On Aggro - Say Line 8'),
(9598,0,14,0,0,0,100,0,6000,9000,16000,21000,0,11,5337,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Arei - IC - Cast ''Wither Strike'''),

(959800,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arei - On Script - Remove ''UNIT_NPC_FLAG_QUESTGIVER'''),
(959800,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Arei - On Script - Say Line 0'),
(959800,9,2,0,0,0,100,0,5000,5000,0,0,0,53,0,9598,0,0,1000,2,12,1,0,0,0,0,0,0,0,'Arei - On Script - Start WP Movement'),
(959800,9,3,0,0,0,100,0,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arei - On Script - Set Faction 250'),

(959801,9,0,0,0,0,100,0,0,0,0,0,0,2,124,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arei - On Script - Set Faction 124'),
(959801,9,1,0,0,0,100,0,1000,1000,0,0,0,1,4,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Arei - On Script - Say Line 4'),
(959801,9,2,0,0,0,100,0,5000,5000,0,0,0,1,5,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Arei - On Script - Say Line 5'),
(959801,9,3,0,0,0,100,0,2000,2000,0,0,0,11,14888,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arei - On Script - Cast ''Arei Transform'''),
(959801,9,4,0,0,0,100,0,3000,3000,0,0,0,1,6,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Arei - On Script - Say Line 6'),
(959801,9,5,0,0,0,100,0,8000,8000,0,0,0,1,7,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Arei - On Script - Say Line 7'),
(959801,9,6,0,0,0,100,0,0,0,0,0,0,15,4261,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Arei - On Script - Complete Quest ''Ancient Spirit''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
