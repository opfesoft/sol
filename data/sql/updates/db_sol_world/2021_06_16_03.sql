-- DB update 2021_06_16_02 -> 2021_06_16_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_16_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_16_02 2021_06_16_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1623878744175516758'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1623878744175516758');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (4294,4295,4300,4302,4303,4298,4299,4540);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4294,0,0,0,0,0,100,0,4000,8000,15000,25000,0,11,6146,0,0,0,0,0,5,30,0,0,0,0,0,0,0,'Scarlet Sorcerer - IC - Cast ''Slow'''),
(4294,0,1,0,0,0,100,0,0,1000,3000,3500,0,11,9672,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Sorcerer - IC - Cast ''Frostbolt'''),
(4294,0,2,0,0,0,100,0,14000,29000,19000,28000,0,11,9672,0,0,0,0,0,5,30,0,0,0,0,0,0,0,'Scarlet Sorcerer - IC - Cast ''Blizzard'''),
(4294,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Sorcerer - Between 0-15% Health - Flee For Assist'),

(4295,0,0,0,4,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Myrmidon - On Aggro - Say Line 0'),
(4295,0,1,2,2,0,100,1,0,40,0,0,0,11,8269,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Myrmidon - Between 0-40% Health - Cast ''Frenzy'''),
(4295,0,2,0,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Myrmidon - Linked - Say Line 1'),

(4298,0,0,0,25,0,100,0,0,0,0,0,0,11,3637,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Defender - On Reset - Cast ''Improved Blocking III'''),
(4298,0,1,0,0,0,100,0,0,2000,180000,180000,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Defender - IC - Cast ''Defensive Stance'''),
(4298,0,2,0,13,0,100,0,8000,11000,0,0,0,11,11972,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Defender - Victim Casting - Cast ''Shield Bash'''),
(4298,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Defender - Between 0-15% Health - Flee For Assist'),

(4299,0,0,0,1,0,100,0,1000,1000,1200000,1200000,0,11,1006,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Chaplain - OOC - Cast ''Inner Fire'''),
(4299,0,1,0,4,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Chaplain - On Aggro - Set Event Phase 1'),
(4299,0,2,0,16,1,100,0,6066,40,8000,8000,0,11,6066,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Scarlet Chaplain - Friendly Missing Buff - Cast ''Power Word: Shield'' (Event Phase 1)'),
(4299,0,3,0,14,0,100,0,400,40,8000,8000,0,11,8362,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Scarlet Chaplain - Friendly Missing Health - Cast ''Renew'''),
(4299,0,4,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Chaplain - Between 0-15% Health - Flee For Assist'),

(4300,0,0,0,4,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Wizard - On Aggro - Say Line 0'),
(4300,0,1,0,0,0,100,0,2000,6000,7000,11000,0,11,8439,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Wizard - IC - Cast ''Arcane Explosion'''),
(4300,0,2,0,0,0,100,0,1000,5000,30000,30000,0,11,2601,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Wizard - IC - Cast ''Fire Shield III'''),
(4300,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Wizard - Between 0-15% Health - Flee For Assist'),

(4302,0,0,0,0,0,100,0,1000,5000,6000,9000,0,11,17143,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Champion - IC - Cast ''Holy Strike'''),
(4302,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Champion - Between 0-15% Health - Flee For Assist'),

(4303,0,0,0,14,0,100,0,400,40,8000,8000,0,11,8362,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Scarlet Abbot - Friendly Missing Health - Cast ''Renew'''),
(4303,0,1,0,14,0,100,0,600,40,4000,8000,0,11,6064,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Scarlet Abbot - Friendly Missing Health - Cast ''Heal'''),
(4303,0,2,3,2,0,100,1,0,40,0,0,0,11,8269,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Abbot - Between 0-40% Health - Cast ''Frenzy'''),
(4303,0,3,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Abbot - Linked - Say Line 0'),

(4540,0,0,0,25,0,100,0,0,0,0,0,0,11,3417,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Monk - On Reset - Cast ''Thrash'''),
(4540,0,1,0,13,0,100,0,7000,7000,0,0,0,11,11978,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Monk - Victim Casting - Cast ''Kick'''),
(4540,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Monk - Between 0-15% Health - Flee For Assist');

DELETE FROM `creature_text` WHERE `CreatureID` IN (4294,4295,4300,4302,4303,4298,4299,4540);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(4295,0,0,'You carry the taint of the Scourge.  Prepare to enter the Twisting Nether.',12,7,25,0,0,0,2625,0,'Scarlet Myrmidon'),
(4295,0,1,'There is no escape for you.  The Crusade shall destroy all who carry the Scourge''s taint.',12,7,25,0,0,0,2626,0,'Scarlet Myrmidon'),
(4295,0,2,'The Light condemns all who harbor evil.  Now you will die!',12,7,25,0,0,0,2627,0,'Scarlet Myrmidon'),
(4295,0,3,'The Scarlet Crusade shall smite the wicked and drive evil from these lands!',12,7,25,0,0,0,2628,0,'Scarlet Myrmidon'),
(4295,1,0,'%s goes into a frenzy!',16,0,100,0,0,0,1191,0,'Scarlet Myrmidon'),

(4300,0,0,'You carry the taint of the Scourge.  Prepare to enter the Twisting Nether.',12,7,25,0,0,0,2625,0,'Scarlet Wizard'),
(4300,0,1,'There is no escape for you.  The Crusade shall destroy all who carry the Scourge''s taint.',12,7,25,0,0,0,2626,0,'Scarlet Wizard'),
(4300,0,2,'The Light condemns all who harbor evil.  Now you will die!',12,7,25,0,0,0,2627,0,'Scarlet Wizard'),
(4300,0,3,'The Scarlet Crusade shall smite the wicked and drive evil from these lands!',12,7,25,0,0,0,2628,0,'Scarlet Wizard'),

(4303,0,0,'%s becomes enraged!',16,0,100,0,0,0,24144,0,'Scarlet Abbot');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
