-- DB update 2021_09_11_00 -> 2021_09_12_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_11_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_11_00 2021_09_12_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1631398609950236203'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1631398609950236203');

-- Soulbind: Add appropriate spell script
DELETE FROM `spell_scripts` WHERE `id` = 36153;
INSERT INTO `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(36153,0,0,15,36141,3,0,0,0,0,0);

-- Warp Storm: Remove UNIT_FLAG_IMMUNE_TO_PC & CREATURE_FLAG_EXTRA_CIVILIAN (otherwise it cannot damage the player)
UPDATE `creature_template` SET `unit_flags` = `unit_flags` & ~256, `flags_extra` = `flags_extra` & ~2 WHERE `entry` = 21322;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (20480,20512,21065,20404,20773,20611,20854,20453,20452,20456,20474,20779,20458,20459,23008,22822,20931,20634,21135,20928,21923,18858,20516,20929,20930,20685,21089);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (20480,20512,21065,20404,20773,20611,20854,20453,20452,20456,20474,20779,20458,20459,23008,22822,20931,20634,21135,20928,21923,18858,20516,20929,20930,20685,21089);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20480,0,0,0,2,0,100,1,0,80,0,0,0,11,36153,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kirin''Var Ghost - Between 0-80% Health - Cast ''Soulbind'' (No Repeat)'),

(20512,0,0,0,2,0,100,1,0,80,0,0,0,11,36153,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Tormented Soul - Between 0-80% Health - Cast ''Soulbind'' (No Repeat)'),

(21065,0,0,0,4,0,100,0,0,0,0,0,0,11,11980,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Tormented Citizen - On Aggro - Cast ''Curse of Weakness'''),
(21065,0,1,0,0,0,100,0,1700,2700,6200,8400,0,11,9613,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Tormented Citizen - IC - Cast ''Shadow Bolt'''),
(21065,0,2,0,2,0,100,1,0,50,0,0,0,11,36153,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Tormented Citizen - Between 0-50% Health - Cast ''Soulbind'' (No Repeat)'),

(20404,0,0,0,0,0,100,0,2100,3400,6900,9400,0,11,35147,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Warp-Gate Engineer - IC - Cast ''Sundering Swipe'''),

(20773,0,0,0,2,0,100,1,0,80,0,0,0,11,25640,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Barbscale Crocolisk - Between 0-80% Health - Cast ''Thorns'' (No Repeat)'),
(20773,0,1,0,0,0,100,0,2000,3000,12000,15000,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Barbscale Crocolisk - IC - Cast ''Tendon Rip'''),

(20611,0,0,0,0,0,100,0,2500,4000,8500,9500,0,11,32914,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shimmerwing Moth - IC - Cast ''Wing Buffet'''),
(20611,0,1,0,2,0,100,1,0,30,0,0,0,11,36592,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Shimmerwing Moth - Between 0-30% Health - Cast ''Shimmerwing Dust'' (No Repeat)'),

(20854,0,0,0,0,0,100,0,1700,2500,6700,8500,0,11,15284,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ethereum Gladiator - IC - Cast ''Cleave'''),
(20854,0,1,0,0,0,100,0,7000,9000,9000,11000,0,11,16856,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ethereum Gladiator - IC - Cast ''Mortal Strike'''),
(20854,0,2,0,0,0,100,0,2300,3500,12300,14500,0,11,31553,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ethereum Gladiator - IC - Cast ''Hamstring'''),

(20453,0,0,0,4,0,100,0,0,0,0,0,0,11,36500,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ethereum Shocktrooper - On Aggro - Cast ''Glaive'''),
(20453,0,1,0,0,0,100,0,2300,3500,12300,14500,0,11,31553,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ethereum Shocktrooper - IC - Cast ''Hamstring'''),

(20452,0,0,0,4,0,100,0,0,0,0,0,0,11,32920,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ethereum Assassin - On Aggro - Cast ''Warp'''),
(20452,0,1,0,67,0,100,0,3000,6000,0,0,0,11,7159,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ethereum Assassin - Behind Target - Cast ''Backstab'''),
(20452,0,2,0,13,0,100,0,10000,15000,0,0,0,11,34802,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ethereum Assassin - On Victim Casting - Cast ''Kick'''),

(20456,0,0,0,0,0,100,0,1700,2400,5200,6800,0,11,9532,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ethereum Researcher - IC - Cast ''Lightning Bolt'''),
(20456,0,1,0,2,0,100,1,0,80,0,0,0,11,36508,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ethereum Researcher - Between 0-80% Health - Cast ''Energy Surge'' (No Repeat)'),
(20456,0,2,0,2,0,100,1,0,30,0,0,0,11,36506,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Researcher - Between 0-30% Health - Cast ''Energy Charge'' (No Repeat)'),

(20474,0,0,0,54,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Nexus-Stalker - On Just Summoned - Say Line 0'),
(20474,0,1,0,1,0,100,0,1000,1000,1000,1000,0,11,36515,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Nexus-Stalker - OOC - Cast ''Shadowtouched'''),
(20474,0,2,0,0,0,100,0,2500,5000,10000,12500,0,11,36517,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ethereum Nexus-Stalker - IC - Cast ''Shadowsurge'''),

(20779,0,0,0,0,0,100,0,5000,10000,15000,25000,0,11,35556,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Congealed Void Horror - IC - Cast ''Eco-Contamination'''),

(20458,0,0,0,4,0,100,0,0,0,0,0,0,11,36513,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Archon - On Aggro - Cast ''Intangible Presence'''),
(20458,0,1,0,2,0,100,0,0,25,8000,8000,0,11,35924,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Archon - Between 0-25% - Cast ''Energy Flux'''),

(20459,0,0,0,4,0,100,0,0,0,0,0,0,11,36509,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ethereum Overlord - On Aggro - Cast ''Charge'''),
(20459,0,1,0,2,0,100,1,0,95,0,0,0,11,32064,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Overlord - Between 0-95% Health - Cast ''Battle Shout'' (No Repeat)'),

(23008,0,0,0,4,0,100,0,0,0,0,0,0,11,36513,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Jailor - On Aggro - Cast ''Intangible Presence'''),

(22822,0,0,0,4,0,100,0,0,0,0,0,0,11,36513,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Nullifier - On Aggro - Cast ''Intangible Presence'''),

(20931,0,0,0,0,0,100,0,2500,4000,27500,30000,0,11,35321,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Tyrantus - IC - Cast ''Gushing Wound'''),
(20931,0,1,0,2,0,100,1,0,30,0,0,0,11,36629,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Tyrantus - Between 0-30% Health - Cast ''Terrifying Roar'' (No Repeat)'),

(20634,0,0,0,4,0,100,0,0,0,0,0,0,11,37359,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scythetooth Raptor - On Aggro - Cast ''Rush'''),
(20634,0,1,0,2,0,100,1,0,80,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scythetooth Raptor - Between 0-80% Health - Cast ''Enrage'' (No Repeat)'),

(21135,0,0,0,2,0,100,1,0,80,0,0,0,11,32008,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Imp - Between 0-80% Health - Cast ''Fel Fire'' (No Repeat)'),

(20928,0,0,0,0,0,100,0,0,5000,10000,15000,0,11,37179,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ironspine Forgelord - IC - Cast ''Hammer Slam'''),
(20928,0,2,0,0,0,100,0,0,5000,10000,15000,0,11,33962,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ironspine Forgelord - IC - Cast ''Toughen'''),

(21923,0,0,0,0,0,100,0,2400,3200,8600,9800,0,11,15496,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Terrorguard Protector - IC - Cast ''Cleave'''),
(21923,0,1,0,2,0,100,1,0,50,0,0,0,11,37488,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Terrorguard Protector - Between 0-50% Health - Cast ''Fel Flames'' (No Repeat)'),

(18858,0,0,0,25,0,100,0,0,0,0,0,0,11,8876,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wrathbringer - On Reset - Cast ''Thrash'''),

(20516,0,0,0,0,0,100,0,2500,5000,30000,35000,0,11,36577,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warp Monstrosity - IC - Cast ''Warp Storm'''),
(20516,0,1,0,0,0,100,0,1700,2300,6800,8100,0,11,13901,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warp Monstrosity - IC - Cast ''Arcane Bolt'''),

(20929,0,0,0,0,0,100,0,2300,4100,7400,9200,0,11,15496,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Wrath Lord - IC - Cast ''Cleave'''),

(20930,0,0,0,4,0,100,0,0,0,0,0,0,11,36541,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hatecryer - On Aggro - Cast ''Curse of Burning Shadows'''),
(20930,0,1,0,0,0,100,0,2100,3500,9100,12500,0,11,34017,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hatecryer - IC - Cast ''Rain of Chaos'''),

(20685,0,0,1,0,0,100,0,10000,15000,15000,20000,0,11,35491,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Overseer Azarad - IC - Cast ''Furious Rage'''),
(20685,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Overseer Azarad - Linked - Set Phase 1'),
(20685,0,2,3,23,1,100,0,35491,0,1000,1000,0,11,35492,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Overseer Azarad - On Has No Aura ''Furious Rage'' - Cast ''Exhaustion'' (Phase 1)'),
(20685,0,3,0,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Overseer Azarad - Linked - Set Phase 0'),

(21089,0,0,0,0,0,100,0,3700,5500,9800,13600,0,11,35871,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Blood Knight - IC - Cast ''Spellbreaker'''),
(21089,0,1,0,2,0,100,1,0,50,0,0,0,11,36476,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Blood Knight - Between 0-50% Health - Cast ''Blood Heal'' (No Repeat)'),
(21089,0,2,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Blood Knight - Between 0-30% Health - Cast ''Enrage'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
