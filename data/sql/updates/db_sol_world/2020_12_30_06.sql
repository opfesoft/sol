-- DB update 2020_12_30_05 -> 2020_12_30_06
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_30_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_30_05 2020_12_30_06 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609327473810726460'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609327473810726460');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (7434,7433,7431,7430,7449,7463,7428,10807,7436,10660,10661,7447,7457) AND `source_type` = 0 AND `id` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (7439,7459,7461,7437,10659) AND `source_type` = 0 AND `id` = 1;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (7460,7462,7435,7448,7450) AND `source_type` = 0 AND `id` IN (0,1);
DELETE FROM `smart_scripts` WHERE `entryorguid` = 10738 AND `source_type` = 0 AND `id` IN (1,2,3);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7434,0,0,0,0,0,100,0,1500,2500,16500,18500,0,11,36590,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Frostsaber Pride Watcher - IC - Cast ''Rip'''),

(7433,0,0,0,0,0,100,0,1000,2000,16000,18000,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Frostsaber Huntress - IC - Cast ''Rend'''),

(7431,0,0,0,0,0,100,0,1500,2000,10000,11000,0,11,24331,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Frostsaber - IC - Cast ''Rake'''),

(7430,0,0,0,0,0,100,0,1500,2000,10000,11000,0,11,24331,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Frostsaber Cub - IC - Cast ''Rake'''),

(10738,0,1,0,0,0,100,0,1200,1400,8600,8900,0,11,15793,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'High Chief Winterfall - IC - Cast ''Maul'''),
(10738,0,2,0,0,0,100,0,6500,7000,14200,16800,0,11,12548,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'High Chief Winterfall - IC - Cast ''Frost Shock'''),
(10738,0,3,0,0,0,100,0,9400,9900,24300,24900,0,11,8364,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'High Chief Winterfall - IC - Cast ''Blizzard'''),

(7439,0,1,0,0,0,100,0,0,0,7500,8000,0,11,9532,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Winterfall Shaman - IC - Cast ''Lightning Bolt'''),

(7459,0,1,0,0,0,100,0,2700,3400,11900,16000,0,11,15878,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ice Thistle Matriarch - IC - Cast ''Ice Blast'''),

(7460,0,0,0,0,0,100,0,2100,2700,8400,9300,0,11,3131,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ice Thistle Patriarch - IC - Cast ''Frost Breath'''),
(7460,0,1,0,0,0,100,0,11750,14600,21200,24300,0,11,15878,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ice Thistle Patriarch - IC - Cast ''Ice Blast'''),

(7449,0,0,0,0,0,100,0,4700,5200,17700,19200,0,11,15850,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Chillwind Ravager - IC - Cast ''Chilled'''),

(7462,0,0,0,0,0,100,0,1400,1900,16500,17400,0,11,13738,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Hederine Manastalker - IC - Cast ''Rend'''),
(7462,0,1,0,0,0,100,0,2400,2600,6200,6400,0,11,15980,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Hederine Manastalker - IC - Cast ''Mana Burn'''),

(7461,0,1,0,0,0,100,0,0,0,7200,7400,0,11,12739,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Hederine Initiate - IC - Cast ''Shadow Bolt'''),

(7463,0,0,0,0,0,100,0,3700,4200,9600,13900,0,11,17547,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Hederine Slayer - IC - Cast ''Mortal Strike'''),

(7428,0,0,0,0,0,100,0,2700,3400,8500,9900,0,11,18368,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Frostmaul Giant - IC - Cast ''Strike'''),

(10807,0,0,0,0,0,100,0,4700,5200,17700,19200,0,11,15850,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Brumeran - IC - Cast ''Chilled'''),

(7437,0,1,0,0,0,100,0,0,0,5600,6100,0,11,15043,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cobalt Mageweaver - IC - Cast ''Frostbolt'''),

(7436,0,0,0,0,0,100,0,1700,1900,16700,16900,0,11,11977,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cobalt Scalebane - IC - Cast ''Rend'''),

(10659,0,1,0,0,0,100,0,2100,2700,17200,17800,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cobalt Whelp - IC - Cast ''Rend'''),

(10660,0,0,0,0,0,100,0,0,0,5800,6900,0,11,9672,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cobalt Broodling - IC - Cast ''Frostbolt'''),

(10661,0,0,0,0,0,100,0,2400,3500,8600,9700,0,11,16340,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Spell Eater - IC - Cast ''Frost Breath'''),

(7435,0,0,0,0,0,100,1,0,0,0,0,0,11,9080,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cobalt Wyrmkin - IC - Cast ''Hamstring'' (No Repeat)'),
(7435,0,1,0,0,0,100,0,2450,2650,7600,8700,0,11,15580,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cobalt Wyrmkin - IC - Cast ''Strike'''),

(7448,0,0,0,0,0,100,0,4700,5200,17700,19200,0,11,15850,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Chillwind Chimaera - IC - Cast ''Chilled'''),
(7448,0,1,0,0,0,100,0,0,0,8700,8900,0,11,15797,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Chillwind Chimaera - IC - Cast Lightning Breath'),

(7447,0,0,0,0,0,100,0,0,0,9400,9600,0,11,16552,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Fledgling Chillwind - IC - Cast ''Venom Spit'''),

(7450,0,0,0,0,0,100,0,2400,2600,17500,17700,0,11,13738,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ragged Owlbeast - IC - Cast ''Rend'''),
(7450,0,1,0,0,0,100,1,6500,6600,0,0,0,11,15848,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ragged Owlbeast - IC - Cast ''Festering Rash'' (No Repeat)'),

(7457,0,0,0,0,0,100,1,0,0,0,0,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Rogue Ice Thistle - IC - Cast ''Tendon Rip'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
