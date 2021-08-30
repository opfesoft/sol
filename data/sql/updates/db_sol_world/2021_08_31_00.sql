-- DB update 2021_08_30_00 -> 2021_08_31_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_30_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_30_00 2021_08_31_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1630361956480375978'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1630361956480375978');

UPDATE `creature_template_addon` SET `bytes1` = 0 WHERE `entry` = 21337;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (19788,19784,19767,19765,21205,21196,21663,21803,21802,21453,21808,21455,22037,22859,21166,21908,21178,21171,21164,21168,21505,21179,21180,21742,21827,19744,19801,21520,21478,21901,23269,23267,23264,22274,21711,22093,22011,21979,19824,21639,21450,19757,21337,21928,19800,19799,21656,19802,21408);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (19788,19784,19767,19765,21205,21196,21663,21803,21802,21453,21808,21455,22037,22859,21166,21908,21178,21171,21164,21168,21505,21179,21180,21742,21827,19744,19801,21520,21478,21901,23269,23267,23264,22274,21711,22093,22011,21979,19824,21639,21450,19757,21337,21928,19800,19799,21656,19802,21408);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` > 0 AND `entryorguid` = 20795;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19788,0,0,0,4,0,100,0,0,0,0,0,0,11,38232,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Coilskar Muckwatcher - On Aggro - Cast ''Battle Shout'''),
(19788,0,1,0,0,0,100,0,5000,10000,15000,20000,0,11,38029,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Coilskar Muckwatcher - IC - Cast ''Stab'''),

(19784,0,0,0,0,0,100,0,2500,5000,15000,20000,0,11,38030,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Coilskar Cobra - IC - Cast ''Poison Spit'''),

(19767,0,0,0,0,0,100,0,2500,5000,10000,15000,0,11,32011,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Coilskar Sorceress - IC - Cast ''Water Bolt'''),
(19767,0,1,0,2,0,100,1,20,80,0,0,0,11,38026,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Coilskar Sorceress - Between 20-80% Health - Cast ''Viscous Shield'' (No Repeat)'),

(19765,0,0,0,2,0,100,1,20,80,0,0,0,11,38027,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Coilskar Myrmidon - Between 20-80% Health - Cast ''Boiling Blood'' (No Repeat)'),

(20795,0,1,0,0,0,100,0,2500,5000,10000,15000,0,11,32011,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Keeper of the Cistern - IC - Cast ''Water Bolt'''),
(20795,0,2,0,2,0,100,1,20,80,0,0,0,11,11831,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Keeper of the Cistern - Between 20-80% Health - Cast ''Frost Nova'' (No Repeat)'),

(21205,0,0,0,0,0,100,0,2500,5000,25000,35000,0,11,38363,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ravenous Flayer Matriarch - IC - Cast ''Gushing Wound'''),
(21205,0,1,0,2,0,100,1,20,80,0,0,0,11,36464,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ravenous Flayer Matriarch - Between 20-80% Health - Cast ''The Den Mother''s Mark'' (No Repeat)'),

(21196,0,0,0,2,0,100,1,20,80,0,0,0,11,37933,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ravenous Flayer - Between 20-80% Health - Cast ''Consume Flesh'' (No Repeat)'),

(21663,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Oronu the Elder - OOC - Cast ''Lightning Shield'''),
(21663,0,1,0,2,0,100,1,20,80,0,0,0,11,34079,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Oronu the Elder - Between 20-80% Health - Cast ''Grounding Totem'' (No Repeat)'),
(21663,0,2,0,2,0,100,1,5,30,0,0,0,11,11986,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Oronu the Elder - Between 5-30% Health - Cast ''Healing Wave'' (No Repeat)'),

(21803,0,0,0,2,0,100,1,5,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ashtongue Handler - Between 5-30% Health - Cast ''Enrage'' (No Repeat)'),

(21802,0,0,0,2,0,100,1,20,80,0,0,0,11,38045,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Elekk Demolisher - Between 20-80% Health - Cast ''Rampaging Stomp'' (No Repeat)'),

(21453,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ashtongue Shaman - OOC - Cast ''Lightning Shield'''),
(21453,0,1,0,0,0,100,0,5000,10000,20000,25000,0,11,32062,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ashtongue Shaman - IC - Cast ''Fire Nova Totem'''),
(21453,0,2,0,2,0,100,1,5,30,0,0,0,11,37067,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ashtongue Shaman - Between 5-30% Health - Cast ''Bloodlust'' (No Repeat)'),

(21808,0,0,0,0,0,100,0,2500,5000,15000,25000,0,11,11977,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Illidari Overseer - IC - Cast ''Rend'''),
(21808,0,1,0,2,0,100,1,20,80,0,0,0,11,32736,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Illidari Overseer - Between 20-80% Health - Cast ''Mortal Strike'' (No Repeat)'),

(21455,0,0,0,0,0,100,0,2500,5000,20000,30000,0,11,6016,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ashtongue Worker - IC - Cast ''Pierce Armor'''),

(22037,0,0,0,0,0,100,0,2500,5000,10000,15000,0,11,13444,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Smith Gorlunk - IC - Cast ''Sunder Armor'''),

(22859,0,0,0,4,0,100,0,0,0,0,0,0,11,13338,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Shadowhoof Summoner - On Aggro - Cast ''Curse of Tongues'''),
(22859,0,1,0,0,0,100,0,2500,4000,8500,10000,0,11,38386,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Shadowhoof Summoner - IC - Cast ''Shadow Bolt'''),

(21166,0,0,0,0,0,100,0,2500,4000,8500,10000,0,11,17287,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Illidari Dreadlord - IC - Cast ''Mind Blast'''),
(21166,0,1,0,2,0,100,1,20,80,0,0,0,11,12098,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Illidari Dreadlord - Between 20-80% Health - Cast ''Sleep'' (No Repeat)'),
(21166,0,2,0,2,0,100,1,5,30,0,0,0,11,13704,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Illidari Dreadlord - Between 5-30% Health - Cast ''Psychic Scream'' (No Repeat)'),

(21908,0,0,0,0,0,100,0,2500,5000,15000,20000,0,11,31553,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Spellbound Terrorguard - IC - Cast ''Hamstring'''),
(21908,0,1,0,2,0,100,1,20,80,0,0,0,11,37488,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Spellbound Terrorguard - Between 20-80% Health - Cast ''Fel Flames'' (No Repeat)'),

(21178,0,0,0,4,0,100,0,0,0,0,0,0,11,38010,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Varedis - On Aggro - Cast ''Curse of Flames'''),
(21178,0,1,0,0,0,100,0,5000,15000,25000,35000,0,11,39262,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Varedis - IC - Cast ''Mana Burn'''),
(21178,0,2,0,2,0,100,1,20,80,0,0,0,11,37683,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Varedis - Between 20-80% Health - Cast ''Evasion'' (No Repeat)'),
(21178,0,3,0,0,0,100,0,25000,35000,55000,75000,0,11,38609,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Varedis - IC - Cast ''Flame Wave'''),
(21178,0,4,0,2,0,100,1,5,50,0,0,0,11,36298,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Varedis - Between 5-50% Health - Cast ''Metamorphosis'' (No Repeat)'),

(21171,0,0,0,0,0,100,0,5000,15000,25000,35000,0,11,39262,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Alandien - IC - Cast ''Mana Burn'''),
(21171,0,1,0,2,0,100,1,20,80,0,0,0,11,37683,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alandien - Between 20-80% Health - Cast ''Evasion'' (No Repeat)'),
(21171,0,2,0,2,0,100,1,5,50,0,0,0,11,36298,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alandien - Between 5-50% Health - Cast ''Metamorphosis'' (No Repeat)'),
(21171,0,3,0,0,0,100,0,25000,35000,55000,75000,0,11,39082,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Alandien - IC - Cast ''Shadowfury'''),

(21164,0,0,0,0,0,100,0,5000,15000,25000,35000,0,11,39262,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Netharel - IC - Cast ''Mana Burn'''),
(21164,0,1,0,2,0,100,1,20,80,0,0,0,11,37683,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Netharel - Between 20-80% Health - Cast ''Evasion'' (No Repeat)'),
(21164,0,2,0,0,0,100,0,10000,20000,30000,40000,0,11,39135,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Netharel - IC - Cast ''Debilitating Strike'''),
(21164,0,3,0,2,0,100,1,5,50,0,0,0,11,36298,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Netharel - Between 5-50% Health - Cast ''Metamorphosis'' (No Repeat)'),

(21168,0,0,0,0,0,100,0,5000,15000,25000,35000,0,11,39262,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Theras - IC - Cast ''Mana Burn'''),
(21168,0,1,0,2,0,100,1,20,80,0,0,0,11,37683,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theras - Between 20-80% Health - Cast ''Evasion'' (No Repeat)'),
(21168,0,2,0,0,0,100,0,10000,20000,30000,40000,0,11,35871,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Theras - IC - Cast ''Spellbreaker'''),
(21168,0,3,0,2,0,100,1,5,50,0,0,0,11,36298,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theras - Between 5-50% Health - Cast ''Metamorphosis'' (No Repeat)'),
(21168,0,4,0,0,0,100,0,25000,35000,55000,75000,0,11,31534,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theras - IC - Cast ''Spell Reflection'''),

(21505,0,0,0,0,0,100,0,2500,5000,10000,15000,0,11,13901,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Summoner - IC - Cast ''Arcane Bolt'''),
(21505,0,1,0,2,0,100,1,20,80,0,0,0,11,14514,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Summoner - Between 20-80% Health - Cast ''Blink'' (No Repeat)'),

(21179,0,0,0,4,0,100,0,0,0,0,0,0,11,32720,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demon Hunter Supplicant - On Aggro - Cast ''Sprint'''),
(21179,0,1,0,2,0,100,1,20,80,0,0,0,11,37683,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demon Hunter Supplicant - Between 20-80% Health - Cast ''Evasion'' (No Repeat)'),

(21180,0,0,0,4,0,100,0,0,0,0,0,0,11,36051,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demon Hunter Initiate - On Aggro - Cast ''Fel Immolation'''),
(21180,0,1,0,0,0,100,0,5000,10000,15000,20000,0,11,35871,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Demon Hunter Initiate - IC - Cast ''Spellbreaker'''),
(21180,0,2,0,2,0,100,1,5,30,0,0,0,11,27565,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Demon Hunter Initiate - Between 5-30% Health - Cast ''Banish'' (No Repeat)'),

(21742,0,0,0,4,0,100,0,0,0,0,0,0,11,38008,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Eradicator - On Aggro - Cast ''Seal of Blood'''),
(21742,0,1,0,2,0,100,1,5,30,0,0,0,11,17137,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Eradicator - Between 5-30% Health - Cast ''Flash Heal'' (No Repeat)'),

(21827,0,0,0,4,0,100,0,0,0,0,0,0,11,38051,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Zandras - On Aggro - Cast ''Fel Shackles'''),

(19744,0,0,0,0,0,100,0,5000,10000,15000,20000,0,11,32736,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dreadwarden - IC - Cast ''Mortal Strike'''),
(19744,0,1,0,2,0,100,1,20,80,0,0,0,11,11443,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dreadwarden - Between 20-80% Health - Cast ''Cripple'' (No Repeat)'),

(19801,0,0,0,0,0,100,0,2500,5000,10000,12500,0,11,36227,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Illidari Agonizer - IC - Cast ''Firebolt'''),

(21520,0,0,0,2,0,100,1,20,80,0,0,0,11,38051,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Illidari Jailor - Between 20-80% Health - Cast ''Fel Shackles'' (No Repeat)'),

(21478,0,0,0,2,0,100,1,20,80,0,0,0,11,33912,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rocknail Ripper - Between 20-80% Health - Cast ''Rip'' (No Repeat)'),

(21901,0,0,0,0,0,100,0,2500,5000,20000,25000,0,11,36659,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Netherskate - IC - Cast ''Tail Sting'''),
(21901,0,1,0,2,0,100,1,20,80,0,0,0,11,17008,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Netherskate - Between 20-80% Health - Cast ''Drain Mana'' (No Repeat)'),
(21901,0,2,0,2,0,100,1,5,30,0,0,0,11,35334,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Netherskate - Between 5-30% Health - Cast ''Nether Shock'' (No Repeat)'),

(23269,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,32732,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Barash the Den Mother - OOC - Cast ''Flay'''),
(23269,0,1,0,0,0,100,0,2500,5000,20000,25000,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Barash the Den Mother - IC - Cast ''Rend'''),
(23269,0,2,0,2,0,100,1,20,80,0,0,0,11,33810,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Barash the Den Mother - Between 20-80% Health - Cast ''Rock Shell'' (No Repeat)'),
(23269,0,3,0,2,0,100,1,5,30,0,0,0,11,40636,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Barash the Den Mother - Between 5-30% Health - Cast ''Bellowing Roar'' (No Repeat)'),

(23267,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,32732,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arvoar the Rapacious - OOC - Cast ''Flay'''),
(23267,0,1,0,0,0,100,0,2500,5000,20000,25000,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Arvoar the Rapacious - IC - Cast ''Rend'''),
(23267,0,2,0,2,0,100,1,20,80,0,0,0,11,33810,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arvoar the Rapacious - Between 20-80% Health - Cast ''Rock Shell'' (No Repeat)'),
(23267,0,3,0,2,0,100,1,5,30,0,0,0,11,40636,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arvoar the Rapacious - Between 5-30% Health - Cast ''Bellowing Roar'' (No Repeat)'),

(23264,0,0,0,0,0,100,0,2500,5000,20000,25000,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Overmine Flayer - IC - Cast ''Rend'''),
(23264,0,1,0,2,0,100,1,20,80,0,0,0,11,33810,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Overmine Flayer - Between 20-80% Health - Cast ''Rock Shell'' (No Repeat)'),

(22274,0,0,0,4,0,100,0,0,0,0,0,0,11,38859,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dragonmaw Skybreaker - On Aggro - Cast ''Serpent Sting'''),
(22274,0,1,0,0,0,100,0,5000,10000,15000,20000,0,11,38861,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dragonmaw Skybreaker - IC - Cast ''Aimed Shot'''),

(21711,0,0,0,0,0,100,0,2500,5000,10000,12500,0,11,9532,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Haalum - IC - Cast ''Lightning Bolt'''),
(21711,0,1,0,2,0,100,1,20,80,0,0,0,11,12058,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Haalum - Between 20-80% Health - Cast ''Chain Lightning'' (No Repeat)'),

(22093,0,0,0,0,0,100,0,5000,10000,15000,20000,0,11,32736,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Illidari Watcher - IC - Cast ''Mortal Strike'''),

(22011,0,0,0,0,0,100,0,5000,10000,15000,20000,0,11,12612,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corok the Mighty - IC - Cast ''Stomp'''),
(22011,0,1,0,2,0,100,1,20,80,0,0,0,11,15550,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corok the Mighty - Between 20-80% Health - Cast ''Trample'' (No Repeat)'),

(21979,0,0,0,0,0,100,0,2500,5000,10000,12500,0,11,38094,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Val''zareq the Conqueror - IC - Cast ''Shoot'''),

(19824,0,0,0,0,0,100,0,5000,10000,15000,20000,0,11,12612,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Son of Corok - IC - Cast ''Stomp'''),

(21639,0,0,0,4,0,100,0,0,0,0,0,0,11,22120,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Illidari Slayer - On Aggro - Cast ''Charge'''),
(21639,0,1,0,0,0,100,0,2500,5000,10000,15000,0,11,15496,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Illidari Slayer - IC - Cast ''Cleave'''),

(21450,0,0,0,2,0,100,1,20,80,0,0,0,11,38254,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Skethyl Owl - Between 20-80% Health - Cast ''Festering Wound'' (No Repeat)'),
(21450,0,1,0,2,0,100,1,5,30,0,0,0,11,38021,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skethyl Owl - Between 5-30% Health - Cast ''Terrifying Screech'' (No Repeat)'),

(19757,0,0,0,0,0,100,0,2500,5000,15000,20000,0,11,11969,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infernal Soul - IC - Cast ''Fire Nova'''),

(21337,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,5916,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Illidari Shadowstalker - OOC - Cast ''Shadowstalker Stealth'''),
(21337,0,1,0,67,0,100,0,3000,6000,0,0,0,11,7159,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Illidari Shadowstalker - On Behind Target - Cast ''Backstab'''),

(21928,0,0,0,4,0,100,0,0,0,0,0,0,11,38166,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lothros - On Aggro - Cast ''Enrage'''),
(21928,0,1,0,2,0,100,1,20,80,0,0,0,11,38167,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lothros - Between 20-80% Health - Cast ''Curse of Blood'' (No Repeat)'),

(19800,0,0,0,0,0,100,0,2500,5000,10000,15000,0,11,15968,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Illidari Painlasher - IC - Cast ''Lash of Pain'''),

(19799,0,0,0,4,0,100,0,0,0,0,0,0,11,38166,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Illidari Dreadbringer - On Aggro - Cast ''Enrage'''),
(19799,0,1,0,2,0,100,1,20,80,0,0,0,11,38167,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Illidari Dreadbringer - Between 20-80% Health - Cast ''Curse of Blood'' (No Repeat)'),

(21656,0,0,0,2,0,100,1,20,80,0,0,0,11,38048,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Illidari Satyr - Between 20-80% Health - Cast ''Curse of Pain'''),

(19802,0,0,0,4,0,100,0,0,0,0,0,0,11,22120,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Illidari Shocktrooper - On Aggro - Cast ''Charge'''),
(19802,0,1,0,0,0,100,0,2500,5000,10000,15000,0,11,15496,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Illidari Shocktrooper - IC - Cast ''Cleave'''),

(21408,0,0,0,4,0,100,0,0,0,0,0,0,11,37941,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Felfire Diemetradon - On Aggro - Cast ''Flaming Wound'''),
(21408,0,1,0,0,0,100,0,2500,5000,10000,12500,0,11,36247,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felfire Diemetradon - IC - Cast ''Fel Fireball''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
