-- DB update 2021_11_11_00 -> 2021_11_12_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_11_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_11_00 2021_11_12_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1636716856049511302'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1636716856049511302');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (18352,18298,18290,18289,18660,18661,19201,18145,17155,17136,17154,18202,18204,18207,18203,23026,18536,21925,18567,16945,18535,17152,17131,17151,17133,18065,18229,18414,18415,17129,18413,17138,17159,17132,17153,17141,17139,17128,18334,18226,17158,18205);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (18352,18298,18290,18289,18660,18661,19201,18145,17155,17136,17154,18202,18204,18207,18203,23026,18536,21925,18567,16945,18535,17152,17131,17151,17133,18065,18229,18414,18415,17129,18413,17138,17159,17132,17153,17141,17139,17128,18334,18226,17158,18205);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18352,0,0,0,0,0,100,1,0,0,0,0,0,11,32248,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Boulderfist Hunter - IC - Cast ''Spear Throw'' (No Repeat)'),

(18298,0,0,0,11,0,100,0,0,0,0,0,0,11,674,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gava''xi - On Respawn - Cast ''Dual Wield'''),
(18298,0,1,0,0,0,100,0,2500,4000,9500,12000,0,11,14873,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Gava''xi - IC - Cast ''Sinister Strike'''),

(18290,0,0,0,0,0,100,0,1500,3000,18000,20000,0,11,32019,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Tusker - IC - Cast ''Gore'''),
(18290,0,1,0,2,0,100,1,0,60,0,0,0,11,15550,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tusker - Between 0-60% Health - Cast ''Trample'' (No Repeat)'),
(18290,0,2,0,2,0,100,1,0,80,0,0,0,11,12612,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tusker - Between 0-80% Health - Cast ''Stomp'' (No Repeat)'),

(18289,0,0,0,2,0,100,1,0,80,0,0,0,11,15550,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bull Elekk - Between 0-80% Health - Cast ''Trample'' (No Repeat)'),

(18660,0,0,0,25,0,100,0,0,0,0,0,0,11,3417,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Subjugator Vaz''shir - On Reset - Cast ''Thrash'''),
(18660,0,1,0,2,0,100,1,0,80,0,0,0,11,13736,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Subjugator Vaz''shir - Between 0-80% Health - Cast ''Whirlwind'' (No Repeat)'),

(18661,0,0,0,0,0,100,0,500,1000,18500,20000,0,11,11443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Terrorguard - IC - Cast ''Cripple'''),
(18661,0,1,0,2,0,100,1,0,60,0,0,0,11,11876,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Terrorguard - Between 0-60% Health - Cast ''War Stomp'' (No Repeat)'),

(19201,0,0,0,25,0,100,0,0,0,0,0,0,11,3417,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mountain Gronn - On Reset - Cast ''Thrash'''),

(18145,0,0,0,0,0,100,0,2500,5000,10000,15000,0,11,32139,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Watoosun''s Polluted Essence - IC - Cast ''Acidic Splash'''),

(17155,0,0,0,4,0,100,0,0,0,0,0,0,11,32012,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lake Surger - On Aggro - Cast ''Surge'''),

(17136,0,0,0,11,0,100,0,0,0,0,0,0,11,674,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Boulderfist Warrior - On Respawn - Cast ''Dual Wield'''),
(17136,0,1,0,4,0,100,0,0,0,0,0,0,11,31994,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Boulderfist Warrior - On Aggro - Cast ''Shoulder Charge'''),

(17154,0,0,0,0,0,100,1,0,0,0,0,0,11,32013,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Muck Spawn - IC - Cast ''Mucky Sludge'' (No Repeat)'),
(17154,0,1,0,0,0,100,0,500,1000,8000,12000,0,11,21067,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Muck Spawn - IC - Cast ''Poison Bolt'''),

(18202,0,0,0,0,0,100,1,0,0,0,0,0,11,32133,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Murkblood Putrifier - IC - Cast ''Corrupted Earth'' (No Repeat)'),
(18202,0,1,0,0,0,100,0,500,1000,9500,12000,0,11,32132,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Murkblood Putrifier - IC - Cast ''Tainted Chain Lightning'''),
(18202,0,2,0,2,0,100,1,0,80,0,0,0,11,32134,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Murkblood Putrifier - Between 0-80% Health - Cast ''Putrid Cloud'' (No Repeat)'),

(18204,0,0,0,9,0,100,1,0,5,0,0,1,11,31981,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ortor of Murkblood - Within 0-5 Range - Cast ''Tainted Earthgrab Totem'' (No Repeat)'),
(18204,0,1,0,0,0,100,0,500,1000,9500,12000,0,11,32132,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ortor of Murkblood - IC - Cast ''Tainted Chain Lightning'''),

(18207,0,0,0,25,0,100,0,0,0,0,0,0,11,3417,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Murkblood Scavenger - On Reset - Cast ''Thrash'''),

(18203,0,0,0,0,0,100,0,5000,10000,15000,20000,0,11,11971,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Murkblood Raider - IC - Cast ''Sunder Armor'''),
(18203,0,1,0,2,0,100,1,0,80,0,0,0,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Murkblood Raider - Between 0-80% Health - Cast ''Cleave'' (No Repeat)'),

(23026,0,0,0,2,0,100,1,0,80,0,0,0,11,36612,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Twilight Serpent - Between 0-80% Health - Cast ''Toothy Bite'' (No Repeat)'),

(18536,0,0,0,25,0,100,0,0,0,0,0,0,11,32008,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Xirkos, Overseer of Fear - On Reset - Cast ''Fel Fire'''),
(18536,0,1,0,2,0,100,1,0,80,0,0,0,11,4629,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Xirkos, Overseer of Fear - Between 0-80% Health - Cast ''Rain of Fire'' (No Repeat)'),

(21925,0,0,0,0,0,100,0,500,1000,8700,9000,0,11,12471,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Avatar of Sathal - IC - Cast ''Shadow Bolt'''),
(21925,0,1,0,2,0,100,1,0,80,0,0,0,11,34017,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Avatar of Sathal - Between 0-80% Health - Cast ''Rain of Chaos'' (No Repeat)'),

(18567,0,0,0,0,0,100,0,2500,5000,10000,15000,0,11,31705,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mo''arg Master Planner - IC - Cast ''Magnetic Pull'''),

(16945,0,0,0,4,0,100,0,0,0,0,0,0,11,31705,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mo''arg Engineer - On Aggro - Cast ''Magnetic Pull'''),
(16945,0,1,0,0,0,100,0,2500,5000,10000,15000,0,11,32005,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mo''arg Engineer - IC - Cast ''Thorium Drill'''),
(16945,0,2,0,2,0,100,1,0,80,0,0,0,11,15976,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mo''arg Engineer - Between 0-80% Health - Cast ''Puncture'' (No Repeat)'),

(18535,0,0,0,25,0,100,0,0,0,0,0,0,11,32008,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demos, Overseer of Hate - On Reset - Cast ''Fel Fire'''),

(17152,0,0,0,25,0,100,0,0,0,0,0,0,11,32008,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Felguard Legionnaire - On Reset - Cast ''Fel Fire'''),
(17152,0,1,0,2,0,100,1,0,80,0,0,0,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felguard Legionnaire - Between 0-80% Health - Cast ''Cleave'' (No Repeat)'),
(17152,0,2,0,2,0,100,1,0,60,0,0,0,11,32009,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felguard Legionnaire - Between 0-60% Health - Cast ''Cutdown'' (No Repeat)'),

(17131,0,0,0,0,0,100,1,0,0,0,0,0,11,32020,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Talbuk Thorngrazer - IC - Cast ''Talbuk Strike'' (No Repeat)'),
(17131,0,1,0,0,0,100,0,2500,5000,20000,25000,0,11,32019,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Talbuk Thorngrazer - IC - Cast ''Gore'''),

(17151,0,0,0,2,0,100,1,0,80,0,0,0,11,32003,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gan''arg Tinkerer - Between 0-80% Health - Cast ''Power Burn'' (No Repeat)'),

(17133,0,0,0,4,0,100,0,0,0,0,0,0,11,32021,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Aged Clefthoof - On Aggro - Cast ''Rushing Charge'''),

(18065,0,0,0,2,0,100,1,0,80,0,0,0,11,10966,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warmaul Brute - Between 0-80% Health - Cast ''Uppercut'' (No Repeat)'),

(18229,0,0,0,0,0,100,0,5000,10000,15000,20000,0,11,16044,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Saurfang the Younger - IC - Cast ''Cleave'''),
(18229,0,1,0,2,0,100,1,0,80,0,0,0,11,24573,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Saurfang the Younger - Between 0-80% Health - Cast ''Mortal Strike'' (No Repeat)'),
(18229,0,2,0,2,0,100,1,0,60,0,0,0,11,67541,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Saurfang the Younger - Between 0-60% Health - Cast ''Bladestorm'' (No Repeat)'),
(18229,0,3,0,2,0,100,1,0,20,0,0,0,11,26339,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Saurfang the Younger - Between 0-20% Health - Cast ''Saurfang''s Rage'' (No Repeat)'),

(18414,0,0,0,4,0,100,1,0,0,0,0,0,11,20697,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Elder Yorley - On Aggro - Cast ''Power Word: Shield'''),
(18414,0,1,0,0,0,100,0,500,1000,15000,20000,0,11,20695,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Elder Yorley - IC - Cast ''Holy Smite'''),

(18415,0,0,0,4,0,100,0,0,0,0,0,0,11,46151,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Elder Ungriz - On Aggro - Cast ''Mana Shield'''),
(18415,0,1,0,0,0,100,0,500,1000,15000,20000,0,11,59210,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Elder Ungriz - IC - Cast ''Arcane Bolt'''),

(17129,0,0,0,2,0,100,1,0,80,0,0,0,11,31273,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Greater Windroc - Between 0-80% Health - Cast ''Screech'' (No Repeat)'),

(18413,0,0,0,0,0,100,0,500,1000,15000,20000,0,11,12548,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Zorbo the Advisor - IC - Cast ''Frost Shock'''),
(18413,0,1,0,2,0,100,1,0,60,0,0,0,11,11986,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zorbo the Advisor - Between 0-60% Health - Cast ''Healing Wave'' (No Repeat)'),

(17138,0,0,0,2,0,100,1,0,80,0,0,0,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warmaul Reaver - Between 0-80% Health - Cast ''Cleave'' (No Repeat)'),

(17159,0,0,0,2,0,100,1,0,80,0,0,0,11,32018,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Storm Rager - Between 0-80% Health - Cast ''Call Lightning'' (No Repeat)'),

(17132,0,0,0,2,0,100,1,0,80,0,0,0,11,32023,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Clefthoof Bull - Between 0-80% Health - Cast ''Hoof Stomp'' (No Repeat)'),

(17153,0,0,0,0,0,100,0,500,1000,10000,15000,0,11,34425,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Lake Spirit - IC - Cast ''Water Bolt'''),

(17141,0,0,0,0,0,100,1,0,0,0,0,0,11,6278,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Windyreed Wretch - IC - Cast ''Creeping Mold'' (No Repeat)'),
(17141,0,1,0,2,0,100,1,0,80,0,0,0,11,3234,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Windyreed Wretch - Between 0-80% Health - Cast ''Disease Touch'' (No Repeat)'),

(17139,0,0,0,0,0,100,1,0,0,0,0,0,11,12024,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Windyreed Scavenger - IC - Cast ''Net'' (No Repeat)'),

(17128,0,0,0,0,0,100,0,2000,6000,9000,14000,0,11,30285,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Windroc - IC - Cast ''Eagle Claw'''),

(18334,0,0,0,0,0,100,0,2500,5000,20000,25000,0,11,32019,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wild Elekk - IC - Cast ''Gore'''),

(18226,0,0,0,0,0,100,1,0,0,0,0,0,11,32020,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Talbuk Patriarch - IC - Cast ''Talbuk Strike'' (No Repeat)'),
(18226,0,1,0,0,0,100,0,2500,5000,20000,25000,0,11,32019,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Talbuk Patriarch - IC - Cast ''Gore'''),

(17158,0,0,0,2,0,100,0,0,80,0,0,0,11,32017,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dust Howler - Between 0-80% Health - Cast ''Howling Dust'''),

(18205,0,0,0,2,0,100,1,0,80,0,0,0,11,32023,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Clefthoof - Between 0-80% Health - Cast ''Hoof Stomp'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
