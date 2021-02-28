-- DB update 2021_02_27_00 -> 2021_02_28_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_27_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_27_00 2021_02_28_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1614550847436410642'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1614550847436410642');

UPDATE `creature_addon` SET `bytes1` = 0 WHERE `guid` = 21570;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 4452;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 4452;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (445200,445201,445202);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4452,0,0,0,20,0,100,0,1112,0,0,0,0,80,445200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Quest ''Parts for Kravel'' Finished - Call Timed Action List'),
(4452,0,1,0,20,0,100,0,1119,0,0,0,0,80,445201,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Quest ''Zanzil''s Mixture and a Fool''s Stout'' Finished - Call Timed Action List'),
(4452,0,2,0,20,0,100,0,1117,0,0,0,0,80,445202,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Quest ''Rumors for Kravel'' Finished - Call Timed Action List'),

(445200,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Remove NPC Flag Questgiver'),
(445200,9,1,0,0,0,100,0,1000,1000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(445200,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Say Line 0'),
(445200,9,3,0,0,0,100,0,1000,1000,0,0,0,50,19878,0,0,0,0,0,8,0,0,0,0,-6232.5,-3855.12,-58.75,3.97786,'Kravel Koalbeard - On Script - Summon Gameobject ''Parts Crate'''),
(445200,9,4,0,0,0,100,0,1000,1000,0,0,0,9,0,0,0,0,0,0,20,19878,10,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Activate GO ''Parts Crate'''),
(445200,9,5,0,0,0,100,0,3000,3000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Say Line 1'),
(445200,9,6,0,0,0,100,0,2000,2000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Say Line 2'),
(445200,9,7,0,0,0,100,0,2000,2000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(445200,9,8,0,0,0,100,0,2000,2000,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Add NPC Flag Questgiver'),

(445201,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Remove NPC Flag Questgiver'),
(445201,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Set Orientation (Invoker)'),
(445201,9,2,0,0,0,100,0,0,0,0,0,0,71,0,0,2703,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Equip Item 2703'),
(445201,9,3,0,0,0,100,0,1000,1000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Say Line 3'),
(445201,9,4,0,0,0,100,0,4000,4000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Say Line 4'),
(445201,9,5,0,0,0,100,0,3000,3000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Say Line 5'),
(445201,9,6,0,0,0,100,0,0,0,0,0,0,71,0,0,1911,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Equip Item 1911'),
(445201,9,7,0,0,0,100,0,2000,2000,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Add NPC Flag Questgiver'),
(445201,9,8,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Reset Orientation'),

(445202,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Remove NPC Flag Questgiver'),
(445202,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Set Orientation (Invoker)'),
(445202,9,2,0,0,0,100,0,1000,1000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Say Line 6'),
(445202,9,3,0,0,0,100,0,1000,1000,0,0,0,5,94,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Emote Dance'),
(445202,9,4,0,0,0,100,0,5000,5000,0,0,0,5,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Emote None'),
(445202,9,5,0,0,0,100,0,1000,1000,0,0,0,1,7,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Say Line 7'),
(445202,9,6,0,0,0,100,0,2000,2000,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Add NPC Flag Questgiver'),
(445202,9,7,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kravel Koalbeard - On Script - Reset Orientation');

UPDATE `creature_text` SET `Emote` = 92 WHERE `CreatureID` = 4452 AND `GroupID` = 4;

DELETE FROM `creature_text` WHERE `CreatureID` = 4452 AND `GroupID` IN (6,7);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(4452,6,0,'%s begins to dance.',16,0,100,0,0,0,1480,0,'Kravel Koalbeard'),
(4452,7,0,'Hahah!  $n, you make quite a partner!',12,0,100,11,0,0,1481,0,'Kravel Koalbeard');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
