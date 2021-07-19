-- DB update 2021_07_19_01 -> 2021_07_20_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_07_19_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_07_19_01 2021_07_20_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1626735474026514504'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1626735474026514504');

UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI', `Data2` = 0, `Data5` = 1 WHERE `entry` IN (181699,181878);

DELETE FROM `gameobject` WHERE `guid` IN (28522,92592,92593,92594,92595,92596,92597,92598,92599,92600,92601,92602,92603,92604,92605,92606,92607);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(28522,181699,530,0,0,1,1,-1647.35,-10922.1,58.8833,4.53641,0,0,-0.76651,0.642232,310,0,1,0),
(92592,181878,530,0,0,1,1,-1648.48,-10927.1,59.1197,2.11185,0,0,0.870356,0.492424,300,255,1,0),
(92593,181878,530,0,0,1,1,-1648.16,-10926,58.9527,2.07694,0,0,0.861629,0.507539,300,255,1,0),
(92594,181878,530,0,0,1,1,-1647.21,-10926.8,59.1528,2.79252,0,0,0.984807,0.173652,300,255,1,0),
(92595,181878,530,0,0,1,1,-1646.84,-10925.8,59.0401,0.558504,0,0,0.275637,0.961262,300,255,1,0),
(92596,181878,530,0,0,1,1,-1646.11,-10927.1,59.3048,2.40855,0,0,0.93358,0.358368,300,255,1,0),
(92597,181878,530,0,0,1,1,-1646.05,-10922.5,58.9643,5.07891,0,0,-0.566406,0.824126,300,255,1,0),
(92598,181878,530,0,0,1,1,-1645.69,-10924.8,59.005,1.81514,0,0,0.788011,0.615662,300,255,1,0),
(92599,181878,530,0,0,1,1,-1645.68,-10926,59.1503,2.23402,0,0,0.898793,0.438373,300,255,1,0),
(92600,181878,530,0,0,1,1,-1645.67,-10923.6,58.9843,1.309,0,0,0.608761,0.793354,300,255,1,0),
(92601,181878,530,0,0,1,1,-1644.94,-10922.8,58.9166,6.00393,0,0,-0.139173,0.990268,300,255,1,0),
(92602,181878,530,0,0,1,1,-1644.82,-10926.6,59.1072,6.10865,0,0,-0.0871553,0.996195,300,255,1,0),
(92603,181878,530,0,0,1,1,-1644.72,-10925.4,58.9535,0.279252,0,0,0.139173,0.990268,300,255,1,0),
(92604,181878,530,0,0,1,1,-1644.68,-10924.1,58.9146,0.925024,0,0,0.446198,0.894935,300,255,1,0),
(92605,181878,530,0,0,1,1,-1643.86,-10923.2,58.841,1.36136,0,0,0.62932,0.777146,300,255,1,0),
(92606,181878,530,0,0,1,1,-1643.71,-10924.5,58.8313,5.51524,0,0,-0.374606,0.927184,300,255,1,0),
(92607,181878,530,0,0,1,1,-1643.62,-10925.9,58.8961,2.68781,0,0,0.97437,0.224951,300,255,1,0);

UPDATE `creature_template` SET `faction` = 1685 WHERE `entry` = 6748;

DELETE FROM `creature_text` WHERE `CreatureId` IN (6748,17359);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(6748,0,0,'Wrong!  It is YOU that will die, Tel''athion the Impure!',12,0,100,0,0,0,14247,0,'Water Spirit'),
(17359,0,0,'What have you done to my life''s work?!  DIE!!!',12,0,100,0,0,0,13793,0,'Tel''athion the Impure'),
(17359,1,0,'It is YOU who are wrong!  I will deal with you two after I have slain this meddlesome shaman!',12,0,100,0,0,0,14248,0,'Tel''athion the Impure');

DELETE FROM `event_scripts` WHERE `id` = 10685;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (6748,17359);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (6748,17359);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (181699,181878);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (18169900,18187800,1735900);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(181699,1,0,0,70,0,100,0,2,0,0,0,0,80,18169900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Barrel of Filth - On Gameobject State Changed - Call Timed Action List'),

(18169900,9,0,0,0,0,100,0,0,0,0,0,0,11,69657,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Barrel of Filth - On Script - Cast ''Water Splash (Self)'''),
(18169900,9,1,0,0,0,100,0,1500,2500,0,0,0,45,1,1,0,0,0,0,14,92597,181878,0,0,0,0,0,0,'Barrel of Filth - On Script - Set Data 1 1 (Barrel of Filth)'),
(18169900,9,2,0,0,0,100,0,0,0,0,0,0,12,17359,4,30000,0,0,0,8,0,0,0,0,-1651.199219,-10924.120117,58.633022,4.135927,'Barrel of Filth - On Script - Summon Creature ''Tel''athion the Impure'''),
(18169900,9,3,0,0,0,100,0,500,1000,0,0,0,45,1,1,0,0,0,0,14,92601,181878,0,0,0,0,0,0,'Barrel of Filth - On Script - Set Data 1 1 (Barrel of Filth)'),
(18169900,9,4,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,14,92600,181878,0,0,0,0,0,0,'Barrel of Filth - On Script - Set Data 1 1 (Barrel of Filth)'),
(18169900,9,5,0,0,0,100,0,500,1000,0,0,0,45,1,1,0,0,0,0,14,92598,181878,0,0,0,0,0,0,'Barrel of Filth - On Script - Set Data 1 1 (Barrel of Filth)'),
(18169900,9,6,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,14,92604,181878,0,0,0,0,0,0,'Barrel of Filth - On Script - Set Data 1 1 (Barrel of Filth)'),
(18169900,9,7,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,14,92605,181878,0,0,0,0,0,0,'Barrel of Filth - On Script - Set Data 1 1 (Barrel of Filth)'),
(18169900,9,8,0,0,0,100,0,500,1000,0,0,0,45,1,1,0,0,0,0,14,92606,181878,0,0,0,0,0,0,'Barrel of Filth - On Script - Set Data 1 1 (Barrel of Filth)'),
(18169900,9,9,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,14,92603,181878,0,0,0,0,0,0,'Barrel of Filth - On Script - Set Data 1 1 (Barrel of Filth)'),
(18169900,9,10,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,14,92599,181878,0,0,0,0,0,0,'Barrel of Filth - On Script - Set Data 1 1 (Barrel of Filth)'),
(18169900,9,11,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,14,92595,181878,0,0,0,0,0,0,'Barrel of Filth - On Script - Set Data 1 1 (Barrel of Filth)'),
(18169900,9,12,0,0,0,100,0,500,1000,0,0,0,45,1,1,0,0,0,0,14,92593,181878,0,0,0,0,0,0,'Barrel of Filth - On Script - Set Data 1 1 (Barrel of Filth)'),
(18169900,9,13,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,14,92594,181878,0,0,0,0,0,0,'Barrel of Filth - On Script - Set Data 1 1 (Barrel of Filth)'),
(18169900,9,14,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,14,92596,181878,0,0,0,0,0,0,'Barrel of Filth - On Script - Set Data 1 1 (Barrel of Filth)'),
(18169900,9,15,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,14,92602,181878,0,0,0,0,0,0,'Barrel of Filth - On Script - Set Data 1 1 (Barrel of Filth)'),
(18169900,9,16,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,14,92607,181878,0,0,0,0,0,0,'Barrel of Filth - On Script - Set Data 1 1 (Barrel of Filth)'),
(18169900,9,17,0,0,0,100,0,500,1000,0,0,0,45,1,1,0,0,0,0,14,92592,181878,0,0,0,0,0,0,'Barrel of Filth - On Script - Set Data 1 1 (Barrel of Filth)'),

(181878,1,0,0,38,0,100,0,1,1,0,0,0,80,18187800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Barrel of Filth - On Gameobject State Changed - Call Timed Action List'),

(18187800,9,0,0,0,0,100,0,0,0,0,0,0,11,69657,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Barrel of Filth - On Gameobject State Changed - Cast ''Water Splash (Self)'''),
(18187800,9,1,0,0,0,100,0,3000,3000,0,0,0,99,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Barrel of Filth - On Gameobject State Changed - Set GO Loot State 2'),

(6748,0,0,0,1,0,100,0,4000,4000,0,0,0,49,0,0,0,0,0,0,19,17359,0,0,0,0,0,0,0,'Water Spirit - OOC - Start Attack (Tel''athion the Impure)'),

(17359,0,0,1,54,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tel''athion the Impure - On Just Summoned - Say Line 0'),
(17359,0,1,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Tel''athion the Impure - On Just Summoned - Start Attack (Nearest Player)'),
(17359,0,2,0,4,0,100,0,0,0,0,0,0,11,11831,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tel''athion the Impure - On Aggro - Cast ''Frost Nova'''),
(17359,0,3,0,0,0,100,0,0,0,3000,5000,0,11,9672,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Tel''athion the Impure - IC - Cast ''Frostbolt'''),
(17359,0,4,0,0,0,100,0,9000,11000,13000,15000,0,11,15735,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Tel''athion the Impure - IC - Cast ''Arcane Missiles'''),
(17359,0,5,0,0,0,100,0,4000,6000,12000,16000,0,11,13339,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Tel''athion the Impure - IC - Cast ''Fire Blast'''),
(17359,0,6,0,2,0,100,257,0,50,0,0,0,80,1735900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tel''athion the Impure - On Health Between 0-50% - Call Timed Action List (No Repeat, Don''t Reset)'),

(1735900,9,0,0,0,0,100,0,0,0,0,0,0,12,6748,4,30000,0,0,0,8,0,0,0,0,-1637.901978,-10915.750977,58.330589,4.159483,'Tel''athion the Impure - On Script - Summon Creature ''Water Spirit'''),
(1735900,9,1,0,0,0,100,0,0,0,0,0,0,12,6748,4,30000,0,0,0,8,0,0,0,0,-1647.273315,-10907.033203,58.325653,4.565927,'Tel''athion the Impure - On Script - Summon Creature ''Water Spirit'''),
(1735900,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,19,6748,0,0,0,0,0,0,0,'Tel''athion the Impure - On Script - Say Line 0 (Water Spirit)'),
(1735900,9,3,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tel''athion the Impure - On Script - Say Line 1');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
