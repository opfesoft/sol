-- DB update 2020_12_25_00 -> 2020_12_27_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_25_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_25_00 2020_12_27_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609025274425789460'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609025274425789460');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (6131,193,8408,6140,6144,6137,6136,6135,6371,6348,6370,6352,6146,8764,8766,6380,6147,6198,6199,6200,6202,6201,6378,6189,6188,6187,6377,6185,6186,6184,8762,6148,6125,6126,6375,6117,6116,8759);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (6131,193,8408,6140,6144,6137,6136,6135,6371,6348,6370,6352,6146,8764,8766,6380,6147,6198,6199,6200,6202,6201,6378,6189,6188,6187,6377,6185,6186,6184,8762,6148,6125,6126,6375,6117,6116,8759) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 6118 AND `source_type` = 0 AND `id` = 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6131,0,0,0,0,0,100,0,0,0,6800,7400,0,11,9672,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Draconic Mageweaver - IC - Cast ''Frostbolt'''),
(6131,0,1,0,2,0,100,1,0,60,0,0,0,11,12557,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Draconic Mageweaver - Between 0-60% Health - Cast ''Cone of Cold'' (No Repeat)'),

(193,0,0,0,0,0,100,0,1700,1900,6500,6800,0,11,12057,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Blue Dragonspawn - IC - Cast ''Strike'''),

(8408,0,0,0,0,0,100,0,2100,2200,6400,6500,0,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warlord Krellian - IC - Cast ''Strike'''),
(8408,0,1,0,2,0,100,1,0,80,0,0,0,11,10968,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warlord Krellian - Between 0-80% Health - Cast ''Demoralizing Roar'' (No Repeat)'),

(6140,0,0,0,0,0,100,0,2100,2400,7600,8900,0,11,3391,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hetaera - IC - Cast ''Thrash'''),
(6140,0,1,0,2,0,100,1,0,80,0,0,0,11,7367,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hetaera - Between 0-80% Health - Cast ''Infected Bite'' (No Repeat)'),

(6144,0,0,0,0,0,100,0,2800,3100,8700,9300,0,11,10101,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Son of Arkkoroc - IC - Cast ''Knock Away'''),

(6137,0,0,0,0,0,100,0,2100,2300,17100,17300,0,11,13443,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Arkkoran Pincer - IC - Cast ''Rend'''),

(6136,0,0,0,4,0,100,0,0,0,0,0,0,11,8139,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Arkkoran Muckdweller - On Aggro - Cast ''Fevered Fatigue'''),

(6135,0,0,0,0,0,100,0,2100,2400,7200,8100,0,11,12057,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Arkkoran Clacker - IC - Cast ''Strike'''),

(6371,0,0,0,0,0,100,0,1700,2300,6800,7400,0,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Storm Bay Warrior - IC - Cast ''Strike'''),
(6371,0,1,0,2,0,100,1,0,60,0,0,0,11,12555,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Storm Bay Warrior - Between 0-60% Health - Cast ''Pummel'' (No Repeat)'),

(6348,0,0,0,0,0,100,0,2100,2300,6700,8200,0,11,3391,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wavethrasher - IC - Cast ''Thrash'''),

(6370,0,0,0,4,0,100,0,0,0,0,0,0,11,12548,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Makrinni Scrabbler - On Aggro - Cast ''Frost Shock'''),
(6370,0,1,0,0,0,100,0,2100,2300,6100,6300,0,11,20822,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Makrinni Scrabbler - IC - Cast ''Frostbolt'''),
(6370,0,2,0,2,0,100,1,0,40,0,0,0,11,11642,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Makrinni Scrabbler - Between 0-40% Health - Cast ''Heal'' (No Repeat)'),

(6352,0,0,0,0,0,100,0,2100,2900,7600,8100,0,11,3391,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Coralshell Lurker - IC - Cast ''Thrash'''),

(6146,0,0,0,4,0,100,0,0,0,0,0,0,11,11443,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cliff Breaker - On Aggro - Cast ''Cripple'''),

(8764,0,0,0,4,0,100,0,0,0,0,0,0,11,8806,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mistwing Ravager - On Aggro - Cast ''Poisoned Shot'''),
(8764,0,1,0,0,0,100,0,2700,3100,12700,13100,0,11,21067,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mistwing Ravager - IC - Cast ''Poison Bolt'''),

(8766,0,0,0,2,0,100,1,0,80,0,0,0,11,6907,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Forest Ooze - Between 0-80% Health - Cast ''Diseased Slime'' (No Repeat)'),

(6380,0,0,0,4,0,100,0,0,0,0,0,0,11,12553,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Thunderhead Consort - On Aggro - Cast ''Shock'''),
(6380,0,1,0,0,0,100,0,2700,3200,12800,13400,0,11,36594,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Thunderhead Consort - IC - Cast ''Lightning Breath'''),

(6147,0,0,0,2,0,100,1,0,80,0,0,0,11,8147,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cliff Thunderer - Between 0-80% Health - Cast ''Thunderclap'' (No Repeat)'),

(6198,0,0,0,0,0,100,0,2100,2400,7600,7900,0,11,11969,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Blood Elf Surveyor - IC - Cast ''Fire Nova'''),

(6199,0,0,0,0,0,100,0,0,0,5000,5100,0,11,20823,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Blood Elf Reclaimer - IC - Cast ''Fireball'''),
(6199,0,1,0,2,0,100,1,0,80,0,0,0,11,11640,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blood Elf Reclaimer - Between 0-80% Health - Cast ''Renew'' (No Repeat)'),
(6199,0,2,0,2,0,100,1,0,40,0,0,0,11,11642,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blood Elf Reclaimer - Between 0-40% Health - Cast ''Heal'' (No Repeat)'),

(6200,0,0,0,2,0,100,1,0,80,0,0,0,11,11981,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Legashi Satyr - Between 0-80% Health - Cast ''Mana Burn'' (No Repeat)'),

(6202,0,0,0,0,0,100,0,0,0,6100,6300,0,11,20823,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Legashi Hellcaller - IC - Cast ''Fireball'''),
(6202,0,1,0,2,0,100,1,0,60,0,0,0,11,11990,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Legashi Hellcaller - Between 0-60% Health - Cast ''Rain of Fire'' (No Repeat)'),

(6201,0,0,0,67,0,100,0,6900,7400,0,0,0,11,7159,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Legashi Rogue - Is Behind Target - Cast ''Backstab'''),

(6378,0,0,0,4,0,100,0,0,0,0,0,0,11,12553,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Thunderhead Skystormer - On Aggro - Cast ''Shock'''),
(6378,0,1,0,2,0,100,1,0,60,0,0,0,11,6535,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Thunderhead Skystormer - Between 0-60% Health - Cast ''Lightning Cloud'' (No Repeat)'),

(6189,0,0,0,2,0,100,1,0,80,0,0,0,11,8078,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Timbermaw Ursa - Between 0-80% Health - Cast ''Thunderclap'' (No Repeat)'),

(6188,0,0,0,0,0,100,0,0,0,6200,6500,0,11,20295,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Timbermaw Shaman - IC - Cast ''Lightning Bolt'''),
(6188,0,1,0,2,0,100,1,0,80,0,0,0,11,6535,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Timbermaw Shaman - Between 0-80% Health - Cast ''Lightning Cloud'' (No Repeat)'),
(6188,0,2,0,2,0,100,1,0,30,0,0,0,11,11986,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Timbermaw Shaman - Between 0-30% Health - Cast ''Healing Wave'' (No Repeat)'),

(6187,0,0,0,0,0,100,1,6500,10000,0,0,0,11,9128,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Timbermaw Den Watcher - IC - Cast ''Battle Shout'' (No Repeat)'),

(6377,0,0,0,4,0,100,0,0,0,0,0,0,11,12553,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Thunderhead Stagwing - On Aggro - Cast ''Shock'''),
(6377,0,1,0,0,0,100,0,2700,3100,8600,9400,0,11,11019,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thunderhead Stagwing - IC - Cast ''Wing Flap'''),

(6185,0,0,0,0,0,100,0,1700,1900,17500,19500,0,11,11977,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Timbermaw Warrior - IC - Cast ''Rend'''),
(6185,0,1,0,0,0,100,0,2400,2600,7600,8200,0,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Timbermaw Warrior - IC - Cast ''Strike'''),

(6186,0,0,0,26,0,100,1,0,2,0,0,1,11,8262,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Timbermaw Totemic - IC LOS - Cast ''Elemental Protection Totem'' (No Repeat)'),
(6186,0,1,0,2,0,100,1,0,30,0,0,0,11,5605,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Timbermaw Totemic - Between 0-30% Health - Cast ''Healing Ward'' (No Repeat)'),

(6184,0,0,0,4,0,100,0,0,0,0,0,0,11,16498,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Timbermaw Pathfinder - On Aggro - Cast ''Faerie Fire'''),

(8762,0,0,0,4,0,100,0,0,0,0,0,0,11,745,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Timberweb Recluse - On Aggro - Cast ''Web'''),
(8762,0,1,0,0,0,100,0,1700,2000,31700,32000,0,11,744,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Timberweb Recluse - IC - Cast ''Poison'''),

(6148,0,0,0,4,0,100,0,0,0,0,0,0,11,16498,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cliff Walker - On Aggro - Cast ''Faerie Fire'''),
(6148,0,1,0,2,0,100,1,0,60,0,0,0,11,11876,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cliff Walker - Between 0-60% Health - Cast ''War Stomp'' (No Repeat)'),

(6125,0,0,0,0,0,100,0,2100,2300,8900,9600,0,11,12057,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Haldarr Satyr - IC - Cast ''Strike'''),

(6126,0,0,0,0,0,100,1,5000,10000,0,0,0,11,7098,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Haldarr Trickster - IC - Cast ''Curse of Mending'' (No Repeat)'),

(6375,0,0,0,4,0,100,0,0,0,0,0,0,11,12553,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Thunderhead Hippogryph - On Aggro - Cast ''Shock'''),

(6117,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12544,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highborne Lichling - OOC - Cast ''Frost Armor'''),
(6117,0,1,0,0,0,100,0,0,0,6100,6200,0,11,20822,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Highborne Lichling - IC - Cast ''Frostbolt'''),

(6116,0,0,0,2,0,100,1,0,40,0,0,0,11,12542,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Highborne Apparition - Between 0-40% Health - Cast ''Fear'' (No Repeat)'),

(6118,0,1,0,4,0,100,0,0,0,0,0,0,11,21007,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Varo''then''s Ghost - On Aggro - Cast ''Curse of Weakness'''),

(8759,0,0,0,0,0,100,0,3200,3300,9800,12500,0,11,12612,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mosshoof Runner - IC - Cast ''Stomp''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
