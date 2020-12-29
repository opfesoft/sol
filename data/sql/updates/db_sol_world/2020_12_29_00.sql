-- DB update 2020_12_27_00 -> 2020_12_29_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_27_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_27_00 2020_12_29_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609277119714519758'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609277119714519758');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (7100,9878,9518,7093,7118,7112,7115,7459,7461,10659,2206,2167,2204,10157,2176,2178,2177,6136,6370,6146,8764,6380,6378,6377,6184,8762,6148,6375,6126) AND `source_type` = 0 AND `id` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (18680,7442,6118) AND `source_type` = 0 AND `id` = 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18680,0,1,0,0,0,100,1,0,0,0,0,0,11,32039,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Marticar - IC - Cast ''Magnetic Pull'' (No Repeat)'),

(7100,0,0,0,0,0,100,1,0,0,0,0,0,11,11922,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Warpwood Moss Flayer - IC - Cast ''Entangling Roots'' (No Repeat)'),

(9878,0,0,0,0,0,100,1,0,0,0,0,0,11,15661,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Entropic Beast - IC - Cast ''Immolate'' (No Repeat)'),

(9518,0,0,0,0,0,100,1,0,0,0,0,0,11,17227,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Rakaiah - IC - Cast ''Curse of Weakness'' (No Repeat)'),

(7093,0,0,0,0,0,100,1,0,0,0,0,0,11,21067,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vile Ooze - IC - Cast ''Poison Bolt'' (No Repeat)'),

(7118,0,0,0,0,0,100,1,0,0,0,0,0,11,11962,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Darkweaver - IC - Cast ''Immolate'' (No Repeat)'),

(7112,0,0,0,0,0,100,1,0,0,0,0,0,11,11639,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Cultist - IC - Cast ''Shadow Word: Pain'' (No Repeat)'),

(7115,0,0,0,0,0,100,1,0,0,0,0,0,11,20832,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Adept - IC - Cast ''Fire Blast'' (No Repeat)'),

(7459,0,0,0,4,0,100,0,0,0,0,0,0,11,6268,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ice Thistle Matriarch - On Aggro - Cast ''Rushing Charge'''),

(7461,0,0,0,0,0,100,1,0,0,0,0,0,11,37668,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Hederine Initiate - IC - Cast ''Immolate'' (No Repeat)'),

(10659,0,0,0,0,0,100,1,0,0,0,0,0,11,15089,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cobalt Whelp - IC - Cast ''Frost Shock'' (No Repeat)'),

(7442,0,1,0,0,0,100,1,0,0,0,0,0,11,16498,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Winterfall Pathfinder - IC - Cast ''Faerie Fire'' (No Repeat)'),

(2206,0,0,0,0,0,100,1,0,0,0,0,0,11,10277,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Greymist Hunter - IC - Cast ''Throw'' (No Repeat)'),

(2167,0,0,0,0,0,100,1,0,0,0,0,0,11,6950,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Blackwood Pathfinder - IC - Cast ''Faerie Fire'' (No Repeat)'),

(2204,0,0,0,0,0,100,1,0,0,0,0,0,11,12024,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Greymist Netter - IC - Cast ''Net'' (No Repeat)'),

(10157,0,0,0,0,0,100,1,0,0,0,0,0,11,15798,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Moonkin Oracle - IC - Cast ''Moonfire'' (No Repeat)'),

(2176,0,0,0,0,0,100,1,0,0,0,0,0,11,5884,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cursed Highborne - IC - Cast ''Banshee Curse'' (No Repeat)'),

(2178,0,0,0,0,0,100,1,0,0,0,0,0,11,5884,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Wailing Highborne - IC - Cast ''Banshee Curse'' (No Repeat)'),

(2177,0,0,0,0,0,100,1,0,0,0,0,0,11,5884,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Writhing Highborne - IC - Cast ''Banshee Curse'' (No Repeat)'),

(6136,0,0,0,0,0,100,1,0,0,0,0,0,11,8139,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Arkkoran Muckdweller - IC - Cast ''Fevered Fatigue'' (No Repeat)'),

(6370,0,0,0,0,0,100,1,0,0,0,0,0,11,12548,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Makrinni Scrabbler - IC - Cast ''Frost Shock'' (No Repeat)'),

(6146,0,0,0,0,0,100,1,0,0,0,0,0,11,11443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cliff Breaker - IC - Cast ''Cripple'' (No Repeat)'),

(8764,0,0,0,0,0,100,1,0,0,0,0,0,11,8806,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mistwing Ravager - IC - Cast ''Poisoned Shot'' (No Repeat)'),

(6380,0,0,0,0,0,100,1,0,0,0,0,0,11,12553,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Thunderhead Consort - IC - Cast ''Shock'' (No Repeat)'),

(6378,0,0,0,0,0,100,1,0,0,0,0,0,11,12553,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Thunderhead Skystormer - IC - Cast ''Shock'' (No Repeat)'),

(6377,0,0,0,0,0,100,1,0,0,0,0,0,11,12553,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Thunderhead Stagwing - IC - Cast ''Shock'' (No Repeat)'),

(6184,0,0,0,0,0,100,1,0,0,0,0,0,11,16498,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Timbermaw Pathfinder - IC - Cast ''Faerie Fire'' (No Repeat)'),

(8762,0,0,0,0,0,100,1,0,0,0,0,0,11,745,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Timberweb Recluse - IC - Cast ''Web'' (No Repeat)'),

(6148,0,0,0,0,0,100,1,0,0,0,0,0,11,16498,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cliff Walker - IC - Cast ''Faerie Fire'' (No Repeat)'),

(6375,0,0,0,0,0,100,1,0,0,0,0,0,11,12553,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Thunderhead Hippogryph - IC - Cast ''Shock'' (No Repeat)'),

(6118,0,1,0,0,0,100,1,0,0,0,0,0,11,21007,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Varo''then''s Ghost - IC - Cast ''Curse of Weakness'' (No Repeat)'),

(6126,0,0,0,0,0,100,1,0,0,0,0,0,11,7098,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Haldarr Trickster - IC - Cast ''Curse of Mending'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
