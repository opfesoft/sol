-- DB update 2021_01_02_01 -> 2021_01_03_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_02_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_02_01 2021_01_03_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609629502160046746'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609629502160046746');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (4695,4680,4682,5771,5760,4676,4685,11559,11561,5601,6068,5600,4637,4632,4636,4635,4634,4696,4688,4692,11576,4716,4715,4719,4687,4714,4718,12347,4713,4711,4712,4690,4693,11577,11562,11563,4699,4694,4727,11578,4726,4661);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (4655,4654,4657,4656,11686,11687,13718,11685,4695,4680,4682,5771,5760,4676,4685,11559,11561,5601,6068,5600,4637,4632,4636,4635,4634,4696,4688,4692,11576,4716,4715,4719,4687,4714,4718,12347,4713,4711,4712,4690,4693,11577,11562,11563,4699,4694,4727,11578,4726,4661) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4655,0,0,0,0,0,100,1,0,0,0,0,0,11,6533,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Maraudine Wrangler - IC - Cast ''Net'' (No Repeat)'),
(4655,0,1,0,0,0,100,0,2500,3000,13500,15000,0,11,8379,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Maraudine Wrangler - IC - Cast ''Disarm'''),

(4654,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Maraudine Scout - Within 5-30 Range - Cast ''Shoot'''),

(4657,0,0,0,0,0,100,0,0,0,8000,9000,0,11,9532,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Maraudine Windchaser - IC - Cast ''Lightning Bolt'''),
(4657,0,1,0,2,0,100,1,0,45,0,0,0,11,11986,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maraudine Windchaser - Between 0-45% Health - Cast ''Healing Wave'' (No Repeat)'),

(4656,0,0,0,0,0,100,0,1500,1500,7000,8000,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maraudine Mauler - IC - Cast ''Thrash'''),

(11686,0,0,0,0,0,100,1,0,0,0,0,0,11,6533,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ghostly Raider - IC - Cast ''Net'' (No Repeat)'),
(11686,0,1,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ghostly Raider - Within 5-30 Range - Cast ''Shoot'''),
(11686,0,2,0,9,0,100,0,5,30,8000,12000,1,11,17174,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ghostly Raider - Within 5-30 Range - Cast ''Concussive Shot'''),

(11687,0,0,0,0,0,100,0,2700,3100,8500,9200,0,11,11976,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ghostly Marauder - IC - Cast ''Strike'''),

(13718,0,0,0,0,0,100,1,0,0,0,0,0,11,15848,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'The Nameless Prophet - IC - Cast ''Festering Rash'' (No Repeat)'),

(11685,0,0,0,0,0,100,1,0,0,0,0,0,11,11639,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Maraudine Priest - IC - Cast ''Shadow Word: Pain'' (No Repeat)'),
(11685,0,1,0,0,0,100,0,3400,4100,9200,10100,0,11,16568,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Maraudine Priest - IC - Cast ''Mind Flay'''),

(4695,0,0,0,0,0,100,0,2100,3800,32100,33800,0,11,3427,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Carrion Horror - IC - Cast ''Infected Wound'''),

(4680,0,0,0,0,0,100,1,5000,7000,0,0,0,11,6192,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doomwarder Captain - IC - Cast ''Battle Shout'' (No Repeat)'),
(4680,0,1,0,0,0,100,0,2100,3400,22100,23400,0,11,3261,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Doomwarder Captain - IC - Cast ''Ignite'''),

(4682,0,0,0,0,0,100,0,2200,2400,14200,14400,0,11,7816,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Nether Sister - IC - Cast ''Lash of Pain'''),

(5771,0,0,0,0,0,100,1,0,0,0,0,0,11,12741,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jugkar Grim''rod - IC - Cast ''Curse of Weakness'' (No Repeat)'),
(5771,0,1,0,2,0,100,1,0,60,0,0,0,11,20787,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jugkar Grim''rod - Between 0-60% Health - Cast ''Immolate'' (No Repeat)'),
(5771,0,2,0,0,0,100,0,0,0,12100,13100,0,11,12471,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jugkar Grim''rod - IC - Cast ''Shadow Bolt'''),

(5760,0,0,0,0,0,100,0,2100,2400,10100,10400,0,11,13737,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Lord Azrethoc - IC - Cast ''Mortal Strike'''),
(5760,0,1,0,2,0,100,1,0,40,0,0,0,11,7961,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Azrethoc - Between 0-40% Health - Cast ''Azrethoc''s Stomp'' (No Repeat)'),

(4676,0,0,0,4,0,100,0,0,0,0,0,0,11,2601,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lesser Infernal - On Aggro - Cast ''Fire Shield III'''),

(4685,0,0,0,0,0,100,0,2100,3200,12100,13200,0,11,22189,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ley Hunter - IC - Cast ''Mana Burn'''),

(11559,0,0,0,4,0,100,0,0,0,0,0,0,11,18166,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Outcast Necromancer - On Aggro - Cast ''Summon Magram Ravager'''),
(11559,0,1,0,0,0,100,0,0,0,10200,10400,0,11,20298,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Outcast Necromancer - IC - Cast ''Shadow Bolt'''),

(11561,0,0,0,1,0,100,0,30000,30000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Undead Ravager - OOC - Force Despawn'),
(11561,0,1,0,2,0,100,1,0,80,0,0,0,11,11978,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Undead Ravager - Between 0-80% Health - Cast ''Kick'' (No Repeat)'),

(5601,0,0,0,4,0,100,0,0,0,0,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Khan Jehn - On Aggro - Cast ''Defensive Stance'''),
(5601,0,1,0,2,0,100,1,0,60,0,0,0,11,11972,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Khan Jehn - Between 0-60% Health - Cast ''Shield Bash'' (No Repeat)'),
(5601,0,2,0,0,0,100,0,2500,3000,8500,10000,0,11,8380,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Khan Jehn - IC - Cast ''Sunder Armor'''),

(6068,0,0,0,0,0,100,0,2500,5000,10000,15000,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Warug''s Bodyguard - IC - Cast ''Thrash'''),

(5600,0,0,0,0,0,100,0,2100,3200,8600,9700,0,11,25710,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Khan Dez''hepah - IC - Cast ''Heroic Strike'''),

(4637,0,0,0,0,0,100,0,0,0,10500,13000,0,11,11824,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Kolkar Destroyer - IC - Cast ''Shock'''),
(4637,0,1,0,12,0,100,1,0,20,0,0,0,11,7160,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kolkar Destroyer - Target Between 0-20% Health - Cast ''Execute'' (No Repeat)'),

(4632,0,0,0,0,0,100,0,2100,2400,10100,10400,0,11,25710,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Kolkar Centaur - IC - Cast ''Heroic Strike'''),

(4636,0,0,0,2,0,100,1,0,90,0,0,0,11,8258,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kolkar Battle Lord - Between 0-90% Health - Cast ''Devotion Aura'' (No Repeat)'),
(4636,0,1,0,0,0,100,0,2100,3000,9800,10400,0,11,25710,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Kolkar Battle Lord - IC - Cast ''Heroic Strike'''),

(4635,0,0,0,0,0,100,0,0,0,9600,10200,0,11,9532,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Kolkar Windchaser - IC - Cast ''Lightning Bolt'''),
(4635,0,1,0,2,0,100,1,0,60,0,0,0,11,6728,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kolkar Windchaser - Between 0-60% Health - Cast ''Enveloping Winds'' (No Repeat)'),

(4634,0,0,0,0,0,100,0,2500,5000,10000,15000,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kolkar Mauler - IC - Cast ''Thrash'''),

(4696,0,0,0,0,0,100,0,2500,3000,47500,48000,0,11,5416,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scorpashi Snapper - IC - Cast ''Venom Sting'''),

(4688,0,0,0,0,0,100,0,2500,3000,12500,13000,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Bonepaw Hyena - IC - Cast ''Tendon Rip'''),

(4692,0,0,0,2,0,100,1,0,60,0,0,0,11,5708,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dread Swoop - Between 0-60% Health - Cast ''Swoop'' (No Repeat)'),

(11576,0,0,0,1,0,100,0,0,0,1000,1000,0,11,8788,34,0,0,0,0,1,0,0,0,0,0,0,0,0,'Whirlwind Ripper - OOC - Cast ''Lightning Shield'''),

(4716,0,0,0,0,0,100,1,0,0,0,0,0,11,10277,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Slitherblade Tidehunter - IC - Cast ''Throw'' (No Repeat)'),
(4716,0,1,0,2,0,100,1,0,60,0,0,0,11,865,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slitherblade Tidehunter - Between 0-60% Health - Cast ''Frost Nova'' (No Repeat)'),

(4715,0,0,0,25,0,100,0,0,0,0,0,0,11,8393,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slitherblade Razortail - On Reset - Cast ''Barbs'''),
(4715,0,1,0,2,0,100,1,0,80,0,0,0,11,7947,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Slitherblade Razortail - Between 0-80% Health - Cast ''Localized Toxin'' (No Repeat)'),

(4719,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12544,34,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slitherblade Sea Witch - OOC - Cast ''Frost Armor'''),
(4719,0,1,0,2,0,100,1,0,80,0,0,0,11,8427,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Slitherblade Sea Witch - Between 0-80% Health - Cast ''Blizzard'' (No Repeat)'),

(4687,0,0,0,0,0,100,0,2500,5000,10000,15000,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deepstrider Searcher - IC - Cast ''Thrash'''),

(4714,0,0,0,2,0,100,1,0,80,0,0,0,11,7947,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Slitherblade Myrmidon - Between 0-80% Health - Cast ''Localized Toxin'' (No Repeat)'),

(4718,0,0,0,0,0,100,1,0,0,0,0,0,11,11436,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Slitherblade Oracle - IC - Cast ''Slow'' (No Repeat)'),
(4718,0,1,0,2,0,100,1,0,80,0,0,0,11,5605,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slitherblade Oracle - Between 0-80% Health - Cast ''Healing Ward'' (No Repeat)'),

(12347,0,0,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Reef Crawler - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(4713,0,0,0,0,0,100,1,0,0,0,0,0,11,9080,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Slitherblade Warrior - IC - Cast ''Hamstring'' (No Repeat)'),
(4713,0,1,0,0,0,100,0,2500,3000,17500,18000,0,11,11977,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Slitherblade Warrior - IC - Cast ''Rend'''),
(4713,0,2,0,2,0,100,1,0,50,0,0,0,11,7947,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Slitherblade Warrior - Between 0-50% Health - Cast ''Localized Toxin'' (No Repeat)'),

(4711,0,0,0,2,0,100,1,0,80,0,0,0,11,7947,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Slitherblade Naga - Between 0-80% Health - Cast ''Localized Toxin'' (No Repeat)'),

(4712,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12544,34,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slitherblade Sorceress - OOC - Cast ''Frost Armor'''),
(4712,0,1,0,0,0,100,0,0,0,9800,11400,0,11,20819,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Slitherblade Sorceress - IC - Cast ''Frostbolt'''),
(4712,0,2,0,2,0,100,1,0,60,0,0,0,11,32011,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Slitherblade Sorceress - Between 0-60% Health - Cast ''Water Bolt'' (No Repeat)'),

(4690,0,0,0,0,0,100,1,2500,5000,0,0,0,11,3150,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Rabid Bonepaw - IC - Cast ''Rabies'' (No Repeat)'),

(4693,0,0,0,2,0,100,1,0,80,0,0,0,11,6713,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Dread Flyer - Between 0-80% Health - Cast ''Disarm'' (No Repeat)'),

(11577,0,0,0,0,0,100,0,2100,2500,10100,10500,0,11,11824,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Whirlwind Stormwalker - IC - Cast ''Shock'''),

(11562,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12544,34,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drysnap Crawler - OOC - Cast ''Frost Armor'''),
(11562,0,1,0,0,0,100,0,2100,2400,10100,10400,0,11,12548,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Drysnap Crawler - IC - Cast ''Frost Shock'''),

(11563,0,0,0,0,0,100,1,2500,5000,0,0,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Drysnap Pincer - IC - Cast ''Rend'' (No Repeat)'),
(11563,0,1,0,0,0,100,0,3000,4000,12000,13000,0,11,13444,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Drysnap Pincer - IC - Cast ''Sunder Armor'''),

(4699,0,0,0,0,0,100,0,2500,3000,40500,41000,0,11,5416,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scorpashi Venomlash - IC - Cast ''Venom Sting'''),

(4694,0,0,0,0,0,100,0,2100,2400,14100,14400,0,11,3147,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Dread Ripper - IC - Cast ''Rend Flesh'''),

(4727,0,0,0,0,0,100,0,2100,2700,10100,10700,0,11,15611,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Elder Thunder Lizard - IC - Cast ''Lizard Bolt'''),
(4727,0,1,0,2,0,100,1,0,60,0,0,0,11,20535,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Elder Thunder Lizard - Between 0-60% Health - Cast ''Lightning Breath'' (No Repeat)'),

(11578,0,0,0,0,0,100,0,2100,2400,17100,17400,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Whirlwind Shredder - IC - Cast ''Rend'''),

(4726,0,0,0,0,0,100,0,2100,2400,10100,10400,0,11,15611,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Raging Thunder Lizard - IC - Cast ''Lizard Bolt'''),
(4726,0,1,0,2,0,100,1,0,80,0,0,0,11,20536,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Raging Thunder Lizard - Between 0-80% Health - Cast ''Lightning Breath'' (No Repeat)'),
(4726,0,2,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raging Thunder Lizard - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(4661,0,0,0,2,0,100,1,0,80,0,0,0,11,33810,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gelkis Rumbler - Between 0-80% Health - Cast ''Rock Shell'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
