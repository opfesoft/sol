-- DB update 2021_01_09_00 -> 2021_01_10_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_09_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_09_00 2021_01_10_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610233399062579804'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610233399062579804');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (2535,2545,687,2551,4506,2544,2522,685,1557,976,1713,2536,854,676,781,1060,682,6366,669,1114,1142,691,855,1094,681,1108,905,4723,4260,772,684);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2541,2535,2545,687,2551,4506,2544,2522,685,14491,1557,976,1713,2536,854,676,781,1060,682,6366,669,1114,1142,691,855,1094,681,1108,905,4723,4260,772,684) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2541,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Sakrasis - On Respawn - Set Active On'),
(2541,0,1,0,0,0,100,0,3700,4200,9700,12200,0,11,15496,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Lord Sakrasis - IC - Cast ''Cleave'''),
(2541,0,2,0,2,0,100,1,0,60,0,0,0,11,3583,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lord Sakrasis - Between 0-60% Health - Cast ''Deadly Poison'' (No Repeat)'),

(2535,0,0,0,0,0,100,0,2800,4400,9200,9900,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maury \"Club Foot\" Wilkins - IC - Cast ''Thrash'''),

(2545,0,0,0,0,0,100,0,2700,4600,8700,9600,0,11,14873,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'\"Pretty Boy\" Duncan - IC - Cast ''Sinister Strike'''),

(687,0,0,0,0,0,100,0,2400,3200,17400,18200,0,11,11977,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jungle Stalker - IC - Cast ''Rend'''),

(2551,0,0,0,0,0,100,0,3200,4800,9200,11800,0,11,33661,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Brutus - IC - Cast ''Crush Armor'''),
(2551,0,1,0,2,0,100,1,0,30,0,0,0,11,38784,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brutus - Between 0-30% Health - Cast ''Ground Smash'' (No Repeat)'),

(4506,0,0,0,2,0,100,1,0,80,0,0,0,11,7357,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bloodsail Swabby - Between 0-80% Health - Cast ''Poisonous Stab'' (No Repeat)'),

(2544,0,0,0,0,0,100,0,2800,3400,8800,9400,0,11,50245,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Southern Sand Crawler - IC - Cast ''Pin'''),

(2522,0,0,0,1,0,100,1,1000,1500,0,0,0,11,22766,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jaguero Stalker - OOC - Cast ''Sneak'' (No Repeat)'),

(685,0,0,0,0,0,100,0,2400,3200,17400,18200,0,11,11977,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Stranglethorn Raptor - IC - Cast ''Rend'''),

(14491,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kurmokk - On Respawn - Set Active On'),
(14491,0,1,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kurmokk - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(1557,0,0,0,2,0,100,1,0,60,0,0,0,11,15615,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Elder Mistvale Gorilla - Between 0-60% Health - Cast ''Pummel'' (No Repeat)'),

(976,0,0,0,0,0,100,0,2300,2700,9700,12700,0,11,51772,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Kurzen War Tiger - IC - Cast ''Claw'''),

(1713,0,0,0,1,0,100,1,1000,1500,0,0,0,11,22766,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Elder Shadowmaw Panther - OOC - Cast ''Sneak'' (No Repeat)'),

(2536,0,0,0,0,0,100,0,2800,4400,9200,9900,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jon-Jon the Crow - IC - Cast ''Thrash'''),

(854,0,0,0,0,0,100,0,2400,3200,17400,18200,0,11,11977,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Young Jungle Stalker - IC - Cast ''Rend'''),

(676,0,0,0,0,0,100,0,2700,4800,9600,12100,0,11,11969,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venture Co. Surveyor - IC - Cast ''Fire Nova'''),

(781,0,0,0,0,0,100,1,0,0,0,0,0,11,6533,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Skullsplitter Headhunter - IC - Cast ''Net'' (No Repeat)'),
(781,0,1,0,9,0,100,0,5,30,2000,3000,1,11,10277,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Skullsplitter Headhunter - Within 5-30 Range - Cast ''Throw'''),
(781,0,2,0,2,0,100,1,0,80,0,0,0,11,3148,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Skullsplitter Headhunter - Between 0-80% Health - Cast ''Head Crack'' (No Repeat)'),

(1060,0,0,0,1,0,100,1,1000,1500,0,0,0,11,20798,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mogh the Undying - OOC - Cast ''Demon Skin'' (No Repeat)'),
(1060,0,1,0,25,0,100,0,0,0,0,0,0,11,8813,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mogh the Undying - On Reset - Cast ''Summon Kurzen Mindslave'''),
(1060,0,2,0,0,0,100,0,0,0,9800,10200,0,11,12471,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mogh the Undying - IC - Cast ''Shadow Bolt'''),

(682,0,0,0,0,0,100,0,2300,2700,9700,12700,0,11,51772,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Stranglethorn Tiger - IC - Cast ''Claw'''),

(6366,0,0,0,2,0,100,1,0,20,0,0,0,11,11642,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kurzen Mindslave - Between 0-20% Health - Cast ''Heal'' (No Repeat)'),
(6366,0,1,0,2,0,100,1,0,60,0,0,0,11,7964,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kurzen Mindslave - Between 0-60% Health - Cast ''Smoke Bomb'' (No Repeat)'),

(669,0,0,0,25,0,100,0,0,0,0,0,0,11,3621,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skullsplitter Hunter - On Reset - Cast ''Skullsplitter Pet'' (No Repeat)'),
(669,0,1,0,0,0,100,0,2700,4100,9600,12800,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skullsplitter Hunter - IC - Cast ''Thrash'''),
(669,0,2,0,2,0,100,1,0,25,0,0,0,11,3148,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Skullsplitter Hunter - Between 0-25% Health - Cast ''Head Crack'' (No Repeat)'),

(1114,0,0,0,2,0,100,1,0,60,0,0,0,11,15615,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jungle Thunderer - Between 0-60% Health - Cast ''Pummel'' (No Repeat)'),

(1142,0,0,0,0,0,100,0,2800,4400,9200,9900,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mosh\'Ogg Brute - IC - Cast ''Thrash'''),

(691,0,0,0,2,0,100,1,0,80,0,0,0,11,38033,2,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lesser Water Elemental - Between 0-80% Health - Cast ''Frost Nova'' (No Repeat)'),

(855,0,0,0,0,0,100,0,2400,3200,17400,18200,0,11,11977,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Young Stranglethorn Raptor - IC - Cast ''Rend'''),

(1094,0,0,0,0,0,100,0,3400,4800,23400,24800,0,11,6016,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Venture Co. Miner - IC - Cast ''Pierce Armor'''),

(681,0,0,0,0,0,100,0,2300,2700,9700,12700,0,11,51772,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Young Stranglethorn Tiger - IC - Cast ''Claw'''),

(1108,0,0,0,2,0,100,1,0,60,0,0,0,11,15615,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mistvale Gorilla - Between 0-60% Health - Cast ''Pummel'' (No Repeat)'),

(905,0,0,0,2,0,100,1,0,30,0,0,0,11,3019,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sharptooth Frenzy - Between 0-30% Health - Cast ''Frenzy'' (No Repeat)'),

(4723,0,0,0,4,0,100,1,0,0,0,0,0,11,184,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Foreman Cozzle - On Aggro - Cast ''Fire Shield II'' (No Repeat)'),
(4723,0,1,0,0,0,100,0,0,0,9700,11800,0,11,9532,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Foreman Cozzle - IC - Cast ''Lightning Bolt'''),
(4723,0,2,0,2,0,100,1,0,30,0,0,0,11,4979,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Foreman Cozzle - Between 0-30% Health - Cast ''Quick Flame Ward'' (No Repeat)'),

(4260,0,0,0,2,0,100,1,0,80,0,0,0,11,36203,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venture Co. Shredder - Between 0-80% Health - Cast ''Doomsaw'' (No Repeat)'),

(772,0,0,0,0,0,100,0,2300,2700,9700,12700,0,11,51772,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Stranglethorn Tigress - IC - Cast ''Claw'''),

(684,0,0,0,1,0,100,1,1000,1500,0,0,0,11,22766,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shadowmaw Panther - OOC - Cast ''Sneak'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
