-- DB update 2021_09_18_01 -> 2021_09_19_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_18_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_18_01 2021_09_19_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1632004679851264312'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1632004679851264312');

-- Fix spell "Summon Unstable Mushroom"
UPDATE `spell_dbc` SET `Effect1` = 28, `EffectMiscValueB1` = 64, `EffectImplicitTargetA1` = 75 WHERE `Id` = 35256;

-- Unstable Shroom: Set minlevel equal to maxlevel; no XP on kill
UPDATE `creature_template` SET `minlevel` = 66, `flags_extra` = `flags_extra` | 64 WHERE `entry` = 20479;

-- Tamed Sporebat: Remove all spawns (they are summoned via Feralfen Hunter SAI)
DELETE FROM `creature` WHERE `id` = 18201;

DELETE FROM `creature_text` WHERE `CreatureId` = 19734;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(19734,0,0,'%s throws a mushroom spore at $n.',16,0,100,0,0,0,18913,0,'Fungal Giant - Summon Unstable Mushroom');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (20293,20442,18340,18214,18212,18046,20090,20079,18122,20291,20290,18201,19734,20479,18423);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (20293,20442,18340,18214,18212,18046,20090,20079,18122,20291,20290,18201,19734,20479,18423,18113);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2047900;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20293,0,0,0,2,0,100,1,0,50,0,0,0,11,3248,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bogstrok Clacker - Between 0-50% Health - Cast ''Improved Blocking'' (No Repeat)'),

(20442,0,0,0,2,0,100,1,0,30,0,0,0,11,35491,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Bo''kar - Between 0-30% Health - Cast ''Furious Rage'' (No Repeat)'),

(18340,0,0,0,0,0,100,0,0,5000,10000,15000,0,11,33962,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Steam Pump Overseer - IC - Cast ''Toughen'''),
(18340,0,1,0,2,0,100,1,0,50,0,0,0,11,5164,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Steam Pump Overseer - Between 0-50% Health - Cast ''Knockdown'' (No Repeat)'),

(18214,0,0,0,25,0,100,0,0,0,0,0,0,11,3417,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fenclaw Thrasher - On Reset - Cast ''Thrash'''),

(18212,0,0,0,2,0,100,1,0,50,0,0,0,11,3019,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mudfin Frenzy - Between 0-50% Health - Cast ''Frenzy'' (No Repeat)'),

(18046,0,0,0,4,0,100,1,0,0,0,0,0,11,35472,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rajah Haghazed - On Aggro - Cast ''Shield Charge'' (No Repeat)'),
(18046,0,1,0,0,0,100,0,2500,5000,10000,15000,0,11,35473,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rajah Haghazed - IC - Cast ''Forceful Cleave'''),
(18046,0,2,0,2,0,100,1,0,80,0,0,0,11,16856,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rajah Haghazed - Between 0-80% Health - Cast ''Mortal Strike'' (No Repeat)'),
(18046,0,3,0,2,0,100,1,0,30,0,0,0,11,15062,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rajah Haghazed - Between 0-30% Health - Cast ''Shield Wall'' (No Repeat)'),

(20090,0,0,0,2,0,100,1,0,20,0,0,0,39,60,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodscale Sentry - Between 0-20% Health - Call For Help (No Repeat)'),

(20079,0,0,0,2,0,100,1,0,20,0,0,0,39,60,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darkcrest Sentry - Between 0-20% Health - Call For Help (No Repeat)'),

(18122,0,0,1,4,0,100,0,0,0,0,0,0,11,41363,0,0,0,0,0,11,18122,5,1,0,0,0,0,0,'Dreghood Drudge - On Aggro - Cast ''Shared Bonds'''),
(18122,0,1,0,61,0,100,0,0,0,0,0,0,39,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dreghood Drudge - Linked - Call For Help'),

(20291,0,0,0,2,0,100,1,0,80,0,0,0,11,6870,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lagoon Walker - Between 0-80% Health - Cast ''Moss Covered Feet'' (No Repeat)'),
(20291,0,1,0,2,0,100,1,0,40,0,0,0,11,7948,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lagoon Walker - Between 0-40% Health - Cast ''Wild Regeneration'' (No Repeat)'),

(20290,0,0,0,4,0,100,0,0,0,0,0,0,11,35319,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lagoon Eel - On Aggro - Cast ''Electric Skin'''),

(18201,0,0,0,6,0,75,0,0,0,0,0,0,11,35336,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tamed Sporebat - On Death - Cast ''Energizing Spores'''),
(18201,0,1,0,0,0,100,0,1000,1000,15000,15000,0,11,35394,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sporebat - IC - Cast ''Spore Cloud'''),

(19734,0,0,0,0,0,100,0,2000,5000,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fungal Giant - IC - Set Phase 1'),
(19734,0,1,2,9,1,100,0,0,10,15000,20000,0,11,35256,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Fungal Giant - Within 0-10 Range - Cast ''Summon Unstable Mushroom'' (Phase 1, No Repeat)'),
(19734,0,2,0,61,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,2,0,0,0,0,0,0,0,0,'Fungal Giant - Linked - Say Line 0'),

(20479,0,0,0,54,0,100,0,0,0,0,0,0,80,2047900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Unstable Shroom - On Just Summoned - Call Timed Action List'),
(20479,0,1,0,6,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,15,180517,1,0,0,0,0,0,0,'Unstable Shroom - On Death - Delete GO ''Putrid Mushroom'''),

(2047900,9,0,0,0,0,100,0,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Unstable Shroom - On Script - Disable Auto Attack'),
(2047900,9,1,0,0,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Unstable Shroom - On Script - Set Root On'),
(2047900,9,2,0,0,0,100,0,0,0,0,0,0,11,24904,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Unstable Shroom - On Script - Cast ''Summon Putrid Mushroom'''),
(2047900,9,3,0,0,0,100,0,5000,5000,0,0,0,11,35252,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Unstable Shroom - On Script - Cast ''Unstable Cloud'''),
(2047900,9,4,0,0,0,100,0,0,0,0,0,0,11,35362,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Unstable Shroom - On Script - Cast ''Unstable Mushroom Visual'''),
(2047900,9,5,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,15,180517,1,0,0,0,0,0,0,'Unstable Shroom - On Script - Delete GO ''Putrid Mushroom'''),
(2047900,9,6,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Unstable Shroom - On Script - Force Despawn'),

(18423,0,0,0,4,0,100,0,0,0,0,0,0,11,32323,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cho''war the Pillager - On Aggro - Cast ''Charge'''),
(18423,0,1,0,0,0,100,1,1500,2000,0,0,0,11,31403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cho''war the Pillager - IC - Cast ''Battle Shout'' (No Repeat)'),
(18423,0,2,0,0,0,100,0,2500,5000,10000,15000,0,11,17963,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cho''war the Pillager - IC - Cast ''Sundering Cleave'''),
(18423,0,3,0,2,0,100,1,0,80,0,0,0,11,15708,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cho''war the Pillager - Between 0-80% Health - Cast ''Mortal Strike'' (No Repeat)'),

(18113,0,0,0,1,0,100,1,1000,1000,0,0,0,11,32060,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feralfen Hunter - OOC - Cast ''Summon Sporebat'' (No Repeat)'),
(18113,0,1,0,9,0,100,0,5,30,2300,3900,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Feralfen Hunter - Within 5-30 Range - Cast ''Shoot'''),
(18113,0,2,0,0,0,100,0,4000,8000,18000,24000,0,11,31975,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Feralfen Hunter - IC - Cast ''Serpent Sting'''),
(18113,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Feralfen Hunter - Between 0-15% Health - Flee For Assist (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
