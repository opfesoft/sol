-- DB update 2020_12_22_01 -> 2020_12_23_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_22_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_22_01 2020_12_23_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1608680632091324949'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1608680632091324949');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (7434,7433,7432,7431,7430,10738,7439,7438,7459,7460,7449,7462,7461,7463,7429,7428,7454,7452,10807,7456,7437,7436,10659,10660,10661,7435,7455,7448,7447,7450,7457,7440,7442,7441,10916);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (7434,7433,7432,7431,7430,10738,7439,7438,7459,7460,7449,7462,7461,7463,7429,7428,7454,7452,10807,7456,7437,7436,10659,10660,10661,7435,7455,7448,7447,7450,7457,7440,7442,7441,10916) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1080700,1080701) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7434,0,0,0,0,0,100,0,1500,2500,16500,18500,0,11,36590,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Frostsaber Pride Watcher - IC - Cast ''Rip'''),
(7434,0,1,0,2,0,100,1,0,30,0,0,0,11,15716,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frostsaber Pride Watcher - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(7433,0,0,0,0,0,100,0,1000,2000,16000,18000,0,11,13443,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Frostsaber Huntress - IC - Cast ''Rend'''),
(7433,0,1,0,2,0,100,1,0,30,0,0,0,11,15716,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frostsaber Huntress - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(7432,0,0,0,25,0,100,1,0,0,0,0,0,11,30991,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frostsaber Stalker - On Reset - Cast ''Stealth'' (No Repeat)'),

(7431,0,0,0,0,0,100,0,1500,2000,10000,11000,0,11,24331,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Frostsaber - IC - Cast ''Rake'''),

(7430,0,0,0,0,0,100,0,1500,2000,10000,11000,0,11,24331,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Frostsaber Cub - IC - Cast ''Rake'''),

(10738,0,0,0,25,0,100,1,0,0,0,0,0,11,17205,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'High Chief Winterfall - On Reset - Cast ''Winterfall Firewater'' (No Repeat)'),
(10738,0,1,0,0,0,100,0,1200,1400,8600,8900,0,11,15793,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'High Chief Winterfall - IC - Cast ''Maul'''),
(10738,0,2,0,0,0,100,0,6500,7000,14200,16800,0,11,12548,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'High Chief Winterfall - IC - Cast ''Frost Shock'''),
(10738,0,3,0,0,0,100,0,9400,9900,24300,24900,0,11,8364,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'High Chief Winterfall - IC - Cast ''Blizzard'''),

(7439,0,0,0,25,0,100,1,0,0,0,0,0,11,17205,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Winterfall Shaman - On Reset - Cast ''Winterfall Firewater'' (No Repeat)'),
(7439,0,1,0,0,0,100,0,0,0,7500,8000,0,11,9532,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Winterfall Shaman - IC - Cast ''Lightning Bolt'''),
(7439,0,2,0,2,0,100,1,0,60,0,0,0,11,13585,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Winterfall Shaman - Between 0-60% Health - Cast ''Lightning Shield'' (No Repeat)'),
(7439,0,3,0,2,0,100,1,0,20,0,0,0,11,11431,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Winterfall Shaman - Between 0-20% Health - Cast ''Healing Touch'' (No Repeat)'),

(7438,0,0,0,25,0,100,1,0,0,0,0,0,11,17205,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Winterfall Ursa - On Reset - Cast ''Winterfall Firewater'' (No Repeat)'),

(7459,0,0,0,4,0,100,0,0,0,0,0,0,11,6268,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ice Thistle Matriarch - On Aggro - Cast ''Rushing Charge'''),
(7459,0,1,0,0,0,100,0,2700,3400,11900,16000,0,11,15878,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ice Thistle Matriarch - IC - Cast ''Ice Blast'''),

(7460,0,0,0,0,0,100,0,2100,2700,8400,9300,0,11,3131,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ice Thistle Patriarch - IC - Cast ''Frost Breath'''),
(7460,0,1,0,0,0,100,0,11750,14600,21200,24300,0,11,15878,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ice Thistle Patriarch - IC - Cast ''Ice Blast'''),

(7449,0,0,0,0,0,100,0,4700,5200,17700,19200,0,11,15850,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Chillwind Ravager - IC - Cast ''Chilled'''),
(7449,0,1,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chillwind Ravager - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(7462,0,0,0,0,0,100,0,1400,1900,16500,17400,0,11,13738,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hederine Manastalker - IC - Cast ''Rend'''),
(7462,0,1,0,0,0,100,0,2400,2600,6200,6400,0,11,15980,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hederine Manastalker - IC - Cast ''Mana Burn'''),

(7461,0,0,0,4,0,100,0,0,0,0,0,0,11,37668,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hederine Initiate - On Aggro - Cast ''Immolate'''),
(7461,0,1,0,0,0,100,0,2600,2900,7200,7400,0,11,12739,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hederine Initiate - IC - Cast ''Shadow Bolt'''),

(7463,0,0,0,0,0,100,0,3700,4200,9600,13900,0,11,17547,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hederine Slayer - IC - Cast ''Mortal Strike'''),

(7429,0,0,0,2,0,100,1,0,60,0,0,0,11,9616,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frostmaul Preserver - Between 0-60% Health - Cast ''Wild Regeneration'' (No Repeat)'),

(7428,0,0,0,0,0,100,0,2700,3400,8500,9900,0,11,18368,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Frostmaul Giant - IC - Cast ''Strike'''),
(7428,0,1,0,2,0,100,1,0,40,0,0,0,11,18670,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Frostmaul Giant - Between 0-40% Health - Cast ''Knock Away'' (No Repeat)'),

(7454,0,0,0,4,0,100,0,0,0,0,0,0,11,5915,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Berserk Owlbeast - On Aggro - Cast ''Crazed'''),
(7454,0,1,0,0,0,100,0,4800,5000,25800,26000,0,11,34971,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Berserk Owlbeast - IC - Cast ''Frenzy'''),

(7452,0,0,0,2,0,100,1,0,30,0,0,0,11,15716,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crazed Owlbeast - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(10807,0,0,0,0,0,100,0,4700,5200,17700,19200,0,11,15850,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Brumeran - IC - Cast ''Chilled'''),
(10807,0,1,0,0,0,100,0,0,0,8700,9600,0,87,1080700,1080701,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brumeran - IC - Call Random Timed Action List'),
(10807,0,2,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brumeran - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),
(1080700,9,0,0,0,0,100,0,0,0,0,0,0,11,16552,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Brumeran - On Script - Cast ''Venom Spit'''),
(1080701,9,0,0,0,0,100,0,0,0,0,0,0,11,15797,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Brumeran - On Script - Cast ''Lightning Breath'''),

(7456,0,0,0,0,0,100,0,3450,4250,12700,13900,0,11,3589,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Winterspring Screecher - IC - Cast ''Deafening Screech'''),

(7437,0,0,0,25,0,100,1,0,0,0,0,0,11,12544,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cobalt Mageweaver - On Reset - Cast ''Frost Armor'' (No Repeat)'),
(7437,0,1,0,0,0,100,0,0,0,5600,6100,0,11,15043,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cobalt Mageweaver - IC - Cast ''Frostbolt'''),

(7436,0,0,0,0,0,100,0,1700,1900,16700,16900,0,11,11977,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cobalt Scalebane - IC - Cast ''Rend'''),
(7436,0,1,0,2,0,100,1,0,70,0,0,0,11,15655,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cobalt Scalebane - Between 0-70% Health - Cast ''Shield Slam'' (No Repeat)'),
(7436,0,2,0,2,0,100,1,0,20,0,0,0,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cobalt Scalebane - Between 0-20% Health - Cast ''Disarm'' (No Repeat)'),

(10659,0,0,0,4,0,100,0,0,0,0,0,0,11,15089,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cobalt Whelp - On Aggro - Cast ''Frost Shock'''),
(10659,0,1,0,0,0,100,0,2100,2700,17200,17800,0,11,13443,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cobalt Whelp - IC - Cast ''Rend'''),

(10660,0,0,0,0,0,100,0,0,0,5800,6900,0,11,9672,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cobalt Broodling - IC - Cast ''Frostbolt'''),
(10660,0,1,0,2,0,100,1,0,60,0,0,0,11,29881,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cobalt Broodling - Between 0-60% Health - Cast ''Drain Mana'' (No Repeat)'),

(10661,0,0,0,0,0,100,0,2400,3500,8600,9700,0,11,16340,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Spell Eater - IC - Cast ''Frost Breath'''),

(7435,0,0,0,26,0,100,1,0,2,0,0,1,11,9080,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cobalt Wyrmkin - IC LOS - Cast ''Hamstring'' (No Repeat)'),
(7435,0,1,0,0,0,100,0,2450,2650,7600,8700,0,11,15580,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cobalt Wyrmkin - IC - Cast ''Strike'''),

(7455,0,0,0,0,0,100,0,2300,3400,8600,9500,0,11,16576,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Winterspring Owl - IC - Cast ''Piercing Screech'''),

(7448,0,0,0,0,0,100,0,4700,5200,17700,19200,0,11,15850,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Chillwind Chimaera - IC - Cast ''Chilled'''),
(7448,0,1,0,0,0,100,0,0,0,8700,8900,0,11,15797,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Chillwind Chimaera - IC - Cast Lightning Breath'),
(7448,0,2,0,2,0,100,1,0,30,0,0,0,11,20005,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Chillwind Chimaera - Between 0-30% Health - Cast ''Chilled'' (No Repeat)'),

(7447,0,0,0,0,0,100,0,0,0,9400,9600,0,11,16552,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Fledgling Chillwind - IC - Cast ''Venom Spit'''),

(7450,0,0,0,0,0,100,0,2400,2600,17500,17700,0,11,13738,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ragged Owlbeast - IC - Cast ''Rend'''),
(7450,0,1,0,0,0,100,1,6500,6600,0,0,0,11,15848,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ragged Owlbeast - IC - Cast ''Festering Rash'' (No Repeat)'),

(7457,0,0,0,26,0,100,1,0,2,0,0,1,11,3604,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rogue Ice Thistle - IC LOS - Cast ''Tendon Rip'' (No Repeat)'),
(7457,0,1,0,2,0,100,1,0,60,0,0,0,11,15878,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rogue Ice Thistle - Between 0-60% Health - Cast ''Ice Blast'' (No Repeat)'),

(7440,0,0,0,25,0,100,1,0,0,0,0,0,11,17205,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Winterfall Den Watcher - On Reset - Cast ''Winterfall Firewater'' (No Repeat)'),

(7442,0,0,0,25,0,100,1,0,0,0,0,0,11,17205,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Winterfall Pathfinder - On Reset - Cast ''Winterfall Firewater'' (No Repeat)'),
(7442,0,1,0,4,0,100,0,0,0,0,0,0,11,16498,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Winterfall Pathfinder - On Aggro - Cast ''Faerie Fire'''),
(7442,0,2,0,0,0,100,0,2100,2500,2100,2500,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Winterfall Pathfinder - IC - Cast ''Shoot'''),
(7442,0,3,0,9,0,100,0,4,30,1,1,0,79,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Winterfall Pathfinder - Within 4-30 Range - Set Ranged Movement'),
(7442,0,4,0,9,0,100,0,0,4,1,1,0,79,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Winterfall Pathfinder - Within 0-4 Range - Set Ranged Movement'),

(7441,0,0,0,25,0,100,1,0,0,0,0,0,11,17205,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Winterfall Totemic - On Reset - Cast ''Winterfall Firewater'' (No Repeat)'),
(7441,0,1,0,26,0,100,1,0,2,0,0,1,11,15786,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Winterfall Totemic - IC LOS - Cast ''Earthbind Totem'' (No Repeat)'),
(7441,0,2,0,0,0,100,0,2500,3000,7500,8000,0,11,15787,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Winterfall Totemic - IC - Cast ''Moonflare Totem'''),

(10916,0,0,0,25,0,100,1,0,0,0,0,0,11,17205,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Winterfall Runner - On Reset - Cast ''Winterfall Firewater'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
