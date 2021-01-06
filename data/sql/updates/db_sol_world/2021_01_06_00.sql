-- DB update 2021_01_05_07 -> 2021_01_06_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_05_07';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_05_07 2021_01_06_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609939567362334885'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609939567362334885');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (10201,10198,10196,7104,7132,7139,14343,14345,14340,14342,2192,7017,2191,6650,6646,6652,6647,6651,6648,5931,5932,4066,5915,5916,4015,5930,14230,4380,5851,5409,3295,3470,5786,5787,5343,5350,5356,14426,14427,5935,8205,16855);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (10199,10201,10198,10196,7104,7132,7139,14343,7137,14345,14340,14342,2192,7015,7017,2191,2184,6650,13896,6646,6652,6647,6651,6648,8660,5931,5932,4066,5915,5916,5928,4015,5930,14230,4380,4377,4339,5851,5409,5842,3295,3470,5786,5787,3056,5343,5350,5356,5934,14426,14427,5935,8205,16855) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (866000,866001) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10199,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grizzle Snowpaw - On Respawn - Set Active On'),
(10199,0,1,0,25,0,100,1,0,0,0,0,0,11,17205,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grizzle Snowpaw - On Reset - Cast ''Winterfall Firewater'' (No Repeat)'),
(10199,0,2,0,0,0,100,0,1200,1400,8600,8900,0,11,15793,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Grizzle Snowpaw - IC - Cast ''Maul'''),
(10199,0,3,0,0,0,100,0,6500,7000,14200,16800,0,11,12548,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Grizzle Snowpaw - IC - Cast ''Frost Shock'''),
(10199,0,4,0,0,0,100,0,9400,9900,24300,24900,0,11,8364,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Grizzle Snowpaw - IC - Cast ''Blizzard'''),

(10201,0,0,0,0,0,100,0,3200,4100,9800,11400,0,11,17146,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Lady Hederine - IC - Cast ''Shadow Word: Pain'''),

(10198,0,0,0,0,0,100,0,2300,3100,6750,9850,0,11,15284,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Kashoch the Reaver - IC - Cast ''Cleave'''),

(10196,0,0,0,4,0,100,0,0,0,0,0,0,11,9128,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'General Colbatann - On Aggro - Cast ''Battle Shout'''),
(10196,0,1,0,0,0,100,0,2700,3200,6800,9300,0,11,11971,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'General Colbatann - IC - Cast ''Sunder Armor'''),
(10196,0,2,0,2,0,100,1,0,40,0,0,0,11,13730,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'General Colbatann - Between 0-40% Health - Cast ''Demoralizing Shout'' (No Repeat)'),

(7104,0,0,0,0,0,100,0,2100,2200,6900,7300,0,11,12058,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Dessecus - IC - Cast ''Chain Lightning'''),
(7104,0,1,0,2,0,100,1,0,60,0,0,0,11,8293,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dessecus - Between 0-60% Health - Cast ''Lightning Cloud'' (No Repeat)'),

(7132,0,0,0,0,0,100,0,2100,2300,6400,7300,0,11,7947,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Toxic Horror - IC - Cast ''Localized Toxin'''),
(7132,0,1,0,2,0,100,1,0,60,0,0,0,11,13582,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Toxic Horror - Between 0-60% Health - Cast ''Deadly Poison'' (No Repeat)'),

(7139,0,0,0,0,0,100,0,2450,2850,6950,7150,0,11,45,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Irontree Stomper - IC - Cast ''War Stomp'''),

(14343,0,0,0,0,0,100,0,2100,2300,15900,18600,0,11,3589,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Olm the Wise - IC - Cast ''Deafening Screech'''),
(14343,0,1,0,2,0,100,1,0,30,0,0,0,11,6605,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Olm the Wise - Between 0-30% Health - Cast ''Terrifying Screech'' (No Repeat)'),

(7137,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Immolatus - On Respawn - Set Active On'),
(7137,0,1,0,0,0,100,0,2300,2600,14200,15300,0,11,10101,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Immolatus - IC - Cast ''Knock Away'''),

(14345,0,0,0,9,0,100,1,0,5,0,0,1,11,3335,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'The Ongar - Within 0-5 Range - Cast ''Dark Sludge'' (No Repeat)'),

(14340,0,0,0,4,0,100,0,0,0,0,0,0,11,13578,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alshirr Banebreath - On Aggro - Cast ''Jadefire'''),

(14342,0,0,0,0,0,100,1,0,0,0,0,0,11,13583,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ragepaw - IC - Cast ''Curse of the Deadwood'' (No Repeat)'),
(14342,0,1,0,0,0,100,0,1900,2100,7600,8300,0,11,13584,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ragepaw - IC - Cast ''Strike'''),

(2192,0,0,0,0,0,100,0,0,0,6500,6800,0,11,20793,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Firecaller Radison - IC - Cast ''Fireball'''),
(2192,0,1,0,2,0,100,1,0,60,0,0,0,11,11969,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Firecaller Radison - Between 0-60% Health - Cast ''Fire Nova'' (No Repeat)'),

(7015,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Flagglemurk the Cruel - On Respawn - Set Active On'),
(7015,0,1,0,0,0,100,0,2400,3100,7800,8600,0,11,11976,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Flagglemurk the Cruel - IC - Cast ''Strike'''),
(7015,0,2,0,2,0,100,1,0,40,0,0,0,11,11428,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Flagglemurk the Cruel - Between 0-40% Health - Cast ''Knockdown'' (No Repeat)'),

(7017,0,0,0,0,0,100,0,2100,2900,6700,7400,0,11,12057,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Lord Sinslayer - IC - Cast ''Strike'''),
(7017,0,1,0,2,0,100,1,0,40,0,0,0,11,13586,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Sinslayer - Between 0-40% Health - Cast ''Aqua Jet'' (No Repeat)'),

(2191,0,0,0,0,0,100,1,0,0,0,0,0,11,11980,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Licillin - IC - Cast ''Curse of Weakness'' (No Repeat)'),
(2191,0,1,0,0,0,100,0,0,0,6100,6300,0,11,20793,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Licillin - IC - Cast ''Fireball'''),

(2184,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Moongazer - On Respawn - Set Active On'),
(2184,0,1,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lady Moongazer - Within 5-30 Range - Cast ''Shoot'''),
(2184,0,2,0,0,0,100,1,0,0,0,0,0,11,6533,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Lady Moongazer - IC - Cast ''Net'' (No Repeat)'),

(6650,0,0,0,0,0,100,0,2100,2200,6500,6800,0,11,12057,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'General Fangferror - IC - Cast ''Strike'''),
(6650,0,1,0,2,0,100,1,0,60,0,0,0,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'General Fangferror - Between 0-60% Health - Cast ''Cleave'' (No Repeat)'),
(6650,0,2,0,2,0,100,1,0,20,0,0,0,11,18812,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'General Fangferror - Between 0-20% Health - Cast ''Knockdown'' (No Repeat)'),

(13896,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scalebeard - On Respawn - Set Active On'),
(13896,0,1,0,0,0,100,0,4800,8200,12400,16800,0,11,54663,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scalebeard - IC - Cast ''Fatal Bite'''),

(6646,0,0,0,0,0,100,0,2300,3100,7900,8400,0,11,10101,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Monnos the Elder - IC - Cast ''Knock Away'''),
(6646,0,1,0,2,0,100,1,0,80,0,0,0,11,5568,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Monnos the Elder - Between 0-80% Health - Cast ''Trample'' (No Repeat)'),
(6646,0,2,0,2,0,100,1,0,20,0,0,0,11,11876,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Monnos the Elder - Between 0-20% Health - Cast ''War Stomp'' (No Repeat)'),

(6652,0,0,0,0,0,100,0,2400,2900,7500,8100,0,11,21073,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Master Feardred - IC - Cast ''Arcane Explosion'''),

(6647,0,0,0,0,0,100,1,0,0,0,0,0,11,18651,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Magister Hawkhelm - IC - Cast ''Multi-Shot'' (No Repeat)'),
(6647,0,1,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Magister Hawkhelm - Within 5-30 Range - Cast ''Shoot'''),

(6651,0,0,0,0,0,100,1,0,0,0,0,0,11,12747,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Gatekeeper Rageroar - IC - Cast ''Entangling Roots'' (No Repeat)'),
(6651,0,1,0,0,0,100,0,2700,3200,8600,9700,0,11,13584,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Gatekeeper Rageroar - IC - Cast ''Strike'''),

(6648,0,0,0,0,0,100,0,1500,1600,16500,16600,0,11,13445,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Antilos - IC - Cast ''Rend'''),
(6648,0,1,0,0,0,100,0,3800,4200,8800,9200,0,11,40504,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Antilos - IC - Cast ''Cleave'''),
(6648,0,2,0,2,0,100,1,0,30,0,0,0,11,5708,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Antilos - Between 0-30% Health - Cast ''Swoop'' (No Repeat)'),

(8660,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Evalcharr - On Respawn - Set Active On'),
(8660,0,1,0,0,0,100,0,0,0,1000,1000,0,87,866000,866001,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Evalcharr - IC - Call Random Timed Action List'),
(866000,9,0,0,0,0,100,0,0,0,0,0,0,11,11985,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'The Evalcharr - On Script - Cast ''Fireball'''),
(866001,9,0,0,0,0,100,0,0,0,0,0,0,11,15797,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'The Evalcharr - On Script - Cast ''Lightning Breath'''),

(5931,0,0,0,0,0,100,1,0,0,0,0,0,11,6533,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Foreman Rigger - IC - Cast ''Net'' (No Repeat)'),
(5931,0,1,0,0,0,100,0,2100,2400,22100,22400,0,11,6016,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Foreman Rigger - IC - Cast ''Pierce Armor'''),

(5932,0,0,0,2,0,100,1,0,60,0,0,0,11,16508,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Taskmaster Whipfang - Between 0-60% Health - Cast ''Intimidating Roar'' (No Repeat)'),

(4066,0,0,0,0,0,100,0,2100,2900,8700,9900,0,11,15305,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Nal''taszar - IC - Cast ''Chain Lightning'''),
(4066,0,1,0,2,0,100,1,0,40,0,0,0,11,8211,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Nal''taszar - Between 0-40% Health - Cast ''Chain Burn'' (No Repeat)'),

(5915,0,0,0,4,0,100,0,0,0,0,0,0,11,7090,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brother Ravenoak - On Aggro - Cast ''Bear Form'''),
(5915,0,1,0,0,0,100,0,2100,2900,8900,9900,0,11,12161,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Brother Ravenoak - IC - Cast ''Maul'''),
(5915,0,2,0,2,0,100,1,0,80,0,0,0,11,8716,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Brother Ravenoak - Between 0-80% Health - Cast ''Low Swipe'' (No Repeat)'),
(5915,0,3,0,2,0,100,1,0,30,0,0,0,11,5164,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Brother Ravenoak - Between 0-30% Health - Cast ''Knockdown'' (No Repeat)'),

(5916,0,0,0,4,0,100,0,0,0,0,0,0,11,5759,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Amarassan - On Aggro - Cast ''Cat Form'''),
(5916,0,1,0,0,0,100,0,2400,3900,12400,13900,0,11,24332,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Sentinel Amarassan - IC - Cast ''Rake'''),

(5928,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sorrow Wing - On Respawn - Set Active On'),
(5928,0,1,0,2,0,100,1,0,80,0,0,0,11,3405,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sorrow Wing - Between 0-80% Health - Cast ''Soul Rend'' (No Repeat)'),
(5928,0,2,0,2,0,100,1,0,40,0,0,0,11,3388,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sorrow Wing - Between 0-40% Health - Cast ''Deadly Leech Poison'' (No Repeat)'),

(4015,0,0,0,0,0,100,0,2100,2300,32100,32300,0,11,744,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Pridewing Patriarch - IC - Cast ''Poison'''),

(5930,0,0,0,4,0,100,0,0,0,0,0,0,11,184,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sister Riven - On Aggro - Cast ''Fire Shield II'''),
(5930,0,1,0,0,0,100,0,2100,2200,27100,27200,0,11,3356,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Sister Riven - IC - Cast ''Flame Lash'''),
(5930,0,2,0,0,0,100,0,4800,6200,16800,19300,0,11,6725,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Sister Riven - IC - Cast ''Flame Spike'''),

(14230,0,0,0,1,0,100,0,0,0,1000,1000,0,11,34827,34,0,0,0,0,1,0,0,0,0,0,0,0,0,'Burgle Eye - OOC - Cast ''Water Shield'''),

(4380,0,0,0,0,0,100,0,2500,3000,30000,31000,0,11,744,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Darkmist Widow - IC - Cast ''Poison'''),
(4380,0,1,2,6,0,100,0,0,0,0,0,0,11,43134,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darkmist Widow - On Death - Cast ''Hatch Spiderlings'''),
(4380,0,2,0,61,0,100,0,0,0,0,0,0,11,43134,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darkmist Widow - Linked - Cast ''Hatch Spiderlings'''),

(4377,0,0,0,1,0,100,0,30000,30000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darkmist Hatchling - OOC - Force Despawn'),
(4377,0,1,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Darkmist Hatchling - On Just Summoned - Attack Closest Player'),

(4339,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brimgore - On Respawn - Set Active On'),
(4339,0,1,0,0,0,100,0,2100,2300,10100,10300,0,11,8873,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Brimgore - IC - Cast ''Flame Breath'''),
(4339,0,2,0,2,0,100,1,0,60,0,0,0,11,27641,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Brimgore - Between 0-60% Health - Cast ''Fear'' (No Repeat)'),

(5851,0,0,0,4,0,100,0,0,0,0,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Gerogg Hammertoe - On Aggro - Cast ''Defensive Stance'''),
(5851,0,1,0,2,0,100,1,0,60,0,0,0,11,3419,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Gerogg Hammertoe - Between 0-60% Health - Cast ''Improved Blocking'' (No Repeat)'),
(5851,0,2,0,0,0,100,0,2700,3200,12700,13500,0,11,1672,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Captain Gerogg Hammertoe - IC - Cast ''Shield Bash'''),
(5851,0,3,0,2,0,100,1,0,30,0,0,0,11,15062,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Gerogg Hammertoe - Between 0-30% Health - Cast ''Shield Wall'' (No Repeat)'),

(5409,0,0,0,1,0,100,0,30000,30000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harvester Swarm - Out of Combat - Force Despawn'),

(5842,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Takk the Leaper - On Respawn - Set Active On'),
(5842,0,1,0,0,0,100,1,0,0,0,0,0,11,53625,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Takk the Leaper - IC - Cast ''Heroic Leap'' (No Repeat)'),
(5842,0,2,0,0,0,100,0,2500,3000,12500,13000,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Takk the Leaper - IC - Cast ''Tendon Rip'''),

(3295,0,0,0,2,0,100,1,0,80,0,0,0,11,7279,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sludge Beast - Between 0-80% Health - Cast ''Black Sludge'' (No Repeat)'),

(3470,0,0,0,0,0,100,0,2500,3500,13500,14500,0,11,13737,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Rathorian - IC - Cast ''Mortal Strike'''),

(5786,0,0,0,0,0,100,1,0,0,0,0,0,11,12024,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Snagglespear - IC - Cast ''Net'' (No Repeat)'),

(5787,0,0,0,2,0,100,1,0,30,0,0,0,11,3019,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Enforcer Emilgund - Between 0-30% Health - Cast ''Frenzy'' (No Repeat)'),

(3056,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost Howl - On Respawn - Set Active On'),
(3056,0,1,0,0,0,100,0,3000,4000,48000,49000,0,11,5781,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ghost Howl - IC - Cast ''Threatening Growl'''),

(5343,0,0,0,0,0,100,0,0,0,8400,9500,0,11,9532,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Lady Szallah - IC - Cast ''Lightning Bolt'''),
(5343,0,1,0,2,0,100,1,0,80,0,0,0,11,8435,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lady Szallah - Between 0-80% Health - Cast ''Forked Lightning'' (No Repeat)'),
(5343,0,2,0,2,0,100,1,0,30,0,0,0,11,6728,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lady Szallah - Between 0-30% Health - Cast ''Enveloping Winds'' (No Repeat)'),

(5350,0,0,0,0,0,100,0,1500,3000,31000,33000,0,11,13298,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Qirot - IC - Cast ''Poison'''),

(5356,0,0,0,0,0,100,0,2500,5000,10000,15000,0,11,5543,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Snarler - IC - Cast ''Fade Out'''),

(5934,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heartrazor - On Respawn - Set Active On'),
(5934,0,1,0,0,0,100,0,2500,5000,50000,60000,0,11,8256,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Heartrazor - IC - Cast ''Lethal Toxin'''),

(14426,0,0,0,0,0,100,0,2000,3000,9000,12000,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harb Foulmountain - IC - Cast ''Thrash'''),
(14426,0,1,0,2,0,100,1,0,60,0,0,0,11,45,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Harb Foulmountain - Between 0-60% Health - Cast ''War Stomp'' (No Repeat)'),

(14427,0,0,0,0,0,100,0,2100,2700,9800,10200,0,11,11971,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Gibblesnik - IC - Cast ''Sunder Armor'''),

(5935,0,0,0,2,0,100,1,0,60,0,0,0,11,11020,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ironeye the Invincible - Between 0-60% Health - Cast ''Petrify'' (No Repeat)'),

(8205,0,0,0,0,0,100,0,1700,2400,10700,12500,0,11,21081,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Haarka the Ravenous - IC - Cast ''Sunder Armor'''),
(8205,0,1,0,0,0,100,0,3200,4900,11200,17400,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Haarka the Ravenous - IC - Cast ''Thrash'''),

(16855,0,0,0,0,0,100,0,4500,6000,25000,26000,0,11,6016,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Tregla - IC - Cast ''Pierce Armor''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
