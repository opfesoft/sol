-- DB update 2021_11_08_01 -> 2021_11_10_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_08_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_08_01 2021_11_10_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1636541228758393548'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1636541228758393548');

DELETE FROM `creature_text` WHERE `CreatureId` = 20747 AND `GroupID` = 1;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(20747,1,0,'%s splits open!',16,0,100,0,0,0,1410,0,'Silkwing Larva');

DELETE FROM `creature_text` WHERE `CreatureId` IN (19956,20730);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(19956,0,0,'Stupid puny thing.  Me smash!',12,0,100,0,0,0,19892,0,'Bloodmaul Lookout on Aggro Text'),
(19956,0,1,'Me mad. You get smash in face!',12,0,100,0,0,0,19893,0,'Bloodmaul Lookout on Aggro Text'),
(19956,0,2,'Me angered. Raaah!',12,0,100,0,0,0,19894,0,'Bloodmaul Lookout on Aggro Text'),
(19956,0,3,'I''ll crush you!',12,0,100,0,0,0,1925,0,'Bloodmaul Lookout on Aggro Text'),
(19956,1,0,'Puny $r... you were a... horrible $g king : queen;.',12,0,100,0,0,0,21050,0,'Bloodmaul Lookout on death Quest 11000 complete'),
(19956,1,1,'Agh... me am...dead.',12,0,100,0,0,0,21032,0,'Bloodmaul Lookout on death Quest 11000 complete'),
(19956,1,2,'Me go to... Ogri''la.',12,0,100,0,0,0,21033,0,'Bloodmaul Lookout on death Quest 11000 complete'),
(19956,1,3,'$G King : Queen; think... there really is... an Ogri''la?',12,0,100,0,0,0,21049,0,'Bloodmaul Lookout on death Quest 11000 complete'),
(19956,1,4,'Me honored... $g king : queen; kill me.',12,0,100,0,0,0,21034,0,'Bloodmaul Lookout on death Quest 11000 complete'),
(19956,1,5,'$G King : Queen; $n, me die now.',12,0,100,0,0,0,21035,0,'Bloodmaul Lookout on death Quest 11000 complete'),

(20730,0,0,'Stupid, squishy $r. That weapon mine now! Give!',12,0,100,0,0,0,19510,0,'Glumdor on Weapon steal.');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 19956;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,19956,0,0,8,0,11000,0,0,0,0,0,'SAI - Bloodmaul Lookout says text on death if quest 11000 is rewarded');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (22244,22242,22182,22287,22283,22221,22218,22217,22174,22289,21021,19961,19960,16952,21123,21300,21124,20161,19982,19983,21254,19984,21839,20747,21373,21516,19980,21519,22123,20751,20714,21004,21423,21956,21033,22052,21040,20211,19987,19985,19986,20757,20729,20753,19956,20726,20731,20730,20732,20723,21975,20728,21381,22308,21810,20329,21325,21048,21047,21046,21042,21492,22099,21383,21382,21637,22286,22451,22196,22298,22385,20109,19943,19945,19944,21023,22132,22044);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (22244,22242,22182,22287,22283,22221,22218,22217,22174,22289,21021,19961,19960,16952,21123,21300,21124,20161,19982,19983,21254,19984,21839,20747,21373,21516,19980,21519,22123,20751,20714,21004,21423,21956,21033,22052,21040,20211,19987,19985,19986,20757,20729,20753,19956,19948,20726,20731,20730,20732,20723,21975,20728,21381,22308,21810,20329,21325,21048,21047,21046,21042,21492,22099,21383,21382,21637,22286,22451,22196,22298,22385,20109,19943,19945,19944,21023,22132,22044);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2074700;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(22244,0,0,0,25,0,100,0,0,0,0,0,0,11,3417,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Unbound Ethereal - On Reset - Cast ''Thrash'''),

(22242,0,0,0,0,0,100,0,2500,4500,12000,15000,0,11,29881,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bash''ir Spell-Thief - IC - Cast ''Drain Mana'''),

(22182,0,0,0,4,0,100,0,0,0,0,0,0,11,35319,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lightning Wasp - On Aggro - Cast ''Electric Skin'''),

(22287,0,0,0,0,0,100,0,2400,3500,9800,11400,0,11,15588,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Amberpelt Clefthoof - IC - Cast ''Thunderclap'''),

(22283,0,0,0,4,0,100,0,0,0,0,0,0,11,41281,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Eredar Stormbringer - On Aggro - Cast ''Cripple'''),
(22283,0,1,0,0,0,100,0,2700,3000,8700,9000,0,11,39083,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Eredar Stormbringer - IC - Cast ''Incinerate'''),
(22283,0,2,0,2,0,100,1,0,30,0,0,0,11,39082,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Eredar Stormbringer - Between 0-30% Health - Cast ''Shadowfury'' (No Repeat)'),

(22221,0,0,0,4,0,100,0,0,0,0,0,0,11,37628,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felstorm Overseer - On Aggro - Cast ''Fel Immolate'''),
(22221,0,1,0,0,0,100,0,500,1000,6700,7000,0,11,37945,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felstorm Overseer - IC - Cast ''Fel Fireball'''),
(22221,0,2,0,2,0,100,1,0,30,0,0,0,11,37488,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felstorm Overseer - Between 0-30% Health - Cast ''Fel Flames'' (No Repeat)'),

(22218,0,0,0,0,0,100,0,500,1000,8700,9000,0,11,1106,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Insidious Familiar - IC - Cast ''Shadow Bolt'''),

(22217,0,0,0,4,0,100,0,0,0,0,0,0,11,32063,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felstorm Corruptor - On Aggro - Cast ''Corruption'''),
(22217,0,1,0,0,0,100,0,500,1000,8900,9600,0,11,9613,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felstorm Corruptor - IC - Cast ''Shadow Bolt'''),

(22174,0,0,0,25,0,100,0,0,0,0,0,0,11,3417,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Trigul - On Reset - Cast ''Thrash'''),
(22174,0,1,0,2,0,100,1,0,80,0,0,0,11,33628,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Trigul - Between 0-80% Health - Cast ''Lightning Tether'' (No Repeat)'),

(22289,0,0,0,2,0,100,1,0,20,0,0,0,11,7139,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darkflame Infernal - Between 0-20% Health - Cast ''Fel Stomp'' (No Repeat)'),

(21021,0,0,0,0,0,100,0,500,1000,8700,9600,0,11,9053,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scorch Imp - IC - Cast ''Fireball'''),

(19961,0,0,0,2,0,100,1,0,80,0,0,0,11,36846,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Doomforge Attendant - Between 0-80% Health - Cast ''Mana Bomb'' (No Repeat)'),
(19961,0,1,0,2,0,100,1,0,20,0,0,0,11,36208,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Doomforge Attendant - Between 0-20% Health - Cast ''Steal Weapon'' (No Repeat)'),

(19960,0,0,0,4,0,100,0,0,0,0,0,0,11,36253,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Doomforge Engineer - On Aggro - Cast ''Chemical Flames'''),
(19960,0,1,0,2,0,100,1,0,30,0,0,0,11,37179,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Doomforge Engineer - Between 0-30% Health - Cast ''Hammer Slam'' (No Repeat)'),

(16952,0,0,0,0,0,100,0,2700,4200,9600,10400,0,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Anger Guard - IC - Cast ''Cleave'''),

(21123,0,0,0,0,0,100,0,500,1000,14000,15000,0,11,32093,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felsworn Scalewing - IC - Cast ''Poison Spit'''),

(21300,0,0,0,1,0,100,0,5000,10000,20000,30000,0,86,36274,0,19,21124,30,0,19,21124,30,0,0,0,0,0,0,'Fel Corrupter - OOC - Cross Cast ''Mad Seduced'' (Closest Felsworn Daggermaw)'),
(21300,0,1,0,4,0,100,0,0,0,0,0,0,11,32063,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Fel Corrupter - On Aggro - Cast ''Corruption'''),
(21300,0,2,0,0,0,100,0,500,1000,8900,9600,0,11,9613,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Fel Corrupter - IC - Cast ''Shadow Bolt'''),

(21124,0,0,0,4,0,100,0,0,0,0,0,0,11,35570,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felsworn Daggermaw - On Aggro - Cast ''Charge'''),
(21124,0,1,0,0,0,100,0,2500,5000,30000,31000,0,11,7367,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felsworn Daggermaw - IC - Cast ''Infected Bite'''),

(20161,0,0,0,4,0,100,0,0,0,0,0,0,11,37579,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vekh''nir Matriarch - On Aggro - Cast ''Impending Doom'''),
(20161,0,1,0,0,0,100,0,500,1000,9500,10000,0,11,9613,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vekh''nir Matriarch - IC - Cast ''Shadow Bolt'''),
(20161,0,2,0,2,0,100,1,0,30,0,0,0,11,34110,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vekh''nir Matriarch - Between 0-30% Health - Cast ''Shadow Mend'' (No Repeat)'),

(19982,0,0,0,0,0,100,0,3500,4000,29500,30000,0,11,35321,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vekh''nir Keeneye - IC - Cast ''Gushing Wound'''),

(19983,0,0,0,0,0,100,0,4500,5000,17500,20000,0,11,37654,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vekh''nir Stormcaller - IC - Cast ''Lightning Tether'''),
(19983,0,1,0,2,0,100,1,0,50,0,0,0,11,32717,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vekh''nir Stormcaller - Between 0-50% Health - Cast ''Hurricane'' (No Repeat)'),

(21254,0,0,0,13,0,100,0,10000,15000,0,0,0,11,34802,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dullgrom Dredger - On Victim Casting - Cast ''Kick'''),
(21254,0,1,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dullgrom Dredger - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(19984,0,0,0,0,0,100,0,3700,4000,12700,14000,0,11,37582,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vekh''nir Dreadhawk - IC - Cast ''Whirlwind'''),
(19984,0,1,0,2,0,100,1,0,30,0,0,0,11,11642,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vekh''nir Dreadhawk - Between 0-30% Health - Cast ''Heal'' (No Repeat)'),

(21839,0,0,0,0,0,100,0,4800,6400,14600,16200,0,11,32914,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mature Silkwing - IC - Cast ''Wing Buffet'''),

(20747,0,0,1,11,0,100,0,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silkwing Larva - On Respawn - Enable Attack'),
(20747,0,1,2,61,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silkwing Larva - Linked - Set Root Off'),
(20747,0,2,0,61,0,100,0,0,0,0,0,0,19,32768,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silkwing Larva - Linked - Remove ''UNIT_FLAG2_DISABLE_TURN'''),
(20747,0,3,0,2,0,100,1,0,20,0,0,0,80,2074700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silkwing Larva - Between 0-20% Health - Call Timed Action List (No Repeat)'),

(2074700,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silkwing Larva - On Script - Say Line 0'),
(2074700,9,1,0,0,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silkwing Larva - On Script - Disable Attack'),
(2074700,9,2,0,0,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silkwing Larva - On Script - Set Root On'),
(2074700,9,3,0,0,0,100,0,0,0,0,0,0,18,32768,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silkwing Larva - On Script - Set ''UNIT_FLAG2_DISABLE_TURN'''),
(2074700,9,4,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silkwing Larva - On Script - Say Line 1'),
(2074700,9,5,0,0,0,100,0,0,0,0,0,0,11,36948,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silkwing Larva - On Script - Cast ''Silkwing'''),
(2074700,9,6,0,0,0,100,0,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silkwing Larva - On Script - Die'),

(21373,0,0,0,0,0,100,0,4800,6400,14600,16200,0,11,32914,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silkwing - IC - Cast ''Wing Buffet'''),
(21373,0,1,0,1,0,100,0,30000,30000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silkwing - OOC - Force Despawn'),

(21516,0,0,0,0,0,100,0,3700,5200,13600,15000,0,11,37621,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Death''s Watch - IC - Cast ''Mind Flay'''),
(21516,0,1,0,2,0,100,1,0,50,0,0,0,11,36398,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Death''s Watch - Between 0-50% Health - Cast ''Tongue Lash'' (No Repeat)'),

(19980,0,0,0,0,0,100,0,3500,5000,13500,15000,0,11,36406,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Void Terror - IC - Cast ''Double Breath'''),
(19980,0,1,0,2,0,100,1,0,30,0,0,0,11,36405,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Void Terror - Between 0-30% Health - Cast ''Stomp'' (No Repeat)'),

(21519,0,0,0,0,0,100,0,3400,4000,10400,12000,0,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Death''s Might - IC - Cast ''Cleave'''),
(21519,0,1,0,2,0,100,1,0,80,0,0,0,11,32736,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Death''s Might - Between 0-80% Health - Cast ''Mortal Strike'' (No Repeat)'),

(22123,0,0,0,4,0,100,0,0,0,0,0,0,11,25640,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rip-Blade Ravager - On Aggro - Cast ''Thorns'''),
(22123,0,1,0,2,0,100,1,0,80,0,0,0,11,3242,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rip-Blade Ravager - Between 0-80% Health - Cast ''Ravage'' (No Repeat)'),

(20751,0,0,0,4,0,100,0,0,0,0,0,0,11,35570,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Daggermaw Lashtail - On Aggro - Cast ''Charge'''),
(20751,0,1,0,0,0,100,0,2500,5000,30000,31000,0,11,7367,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Daggermaw Lashtail - IC - Cast ''Infected Bite'''),

(20714,0,0,0,2,0,100,1,0,80,0,0,0,11,744,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ridgespine Stalker - Between 0-80% Health - Cast ''Poison'' (No Repeat)'),

(21004,0,0,0,2,0,100,1,0,40,0,0,0,11,36513,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lesser Nether Drake - Between 0-40% Health - Cast ''Intangible Presence'' (No Repeat)'),

(21423,0,0,0,4,0,100,0,0,0,0,0,0,11,25640,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gore-Scythe Ravager - On Aggro - Cast ''Thorns'''),
(21423,0,1,0,0,0,100,0,4000,5000,19000,20000,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Gore-Scythe Ravager - IC - Cast ''Rend'''),

(21956,0,0,0,0,0,100,0,4000,5000,19000,20000,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Rema - IC - Cast ''Rend'''),
(21956,0,1,0,2,0,100,1,0,80,0,0,0,11,5781,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rema - Between 0-80% Health - Cast ''Threatening Growl'' (No Repeat)'),
(21956,0,2,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rema - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(21033,0,0,0,4,0,100,0,0,0,0,0,0,11,37839,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bladewing Bloodletter - On Aggro - Cast ''Poison Spit'''),
(21033,0,1,0,2,0,100,1,0,40,0,0,0,11,37838,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bladewing Bloodletter - Between 0-40% Health - Cast ''Blood Leech'' (No Repeat)'),

(22052,0,0,0,0,0,100,0,2500,5000,20500,25000,0,11,35321,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Daggermaw Blackhide - IC - Cast ''Gushing Wound'''),

(21040,0,0,0,25,0,100,0,0,0,0,0,0,11,3417,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Outraged Raven''s Wood Sapling - On Reset - Cast ''Thrash'''),

(20211,0,0,0,4,0,100,0,0,0,0,0,0,11,37579,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ruuan''ok Matriarch - On Aggro - Cast ''Impending Doom'''),
(20211,0,1,0,0,0,100,0,500,1000,9500,10000,0,11,9613,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ruuan''ok Matriarch - IC - Cast ''Shadow Bolt'''),
(20211,0,2,0,2,0,100,1,0,30,0,0,0,11,34110,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ruuan''ok Matriarch - Between 0-30% Health - Cast ''Shadow Mend'' (No Repeat)'),

(19987,0,0,0,0,0,100,0,3000,4000,12000,15000,0,11,37581,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ruuan''ok Ravenguard - IC - Cast ''Thundercleave'''),

(19985,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ruuan''ok Cloudgazer - OOC - Cast ''Lightning Shield'''),
(19985,0,1,0,0,0,100,0,500,1000,7500,8000,0,11,9532,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ruuan''ok Cloudgazer - IC - Cast ''Lightning Bolt'''),

(19986,0,0,0,2,0,100,1,0,60,0,0,0,11,37681,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ruuan''ok Skyfury - Between 0-60% Health - Cast ''Lightning Fury'' (No Repeat)'),

(20757,0,0,0,4,0,100,0,0,0,0,0,0,11,33245,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fingrom - On Aggro - Cast ''Ice Barrier'''),
(20757,0,1,0,2,0,100,1,0,80,0,0,0,11,33061,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fingrom - Between 0-80% Health - Cast ''Blast Wave'' (No Repeat)'),
(20757,0,2,0,0,0,100,0,500,1000,7500,8000,0,11,15242,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Fingrom - IC - Cast ''Fireball'''),

(20729,0,0,0,4,0,100,0,0,0,0,0,0,11,22911,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bladespire Ravager - On Aggro - Cast ''Charge'''),
(20729,0,1,0,2,0,100,1,0,80,0,0,0,11,16128,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bladespire Ravager - Between 0-80% Health - Cast ''Infected Bite'' (No Repeat)'),

(20753,0,0,0,4,0,100,0,0,0,0,0,0,11,12493,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dorgok - On Aggro - Cast ''Curse of Weakness'''),
(20753,0,1,0,2,0,100,1,0,30,0,0,0,11,39119,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dorgok - Between 0-30% Health - Cast ''Fear'' (No Repeat)'),
(20753,0,2,0,0,0,100,0,500,1000,18000,19000,0,11,11962,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dorgok - IC - Cast ''Immolate'''),

(19956,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Lookout - On Death - Say Line 1'),
(19956,0,1,2,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,2,0,0,0,0,0,0,0,0,'Bloodmaul Lookout - On Aggro - Say Line 0'),
(19956,0,2,0,2,0,100,1,0,30,0,0,0,11,37786,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Lookout - Between 0-30% Health - Cast ''Bloodmaul Rage'' (No Repeat)'),

(19948,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Skirmisher - On Death - Say Line 1'),
(19948,0,1,2,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,2,0,0,0,0,0,0,0,0,'Bloodmaul Skirmisher - On Aggro - Say Line 0'),
(19948,0,2,0,61,0,100,0,0,0,0,0,0,11,34932,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Skirmisher - On Aggro - Cast ''Bloodmaul Buzz'''),
(19948,0,3,0,13,0,100,0,10000,15000,0,0,0,11,34802,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bloodmaul Skirmisher - On Victim Casting - Cast ''Kick'''),
(19948,0,4,0,2,0,100,1,0,30,0,0,0,11,37786,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Skirmisher - Between 0-30% Health - Cast ''Bloodmaul Rage'' (No Repeat)'),

(20726,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mugdorg - OOC - Cast ''Lightning Shield'''),
(20726,0,1,0,0,0,100,0,500,1000,8500,9000,0,11,12058,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mugdorg - IC - Cast ''Chain Lightning'''),
(20726,0,2,0,2,0,100,1,0,30,0,0,0,11,11986,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mugdorg - Between 0-30% Health - Cast ''Healing Wave'' (No Repeat)'),

(20731,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,12544,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Droggam - OOC - Cast ''Frost Armor'''),
(20731,0,1,0,0,0,100,0,500,1000,8500,9000,0,11,9053,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Droggam - IC - Cast ''Fireball'''),
(20731,0,2,0,2,0,100,1,0,30,0,0,0,11,11831,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Droggam - Between 0-30% Health - Cast ''Frost Nova'' (No Repeat)'),

(20730,0,0,0,0,0,100,0,2500,4000,11500,14000,0,11,32009,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Glumdor - IC - Cast ''Cutdown'''),
(20730,0,1,2,2,0,100,1,0,80,0,0,0,11,36208,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Glumdor - Between 0-80% Health - Cast ''Steal Weapon'' (No Repeat)'),
(20730,0,2,0,61,0,100,1,0,0,0,0,0,1,0,0,1,0,0,0,2,0,0,0,0,0,0,0,0,'Glumdor - Linked - Say Line 0'),
(20730,0,3,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Glumdor - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(20732,0,0,0,0,0,100,0,500,1000,8500,9000,0,11,9672,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gorr''Dim - IC - Cast ''Frostbolt'''),
(20732,0,2,0,2,0,100,1,0,30,0,0,0,11,15091,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gorr''Dim - Between 0-30% Health - Cast ''Blast Wave'' (No Repeat)'),

(20723,0,0,0,13,0,100,0,10000,15000,0,0,0,11,11978,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Korgaah - On Victim Casting - Cast ''Kick'''),
(20723,0,1,0,2,0,100,1,0,80,0,0,0,11,23600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Korgaah - Between 0-80% Health - Cast ''Piercing Howl'' (No Repeat)'),
(20723,0,2,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Korgaah - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(21975,0,0,0,0,0,100,0,2100,3600,9400,11200,0,11,15496,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Bladespire Sober Defender - IC - Cast ''Cleave'''),

(20728,0,0,0,0,0,100,0,2500,5000,20500,25000,0,11,35321,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Bladespire Raptor - IC - Cast ''Gushing Wound'''),

(21381,0,0,0,4,0,100,0,0,0,0,0,0,11,37359,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Young Crust Burster - On Aggro - Cast ''Rush'''),
(21381,0,1,0,0,0,100,0,2400,3000,8600,10400,0,11,21067,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Young Crust Burster - IC - Cast ''Poison Bolt'''),

(22308,0,0,0,4,0,100,0,0,0,0,0,0,11,39182,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wyrmcult Hunter - On Aggro - Cast ''Serpent Sting'''),
(22308,0,1,0,9,0,100,0,5,30,2300,3900,1,11,15547,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wyrmcult Hunter - Within 5-30 Range - Cast ''Shoot'''),

(21810,0,0,0,0,0,100,0,2400,4700,9800,13600,0,11,17207,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wyrmcult Hewer - IC - Cast ''Whirlwind'''),
(21810,0,1,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wyrmcult Hewer - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(20329,0,1,0,4,0,100,0,0,0,0,0,0,11,37579,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Grishna Matriarch - On Aggro - Cast ''Impending Doom'''),
(20329,0,2,0,0,0,100,0,500,1000,8700,9000,0,11,9613,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Grishna Matriarch - IC - Cast ''Shadow Bolt'''),

(21325,0,0,0,4,0,100,0,0,0,0,0,0,11,37823,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Raven''s Wood Stonebark - On Aggro - Cast ''Entangling Roots'''),
(21325,0,1,0,0,0,100,0,2400,4000,10600,13800,0,11,12612,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Raven''s Wood Stonebark - IC - Cast ''Stomp'''),
(21325,0,2,0,2,0,100,1,0,80,0,0,0,11,37709,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raven''s Wood Stonebark - Between 0-80% Health - Cast ''Wild Regeneration'' (No Repeat)'),

(21048,0,0,0,11,0,100,0,0,0,0,0,0,11,674,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Boulder''mok Chieftain - On Respawn - Cast ''Dual Wield'''),
(21048,0,1,0,0,0,100,0,2800,3400,12800,13400,0,11,8078,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Boulder''mok Chieftain - IC - Cast ''Thunderclap'''),
(21048,0,2,0,2,0,100,1,0,30,0,0,0,11,35491,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Boulder''mok Chieftain - Between 0-30% Health - Cast ''Furious Rage'' (No Repeat)'),

(21047,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Boulder''mok Shaman - OOC - Cast ''Lightning Shield'''),
(21047,0,1,0,2,0,100,1,0,80,0,0,0,11,11986,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Boulder''mok Shaman - Between 0-80% Health - Cast ''Healing Wave'' (No Repeat)'),
(21047,0,2,0,2,0,100,1,0,30,0,0,0,11,28902,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Boulder''mok Shaman - Between 0-30% Health - Cast ''Bloodlust'' (No Repeat)'),

(21046,0,0,0,0,0,100,0,2500,4000,9500,13000,0,11,37577,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Boulder''mok Brute - IC - Cast ''Debilitating Strike'''),
(21046,0,1,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Boulder''mok Brute - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(21042,0,0,0,2,0,100,1,0,80,0,0,0,11,31273,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dire Raven - Between 0-80% Health - Cast ''Screech'' (No Repeat)'),

(21492,0,0,0,0,0,100,0,500,1000,8400,9000,0,11,9053,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wyrmcult Blessed - IC - Cast ''Fireball'''),
(21492,0,1,0,2,0,100,1,0,80,0,0,0,11,11969,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wyrmcult Blessed - Between 0-80% Health - Cast ''Fire Nova'' (No Repeat)'),

(22099,0,0,0,0,0,100,0,2500,4500,9500,12500,0,11,35857,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wyrmcult Provisioner - IC - Cast ''Torch'''),
(22099,0,1,0,13,0,100,0,10000,15000,0,0,0,11,34802,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wyrmcult Provisioner - On Victim Casting - Cast ''Kick'' (No Repeat)'),

(21383,0,0,0,0,0,100,0,500,1000,8600,9200,0,11,32707,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wyrmcult Acolyte - IC - Cast ''Incinerate'''),
(21383,0,1,0,2,0,100,1,0,80,0,0,0,11,11969,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wyrmcult Acolyte - Between 0-80% Health - Cast ''Fire Nova'' (No Repeat)'),
(21383,0,2,0,2,0,100,1,0,40,0,0,0,11,17139,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wyrmcult Acolyte - Between 0-40% Health - Cast ''Power Word: Shield'' (No Repeat)'),

(21382,0,0,0,0,0,100,0,500,1000,8900,9600,0,11,20714,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wyrmcult Zealot - IC - Cast ''Fireball'''),
(21382,0,1,0,2,0,100,1,0,80,0,0,0,11,32009,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wyrmcult Zealot - Between 0-80% Health - Cast ''Cutdown'' (No Repeat)'),
(21382,0,2,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wyrmcult Zealot - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(21637,0,0,0,9,0,100,0,5,30,2300,3900,1,11,15547,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wyrmcult Scout - Within 5-30 Range - Cast ''Shoot'''),
(21637,0,1,0,0,0,100,0,500,1000,8400,9000,0,11,20714,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wyrmcult Scout - IC - Cast ''Fireball'''),
(21637,0,2,0,2,0,100,1,20,80,0,0,0,11,11970,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wyrmcult Scout - Between 20-80% Health - Cast ''Fire Nova'' (No Repeat)'),

(22286,0,0,0,25,0,100,0,0,0,0,0,0,11,3417,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Rager - On Reset - Cast ''Thrash'''),

(22451,0,0,0,11,0,100,0,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Legion Fel Cannon MKII - On Respawn - Disable Combat Movement'),
(22451,0,1,0,0,0,100,0,1500,3000,7500,9000,0,11,36238,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Legion Fel Cannon MKII - IC - Cast ''Fel Cannon Blast'''),

(22196,0,0,0,2,0,100,1,0,80,0,0,0,11,31755,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wrath Reaver - Between 0-80% Health - Cast ''War Stomp'' (No Repeat)'),

(22298,0,0,0,0,0,100,0,500,1000,9600,12400,0,11,9053,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vile Fire-Soul - IC - Cast ''Fireball'''),

(22385,0,0,0,0,0,100,0,2500,3000,17500,18000,0,11,11443,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Terrordar the Tormentor - IC - Cast ''Cripple'''),
(22385,0,1,0,0,0,100,0,1500,2000,7500,9000,0,11,39083,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Terrordar the Tormentor - IC - Cast ''Incinerate'''),

(20109,0,0,0,2,0,100,1,0,80,0,0,0,11,31273,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lashh''an Kaliri - Between 0-80% Health - Cast ''Screech'' (No Repeat)'),

(19943,0,0,0,67,0,100,0,3000,6000,0,0,0,11,37685,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lashh''an Talonite - Behind Target - Cast ''Backstab'''),

(19945,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lashh''an Windwalker - OOC - Cast ''Lightning Shield'''),
(19945,0,1,0,0,0,100,0,500,1000,6500,9000,0,11,9532,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lashh''an Windwalker - IC - Cast ''Lightning Bolt'''),

(19944,0,0,0,0,0,100,0,3500,4000,10500,14500,0,11,37577,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Lashh''an Wing Guard - IC - Cast ''Debilitating Strike'''),

(21023,0,0,0,4,0,100,0,0,0,0,0,0,11,11922,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Stronglimb Deeproot - On Aggro - Cast ''Entangling Roots'''),
(21023,0,1,0,2,0,100,1,0,60,0,0,0,11,12612,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Stronglimb Deeproot - Between 0-60% Health - Cast ''Stomp'' (No Repeat)'),

(22132,0,0,0,0,0,100,0,500,1000,9800,12600,0,11,7951,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mature Cavern Crawler - IC - Cast ''Toxic Spit'''),

(22044,0,0,0,2,0,100,1,0,80,0,0,0,11,744,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cavern Crawler - Between 0-80% Health - Cast ''Poison'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
