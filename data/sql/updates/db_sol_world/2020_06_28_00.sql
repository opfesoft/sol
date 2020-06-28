-- DB update 2020_06_26_00 -> 2020_06_28_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_06_26_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_06_26_00 2020_06_28_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1593361720301505604'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1593361720301505604');

-- Enraged Silverback Gorilla, Mokk the Savage, Konda: Enable SAI
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (1511,1514,1516);

-- Witch Doctor Unbagwa: Add creature text
DELETE FROM `creature_text` WHERE `CreatureID` = 1449;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(1449,0,0,'Get ready everyone!  Here come de apes!',14,0,100,5,0,0,43550,0,'Witch Doctor Unbagwa - Quest ''Stranglethorn Fever''');

-- Enraged Silverback Gorilla, Mokk the Savage, Konda, Witch Doctor Unbagwa SAI
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1449,1511,1514,1516) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (144900,144901) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1449,0,0,0,20,0,100,0,349,0,0,0,0,80,144900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Unbagwa - On Quest ''Stranglethorn Fever'' Finished - Call Timed Action List'),
(1449,0,1,0,38,0,100,0,1,1,0,0,0,80,144901,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Unbagwa - On Data 1 1 Set - Call Timed Action List'),

(144900,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Unbagwa - On Script - Remove Questgiver Flag'),
(144900,9,1,0,0,0,100,0,0,0,0,0,0,2,495,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Unbagwa - On Script - Change Faction'),
(144900,9,2,0,0,0,100,0,5000,5000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Unbagwa - On Script - Say Line 0'),
(144900,9,3,0,0,0,100,0,15000,15000,0,0,0,12,1511,3,300000,1,0,0,8,0,0,0,0,-13813.5,8.70047,27.3387,6.0634,'Witch Doctor Unbagwa - On Script - Summon Creature ''Enraged Silverback Gorilla'''),
(144900,9,4,0,0,0,100,0,20000,20000,0,0,0,12,1516,3,300000,1,0,0,8,0,0,0,0,-13813.5,8.70047,27.3387,6.0634,'Witch Doctor Unbagwa - On Script - Summon Creature ''Konda'''),
(144900,9,5,0,0,0,100,0,20000,20000,0,0,0,12,1514,3,300000,1,0,0,8,0,0,0,0,-13813.5,8.70047,27.3387,6.0634,'Witch Doctor Unbagwa - On Script - Summon Creature ''Mokk the Savage'''),

(144901,9,0,0,0,0,100,0,0,0,0,0,0,4,2859,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Unbagwa - On Script - Play Sound'),
(144901,9,1,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Unbagwa - On Script - Add Questgiver Flag'),
(144901,9,2,0,0,0,100,0,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Unbagwa - On Script - Restore Faction'),

(1511,0,0,0,11,0,100,0,0,0,0,0,0,53,1,1511,0,0,0,2,1,0,0,0,0,0,0,0,0,'Enraged Silverback Gorilla - On Spawn - Start Waypoint'),
(1511,0,1,2,2,0,100,1,0,30,0,0,0,11,8269,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Silverback Gorilla - Between 0-30% Health - Cast ''Frenzy'' (No Repeat)'),
(1511,0,2,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Silverback Gorilla - Linked - Say Line 0'),
(1511,0,3,0,7,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Silverback Gorilla - On Evade - Despawn'),

(1514,0,0,0,11,0,100,0,0,0,0,0,0,53,1,1514,0,0,0,2,1,0,0,0,0,0,0,0,0,'Mokk the Savage - On Spawn - Start Waypoint'),
(1514,0,1,2,2,0,100,1,0,30,0,0,0,11,8269,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mokk the Savage - Between 0-30% Health - Cast ''Frenzy'' (No Repeat)'),
(1514,0,2,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mokk the Savage - Linked - Say Line 0'),
(1514,0,3,0,6,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,1449,0,0,0,0,0,0,0,'Mokk the Savage - On Death - Set Data 1 1 (Witch Doctor Unbagwa)'),
(1514,0,4,0,7,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mokk the Savage - On Evade - Despawn'),

(1516,0,0,0,11,0,100,0,0,0,0,0,0,53,1,1516,0,0,0,2,1,0,0,0,0,0,0,0,0,'Konda - On Spawn - Start Waypoint'),
(1516,0,1,2,2,0,100,1,0,30,0,0,0,11,8269,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Konda - Between 0-30% Health - Cast ''Frenzy'' (No Repeat)'),
(1516,0,2,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Konda - Linked - Say Line 0'),
(1516,0,3,0,7,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Konda - On Evade - Despawn');

-- Enraged Silverback Gorilla, Mokk the Savage, Konda: Waypoints for SAI
DELETE FROM `waypoints` WHERE `entry` IN (1511,1514,1516);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(1511,1,-13789,3.23242,34.3991,'Enraged Silverback Gorilla'),
(1511,2,-13777.5,-2.92882,39.948,''),
(1511,3,-13771.6,-6.58605,42.698,''),
(1511,4,-13763.4,-11.9761,44.9554,''),
(1511,5,-13743.7,-23.97,45.14,''),

(1514,1,-13789,3.23242,34.3991,'Mokk the Savage'),
(1514,2,-13777.5,-2.92882,39.948,''),
(1514,3,-13771.6,-6.58605,42.698,''),
(1514,4,-13763.4,-11.9761,44.9554,''),
(1514,5,-13743.7,-23.97,45.14,''),

(1516,1,-13789,3.23242,34.3991,'Konda'),
(1516,2,-13777.5,-2.92882,39.948,''),
(1516,3,-13771.6,-6.58605,42.698,''),
(1516,4,-13763.4,-11.9761,44.9554,''),
(1516,5,-13743.7,-23.97,45.14,'');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
