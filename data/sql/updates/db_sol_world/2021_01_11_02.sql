-- DB update 2021_01_11_01 -> 2021_01_11_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_11_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_11_01 2021_01_11_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610375246191201350'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610375246191201350');

UPDATE `creature_template` SET `unit_class` = 2 WHERE `entry` = 14225;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (1106,3398,5785,5864,5937,6649,8199,8200,8203,8208,8214,8277,8282,10197,11447,11497,11498,12432,14225,14226,14227,14228,14229,14339,14344,14445,18241);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1106,1839,1885,3068,3398,5785,5807,5864,5933,5937,6649,8199,8200,8203,8208,8214,8215,8277,8281,8282,10197,10200,11447,11497,11498,12432,14225,14226,14227,14228,14229,14234,14339,14344,14445,18241) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1149700,1149701) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1106,0,0,0,0,0,100,0,3000,5000,9000,14000,0,11,11962,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Lost One Cook - IC - Cast ''Immolate'''),
(1106,0,1,0,0,0,100,0,0,0,8000,11000,0,11,11428,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Lost One Cook - IC - Cast ''Knockdown'''),

(1839,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet High Clerist - On Respawn - Set Active On'),
(1839,0,1,0,0,0,100,0,0,0,14000,19000,0,11,17141,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scarlet High Clerist - IC - Cast ''Holy Fire'''),
(1839,0,2,0,0,0,100,0,18000,25000,60000,90000,0,11,17139,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet High Clerist - IC - Cast ''Power Word: Shield'''),
(1839,0,3,0,2,0,100,0,0,50,15000,21000,0,11,15586,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet High Clerist - Between 0-50% Health - Cast ''Heal'''),
(1839,0,4,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Scarlet High Clerist - Between 0-15% Health - Flee For Assist (No Repeat)'),

(1885,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Smith - On Respawn - Set Active On'),
(1885,0,1,0,0,0,100,0,5000,7000,5000,7000,0,11,12057,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Smith - IC - Cast ''Strike'''),
(1885,0,2,0,0,0,100,0,8000,11000,11000,14000,0,11,11428,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Smith - IC - Cast ''Knockdown'''),
(1885,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Scarlet Smith - Between 0-15% Health - Flee For Assist (No Repeat)'),

(3068,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mazzranache - On Respawn - Set Active On'),
(3068,0,1,0,4,0,100,0,0,0,0,0,0,11,6268,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mazzranache - On Aggro - Cast ''Rushing Charge'''),
(3068,0,2,0,0,0,100,0,6000,8000,16000,20000,0,11,3583,2,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mazzranache - IC - Cast ''Deadly Poison'''),

(3398,0,0,0,0,0,100,0,6000,9000,17000,23000,0,11,3583,2,0,0,0,0,5,0,0,0,0,0,0,0,0,'Gesharahan - IC - Cast ''Deadly Poison'''),

(5785,0,0,0,0,0,100,0,0,0,3400,4800,0,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sister Hatelash - IC - Cast ''Lightning Bolt'''),
(5785,0,1,0,0,0,100,0,4000,9000,30000,45000,0,11,6960,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sister Hatelash - IC - Cast ''Lightning Barrier'''),

(5807,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Rake - On Respawn - Set Active On'),
(5807,0,1,0,0,0,100,0,5000,8000,8000,12000,0,11,12166,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'The Rake - IC - Cast ''Muscle Tear'''),

(5864,0,0,0,0,0,100,0,5000,7000,15000,17000,0,11,6016,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Swinegart Spearhide - IC - Cast ''Pierce Armor'''),

(5933,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Achellios the Banished - On Respawn - Set Active On'),
(5933,0,1,0,4,0,100,0,0,0,0,0,0,11,9128,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Achellios the Banished - On Aggro - Cast ''Battle Shout'''),

(5937,0,0,0,0,0,100,0,8000,12000,22000,26000,0,11,8257,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vile Sting - IC - Cast ''Venom Sting'''),

(6649,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lady Sesspira - Within 5-30 Range - Cast ''Shoot'''),
(6649,0,1,0,0,0,100,0,4000,6000,8000,12000,0,11,15495,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lady Sesspira - IC - Cast ''Explosive Shot'''),
(6649,0,2,0,0,0,100,0,11000,15000,9000,16000,0,11,20299,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Lady Sesspira - IC - Cast ''Forked Lightning'''),
(6649,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Lady Sesspira - Between 0-15% Health - Flee For Assist (No Repeat)'),

(8199,0,0,0,0,0,100,0,8000,10000,18000,34000,0,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warleader Krazzilak - IC - Cast ''Disarm'''),
(8199,0,1,0,0,0,100,0,13000,15000,17000,26000,0,11,9080,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warleader Krazzilak - IC - Cast ''Hamstring'''),
(8199,0,2,0,0,0,100,0,14000,18000,12000,26000,0,11,17230,32,0,0,0,0,5,0,0,0,0,0,0,0,0,'Warleader Krazzilak - IC - Cast ''Infected Wound'''),
(8199,0,3,0,0,0,100,0,12000,20000,12000,25000,0,11,18103,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Warleader Krazzilak - IC - Cast ''Backhand'''),

(8200,0,0,0,0,0,100,0,0,0,3400,4800,0,11,20824,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jin''Zallah the Sandbringer - IC - Cast ''Lightning Bolt'''),
(8200,0,1,0,9,0,100,0,0,8,13600,14500,0,11,7272,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jin''Zallah the Sandbringer - Within 0-8 Range - Cast ''Dust Cloud'''),
(8200,0,2,0,2,0,100,1,0,55,0,0,0,11,10132,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jin''Zallah the Sandbringer - Between 0-55% Health - Cast ''Sand Storms'' (No Repeat)'),

(8203,0,0,0,0,0,100,0,2000,3000,9000,14000,0,11,11976,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Kregg Keelhaul - IC - Cast ''Strike'''),
(8203,0,1,0,0,0,100,0,9000,16000,16000,21000,0,11,40504,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kregg Keelhaul - IC - Cast ''Cleave'''),

(8208,0,0,0,0,0,100,0,8000,12000,15000,20000,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Murderous Blisterpaw - IC - Cast ''Thrash'''),
(8208,0,1,0,0,0,100,0,12000,18000,15000,22000,0,11,13445,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Murderous Blisterpaw - IC - Cast ''Rend'''),

(8214,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jalinde Summerdrake - Within 5-30 Range - Cast ''Shoot'''),
(8214,0,1,0,0,0,100,0,4000,6000,9000,13000,0,11,15495,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Jalinde Summerdrake - IC - Cast ''Explosive Shot'''),
(8214,0,2,0,0,0,100,0,3000,5000,15000,21000,0,11,8806,32,0,0,0,0,5,0,0,0,0,0,0,0,0,'Jalinde Summerdrake - IC - Cast ''Poisoned Shot'''),

(8215,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimungous - On Respawn - Set Active On'),
(8215,0,1,0,0,0,100,0,6000,9000,9000,13000,0,11,5568,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimungous - IC - Cast ''Trample'''),
(8215,0,2,0,0,0,100,0,3000,5000,14000,20000,1,11,11876,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimungous - IC - Cast ''War Stomp'''),

(8277,0,0,0,0,0,100,0,7000,9000,16000,18000,0,11,3583,2,0,1,0,0,2,0,0,0,0,0,0,0,0,'Rekk''tilac - IC - Cast ''Deadly Poison'''),

(8281,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scald - On Respawn - Set Active On'),
(8281,0,1,0,0,0,100,0,3000,5000,14000,16000,0,11,11962,2,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scald - IC - Cast ''Immolate'''),

(8282,0,0,0,0,0,100,0,0,0,3000,5000,0,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Highlord Mastrogonde - IC - Cast ''Shadow Bolt'''),
(8282,0,1,0,0,0,100,0,8000,14000,21000,25000,0,11,11639,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Highlord Mastrogonde - IC - Cast ''Shadow Word: Pain'''),
(8282,0,2,0,0,0,100,0,6000,9000,15000,18000,0,11,13323,0,0,0,0,0,6,0,0,0,0,0,0,0,0,'Highlord Mastrogonde - IC - Cast ''Polymorph'''),
(8282,0,3,0,2,0,100,0,0,50,50000,70000,0,11,11974,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Mastrogonde - Between 0-50% Health - Cast ''Power Word: Shield'''),

(10197,0,0,0,9,0,100,0,0,5,31000,35000,1,11,15971,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mezzir the Howler - Within 0-5 Range - Cast ''Demoralizing Roar'''),
(10197,0,1,0,0,0,100,0,7000,10000,14000,18000,0,11,3131,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mezzir the Howler - IC - Cast ''Frost Breath'''),
(10197,0,2,0,2,0,100,0,0,40,18000,24000,0,11,14100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mezzir the Howler - Between 0-40% Health - Cast ''Terrifying Roar'''),

(10200,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rak''shiri - On Respawn - Set Active On'),
(10200,0,1,0,2,0,100,0,0,60,15000,21000,0,11,7399,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rak''shiri - Between 0-60% Health - Cast ''Terrify'''),
(10200,0,2,0,2,0,100,1,0,30,0,0,0,11,15716,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rak''shiri - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),
(10200,0,3,0,2,0,100,1,0,30,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rak''shiri - Between 0-30% Health - Say Line 0 (No Repeat)'),

(11447,0,0,0,0,0,100,0,2000,3000,12000,15000,0,11,22127,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mushgog - IC - Cast ''Entangling Roots'''),
(11447,0,1,0,0,0,100,0,7000,10000,8000,12000,0,11,21749,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mushgog - IC - Cast ''Thorn Volley'''),
(11447,0,2,0,6,0,100,0,0,0,0,0,0,11,22948,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mushgog - On Just Died - Cast ''Spore Cloud'''),

(11497,0,1,0,0,0,100,0,0,0,1000,1000,0,87,1149700,1149701,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Razza - IC - Call Random Timed Action List'),
(1149700,9,0,0,0,0,100,0,0,0,0,0,0,11,21067,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'The Razza - On Script - Cast ''Poison Bolt'''),
(1149701,9,0,0,0,0,100,0,0,0,0,0,0,11,12058,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'The Razza - On Script - Cast ''Chain Lightning'''),

(11498,0,0,0,0,0,100,0,5000,7000,13000,16000,0,11,11428,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Skarr the Unbreakable - IC - Cast ''Knockdown'''),
(11498,0,1,0,0,0,100,0,2000,3000,7000,10000,0,11,15496,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Skarr the Unbreakable - IC - Cast ''Cleave'''),
(11498,0,2,0,0,0,100,0,8000,12000,9000,15000,0,11,13737,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Skarr the Unbreakable - IC - Cast ''Mortal Strike'''),

(12432,0,0,0,0,0,100,0,5000,10000,7000,12000,0,11,13446,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Old Vicejaw - IC - Cast ''Strike'''),

(14225,0,0,0,0,0,100,0,0,0,3400,4800,0,11,35913,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Prince Kellen - IC - Cast ''Fel Fireball'''),
(14225,0,1,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Kellen - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),
(14225,0,2,0,2,0,100,1,0,30,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Kellen - Between 0-30% Health - Say Line 0 (No Repeat)'),

(14226,0,0,0,9,0,100,0,0,8,28000,34000,1,11,13730,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaskk - Within 0-8 Range - Cast ''Demoralizing Shout'''),
(14226,0,1,0,0,0,100,0,6000,9000,10000,16000,0,11,22859,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Kaskk - IC - Cast ''Mortal Cleave'''),

(14227,0,0,0,0,0,100,0,8000,12000,24000,28000,0,11,11020,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hissperak - IC - Cast ''Petrify'''),

(14228,0,0,0,0,0,100,0,6000,8000,6000,8000,0,11,3150,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Giggler - IC - Cast ''Rabies'''),

(14229,0,0,0,0,0,100,0,5000,8000,10000,15000,0,11,7947,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Accursed Slitherblade - IC - Cast ''Localized Toxin'''),

(14234,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hayoc - On Respawn - Set Active On'),
(14234,0,1,0,0,0,100,0,3000,5000,9000,14000,0,11,17157,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hayoc - IC - Cast ''Lightning Breath'''),
(14234,0,2,0,0,0,100,0,7000,9000,9000,14000,0,11,21059,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hayoc - IC - Cast ''Acid Spit'''),

(14339,0,0,0,0,0,100,0,2000,3000,12000,15000,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Death Howl - IC - Cast ''Tendon Rip'''),
(14339,0,1,0,0,0,100,0,7000,11000,25000,29000,0,11,8715,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Death Howl - IC - Cast ''Terrifying Howl'''),
(14339,0,2,0,0,0,100,0,4000,6000,8000,14000,0,11,3427,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Death Howl - IC - Cast ''Infected Wound'''),

(14344,0,0,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mongress - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),
(14344,0,1,0,0,0,100,0,2000,3000,12000,14500,0,11,31279,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mongress - IC - Cast ''Swipe'''),
(14344,0,2,0,2,0,100,1,0,30,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mongress - Between 0-30% Health - Say Line 0 (No Repeat)'),

(14445,0,0,0,0,0,100,0,9000,12000,9000,12000,0,11,12533,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lord Captain Wyrmak - IC - Cast ''Acid Breath'''),
(14445,0,1,0,0,0,100,0,2000,3000,5000,8000,0,11,15496,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Lord Captain Wyrmak - IC - Cast ''Cleave'''),

(18241,0,0,0,0,0,100,0,8000,12000,16000,22000,0,11,5424,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Crusty - IC - Cast ''Claw Grasp'''),
(18241,0,1,0,2,0,100,1,0,20,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusty - Between 0-20% Health - Cast ''Enrage'' (No Repeat)'),
(18241,0,2,0,2,0,100,1,0,20,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusty - Between 0-20% Health - Say Line 0 (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
