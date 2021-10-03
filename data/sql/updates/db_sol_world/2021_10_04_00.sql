-- DB update 2021_10_03_01 -> 2021_10_04_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_03_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_03_01 2021_10_04_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1633300290903199937'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1633300290903199937');

DELETE FROM `gameobject` WHERE `guid` IN (3008986,3008987);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3008986,149410,0,0,0,1,1,-6683.73,-1194.19,240.02,0.447678,0,0,0,0,-1,100,1,0), -- Light of Retribution
(3008987,149047,0,0,0,1,1,-6683.73,-1194.19,242.02,0.212059,0,0,0,0,-1,100,1,0); -- Torch of Retribution

UPDATE `creature` SET `spawntimesecs` = 120 WHERE `guid` = 5921; -- Kalaran Windblade

DELETE FROM `creature_text` WHERE `CreatureId` = 8480 AND `GroupID` IN (6,7);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(8480,6,0,'%s begins to flap his massive wings faster. He is preparing for flight.',16,0,100,0,0,0,4464,0,'Kalaran the Deceiver'),
(8480,7,0,'Oh yes, the molt - do not lose it. There are those of my kin in the Burning Steppes that would craft items that only the molt of the black Dragonflight could fortify.',12,0,100,0,0,0,4463,0,'Kalaran the Deceiver');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `unit_flags` = 768 WHERE `entry` = 8480;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 8509;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (8479,8480,8509);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (847900,848000);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8479,0,0,1,62,0,100,0,1321,0,0,0,0,26,3441,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Gossip Option 0 Selected - Quest Credit ''Divine Retribution'''),
(8479,0,1,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Kalaran Windblade - Linked - Close Gossip'),
(8479,0,2,3,62,0,100,0,1323,2,0,0,0,11,19797,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Gossip Option 2 Selected - Cast ''Conjure Torch of Retribution'''),
(8479,0,3,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Kalaran Windblade - Linked - Close Gossip'),
(8479,0,4,0,62,0,100,0,1323,3,0,0,0,80,847900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Gossip Option 3 Selected - Call Timed Action List'),
(8479,0,5,6,19,0,100,0,3454,0,0,0,0,70,60,0,0,0,0,0,14,3008986,149410,0,0,0,0,0,0,'Kalaran Windblade - On Quest ''The Torch of Retribution'' Accepted - Respawn GO (Light of Retribution)'),
(8479,0,6,0,61,0,100,0,0,0,0,0,0,70,60,0,0,0,0,0,14,3008987,149047,0,0,0,0,0,0,'Kalaran Windblade - Linked - Respawn GO (Torch of Retribution)'),
(8479,0,7,8,38,0,100,0,1,1,0,0,0,12,8480,3,68000,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Data Set - Summon Creature ''Kalaran the Deceiver'''),
(8479,0,8,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran Windblade - Linked - Force Despawn'),

(847900,9,0,0,0,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Script - Close Gossip'),
(847900,9,1,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(847900,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Script - Say Line 0'),
(847900,9,3,0,0,0,100,0,0,0,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Script - Set Emote State ''STATE_USESTANDING'''),
(847900,9,4,0,0,0,100,0,10000,10000,0,0,0,11,12511,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Script - Cast ''Torch Combine'''),
(847900,9,5,0,0,0,100,0,8000,8000,0,0,0,11,12511,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Script - Cast ''Torch Combine'''),
(847900,9,6,0,0,0,100,0,7000,7000,0,0,0,11,12511,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Script - Cast ''Torch Combine'''),
(847900,9,7,0,0,0,100,0,10000,10000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Script - Say Line 1'),
(847900,9,8,0,0,0,100,0,7000,7000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Script - Set Emote State ''ONESHOT_NONE'''),
(847900,9,9,0,0,0,100,0,1000,1000,0,0,0,11,12512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Script - Cast ''Kalaran Conjures Torch'''),
(847900,9,10,0,0,0,100,0,1000,1000,0,0,0,70,180,0,0,0,0,0,14,3008986,149410,0,0,0,0,0,0,'Kalaran Windblade - On Script - Respawn GO (Light of Retribution)'),
(847900,9,11,0,0,0,100,0,0,0,0,0,0,70,180,0,0,0,0,0,14,3008987,149047,0,0,0,0,0,0,'Kalaran Windblade - On Script - Respawn GO (Torch of Retribution)'),
(847900,9,12,0,0,0,100,0,3000,3000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Script - Say Line 2'),
(847900,9,13,0,0,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(847900,9,14,0,0,0,100,0,2000,2000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Script - Say Line 3'),
(847900,9,15,0,0,0,100,0,2000,2000,0,0,0,15,3453,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Script - Quest Credit ''The Torch of Retribution'''),
(847900,9,16,0,0,0,100,0,2000,2000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(847900,9,17,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran Windblade - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),

(8509,0,0,0,20,0,100,0,3463,0,0,0,0,45,1,1,0,0,0,0,19,8479,0,0,0,0,0,0,0,'Squire Maltrake - On Quest ''Set Them Ablaze!'' Rewarded - Set Data 1 1 (Kalaran Windblade)'),

(8480,0,0,0,54,0,100,0,0,0,0,0,0,80,848000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran the Deceiver - On Just Summoned - Call Timed Action List'),

(848000,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran the Deceiver - On Script - Set Active On'),
(848000,9,1,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran the Deceiver - On Script - Say Line 0'),
(848000,9,2,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran the Deceiver - On Script - Say Line 1'),
(848000,9,3,0,0,0,100,0,4000,4000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran the Deceiver - On Script - Say Line 2'),
(848000,9,4,0,0,0,100,0,6000,6000,0,0,0,1,0,0,0,0,0,0,19,8509,0,0,0,0,0,0,0,'Kalaran the Deceiver - On Script - Say Line 0 (Squire Maltrake)'),
(848000,9,5,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,4.65994,'Kalaran the Deceiver - On Script - Set Orientation'),
(848000,9,6,0,0,0,100,0,3000,3000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran the Deceiver - On Script - Say Line 3'),
(848000,9,7,0,0,0,100,0,3000,3000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran the Deceiver - On Script - Say Line 4'),
(848000,9,8,0,0,0,100,0,9000,9000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran the Deceiver - On Script - Say Line 5'),
(848000,9,9,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,19,8509,0,0,0,0,0,0,0,'Kalaran the Deceiver - On Script - Say Line 1 (Squire Maltrake)'),
(848000,9,10,0,0,0,100,0,3000,3000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran the Deceiver - On Script - Say Line 6'),
(848000,9,11,0,0,0,100,0,5000,5000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran the Deceiver - On Script - Say Line 7'),
(848000,9,12,0,0,0,100,0,9000,9000,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran the Deceiver - On Script - Say Line 8'),
(848000,9,13,0,0,0,100,0,0,0,0,0,0,53,1,8480,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalaran the Deceiver - On Script - Move to Position');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 1323;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,1323,0,0,0,47,0,3441,8,0,0,0,0,'Kalaran Windblade - Group 0: Show gossip option 0 only if quest ''Divine Retribution'' is in progress'),

(15,1323,2,0,0,2,0,10515,1,0,1,0,0,'Kalaran Windblade - Group 0: Show gossip option 2 only if the player does not have item ''Torch of Retribution'''),
(15,1323,2,0,0,47,0,3454,64,0,0,0,0,'Kalaran Windblade - Group 0: Show gossip option 2 only if quest ''The Torch of Retribution'' is rewarded'),

(15,1323,3,0,0,47,0,3453,8,0,0,0,0,'Kalaran Windblade - Group 0: Show gossip option 3 only if quest ''The Torch of Retribution'' is in progress');

DELETE FROM `waypoints` WHERE `entry` = 8480;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(8480,1,-6679.93,-1194.36,240.214,'Kalaran the Deceiver'),
(8480,2,-6692.52,-1193.68,240.254,NULL),
(8480,3,-6704.04,-1193.07,241.721,NULL),
(8480,4,-6712.78,-1192.6,240.347,NULL),
(8480,5,-6725.83,-1191.9,240.345,NULL),
(8480,6,-6731.54,-1191.59,240.794,NULL),
(8480,7,-6736.43,-1191.33,240.851,NULL),
(8480,8,-6745.06,-1190.87,240.288,NULL),
(8480,9,-6754.03,-1190.39,241.801,NULL),
(8480,10,-6761.94,-1189.96,243.999,NULL),
(8480,11,-6770.45,-1189.5,245.303,NULL),
(8480,12,-6778.84,-1189.06,244.147,NULL),
(8480,13,-6788.63,-1188.53,242.284,NULL),
(8480,14,-6797.61,-1188.05,241.007,NULL),
(8480,15,-6806.69,-1187.56,239.913,NULL),
(8480,16,-6818.11,-1186.95,240.155,NULL),
(8480,17,-6827.08,-1186.47,240.869,NULL),
(8480,18,-6835.58,-1186.01,241.654,NULL),
(8480,19,-6843.15,-1185.61,241.942,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
