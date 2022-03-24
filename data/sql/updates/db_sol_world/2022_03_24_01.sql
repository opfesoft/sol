-- DB update 2022_03_24_00 -> 2022_03_24_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_24_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_24_00 2022_03_24_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648161903633419887'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648161903633419887');

UPDATE `creature_template` SET `speed_walk` = 2/3, `speed_run` = 6/7, `unit_flags` = `unit_flags` | 512 WHERE `entry` IN (17391,17392,17410);
UPDATE `creature_template` SET `modelid2` = 0, `speed_walk` = 2/3, `speed_run` = 6.5/7 WHERE `entry` = 17379;
UPDATE `creature_template` SET `modelid2` = 0, `speed_walk` = 1, `speed_run` = 6/7, `unit_flags` = `unit_flags` | 512 WHERE `entry` = 17393;
UPDATE `creature_template` SET `unit_flags2` = `unit_flags2` | 32768 WHERE `entry` IN (17360,17361,17362,17363);
UPDATE `creature_template` SET `modelid2` = 0, `flags_extra` = `flags_extra` | 512 WHERE `entry` = 17391;
UPDATE `creature_template` SET `modelid2` = 0 WHERE `entry` = 17410;

UPDATE `quest_template_addon` SET `SourceSpellID` = 0 WHERE `ID` = 9542;
UPDATE `spell_dbc` SET `Effect1` = 28, `EffectMiscValueB1` = 64 WHERE `Id` = 30445;
UPDATE `spell_dbc` SET `SchoolMask` = 0 WHERE `Id` = 30444;

DELETE FROM `creature_text` WHERE `CreatureId` = 17391 AND `GroupID` = 3;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(17391,3,0,'%s points across the river.',16,0,100,0,0,0,13872,0,'Stillpine Ancestor Coo');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 17363;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (17360,17379,17361,17391,17362,17392,17363,17393,17364,17410);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1737900,1737901,1739100,1739101,1739200,1739201,1739300,1739301,1739302,1741000);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17360,0,0,0,19,0,100,0,9539,0,0,0,0,85,30437,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Totem of Akida - On Quest ''Totem of Coo'' Accepted - Invoker Cast ''Stillpine Ancestor Akida TRIGGER'' (Invoker)'),

(17379,0,0,0,54,0,100,0,0,0,0,0,0,80,1737900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Akida - On Just Summoned - Call Timed Action List'),
(17379,0,1,0,58,0,100,0,0,17379,0,0,0,80,1737901,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Akida - On WP Path Ended - Call Timed Action List'),

(1737900,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Akida - On Script - Set Active On'),
(1737900,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Stillpine Ancestor Akida - On Script - Set Orientation (Owner)'),
(1737900,9,2,0,0,0,100,0,0,0,0,0,0,11,25035,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Akida - On Script - Cast ''Elemental Spawn-in'''),
(1737900,9,3,0,0,0,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Akida - On Script - Say Line 0'),
(1737900,9,4,0,0,0,100,0,1000,1000,0,0,0,53,1,17379,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Akida - On Script - Start WP Movement'),

(1737901,9,0,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,19,17361,0,0,0,0,0,0,0,'Stillpine Ancestor Akida - On Script - Set Orientation (Totem of Coo)'),
(1737901,9,1,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Akida - On Script - Say Line 1'),
(1737901,9,2,0,0,0,100,0,3000,3000,0,0,0,11,30428,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Akida - On Script - Cast ''Stillpine Ancestor Despawn DND'''),
(1737901,9,3,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Akida - On Script - Force Despawn'),

(17361,0,0,0,19,0,100,0,9540,0,0,0,0,85,30442,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Totem of Coo - On Quest ''Totem of Tikti'' Accepted - Invoker Cast ''Stillpine Ancestor Coo TRIGGER'' (Invoker)'),

(17391,0,0,0,54,0,100,0,0,1,0,0,0,80,1739100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On Just Summoned - Call Timed Action List'),
(17391,0,1,0,40,0,100,0,3,0,0,0,0,80,1739101,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On WP 3 Reached - Call Timed Action List'),
(17391,0,2,3,58,0,100,0,0,17391,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On WP Path Ended - Force Despawn'),
(17391,0,3,0,61,0,100,0,0,0,0,0,0,11,30428,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On Script - Cast ''Stillpine Ancestor Despawn DND'''),

(1739100,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On Script - Set Active On'),
(1739100,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On Script - Set Orientation (Owner)'),
(1739100,9,2,0,0,0,100,0,0,0,0,0,0,11,25035,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On Script - Cast ''Elemental Spawn-in'''),
(1739100,9,3,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On Script - Say Line 0'),
(1739100,9,4,0,0,0,100,0,1000,1000,0,0,0,53,0,17391,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On Script - Start WP Movement'),

(1739101,9,0,0,0,0,100,0,0,0,0,0,0,54,12000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On Script - Pause WP Movement'),
(1739101,9,1,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On Script - Say Line 1'),
(1739101,9,2,0,0,0,100,0,4000,4000,0,0,0,11,30424,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On Script - Cast ''Ghost Walk'''),
(1739101,9,3,0,0,0,100,0,1000,1000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On Script - Say Line 2'),
(1739101,9,4,0,0,0,100,0,3000,3000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On Script - Say Line 3'),
(1739101,9,5,0,0,0,100,0,1000,1000,0,0,0,11,30473,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On Script - Cast ''Coo Transform Furbolg DND'''),
(1739101,9,6,0,0,0,100,0,0,0,0,0,0,40,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On Script - Sheath Weapon'),
(1739101,9,7,0,0,0,100,0,0,0,0,0,0,3,0,17019,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On Script - Morph To Model 17019'),
(1739101,9,8,0,0,0,100,0,3000,3000,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On Script - Set Fly On'),
(1739101,9,9,0,0,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Coo - On Script - Set Run On'),

(17362,0,0,0,19,0,100,0,9541,0,0,0,0,85,30443,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Totem of Tikti - On Quest ''Totem of Yor'' Accepted - Invoker Cast ''Stillpine Ancestor Tikti TRIGGER'' (Invoker)'),

(17392,0,0,0,54,0,100,0,0,0,0,0,0,80,1739200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Tikti - On Just Summoned - Call Timed Action List'),
(17392,0,1,0,40,0,100,0,2,0,0,0,0,80,1739201,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Tikti - On WP 2 Reached - Call Timed Action List'),
(17392,0,2,3,58,0,100,0,0,17392,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Tikti - On WP Path Ended - Force Despawn'),
(17392,0,3,0,61,0,100,0,0,0,0,0,0,11,30428,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Tikti - On Script - Cast ''Stillpine Ancestor Despawn DND'''),

(1739200,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Tikti - On Script - Set Active On'),
(1739200,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Stillpine Ancestor Tikti - On Script - Set Orientation (Owner)'),
(1739200,9,2,0,0,0,100,0,0,0,0,0,0,11,25035,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Tikti - On Script - Cast ''Elemental Spawn-in'''),
(1739200,9,3,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Tikti - On Script - Say Line 0'),
(1739200,9,4,0,0,0,100,0,0,0,0,0,0,53,0,17392,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Tikti - On Script - Start WP Movement'),

(1739201,9,0,0,0,0,100,0,0,0,0,0,0,54,14000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Tikti - On Script - Pause WP Movement'),
(1739201,9,1,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Tikti - On Script - Say Line 1'),
(1739201,9,2,0,0,0,100,0,6000,6000,0,0,0,11,30430,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Stillpine Ancestor Tikti - On Script - Cast ''Embrace of the Serpent'''),
(1739201,9,3,0,0,0,100,0,2000,2000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Tikti - On Script - Say Line 2'),
(1739201,9,4,0,0,0,100,0,1000,1000,0,0,0,11,30431,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Tikti - On Script - Cast ''Tikti Transform DND'''),
(1739201,9,5,0,0,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Tikti - On Script - Set Run On'),

(17363,0,0,0,19,0,100,0,9542,0,0,0,0,85,30444,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Totem of Yor - On Quest ''Totem of Vark'' Accepted - Invoker Cast ''Stillpine Ancestor Yor TRIGGER'' (Invoker)'),

(17393,0,0,0,54,0,100,0,0,0,0,0,0,80,1739300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On Just Summoned - Call Timed Action List'),
(17393,0,1,0,40,0,100,0,1,0,0,0,0,3,0,16995,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On WP 1 Reached - Morph To Model 16995'),
(17393,0,2,0,40,0,100,0,4,0,0,0,0,80,1739301,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On WP 4 Reached - Call Timed Action List'),
(17393,0,3,0,58,0,100,0,0,17393,0,0,0,80,1739302,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On WP Path Ended - Call Timed Action List'),

(1739300,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On Script - Set Active On'),
(1739300,9,1,0,0,0,100,0,0,0,0,0,0,11,25035,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On Script - Cast ''Elemental Spawn-in'''),
(1739300,9,2,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On Script - Set Orientation (Owner)'),
(1739300,9,3,0,0,0,100,0,1000,1000,0,0,0,1,0,0,1,0,0,0,23,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On Script - Say Line 0'),
(1739300,9,4,0,0,0,100,0,5000,5000,0,0,0,53,0,17393,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On Script - Start WP Movement'),

(1739301,9,0,0,0,0,100,0,0,0,0,0,0,54,13000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On Script - Pause WP Movement'),
(1739301,9,1,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On Script - Set Orientation (Owner)'),
(1739301,9,2,0,0,0,100,0,3000,3000,0,0,0,1,1,0,1,0,0,0,23,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On Script - Say Line 1'),
(1739301,9,3,0,0,0,100,0,3000,3000,0,0,0,11,30448,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On Script - Cast ''Shadow of the Forest'''),
(1739301,9,4,0,0,0,100,0,0,0,0,0,0,11,30447,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On Script - Cast ''Shadow of the Forest'''),
(1739301,9,5,0,0,0,100,0,1000,1000,0,0,0,1,2,0,1,0,0,0,23,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On Script - Say Line 2'),
(1739301,9,6,0,0,0,100,0,4000,4000,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On Script - Set Run On'),

(1739302,9,0,0,0,0,100,0,4000,4000,0,0,0,1,3,0,1,0,0,0,23,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On Script - Say Line 3'),
(1739302,9,1,0,0,0,100,0,2000,2000,0,0,0,11,30428,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On Script - Cast ''Stillpine Ancestor Despawn DND'''),
(1739302,9,2,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Yor - On Script - Force Despawn'),

(17364,0,0,1,19,0,100,0,9544,0,0,0,0,85,30453,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Totem of Vark - On Quest ''The Prophecy of Akida'' Accepted - Invoker Cast ''Stillpine Ancestor Vark TRIGGER'' (Invoker)'),
(17364,0,1,0,61,0,100,0,0,0,0,0,0,28,30448,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Stillpine Ancestor Vark - Linked - Remove Aura ''Shadow of the Forest'' (Invoker)'),

(17410,0,0,0,54,0,100,0,0,1,0,0,0,80,1741000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Vark - On Just Summoned - Call Timed Action List'),

(1741000,9,0,0,0,0,100,0,0,0,0,0,0,11,25035,0,0,0,0,0,1,0,0,0,0,0,0,0,0.0174532,'Stillpine Ancestor Vark - On Script - Cast ''Elemental Spawn-in'''),
(1741000,9,1,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Stillpine Ancestor Vark - On Script - Set Orientation (Owner)'),
(1741000,9,2,0,0,0,100,0,2000,2000,0,0,0,1,0,0,1,0,0,0,23,0,0,0,0,0,0,0,0,'Stillpine Ancestor Vark - On Script - Say Line 0'),
(1741000,9,3,0,0,0,100,0,8000,8000,0,0,0,11,30428,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Vark - On Script - Cast ''Stillpine Ancestor Despawn DND'''),
(1741000,9,4,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stillpine Ancestor Vark - On Script - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (17360,17361,17362,17363,17364);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,17360,0,0,1,0,30426,1,0,1,0,0,'Totem of Akida - Group 0: Execute SAI ID 0 if player does not have aura ''Stillpine Ancestor Akida'''),
(22,1,17361,0,0,1,0,30429,1,0,1,0,0,'Totem of Coo - Group 0: Execute SAI ID 0 if player does not have aura ''Stillpine Ancestor Coo'''),
(22,1,17362,0,0,1,0,30432,1,0,1,0,0,'Totem of Tikti - Group 0: Execute SAI ID 0 if player does not have aura ''Stillpine Ancestor Tikti'''),
(22,1,17363,0,0,1,0,30445,1,0,1,0,0,'Totem of Yor - Group 0: Execute SAI ID 0 if player does not have aura ''Stillpine Ancestor Yor'''),
(22,1,17364,0,0,1,0,30454,1,0,1,0,0,'Totem of Vark - Group 0: Execute SAI ID 0 if player does not have aura ''Stillpine Ancestor Vark''');

DELETE FROM `waypoints` WHERE `entry` IN (17379,17391,17392,17393);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(17379,1,-4168.3,-12511.5,44.3613,'Stillpine Ancestor Akida - Quest ''Totem of Coo'''),
(17379,2,-4154.22,-12514.7,45.2309,NULL),
(17379,3,-4141.08,-12515.8,45.6774,NULL),
(17379,4,-4131.07,-12516.6,44.7033,NULL),
(17379,5,-4123.56,-12517.2,44.8283,NULL),
(17379,6,-4116.14,-12518.8,44.2708,NULL),
(17379,7,-4107.13,-12520.7,43.3619,NULL),
(17379,8,-4098.82,-12522.5,42.1997,NULL),
(17379,9,-4091.88,-12524,42.3742,NULL),
(17379,10,-4080.74,-12528.8,43.6904,NULL),
(17379,11,-4068.97,-12533.9,44.1191,NULL),
(17379,12,-4058.04,-12538.6,43.9229,NULL),
(17379,13,-4050.42,-12545.8,42.2712,NULL),
(17379,14,-4043.97,-12551.9,43.389,NULL),
(17379,15,-4035,-12560.4,44.9155,NULL),
(17379,16,-4026.53,-12568.4,45.8046,NULL),
(17379,17,-4020.62,-12575.2,47.925,NULL),
(17379,18,-4014.26,-12582.5,50.2571,NULL),
(17379,19,-4007.96,-12589.7,51.9591,NULL),
(17379,20,-4000.16,-12598.6,54.1583,NULL),
(17379,21,-3994.51,-12605.7,56.7953,NULL),
(17379,22,-3985.17,-12617.5,61.0789,NULL),
(17379,23,-3977.5,-12627.2,63.0538,NULL),
(17379,24,-3971.99,-12634.4,64.3236,NULL),
(17379,25,-3967.2,-12640.7,66.1866,NULL),
(17379,26,-3959.58,-12650.8,70.9043,NULL),
(17379,27,-3952.25,-12660.4,74.317,NULL),
(17379,28,-3947.11,-12670.6,75.7651,NULL),
(17379,29,-3942.13,-12680.5,78.041,NULL),
(17379,30,-3937.26,-12690.2,82.4474,NULL),
(17379,31,-3933.18,-12698.3,85.5551,NULL),
(17379,32,-3929.52,-12708.5,87.4288,NULL),
(17379,33,-3925.84,-12718.8,89.6703,NULL),
(17379,34,-3922.22,-12727.8,92.8166,NULL),
(17379,35,-3918.55,-12736.9,95.4422,NULL),
(17379,36,-3915.91,-12743.4,98.5678,NULL),

(17391,1,-3926.04,-12746.7,96.0678,'Stillpine Ancestor Coo - Quest ''Totem of Tikti'''),
(17391,2,-3926.33,-12753.7,98.4428,NULL),
(17391,3,-3924.27,-12761.5,101.693,NULL),
(17391,4,-3926.07,-12767.3,104.38,NULL),
(17391,5,-3923.5,-12795,98.4632,NULL),
(17391,6,-3922.69,-12832.4,89.241,NULL),

(17392,1,-3881,-13107.1,5.51782,'Stillpine Ancestor Tikti - Quest ''Totem of Yor'''),
(17392,2,-3885.66,-13096.6,3.56383,NULL),
(17392,3,-3895.26,-13082.3,0.953544,NULL),
(17392,4,-3913.36,-13055.2,-4.82595,NULL),
(17392,5,-3951.4,-13033.9,-8.45508,NULL),

(17393,1,-4646.63,-13015.4,-1.38673,'Stillpine Ancestor Yor - Quest ''Totem of Vark'''),
(17393,2,-4656.59,-13006.1,0.133819,NULL),
(17393,3,-4668.7,-12994.8,0.693569,NULL),
(17393,4,-4679.14,-12985,0.5803,NULL),
(17393,5,-4679.91,-12973.6,1.42054,NULL),
(17393,6,-4680.61,-12963.3,2.66436,NULL),
(17393,7,-4680.89,-12956.9,3.75235,NULL),
(17393,8,-4681.2,-12949.7,5.54,NULL),
(17393,9,-4681.92,-12940.2,4.56182,NULL),
(17393,10,-4682.73,-12929.5,3.47035,NULL),
(17393,11,-4673.9,-12917.9,2.76644,NULL),
(17393,12,-4667.73,-12909.8,1.50962,NULL),
(17393,13,-4659.06,-12900.2,1.09935,NULL),
(17393,14,-4647.96,-12887.9,2.97161,NULL),
(17393,15,-4639.09,-12877.2,4.9471,NULL),
(17393,16,-4634.74,-12865.7,5.06317,NULL),
(17393,17,-4630.71,-12855.1,4.28118,NULL),
(17393,18,-4625.22,-12842,5.01537,NULL),
(17393,19,-4620.17,-12829.9,6.06746,NULL),
(17393,20,-4615.85,-12821.5,6.99239,NULL),
(17393,21,-4612,-12814,7.12509,NULL),
(17393,22,-4608.19,-12807,5.66417,NULL),
(17393,23,-4601.96,-12795.7,3.27105,NULL),
(17393,24,-4595.53,-12785.4,5.22577,NULL),
(17393,25,-4587.13,-12772.7,7.38265,NULL),
(17393,26,-4581.74,-12767.1,6.56492,NULL),
(17393,27,-4575.77,-12760.8,6.10979,NULL),
(17393,28,-4569.67,-12752.4,7.73868,NULL),
(17393,29,-4563.73,-12744.2,9.99685,NULL),
(17393,30,-4559.53,-12736.9,11.2467,NULL),
(17393,31,-4554.96,-12729,12.2105,NULL),
(17393,32,-4551.77,-12721.9,11.3428,NULL),
(17393,33,-4547.41,-12712.1,9.81412,NULL),
(17393,34,-4543.19,-12701.6,10.5336,NULL),
(17393,35,-4538.2,-12689.2,12.5838,NULL),
(17393,36,-4535.57,-12678.1,14.8524,NULL),
(17393,37,-4533.52,-12669.4,16.8694,NULL),
(17393,38,-4533.3,-12664.5,16.6624,NULL),
(17393,39,-4532.96,-12656.8,15.2664,NULL),
(17393,40,-4532.89,-12649.1,15.4381,NULL),
(17393,41,-4532.79,-12639,16.6052,NULL),
(17393,42,-4532.86,-12633.1,15.3662,NULL),
(17393,43,-4533.02,-12619.1,12.0263,NULL),
(17393,44,-4532.89,-12605.1,13.7138,NULL),
(17393,45,-4532.8,-12595.9,14.8177,NULL),
(17393,46,-4533.53,-12588.7,14.2059,NULL),
(17393,47,-4534.43,-12579.8,12.5176,NULL),
(17393,48,-4535.16,-12572.5,11.9603,NULL),
(17393,49,-4531.42,-12565.6,12.151,NULL),
(17393,50,-4526.96,-12557.4,11.0898,NULL),
(17393,51,-4521.38,-12547.2,8.20642,NULL),
(17393,52,-4516.95,-12539.1,7.06028,NULL),
(17393,53,-4513.86,-12533.5,6.69793,NULL),
(17393,54,-4510.83,-12528,5.28314,NULL),
(17393,55,-4506.74,-12520.5,2.71515,NULL),
(17393,56,-4502.67,-12513.3,3.53491,NULL),
(17393,57,-4497.45,-12504,4.50484,NULL),
(17393,58,-4492.57,-12495.4,4.36968,NULL),
(17393,59,-4484.92,-12482.6,3.41433,NULL),
(17393,60,-4476.92,-12469.2,2.26036,NULL),
(17393,61,-4473.49,-12461.9,3.2545,NULL),
(17393,62,-4470.65,-12455.9,3.99746,NULL),
(17393,63,-4466.87,-12447.9,3.55359,NULL),
(17393,64,-4462.38,-12438.4,2.68436,NULL),
(17393,65,-4448.59,-12440,1.98259,NULL),
(17393,66,-4430.42,-12442,2.38524,NULL),
(17393,67,-4419.91,-12429.3,3.2091,NULL),
(17393,68,-4414.82,-12416.1,3.78427,NULL),
(17393,69,-4408.61,-12400.1,5.02559,NULL),
(17393,70,-4411.39,-12385.9,5.24124,NULL),
(17393,71,-4414.42,-12370.4,5.99229,NULL),
(17393,72,-4418.52,-12358.9,7.18568,NULL),
(17393,73,-4423.44,-12345,8.29463,NULL),
(17393,74,-4429.55,-12330.2,9.44157,NULL),
(17393,75,-4435.58,-12315.7,10.3162,NULL),
(17393,76,-4445.88,-12310.2,11.1237,NULL),
(17393,77,-4457.19,-12304.2,12.3064,NULL),
(17393,78,-4465.72,-12299.4,13.2753,NULL),
(17393,79,-4475.24,-12294,13.9122,NULL),
(17393,80,-4482.56,-12287.3,14.8288,NULL),
(17393,81,-4490.89,-12279.7,15.2792,NULL),
(17393,82,-4495.55,-12268.5,15.5154,NULL),
(17393,83,-4499.54,-12258.9,15.8413,NULL),
(17393,84,-4503.42,-12249.6,16.3871,NULL),
(17393,85,-4506.84,-12239.5,16.8177,NULL),
(17393,86,-4510.15,-12229.8,17.1362,NULL),
(17393,87,-4511.71,-12219.7,17.1471,NULL),
(17393,88,-4513.27,-12209.5,16.9777,NULL),
(17393,89,-4513.45,-12199.5,17.0999,NULL),
(17393,90,-4513.64,-12189.1,16.9593,NULL),
(17393,91,-4510.44,-12179.7,16.5835,NULL),
(17393,92,-4506.92,-12169.5,16.3076,NULL),
(17393,93,-4502.99,-12158,16.1291,NULL),
(17393,94,-4504.85,-12147,16.3234,NULL),
(17393,95,-4506.77,-12135.6,16.5127,NULL),
(17393,96,-4508.94,-12122.7,16.9898,NULL),
(17393,97,-4507.08,-12108.8,17.7712,NULL),
(17393,98,-4505.31,-12095.6,18.8873,NULL),
(17393,99,-4503.08,-12084.6,19.9195,NULL),
(17393,100,-4500.36,-12071.2,21.4168,NULL),
(17393,101,-4508.48,-12061,22.7413,NULL),
(17393,102,-4516.81,-12050.5,24.2492,NULL),
(17393,103,-4528.22,-12037.5,26.0347,NULL),
(17393,104,-4530.18,-12022.1,27.2076,NULL),
(17393,105,-4531.9,-12008.6,28.4037,NULL),
(17393,106,-4535.29,-11996.4,29.3626,NULL),
(17393,107,-4538.61,-11984.4,29.7635,NULL),
(17393,108,-4541.08,-11974.4,29.6832,NULL),
(17393,109,-4543.79,-11963.5,29.1954,NULL),
(17393,110,-4540.52,-11948.3,28.2123,NULL),
(17393,111,-4537.48,-11934.2,27.0094,NULL),
(17393,112,-4535.45,-11921.1,25.0319,NULL),
(17393,113,-4533.18,-11906.3,22.686,NULL),
(17393,114,-4524.42,-11897.9,20.73,NULL),
(17393,115,-4513.81,-11887.7,18.6104,NULL),
(17393,116,-4504.71,-11879,17.5661,NULL),
(17393,117,-4503.46,-11869.4,16.8051,NULL),
(17393,118,-4501.96,-11857.9,15.7746,NULL),
(17393,119,-4500.36,-11845.7,15.0063,NULL),
(17393,120,-4505.51,-11831.2,14.2562,NULL),
(17393,121,-4510.63,-11816.8,13.8306,NULL),
(17393,122,-4516.37,-11808.6,14.2907,NULL),
(17393,123,-4523.98,-11797.7,14.6582,NULL),
(17393,124,-4531.7,-11786.6,15.5384,NULL),
(17393,125,-4540.11,-11776.3,16.6851,NULL),
(17393,126,-4548.66,-11765.8,17.3358,NULL),
(17393,127,-4555.94,-11756.9,17.6289,NULL),
(17393,128,-4551.19,-11746.1,18.5433,NULL),
(17393,129,-4546.7,-11735.9,19.533,NULL),
(17393,130,-4542.14,-11725.9,20.0117,NULL),
(17393,131,-4535.96,-11712.4,18.2368,NULL),
(17393,132,-4528.63,-11707.8,17.5258,NULL),
(17393,133,-4522.45,-11704,18.0279,NULL),
(17393,134,-4518.32,-11701.4,17.5709,NULL),
(17393,135,-4507,-11694.5,13.2184,NULL),
(17393,136,-4502.25,-11688.4,13.0018,NULL),
(17393,137,-4496.42,-11681,12.6125,NULL),
(17393,138,-4490.14,-11673,10.8723,NULL),
(17393,139,-4488.02,-11664.6,10.4685,NULL),
(17393,140,-4486.34,-11658,10.6353,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
