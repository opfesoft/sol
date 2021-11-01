-- DB update 2021_10_30_00 -> 2021_11_01_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_30_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_30_00 2021_11_01_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1635757726987508639'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1635757726987508639');

UPDATE `creature_template` SET `speed_walk` = 2, `speed_run` = 5/7, `unit_flags` = 768, `AIName` = 'SmartAI', `ScriptName` = '', `flags_extra` = 512 WHERE `entry` IN (7784,7806,7807);

DELETE FROM `creature_addon` WHERE `guid` IN (23229,93301,50381);

DELETE FROM `creature_summon_groups` WHERE `summonerId` IN (7784,7806,7807);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`)
VALUES
(7784,0,0,7803,-8343.94,-4444.2,9.41007,4.06661,4,60000),
(7784,0,0,7803,-8342.95,-4454.98,9.5386,2.18166,4,60000),
(7784,0,0,7803,-8356.77,-4448.49,10.2461,6.21337,4,60000),

(7806,0,0,7808,186.032,-3820.85,131.839,1.99726,4,60000),
(7806,0,0,7808,183.976,-3825.72,131.507,1.96191,4,60000),
(7806,0,0,7808,183.759,-3820.45,131.293,2.19753,4,60000),

(7807,0,0,7848,-4773.21,1578.04,86.9398,3.47146,4,60000),
(7807,0,0,7848,-4775.57,1582.44,86.2325,3.87437,4,60000);

DELETE FROM `creature_text` WHERE `CreatureId` IN (7784,7806,7807,7808);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(7784,0,0,'Emergency power activated!  Initializing ambulatory motor!  CLUCK!',12,0,100,0,0,0,3794,0,'Homing Robot OOX-17/TN'),
(7784,1,0,'Physical threat detected!  Evasive action!  CLUCK!',12,0,100,0,0,0,3795,0,'Homing Robot OOX-17/TN'),
(7784,1,1,'Threat analyzed!  Activating combat plan beta!  CLUCK!',12,0,100,0,0,0,3796,0,'Homing Robot OOX-17/TN'),
(7784,2,0,'CLUCK!  Sensors detect spatial anomaly -- danger imminent!  CLUCK!',12,0,100,0,0,0,3797,0,'Homing Robot OOX-17/TN'),
(7784,3,0,'Flight systems online!  CLUCK!  Engaging rockets for transport to Booty Bay!',12,0,100,0,0,0,3816,0,'Homing Robot OOX-17/TN'),

(7806,0,0,'Emergency power activated!  Initializing ambulatory motor!  CLUCK!',12,0,100,0,0,0,3819,0,'Homing Robot OOX-09/HL'),
(7806,1,0,'Physical threat detected!  Evasive action!  CLUCK!',12,0,100,0,0,0,3795,0,'Homing Robot OOX-09/HL'),
(7806,1,1,'Threat analyzed!  Activating combat plan beta!  CLUCK!',12,0,100,0,0,0,3796,0,'Homing Robot OOX-09/HL'),
(7806,2,0,'CLUCK!  Sensors detect spatial anomaly -- danger imminent!  CLUCK!',12,0,100,0,0,0,3821,0,'Homing Robot OOX-09/HL'),
(7806,3,0,'Flight systems online!  CLUCK!  Engaging rockets for transport to Booty Bay!',12,0,100,0,0,0,3820,0,'Homing Robot OOX-09/HL'),

(7807,0,0,'Emergency power activated!  Initializing ambulatory motor!  CLUCK!',12,0,100,0,0,0,3824,0,'Homing Robot OOX-22/FE'),
(7807,1,0,'Physical threat detected!  Evasive action!  CLUCK!',12,0,100,0,0,0,3795,0,'Homing Robot OOX-22/FE'),
(7807,1,1,'Threat analyzed!  Activating combat plan beta!  CLUCK!',12,0,100,0,0,0,3796,0,'Homing Robot OOX-22/FE'),
(7807,2,0,'CLUCK!  Sensors detect spatial anomaly -- danger imminent!  CLUCK!',12,0,100,0,0,0,3822,0,'Homing Robot OOX-22/FE'),
(7807,3,0,'Flight systems online!  CLUCK!  Engaging rockets for transport to Booty Bay!',12,0,100,0,0,0,3823,0,'Homing Robot OOX-22/FE'),

(7808,0,0,'%s goes into a frenzy!',16,0,100,0,0,0,1191,0,'Marauding Owlbeast');

UPDATE `quest_poi_points` SET `X` = -8352, `Y` = -4447 WHERE `QuestID` = 648 AND `Idx1` = 2;
UPDATE `quest_poi_points` SET `X` = 178, `Y` = -3801 WHERE `QuestID` = 836 AND `Idx1` = 2;
UPDATE `quest_poi_points` SET `X` = -4746, `Y` = 1585 WHERE `QuestID` = 2767 AND `Idx1` = 2;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 7808;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (7784,7806,7807,7803,7808);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (778400,778401,780600,780601,780700,780701,780702);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7784,0,0,1,11,0,100,0,0,0,0,0,0,90,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Respawn - Set ''UNIT_STAND_STATE_DEAD'''),
(7784,0,1,0,61,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - Linked - Add ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(7784,0,2,0,4,0,25,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Aggro - Say Line 1'),
(7784,0,3,0,19,0,100,0,648,0,0,0,0,80,778400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Quest ''Rescue OOX-17/TN!'' Accepted - Call Timed Action List'),
(7784,0,4,0,58,0,100,0,0,7784,0,0,0,80,778401,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On WP Ended - Call Timed Action List'),
(7784,0,5,0,6,0,100,0,0,0,0,0,0,6,648,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Death - Fail Quest ''Rescue OOX-17/TN!'''),

(778400,9,0,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Script - Store Targetlist'),
(778400,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Script - Say Line 0'),
(778400,9,2,0,0,0,100,0,0,0,0,0,0,2,113,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Script - Set Faction ''Escortee'''),
(778400,9,3,0,0,0,100,0,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(778400,9,4,0,0,0,100,0,0,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Script - Remove ''UNIT_STAND_STATE_DEAD'''),
(778400,9,5,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(778400,9,6,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Script - Set Active On'),
(778400,9,7,0,0,0,100,0,3000,3000,0,0,0,53,0,7784,0,0,0,2,7,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Script - Start WP Movement'),

(778401,9,0,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Script - Say Line 2'),
(778401,9,1,0,0,0,100,0,2000,2000,0,0,0,107,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Script - Summon Group 0'),
(778401,9,2,0,0,0,100,0,5000,5000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Script - Say Line 3'),
(778401,9,3,0,0,0,100,0,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Script - Set Fly On'),
(778401,9,4,0,0,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Script - Set Run On'),
(778401,9,5,0,0,0,100,0,4000,4000,0,0,0,11,68499,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Script - Cast ''OOX Lift Off'''),
(778401,9,6,0,0,0,100,0,0,0,0,0,0,26,648,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Script - Quest Credit ''Rescue OOX-17/TN!'''),
(778401,9,7,0,0,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Script - Add ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(778401,9,8,0,0,0,100,0,2000,2000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-8161.73,-4410.54,58.0852,0,'Homing Robot OOX-17/TN - On Script - Move To Position'),
(778401,9,9,0,0,0,100,0,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-17/TN - On Script - Force Despawn'),

(7806,0,0,1,11,0,100,0,0,0,0,0,0,90,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Respawn - Set ''UNIT_STAND_STATE_DEAD'''),
(7806,0,1,0,61,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - Linked - Add ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(7806,0,2,0,4,0,25,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Aggro - Say Line 1'),
(7806,0,3,0,19,0,100,0,836,0,0,0,0,80,780600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Quest ''Rescue OOX-09/HL!'' Accepted - Call Timed Action List'),
(7806,0,4,0,58,0,100,0,0,7806,0,0,0,80,780601,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On WP Ended - Call Timed Action List'),
(7806,0,5,0,6,0,100,0,0,0,0,0,0,6,836,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Death - Fail Quest ''Rescue OOX-09/HL!'''),

(780600,9,0,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Script - Store Targetlist'),
(780600,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Script - Say Line 0'),
(780600,9,2,0,0,0,100,0,0,0,0,0,0,2,113,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Script - Set Faction ''Escortee'''),
(780600,9,3,0,0,0,100,0,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(780600,9,4,0,0,0,100,0,0,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Script - Remove ''UNIT_STAND_STATE_DEAD'''),
(780600,9,5,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(780600,9,6,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Script - Set Active On'),
(780600,9,7,0,0,0,100,0,3000,3000,0,0,0,53,0,7806,0,0,0,2,7,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Script - Start WP Movement'),

(780601,9,0,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Script - Say Line 2'),
(780601,9,1,0,0,0,100,0,2000,2000,0,0,0,107,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Script - Summon Group 0'),
(780601,9,2,0,0,0,100,0,5000,5000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Script - Say Line 3'),
(780601,9,3,0,0,0,100,0,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Script - Set Fly On'),
(780601,9,4,0,0,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Script - Set Run On'),
(780601,9,5,0,0,0,100,0,4000,4000,0,0,0,11,68499,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Script - Cast ''OOX Lift Off'''),
(780601,9,6,0,0,0,100,0,0,0,0,0,0,26,836,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Script - Quest Credit ''Rescue OOX-09/HL!'''),
(780601,9,7,0,0,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Script - Add ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(780601,9,8,0,0,0,100,0,2000,2000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,96.7698,-3951.47,165.528,0,'Homing Robot OOX-09/HL - On Script - Move To Position'),
(780601,9,9,0,0,0,100,0,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-09/HL - On Script - Force Despawn'),

(7807,0,0,1,11,0,100,0,0,0,0,0,0,90,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Respawn - Set ''UNIT_STAND_STATE_DEAD'''),
(7807,0,1,0,61,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - Linked - Add ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(7807,0,2,0,4,0,25,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Aggro - Say Line 1'),
(7807,0,3,0,19,0,100,0,2767,0,0,0,0,80,780700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Quest ''Rescue OOX-22/FE!'' Accepted - Call Timed Action List'),
(7807,0,4,0,40,0,100,0,39,7807,0,0,0,80,780701,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On WP 39 Reached - Call Timed Action List'),
(7807,0,5,0,58,0,100,0,0,7807,0,0,0,80,780702,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On WP Ended - Call Timed Action List'),
(7807,0,6,0,6,0,100,0,0,0,0,0,0,6,2767,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Death - Fail Quest ''Rescue OOX-22/FE!'''),

(780700,9,0,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Store Targetlist'),
(780700,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Say Line 0'),
(780700,9,2,0,0,0,100,0,0,0,0,0,0,2,113,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Set Faction ''Escortee'''),
(780700,9,3,0,0,0,100,0,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(780700,9,4,0,0,0,100,0,0,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Remove ''UNIT_STAND_STATE_DEAD'''),
(780700,9,5,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(780700,9,6,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Set Active On'),
(780700,9,7,0,0,0,100,0,3000,3000,0,0,0,53,0,7807,0,0,0,2,7,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Start WP Movement'),

(780701,9,0,0,0,0,100,0,0,0,0,0,0,54,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Pause WP Movement'),
(780701,9,1,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Say Line 2'),
(780701,9,2,0,0,0,100,0,2000,2000,0,0,0,107,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Summon Group 0'),

(780702,9,0,0,0,0,100,0,5000,5000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Say Line 3'),
(780702,9,1,0,0,0,100,0,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Set Fly On'),
(780702,9,2,0,0,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Set Run On'),
(780702,9,3,0,0,0,100,0,4000,4000,0,0,0,11,68499,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Cast ''OOX Lift Off'''),
(780702,9,4,0,0,0,100,0,0,0,0,0,0,26,2767,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Quest Credit ''Rescue OOX-22/FE!'''),
(780702,9,5,0,0,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Add ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(780702,9,6,0,0,0,100,0,2000,2000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-4743.87,1744.25,121.255,0,'Homing Robot OOX-22/FE - On Script - Move To Position'),
(780702,9,7,0,0,0,100,0,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Homing Robot OOX-22/FE - On Script - Force Despawn'),

(7803,0,0,0,0,0,100,0,6400,14700,20900,45800,0,11,5416,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scorpid Duneburrower - IC - Cast ''Venom Sting'''),

(7808,0,0,1,2,0,100,1,0,50,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marauding Owlbeast - Between 0-50% Health - Cast ''Enrage'' (No Repeat)'),
(7808,0,1,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marauding Owlbeast - On Linked - Say Line 0');

DELETE FROM `script_waypoint` WHERE `entry` IN (7784,7806,7807);

DELETE FROM `waypoints` WHERE `entry` IN (7784,7806,7807);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(7784,1,-8844.96,-4374.74,43.7764,'Homing Robot OOX-17/TN'),
(7784,2,-8837.49,-4374.54,45.4541,NULL),
(7784,3,-8833.01,-4374.43,45.5781,NULL),
(7784,4,-8828.85,-4374.31,43.6999,NULL),
(7784,5,-8820.99,-4374.11,38.0888,NULL),
(7784,6,-8810.63,-4373.83,32.4665,NULL),
(7784,7,-8803.46,-4370.39,29.9907,NULL),
(7784,8,-8794.97,-4366.31,25.8966,NULL),
(7784,9,-8779.41,-4366.35,23.5998,NULL),
(7784,10,-8763.17,-4366.4,25.248,NULL),
(7784,11,-8752.49,-4366.43,24.1011,NULL),
(7784,12,-8738.54,-4359.23,21.815,NULL),
(7784,13,-8724.97,-4352.23,20.6802,NULL),
(7784,14,-8716.13,-4352.8,19.7918,NULL),
(7784,15,-8708.82,-4353.28,18.2806,NULL),
(7784,16,-8696.38,-4366.81,15.0152,NULL),
(7784,17,-8685,-4379.19,13.454,NULL),
(7784,18,-8671.38,-4383.45,11.8974,NULL),
(7784,19,-8656.83,-4388.01,12.2181,NULL),
(7784,20,-8644.62,-4390.57,12.5518,NULL),
(7784,21,-8630.17,-4393.6,11.5954,NULL),
(7784,22,-8612.75,-4397.25,9.64062,NULL),
(7784,23,-8597.86,-4402.22,9.51912,NULL),
(7784,24,-8578.57,-4408.65,11.4721,NULL),
(7784,25,-8561.35,-4414.23,13.0217,NULL),
(7784,26,-8539.1,-4421.45,12.522,NULL),
(7784,27,-8514.03,-4425.82,13.743,NULL),
(7784,28,-8500.02,-4427.32,13.5765,NULL),
(7784,29,-8486.31,-4428.78,11.6087,NULL),
(7784,30,-8469.62,-4433.84,9.50746,NULL),
(7784,31,-8446.95,-4440.72,9.37416,NULL),
(7784,32,-8433.16,-4442.82,9.35393,NULL),
(7784,33,-8417.6,-4445.19,10.2709,NULL),
(7784,34,-8403.58,-4446.56,11.3183,NULL),
(7784,35,-8388.9,-4448,10.9225,NULL),
(7784,36,-8372,-4447.81,9.49746,NULL),
(7784,37,-8352,-4447.59,10.0666,NULL),

(7806,1,495.404,-3478.35,114.837,'Homing Robot OOX-09/HL'),
(7806,2,492.705,-3486.11,108.627,NULL),
(7806,3,487.25,-3485.76,107.89,NULL),
(7806,4,482.903,-3487.48,105.236,NULL),
(7806,5,476.852,-3489.88,99.985,NULL),
(7806,6,467.212,-3493.36,99.819,NULL),
(7806,7,460.017,-3496.98,104.481,NULL),
(7806,8,450.034,-3498.82,106.412,NULL),
(7806,9,439.619,-3500.73,110.534,NULL),
(7806,10,433.298,-3498.01,114.62,NULL),
(7806,11,428.326,-3495.87,118.662,NULL),
(7806,12,424.664,-3489.38,121.999,NULL),
(7806,13,424.407,-3480.4,123.443,NULL),
(7806,14,424.137,-3470.95,124.333,NULL),
(7806,15,423.559,-3465.6,123.655,NULL),
(7806,16,422.606,-3456.78,121.084,NULL),
(7806,17,421.791,-3449.24,119.126,NULL),
(7806,18,416.387,-3443.12,119.637,NULL),
(7806,19,410.363,-3436.3,118.865,NULL),
(7806,20,404.247,-3429.38,117.644,NULL),
(7806,21,397.266,-3429.52,117.733,NULL),
(7806,22,385.369,-3429.75,117.407,NULL),
(7806,23,373.471,-3429.98,116.628,NULL),
(7806,24,362.035,-3430.2,116.496,NULL),
(7806,25,348.973,-3430.46,116.371,NULL),
(7806,26,336.835,-3430.69,116.396,NULL),
(7806,27,327.373,-3430.88,116.627,NULL),
(7806,28,324.104,-3435.73,116.696,NULL),
(7806,29,324.634,-3443.98,117.105,NULL),
(7806,30,327.971,-3454.19,116.619,NULL),
(7806,31,331.18,-3464,117.143,NULL),
(7806,32,332.745,-3475.37,118.041,NULL),
(7806,33,334.352,-3487.05,117.944,NULL),
(7806,34,336.394,-3501.88,118.201,NULL),
(7806,35,336.599,-3512.14,118.076,NULL),
(7806,36,336.888,-3526.61,118,NULL),
(7806,37,337.074,-3535.91,117.563,NULL),
(7806,38,337.251,-3544.76,117.284,NULL),
(7806,39,337.526,-3556.19,116.781,NULL),
(7806,40,337.749,-3565.42,116.797,NULL),
(7806,41,337.217,-3575.21,117.122,NULL),
(7806,42,336.57,-3587.09,117.539,NULL),
(7806,43,336.011,-3597.36,118.225,NULL),
(7806,44,332.915,-3604.3,118.541,NULL),
(7806,45,328.683,-3613.78,118.987,NULL),
(7806,46,324.619,-3622.88,119.811,NULL),
(7806,47,318.538,-3632.31,120.362,NULL),
(7806,48,312.722,-3641.32,121.536,NULL),
(7806,49,308.027,-3648.6,123.047,NULL),
(7806,50,302.505,-3655.07,124.11,NULL),
(7806,51,295.613,-3663.14,125.053,NULL),
(7806,52,289.173,-3670.69,126.058,NULL),
(7806,53,282.583,-3678.41,127.134,NULL),
(7806,54,276.325,-3685.74,128.356,NULL),
(7806,55,268.933,-3692.17,129.112,NULL),
(7806,56,260.295,-3699.67,129.77,NULL),
(7806,57,250.082,-3708.55,130.962,NULL),
(7806,58,239.981,-3717.33,131.874,NULL),
(7806,59,232.615,-3723.62,132.139,NULL),
(7806,60,224.951,-3730.17,132.125,NULL),
(7806,61,219.795,-3737.66,131.946,NULL),
(7806,62,213.245,-3747.17,131.187,NULL),
(7806,63,205.835,-3757.94,130.255,NULL),
(7806,64,198.708,-3768.29,129.42,NULL),
(7806,65,191.411,-3779.41,128.405,NULL),
(7806,66,183.758,-3791.07,128.045,NULL),
(7806,67,178.111,-3801.58,128.37,NULL),

(7807,1,-4945.89,1726.61,62.9108,'Homing Robot OOX-22/FE'),
(7807,2,-4943.74,1715.74,62.741,NULL),
(7807,3,-4944.93,1706.66,63.1631,NULL),
(7807,4,-4944.25,1701.37,64.6046,NULL),
(7807,5,-4942.82,1690.22,64.25,NULL),
(7807,6,-4943.97,1683.73,62.5606,NULL),
(7807,7,-4945.58,1674.66,63.558,NULL),
(7807,8,-4946.47,1669.62,63.6856,NULL),
(7807,9,-4951.74,1659.74,62.5171,NULL),
(7807,10,-4955.93,1651.88,63,NULL),
(7807,11,-4961.79,1647.84,63.8189,NULL),
(7807,12,-4967.58,1643.86,64.2905,NULL),
(7807,13,-4970.79,1632.9,62.3335,NULL),
(7807,14,-4973.25,1624.5,63.2349,NULL),
(7807,15,-4976.17,1614.57,64.2113,NULL),
(7807,16,-4978.12,1607.9,64.3,NULL),
(7807,17,-4975.81,1596.57,64.6113,NULL),
(7807,18,-4974.81,1591.65,64.4254,NULL),
(7807,19,-4972.82,1581.89,61.75,NULL),
(7807,20,-4965.36,1581.45,62.0316,NULL),
(7807,21,-4958.65,1581.05,61.81,NULL),
(7807,22,-4952.73,1584.79,62.2557,NULL),
(7807,23,-4946.13,1588.95,64.159,NULL),
(7807,24,-4939.32,1593.25,65.8854,NULL),
(7807,25,-4926.56,1594.41,65.26,NULL),
(7807,26,-4912.27,1595.7,64.2644,NULL),
(7807,27,-4898.2,1596.97,65.2495,NULL),
(7807,28,-4885.69,1598.1,67.45,NULL),
(7807,29,-4879.68,1600,68.2465,NULL),
(7807,30,-4874.2,1601.73,68.54,NULL),
(7807,31,-4867.95,1600.94,69.2971,NULL),
(7807,32,-4858.92,1599.8,71.9955,NULL),
(7807,33,-4852.32,1598.97,73.6983,NULL),
(7807,34,-4841.33,1597.58,74.1823,NULL),
(7807,35,-4830.8,1596.26,75.0902,NULL),
(7807,36,-4816.64,1594.47,78.2,NULL),
(7807,37,-4811.65,1586.67,79.4697,NULL),
(7807,38,-4806.36,1578.42,82.7599,NULL),
(7807,39,-4802.2,1571.92,87.01,NULL),
(7807,40,-4794.87,1572.47,87.5119,NULL),
(7807,41,-4785.09,1573.2,87.6628,NULL),
(7807,42,-4774.98,1573.96,87.4852,NULL),
(7807,43,-4762.76,1574.88,87.9919,NULL),
(7807,44,-4746.4,1581.18,84.3644,NULL),
(7807,45,-4746.4,1585.87,84.2135,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
