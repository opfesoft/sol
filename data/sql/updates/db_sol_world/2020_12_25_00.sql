-- DB update 2020_12_23_01 -> 2020_12_25_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_23_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_23_01 2020_12_25_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1608899426469278787'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1608899426469278787');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (2187,2208,2338,2339,2157,2156,2206,2324,2167,2231,2185,2234,2203,2204,2205,2174,2235,2233,2236,2182,2181,3660,2180,2179,2189,2212,2190,10159,10158,10157,10160,2176,2178,2177,2322,2321,2069,2165,2237,2168,2323,2169,2070,2071);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2187,2208,2338,2339,2157,2156,2206,2324,2167,2231,2185,2234,2203,2204,2205,2174,2235,2233,2236,2182,2181,3660,2180,2179,2189,2212,2190,10159,10158,10157,10160,2176,2178,2177,2322,2321,2069,2165,2237,2168,2323,2169,2070,2071) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2187,0,0,0,0,0,100,0,2500,3200,45500,50000,0,11,6016,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Elder Darkshore Thresher - IC - Cast ''Pierce Armor'''),

(2208,0,0,0,0,0,100,0,2700,2900,7900,8100,0,11,744,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Greymist Tidehunter - IC - Cast ''Poison'''),

(2338,0,0,0,2,0,100,1,0,80,0,0,0,11,2054,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Twilight Disciple - Between 0-80% Health - Cast ''Heal'' (No Repeat)'),
(2338,0,1,0,2,0,100,1,0,20,0,0,0,11,6074,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Twilight Disciple - Between 0-20% Health - Cast ''Renew'' (No Repeat)'),

(2339,0,0,0,25,0,100,1,0,0,0,0,0,11,7165,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Twilight Thug - On Reset - Cast ''Battle Stance'' (No Repeat)'),
(2339,0,1,0,0,0,100,1,6500,10000,0,0,0,11,5242,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Twilight Thug - IC - Cast ''Battle Shout'' (No Repeat)'),
(2339,0,2,0,2,0,100,1,0,40,0,0,0,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Twilight Thug - Between 0-40% Health - Cast ''Disarm'' (No Repeat)'),

(2157,0,0,0,4,0,100,0,0,0,0,0,0,11,5810,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stone Behemoth - On Aggro - Cast ''Stone Skin'''),

(2156,0,0,0,4,0,100,0,0,0,0,0,0,11,5810,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cracked Golem - On Aggro - Cast ''Stone Skin'''),

(2206,0,0,0,4,0,100,0,0,0,0,0,0,11,10277,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Greymist Hunter - On Aggro - Cast ''Throw'''),

(2324,0,0,0,2,0,100,1,0,60,0,0,0,11,6982,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blackwood Windtalker - Between 0-60% Health - Cast ''Gust of Wind'' (No Repeat)'),

(2167,0,0,0,4,0,100,0,0,0,0,0,0,11,6950,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Blackwood Pathfinder - On Aggro - Cast ''Faerie Fire'''),
(2167,0,1,0,0,0,100,0,2700,3300,7900,8600,0,11,3391,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Blackwood Pathfinder - IC - Cast ''Thrash'''),

(2231,0,0,0,2,0,100,1,0,60,0,0,0,11,5424,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Pygmy Tide Crawler - Between 0-60% Health - Cast ''Claw Grasp'' (No Repeat)'),

(2185,0,0,0,0,0,100,0,2300,3200,45000,50000,0,11,6016,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Darkshore Thresher - IC - Cast ''Pierce Armor'''),

(2234,0,0,0,2,0,100,1,0,60,0,0,0,11,5424,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Young Reef Crawler - Between 0-60% Health - Cast ''Claw Grasp'' (No Repeat)'),

(2203,0,0,0,1,0,100,0,0,0,1000,1000,0,11,324,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Greymist Seer - OOC - Cast ''Lightning Shield'''),
(2203,0,1,0,2,0,100,1,0,40,0,0,0,11,547,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Greymist Seer - Between 0-40% Health - Cast ''Healing Wave'' (No Repeat)'),

(2204,0,0,0,4,0,100,0,0,0,0,0,0,11,12024,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Greymist Netter - On Aggro - Cast ''Net'''),

(2205,0,0,0,25,0,100,1,0,0,0,0,0,11,7165,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Greymist Warrior - On Reset - Cast ''Battle Stance'' (No Repeat)'),
(2205,0,1,0,0,0,100,1,6500,10000,0,0,0,11,5242,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Greymist Warrior - IC - Cast ''Battle Shout'' (No Repeat)'),

(2174,0,0,0,2,0,100,1,0,30,0,0,0,11,3019,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Coastal Frenzy - Between 0-30% Health - Cast ''Frenzy'' (No Repeat)'),

(2235,0,0,0,0,0,100,0,2300,2600,8900,9400,0,11,12166,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Reef Crawler - IC - Cast ''Muscle Tear'''),

(2233,0,0,0,0,0,100,0,2400,3100,32500,34600,0,11,3427,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Encrusted Tide Crawler - IC - Cast ''Infected Wound'''),

(2236,0,0,0,0,0,100,0,2700,3100,9500,10100,0,11,3391,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Raging Reef Crawler - IC - Cast ''Thrash'''),

(2182,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12544,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stormscale Sorceress - OOC - Cast ''Frost Armor'''),
(2182,0,1,0,0,0,100,0,0,0,6800,7400,0,11,20792,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Stormscale Sorceress - IC - Cast ''Frostbolt'''),

(2181,0,0,0,2,0,100,1,0,60,0,0,0,11,5164,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Stormscale Myrmidon - Between 0-60% Health - Cast ''Knockdown'' (No Repeat)'),

(3660,0,0,0,0,0,100,0,0,0,6800,7200,0,11,7641,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Athrikus Narassin - IC - Cast ''Shadow Bolt'''),
(3660,0,1,0,2,0,100,1,0,60,0,0,0,11,5782,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Athrikus Narassin - Between 0-60% Health - Cast ''Fear'' (No Repeat)'),

(2180,0,0,0,0,0,100,0,0,0,6500,6700,0,11,9734,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Stormscale Siren - IC - Cast ''Holy Smite'''),
(2180,0,1,0,2,0,100,1,0,30,0,0,0,11,11642,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stormscale Siren - Between 0-30% Health - Cast ''Heal'' (No Repeat)'),

(2179,0,0,0,2,0,100,1,0,60,0,0,0,11,13586,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stormscale Wave Rider - Between 0-60% Health - Cast ''Aqua Jet'' (No Repeat)'),

(2189,0,0,0,0,0,100,0,2400,2900,32400,32900,0,11,744,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vile Sprite - IC - Cast ''Poison'''),

(2212,0,0,0,0,0,100,0,2100,2500,2100,2500,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Deth''ryll Satyr - IC - Cast ''Shoot'''),
(2212,0,1,0,9,0,100,0,4,30,1,1,0,79,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deth''ryll Satyr - Within 4-30 Range - Set Ranged Movement'),
(2212,0,2,0,9,0,100,0,0,4,1,1,0,79,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deth''ryll Satyr - Within 0-4 Range - Set Ranged Movement'),

(2190,0,0,0,4,0,100,0,0,0,0,0,0,11,5915,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wild Grell - On Aggro - Cast ''Crazed'''),

(10159,0,0,0,0,0,100,0,1000,1200,9600,12700,0,11,8921,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Young Moonkin - IC - Cast ''Moonfire'''),

(10158,0,0,0,0,0,100,0,2400,2600,6800,7400,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Moonkin - IC - Cast ''Thrash'''),

(10157,0,0,0,4,0,100,0,0,0,0,0,0,11,15798,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Moonkin Oracle - On Aggro - Cast ''Moonfire'''),
(10157,0,1,0,0,0,100,0,1400,1600,5400,6200,0,11,9739,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Moonkin Oracle - IC - Cast ''Wrath'''),
(10157,0,2,0,2,0,100,1,0,40,0,0,0,11,8936,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Moonkin Oracle - Between 0-40% Health - Cast ''Regrowth'' (No Repeat)'),

(10160,0,0,0,0,0,100,0,1200,1800,16200,16800,0,11,13443,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Raging Moonkin - IC - Cast ''Rend'''),
(10160,0,1,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raging Moonkin - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(2176,0,0,0,4,0,100,0,0,0,0,0,0,11,5884,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cursed Highborne - On Aggro - Cast ''Banshee Curse'''),

(2178,0,0,0,4,0,100,0,0,0,0,0,0,11,5884,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wailing Highborne - On Aggro - Cast ''Banshee Curse'''),

(2177,0,0,0,4,0,100,0,0,0,0,0,0,11,5884,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Writhing Highborne - On Aggro - Cast ''Banshee Curse'''),

(2322,0,0,0,0,0,100,0,2100,3100,6900,7400,0,11,3391,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Foreststrider - IC - Cast ''Thrash'''),

(2321,0,0,0,0,0,100,0,2100,3100,6900,7400,0,11,3391,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Foreststrider Fledgling - IC - Cast ''Thrash'''),

(2069,0,0,0,0,0,100,0,1200,1300,12200,14300,0,11,24331,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Moonstalker - IC - Cast ''Rake'''),

(2165,0,0,0,2,0,100,1,0,60,0,0,0,11,3242,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Grizzled Thistle Bear - Between 0-60% Health - Cast ''Ravage'' (No Repeat)'),

(2237,0,0,0,67,0,100,0,7800,8900,0,0,0,11,6595,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Moonstalker Sire - Is Behind Target - Cast ''Exploit Weakness'''),

(2168,0,0,0,25,0,100,1,0,0,0,0,0,11,7165,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blackwood Warrior - On Reset - Cast ''Battle Stance'' (No Repeat)'),
(2168,0,1,0,0,0,100,0,6500,10000,12000,14000,0,11,13532,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Blackwood Warrior - IC - Cast ''Thunder Clap'''),

(2323,0,0,0,0,0,100,0,2100,3100,6900,7400,0,11,3391,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Giant Foreststrider - IC - Cast ''Thrash'''),

(2169,0,0,0,26,0,100,1,0,2,0,0,1,11,5605,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blackwood Totemic - IC LOS - Cast ''Healing Ward'' (No Repeat)'),

(2070,0,0,0,67,0,100,0,7800,8900,0,0,0,11,6595,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Moonstalker Runt - Is Behind Target - Cast ''Exploit Weakness'''),

(2071,0,0,0,4,0,100,0,0,0,0,0,0,11,8594,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Moonstalker Matriarch - On Aggro - Cast ''Summon Moonstalker Runt''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
