-- DB update 2021_01_07_01 -> 2021_01_07_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_07_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_07_01 2021_01_07_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610027869843940937'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610027869843940937');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (2635,595,873,875,877,879,871,978,979,813,679,14492);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2635,595,873,875,877,879,871,978,979,813,679,14492,678,680,709,710) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2635,0,0,0,0,0,100,0,3000,8000,13000,24000,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Elder Saltwater Crocolisk - IC - Cast ''Tendon Rip'''),

(595,0,0,0,9,0,100,0,5,30,2000,3000,1,11,10277,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bloodscalp Hunter - Within 5-30 Range - Cast ''Throw'''),
(595,0,1,0,0,0,100,0,9500,24100,18500,39800,0,11,6533,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Bloodscalp Hunter - IC - Cast ''Net'''),
(595,0,2,0,2,0,100,1,0,30,0,0,0,11,8599,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodscalp Hunter - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(873,0,0,0,0,0,100,0,0,0,3400,4800,0,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Saltscale Oracle - IC CMC - Cast ''Lightning Bolt'''),
(873,0,1,0,14,0,100,0,700,40,25000,35000,0,11,11986,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Saltscale Oracle - Friendly At 700 Health - Cast ''Healing Wave'''),
(873,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Saltscale Oracle - Between 0-15% Health - Flee For Assist (No Repeat)'),

(875,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12544,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Saltscale Tide Lord - OOC - Cast ''Frost Armor'''),
(875,0,1,0,0,0,100,0,0,0,2400,3800,0,11,9672,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Saltscale Tide Lord - IC CMC - Cast ''Frostbolt'''),
(875,0,2,0,9,0,100,0,0,10,15000,18500,1,11,11831,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Saltscale Tide Lord - Within 0-10 Range - Cast ''Frost Nova'''),
(875,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Saltscale Tide Lord - Between 0-15% Health - Flee For Assist (No Repeat)'),

(877,0,0,0,0,0,100,0,2000,3000,20000,30000,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Saltscale Forager - IC - Cast ''Rend'''),
(877,0,1,0,0,0,100,0,2000,3000,4000,9000,0,11,744,32,0,1,0,0,2,0,0,0,0,0,0,0,0,'Saltscale Forager - IC - Cast ''Poison'''),
(877,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Saltscale Forager - Between 0-15% Health - Flee For Assist (No Repeat)'),

(879,0,0,0,9,0,100,0,5,30,2000,3000,1,11,10277,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Saltscale Hunter - Within 5-30 Range - Cast ''Throw'''),
(879,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Saltscale Hunter - Between 0-15% Health - Flee For Assist (No Repeat)'),

(871,0,0,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Saltscale Warrior - Between 0-15% Health - Flee For Assist (No Repeat)'),

(978,0,0,0,0,0,100,0,6000,11000,20000,30000,0,11,8053,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Kurzen Subchief - IC - Cast ''Flame Shock'''),

(979,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kurzen Shadow Hunter - Within 5-30 Range - Cast ''Shoot'''),
(979,0,1,0,0,0,100,0,9000,14000,9000,14000,0,11,8806,32,0,1,0,0,5,0,0,0,0,0,0,0,0,'Kurzen Shadow Hunter - IC - Cast ''Poisoned Shot'''),
(979,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kurzen Shadow Hunter - Between 0-15% Health - Flee For Assist (No Repeat)'),

(813,0,0,0,0,0,100,0,8000,12000,25000,30000,0,11,8817,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Colonel Kurzen - IC - Cast ''Smoke Bomb'''),
(813,0,1,0,0,0,100,0,0,0,1000,1000,0,11,8818,32,0,1,0,0,2,0,0,0,0,0,0,0,0,'Colonel Kurzen - IC - Cast ''Garrote'''),
(813,0,2,0,23,0,100,0,8822,1,1000,1000,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Colonel Kurzen - On Has Aura ''Stealth'' - Disable Auto Attack'),
(813,0,3,0,23,0,100,0,8822,0,1000,1000,0,20,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Colonel Kurzen - On Has No Aura ''Stealth'' - Enable Auto Attack'),

(679,0,0,0,0,0,100,0,6500,10000,9500,12500,0,11,12058,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mosh''Ogg Shaman - IC - Cast ''Chain Lightning'''),
(679,0,1,0,2,0,100,0,0,30,34000,38000,0,11,6742,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mosh''Ogg Shaman - Between 0-30% Health - Cast ''Bloodlust'''),
(679,0,2,0,0,0,100,0,9500,18000,33000,45000,0,11,11899,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mosh''Ogg Shaman - IC - Cast ''Healing Ward'''),
(679,0,3,0,4,0,15,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Mosh''Ogg Shaman - On Aggro - Say Line 0'),

(14492,0,0,0,0,0,100,0,2000,3000,23800,28200,0,11,12097,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Verifonix - IC - Cast ''Pierce Armor'''),

(678,0,0,0,0,0,50,0,4000,6000,11000,12000,0,11,5164,2,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mosh''Ogg Mauler - IC - Cast ''Knockdown'''),
(678,0,1,0,4,0,15,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Mosh''Ogg Mauler - On Aggro - Say Line 0'),

(680,0,0,0,0,0,100,0,3000,4000,30000,40000,0,11,9128,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mosh''Ogg Lord - IC - Cast ''Battle Shout'''),
(680,0,1,0,4,0,15,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Mosh''Ogg Lord - On Aggro - Say Line 0'),

(709,0,0,0,0,0,75,0,2000,3000,10000,11000,0,11,8147,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mosh''Ogg Warmonger - IC - Cast ''Thunderclap'''),
(709,0,1,0,4,0,15,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Mosh''Ogg Warmonger - On Aggro - Say Line 0'),

(710,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12544,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mosh''Ogg Spellcrafter - OOC - Cast ''Frost Armor'''),
(710,0,1,0,0,0,100,0,3000,4000,5000,6000,0,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mosh''Ogg Spellcrafter - IC CMC - Cast ''Fireball'''),
(710,0,2,0,0,0,100,0,6000,7000,6000,7000,0,11,11829,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mosh''Ogg Spellcrafter - IC CMC - Cast ''Flamestrike'''),
(710,0,3,0,4,0,15,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Mosh''Ogg Spellcrafter - On Aggro - Say Line 0');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
