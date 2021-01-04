-- DB update 2021_01_03_00 -> 2021_01_04_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_03_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_03_00 2021_01_04_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609759737078450871'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609759737078450871');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (5363,5366,5364,5362,5296,5276,5288,8136,12802,5462,5308,5307,5247,5244,5245,5272,5258,5287,5260,5255,5278,7584,5251,5249,5229,5286,5268);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (5363,5366,5364,5362,5296,5276,5288,8136,12802,5462,5308,5307,5247,5244,5245,5272,5258,5287,5260,5255,5278,7584,5251,5249,5229,5286,5268) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(5363,0,0,0,67,0,100,0,8000,10000,0,0,0,11,6595,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Northspring Roguefeather - Is Behind Target - Cast ''Exploit Weakness'''),
(5363,0,1,0,0,0,100,0,2200,3300,9700,10500,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Northspring Roguefeather - IC - Cast ''Thrash'''),
(5363,0,2,0,74,0,100,1,0,50,0,0,0,11,11014,0,0,0,0,0,11,0,40,1,0,0,0,0,0,'Northspring Roguefeather - Friendly Between 0-50% Health - Cast ''Flow of the Northspring'' (No Repeat)'),

(5366,0,0,0,0,0,100,0,0,0,8600,9000,0,11,9532,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Northspring Windcaller - IC - Cast ''Lightning Bolt'''),
(5366,0,1,0,2,0,100,1,0,60,0,0,0,11,6728,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Northspring Windcaller - Between 0-60% Health - Cast ''Enveloping Winds'' (No Repeat)'),
(5366,0,2,0,74,0,100,1,0,50,0,0,0,11,11014,0,0,0,0,0,11,0,40,1,0,0,0,0,0,'Northspring Windcaller - Friendly Between 0-50% Health - Cast ''Flow of the Northspring'' (No Repeat)'),

(5364,0,0,0,74,0,100,1,0,50,0,0,0,11,11014,0,0,0,0,0,11,0,40,1,0,0,0,0,0,'Northspring Slayer - Friendly Between 0-50% Health - Cast ''Flow of the Northspring'' (No Repeat)'),
(5364,0,1,0,12,0,100,1,1,20,0,0,0,11,7160,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Northspring Slayer - Target Between 1-20% Health - Cast ''Execute'' (No Repeat)'),

(5362,0,0,0,74,0,100,1,0,50,0,0,0,11,11014,0,0,0,0,0,11,0,40,1,0,0,0,0,0,'Northspring Harpy - Friendly Between 0-50% Health - Cast ''Flow of the Northspring'' (No Repeat)'),

(5296,0,0,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rage Scar Yeti - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(5276,0,0,0,0,0,100,0,3000,4000,9000,12000,0,11,11981,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Sprite Dragon - IC - Cast ''Mana Burn'''),

(5288,0,0,0,0,0,100,1,4000,6000,0,0,0,11,3150,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Rabid Longtooth - IC - Cast ''Rabies'' (No Repeat)'),

(8136,0,0,0,0,0,100,0,1300,2000,9600,10000,0,11,8058,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Lord Shalzaru - IC - Cast ''Frost Shock'''),

(12802,0,0,0,0,0,100,0,4500,5000,10500,12000,0,11,54663,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Chimaerok Devourer - IC - Cast ''Fatal Bite'''),
(12802,0,1,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chimaerok Devourer - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(5462,0,0,0,0,0,100,0,0,0,8900,9300,0,11,11538,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Sea Spray - IC - Cast ''Frostbolt'''),
(5462,0,1,0,2,0,100,1,0,40,0,0,0,11,10987,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sea Spray - Between 0-40% Health - Cast ''Geyser'' (No Repeat)'),

(5308,0,0,0,0,0,100,0,2400,3200,12400,14800,0,11,8281,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rogue Vale Screecher - IC - Cast ''Sonic Burst'''),

(5307,0,0,0,0,0,100,0,1200,1600,8900,9300,0,11,59220,2,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vale Screecher - IC - Cast ''Chain Lightning'''),
(5307,0,1,0,2,0,100,1,0,50,0,0,0,11,8281,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vale Screecher - Between 0-50% Health - Cast ''Sonic Burst'' (No Repeat)'),

(5247,0,0,0,0,0,100,0,1500,2500,45000,46000,0,11,6016,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Zukk''ash Tunneler - IC - Cast ''Pierce Armor'''),

(5244,0,0,0,0,0,100,0,2000,3000,45000,46000,0,11,5416,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Zukk''ash Stinger - IC - Cast ''Venom Sting'''),
(5244,0,1,0,2,0,100,1,0,15,0,0,0,11,17170,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Zukk''ash Stinger - Between 0-15% Health - Cast ''Fatal Sting'' (No Repeat)'),

(5245,0,0,0,0,0,100,0,2500,3000,30000,31000,0,11,744,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Zukk''ash Wasp - IC - Cast ''Poison'''),

(5272,0,0,0,0,0,100,0,1300,2000,8700,9000,0,11,31279,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Grizzled Ironfur Bear - IC - Cast ''Swipe'''),

(5258,0,0,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Woodpaw Alpha - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(5287,0,0,0,0,0,100,0,2000,3500,9500,12000,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Longtooth Howler - IC - Cast ''Thrash'''),

(5260,0,0,0,0,0,100,0,2000,3500,9500,12000,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Groddoc Ape - IC - Cast ''Thrash'''),

(5255,0,0,0,4,0,100,0,0,0,0,0,0,11,7366,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Woodpaw Reaver - On Aggro - Cast ''Berserker Stance'''),
(5255,0,1,0,0,0,100,0,2700,3800,9900,11600,0,11,7369,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Woodpaw Reaver - IC - Cast ''Cleave'''),

(5278,0,0,0,0,0,100,0,3400,4100,9600,13800,0,11,11981,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Sprite Darter - IC - Cast ''Mana Burn'''),

(7584,0,0,0,2,0,100,1,0,60,0,0,0,11,16561,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wandering Forest Walker - Between 0-60% Health - Cast ''Regrowth'' (No Repeat)'),

(5251,0,0,0,0,0,100,0,0,0,0,0,0,11,6533,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Woodpaw Trapper - IC - Cast ''Net'' (No Repeat)'),
(5251,0,1,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Woodpaw Trapper - Within 5-30 Range - Cast ''Shoot'''),

(5249,0,0,0,2,0,100,1,0,80,0,0,0,11,7102,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Woodpaw Mongrel - Between 0-80% Health - Cast ''Contagion of Rot'' (No Repeat)'),

(5229,0,0,0,0,0,100,0,2300,2900,8600,9500,0,11,11976,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Gordunni Ogre - IC - Cast ''Strike'''),

(5286,0,0,0,4,0,100,0,0,0,0,0,0,11,3149,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Longtooth Runner - On Aggro - Cast ''Furious Howl'''),

(5268,0,0,0,0,0,100,0,1300,2000,8700,9000,0,11,31279,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ironfur Bear - IC - Cast ''Swipe''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
