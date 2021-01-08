-- DB update 2021_01_08_03 -> 2021_01_08_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_08_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_08_03 2021_01_08_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610108841189789241'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610108841189789241');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (1529,1532,1664,4284,4280,4282,1527,1656,4281,1525,1665,1660,1655,1538,1540,1526,1941,1528,1753,1675,1658,1530,1654,1523,1520,1545,1662);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1529,1532,1664,4284,4280,4282,1527,1656,4281,1525,1665,1660,1655,1538,1540,1526,1941,1528,1753,1675,1658,1530,1654,1533,1523,1520,1545,1662) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1529,0,0,0,0,0,100,0,2700,3400,9400,11600,0,11,3322,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bleeding Horror - IC - Cast ''Rancid Blood'''),

(1532,0,0,0,0,0,100,0,2100,3200,9100,10200,0,11,7713,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wandering Spirit - IC - Cast ''Wailing Dead'''),

(1664,0,0,0,4,0,100,0,0,0,0,0,0,11,7164,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Vachon - On Aggro - Cast ''Defensive Stance'''),
(1664,0,1,0,0,0,100,0,6100,7700,9600,10500,0,11,72,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Captain Vachon - IC - Cast ''Shield Bash'''),
(1664,0,2,0,2,0,100,1,0,30,0,0,0,11,3248,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Vachon - Between 0-30% Health - Cast ''Improved Blocking'' (No Repeat)'),

(4284,0,0,0,0,0,100,0,0,0,8700,9600,0,11,9613,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Augur - IC - Cast ''Shadow Bolt'''),

(4280,0,0,0,0,0,100,0,2100,3300,8200,9300,0,11,13953,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Preserver - IC - Cast ''Holy Strike'''),
(4280,0,1,0,2,0,100,1,0,30,0,0,0,11,13952,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Preserver - Between 0-30% Health - Cast ''Holy Light'' (No Repeat)'),

(4282,0,0,0,4,0,100,0,0,0,0,0,0,11,8457,21,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Magician - On Aggro - Cast ''Fire Ward'''),
(4282,0,1,0,0,0,100,0,0,0,8600,9200,0,11,9053,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Magician - IC - Cast ''Fireball'''),

(1527,0,0,0,2,0,100,1,0,80,0,0,0,11,3234,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hungering Dead - Between 0-80% Health - Cast ''Disease Touch'' (No Repeat)'),

(1656,0,0,0,0,0,100,0,2400,2900,7900,9600,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thurman Agamand - IC - Cast ''Thrash'''),

(4281,0,0,0,0,0,100,1,0,0,0,0,0,11,6979,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Scout - IC - Cast ''Fire Shot'' (No Repeat)'),
(4281,0,1,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Scout - Within 5-30 Range - Cast ''Shoot'''),

(1525,0,0,0,2,0,100,1,0,80,0,0,0,11,3234,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rooting Dead - Between 0-80% Health - Cast ''Disease Touch'' (No Repeat)'),

(1665,0,0,0,4,0,100,0,0,0,0,0,0,11,8258,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Melrache - On Aggro - Cast ''Devotion Aura'''),
(1665,0,1,0,0,0,100,0,2100,2900,8700,9200,0,11,11976,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Captain Melrache - IC - Cast ''Strike'''),

(1660,0,0,0,2,0,100,1,0,30,0,0,0,11,12169,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Bodyguard - Between 0-30% Health - Cast ''Shield Block'' (No Repeat)'),

(1655,0,0,0,0,0,100,0,2400,2900,7900,9600,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nissa Agamand - IC - Cast ''Thrash'''),

(1538,0,0,0,1,0,100,0,0,0,1000,1000,0,11,1243,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Friar - OOC - Cast ''Power Word: Fortitude'''),
(1538,0,1,0,2,0,100,1,0,60,0,0,0,11,2052,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Friar - Between 0-60% Health - Cast ''Lesser Heal'' (No Repeat)'),

(1540,0,0,0,4,0,100,0,0,0,0,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Vanguard - On Aggro - Cast ''Defensive Stance'''),
(1540,0,1,0,0,0,100,0,6100,7900,9800,9900,0,11,72,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Vanguard - IC - Cast ''Shield Bash'''),

(1526,0,0,0,2,0,100,1,0,80,0,0,0,11,3234,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ravaged Corpse - Between 0-80% Health - Cast ''Disease Touch'' (No Repeat)'),

(1941,0,0,0,2,0,100,1,0,60,0,0,0,11,3237,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rot Hide Graverobber - Between 0-60% Health - Cast ''Curse of Thule'' (No Repeat)'),

(1528,0,0,0,2,0,100,1,0,80,0,0,0,11,3234,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Shambling Horror - Between 0-80% Health - Cast ''Disease Touch'' (No Repeat)'),

(1753,0,0,0,2,0,100,1,0,60,0,0,0,11,3237,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Maggot Eye - Between 0-60% Health - Cast ''Curse of Thule'' (No Repeat)'),
(1753,0,1,0,2,0,100,1,0,20,0,0,0,11,3243,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Maggot Eye - Between 0-20% Health - Cast ''Life Harvest'' (No Repeat)'),

(1675,0,0,0,2,0,100,1,0,60,0,0,0,11,3237,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rot Hide Mongrel - Between 0-60% Health - Cast ''Curse of Thule'' (No Repeat)'),
-- 
(1658,0,0,0,0,0,100,0,2400,2900,7900,9600,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Dargol - IC - Cast ''Thrash'''),

(1530,0,0,0,0,0,100,0,2700,3400,9800,12100,0,11,3322,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rotting Ancestor - IC - Cast ''Rancid Blood'''),

(1654,0,0,0,0,0,100,0,2400,2900,7900,9600,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gregor Agamand - IC - Cast ''Thrash'''),

(1533,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tormented Spirit - On Respawn - Set Active On'),
(1533,0,1,0,0,0,100,0,2100,2400,9200,9600,0,11,7713,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tormented Spirit - IC - Cast ''Wailing Dead'''),

(1523,0,0,0,0,0,100,1,0,0,0,0,0,11,589,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cracked Skull Soldier - IC - Cast ''Shadow Word: Pain'' (No Repeat)'),

(1520,0,0,0,2,0,100,1,0,80,0,0,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rattlecage Soldier - Between 0-80% Health - Cast ''Thrash'' (No Repeat)'),

(1545,0,0,0,67,0,100,0,8000,10000,0,0,0,11,7159,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vile Fin Muckdweller - Is Behind Target - Cast ''Backstab'''),

(1662,0,0,0,2,0,100,1,0,80,0,0,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Perrine - Between 0-80% Health - Cast ''Thrash'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
