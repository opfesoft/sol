-- DB update 2020_12_30_07 -> 2020_12_30_08
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_30_07';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_30_07 2020_12_30_08 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609334862547184030'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609334862547184030');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (6131,193,8408,6140,6144,6137,6135,6371,6348,6352,6199,6202,6188,6125,6126) AND `source_type` = 0 AND `id` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (6370,8764,6380,8762,6117) AND `source_type` = 0 AND `id` = 1;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 6185 AND `source_type` = 0 AND `id` IN (0,1);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6131,0,0,0,0,0,100,0,0,0,6800,7400,0,11,9672,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Draconic Mageweaver - IC - Cast ''Frostbolt'''),

(193,0,0,0,0,0,100,0,1700,1900,6500,6800,0,11,12057,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Blue Dragonspawn - IC - Cast ''Strike'''),

(8408,0,0,0,0,0,100,0,2100,2200,6400,6500,0,11,11976,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Warlord Krellian - IC - Cast ''Strike'''),

(6140,0,0,0,0,0,100,0,2100,2400,7600,8900,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hetaera - IC - Cast ''Thrash'''),

(6144,0,0,0,0,0,100,0,2800,3100,8700,9300,0,11,10101,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Son of Arkkoroc - IC - Cast ''Knock Away'''),

(6137,0,0,0,0,0,100,0,2100,2300,17100,17300,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Arkkoran Pincer - IC - Cast ''Rend'''),

(6135,0,0,0,0,0,100,0,2100,2400,7200,8100,0,11,12057,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Arkkoran Clacker - IC - Cast ''Strike'''),

(6371,0,0,0,0,0,100,0,1700,2300,6800,7400,0,11,11976,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Storm Bay Warrior - IC - Cast ''Strike'''),

(6348,0,0,0,0,0,100,0,2100,2300,6700,8200,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wavethrasher - IC - Cast ''Thrash'''),

(6370,0,1,0,0,0,100,0,2100,2300,6100,6300,0,11,20822,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Makrinni Scrabbler - IC - Cast ''Frostbolt'''),

(6352,0,0,0,0,0,100,0,2100,2900,7600,8100,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Coralshell Lurker - IC - Cast ''Thrash'''),

(8764,0,1,0,0,0,100,0,2700,3100,12700,13100,0,11,21067,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mistwing Ravager - IC - Cast ''Poison Bolt'''),

(6380,0,1,0,0,0,100,0,2700,3200,12800,13400,0,11,36594,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Thunderhead Consort - IC - Cast ''Lightning Breath'''),

(6199,0,0,0,0,0,100,0,0,0,5000,5100,0,11,20823,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Blood Elf Reclaimer - IC - Cast ''Fireball'''),

(6202,0,0,0,0,0,100,0,0,0,6100,6300,0,11,20823,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Legashi Hellcaller - IC - Cast ''Fireball'''),

(6188,0,0,0,0,0,100,0,0,0,6200,6500,0,11,20295,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Timbermaw Shaman - IC - Cast ''Lightning Bolt'''),

(6185,0,0,0,0,0,100,0,1700,1900,17500,19500,0,11,11977,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Timbermaw Warrior - IC - Cast ''Rend'''),
(6185,0,1,0,0,0,100,0,2400,2600,7600,8200,0,11,11976,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Timbermaw Warrior - IC - Cast ''Strike'''),

(8762,0,1,0,0,0,100,0,1700,2000,31700,32000,0,11,744,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Timberweb Recluse - IC - Cast ''Poison'''),

(6125,0,0,0,0,0,100,0,2100,2300,8900,9600,0,11,12057,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Haldarr Satyr - IC - Cast ''Strike'''),

(6126,0,0,0,0,0,100,1,5000,10000,0,0,0,11,7098,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Haldarr Trickster - IC - Cast ''Curse of Mending'' (No Repeat)'),

(6117,0,1,0,0,0,100,0,0,0,6100,6200,0,11,20822,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Highborne Lichling - IC - Cast ''Frostbolt''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
