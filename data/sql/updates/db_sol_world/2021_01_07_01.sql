-- DB update 2021_01_07_00 -> 2021_01_07_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_07_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_07_00 2021_01_07_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610018161960379628'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610018161960379628');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (11873,10580,4472,1813,1824,11613,11614,1836,10608,11611,1884,1785,10605,10801,1822);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (11873,10580,4472,1813,1824,11613,11614,1836,10608,11611,1884,1785,10605,10801,1822) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(11873,0,0,0,0,0,100,1,0,0,0,0,0,11,11443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Spectral Attendant - IC - Cast ''Cripple'' (No Repeat)'),
(11873,0,1,0,0,0,100,0,2200,3400,9800,12700,0,11,13860,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Spectral Attendant - IC - Cast ''Mind Blast'''),
(11873,0,2,0,2,0,100,1,0,60,0,0,0,11,11981,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Spectral Attendant - Between 0-60% Health - Cast ''Mana Burn'' (No Repeat)'),

(10580,0,0,0,25,0,100,0,0,0,0,0,0,11,8713,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fetid Zombie - On Reset - Cast ''Overwhelming Musk'''),

(4472,0,0,0,0,0,100,1,0,0,0,0,0,11,11443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Haunting Vision - IC - Cast ''Cripple'' (No Repeat)'),
(4472,0,1,0,0,0,100,0,2200,3400,9800,12700,0,11,13860,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Haunting Vision - IC - Cast ''Mind Blast'''),
(4472,0,2,0,2,0,100,1,0,60,0,0,0,11,11981,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Haunting Vision - Between 0-60% Health - Cast ''Mana Burn'' (No Repeat)'),

(1813,0,0,0,25,0,100,0,0,0,0,0,0,11,34158,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Decaying Horror - On Reset - Cast ''Fungal Decay'''),

(1824,0,0,0,25,0,100,0,0,0,0,0,0,11,8247,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Lurker - On Reset - Cast ''Wandering Plague'''),

(11613,0,0,0,0,0,100,1,0,0,0,0,0,11,14443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Huntsman Radley - IC - Cast ''Multi-Shot'' (No Repeat)'),
(11613,0,1,0,0,0,100,0,2700,3900,9700,12400,0,11,11976,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Huntsman Radley - IC - Cast ''Strike'''),
(11613,0,2,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Huntsman Radley - Within 5-30 Range - Cast ''Shoot'''),

(11614,0,0,0,0,0,100,0,2100,3200,17100,18200,0,11,13692,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Bloodshot - IC - Cast ''Dire Growl'''),

(1836,0,0,0,0,0,100,0,2500,3000,9500,10000,0,11,16856,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Cavalier - IC - Cast ''Mortal Strike'''),
(1836,0,1,0,2,0,100,1,0,80,0,0,0,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Cavalier - Between 0-80% Health - Cast ''Cleave'' (No Repeat)'),
(1836,0,2,0,2,0,100,1,0,30,0,0,0,11,6253,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Cavalier - Between 0-30% Health - Cast ''Backhand'' (No Repeat)'),

(10608,0,0,0,1,0,100,0,0,0,1000,1000,0,11,13864,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Priest - OOC - Cast ''Power Word: Fortitude'''),
(10608,0,1,0,0,0,100,0,0,0,8600,9300,0,11,15498,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Priest - IC - Cast ''Holy Smite'''),
(10608,0,2,0,2,0,100,1,0,50,0,0,0,11,8362,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Priest - Between 0-50% Health - Cast ''Renew'' (No Repeat)'),
(10608,0,3,0,2,0,100,1,0,25,0,0,0,11,12039,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Priest - Between 0-25% Health - Cast ''Heal'' (No Repeat)'),

(11611,0,0,0,0,0,100,0,2300,3100,8900,9600,0,11,13953,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cavalier Durgen - IC - Cast ''Holy Strike'''),
(11611,0,1,0,2,0,100,1,0,30,0,0,0,11,13005,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cavalier Durgen - Between 0-30% Health - Cast ''Hammer of Justice'' (No Repeat)'),

(1884,0,0,0,0,0,100,0,2500,3000,17500,18000,0,11,11977,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Lumberjack - IC - Cast ''Rend'''),
(1884,0,1,0,2,0,100,1,0,40,0,0,0,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Lumberjack - Between 0-40% Health - Cast ''Cleave'' (No Repeat)'),

(1785,0,0,0,2,0,100,1,0,30,0,0,0,11,12542,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Skeletal Terror - Between 0-30% Health - Cast ''Fear'' (No Repeat)'),

(10605,0,0,0,1,0,100,0,0,0,1000,1000,0,11,17175,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Medic - OOC - Cast ''Resist Arcane'''),
(10605,0,1,0,2,0,100,1,0,70,0,0,0,11,11640,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Medic - Between 0-70% Health - Cast ''Renew'' (No Repeat)'),
(10605,0,2,0,2,0,100,1,0,20,0,0,0,11,17137,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Medic - Between 0-20% Health - Cast ''Flash Heal'' (No Repeat)'),

(10801,0,0,0,4,0,100,0,0,0,0,0,0,11,15716,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jabbering Ghoul - On Aggro - Cast ''Enrage'''),
(10801,0,1,0,0,0,100,0,2500,3000,22500,23000,0,11,12097,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jabbering Ghoul - IC - Cast ''Pierce Armor'''),

(1822,0,0,0,0,0,100,1,0,0,0,0,0,11,3583,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Venom Mist Lurker - IC - Cast ''Deadly Poison'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
