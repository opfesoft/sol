-- DB update 2020_12_23_00 -> 2020_12_23_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_23_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_23_00 2020_12_23_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1608736792160541470'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1608736792160541470');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (10648,7111,7108,7107,9462,8961,7101,7100,7098,7138,7149,7136,9878,8960,9516,9517,9860,9861,9518,7093,7118,9877,9862,7114,7125,7113,7112,7115,7099,9454,7110,7106,7109,7105,9464,7097,8959);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (10648,7111,7108,7107,9462,8961,7101,7100,7098,7138,7149,7136,9878,8960,9516,9517,9860,9861,9518,7093,7118,9877,9862,7114,7125,7113,7112,7115,7099,9454,7110,7106,7109,7105,9464,7097,8959) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10648,0,0,0,4,0,100,0,0,0,0,0,0,11,13578,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Xavaric - On Aggro - Cast ''Jadefire'''),
(10648,0,1,0,0,0,100,0,1400,1900,6500,7200,0,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Xavaric - IC - Cast ''Cleave'''),

(7111,0,0,0,4,0,100,0,0,0,0,0,0,11,13578,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jadefire Hellcaller - On Aggro - Cast ''Jadefire'''),
(7111,0,1,0,0,0,100,0,2100,2200,6400,6700,0,11,20823,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Hellcaller - IC - Cast ''Fireball'''),
(7111,0,2,0,2,0,100,1,0,30,0,0,0,11,11990,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Hellcaller - Between 0-30% Health - Cast ''Rain of Fire'' (No Repeat)'),

(7108,0,0,0,4,0,100,0,0,0,0,0,0,11,13578,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jadefire Betrayer - On Aggro - Cast ''Jadefire'''),
(7108,0,1,0,0,0,100,0,1100,1200,16100,16200,0,11,13443,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Betrayer - IC - Cast ''Rend'''),
(7108,0,2,0,0,0,100,0,4500,4900,10700,11200,0,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Betrayer - IC - Cast ''Cleave'''),

(7107,0,0,0,4,0,100,0,0,0,0,0,0,11,13578,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jadefire Trickster - On Aggro - Cast ''Jadefire'''),
(7107,0,1,0,0,0,100,1,1100,1200,0,0,0,11,13338,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Trickster - IC - Cast ''Curse of Tongues'' (No Repeat)'),
(7107,0,2,0,0,0,100,1,5200,6400,0,0,0,11,11980,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Trickster - IC - Cast ''Curse of Weakness'' (No Repeat)'),

(9462,0,0,0,26,0,100,1,0,8,0,0,1,11,13583,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Chieftain Bloodmaw - IC LOS - Cast ''Curse of the Deadwood'' (No Repeat)'),
(9462,0,1,0,2,0,100,0,31,100,5900,6200,0,11,15117,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Chieftain Bloodmaw - Between 31-100% Health - Cast ''Chain Lightning'''),
(9462,0,2,0,2,0,100,1,0,30,0,0,0,11,5915,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chieftain Bloodmaw - Between 0-30% Health - Cast ''Crazed'' (No Repeat)'),

(8961,0,0,0,0,0,100,0,3300,3900,9400,9600,0,11,3391,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felpaw Ravager - IC - Cast ''Thrash'''),
(8961,0,1,0,0,0,100,1,6500,6600,0,0,0,11,17230,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felpaw Ravager - IC - Cast ''Infected Wound'' (No Repeat)'),

(7101,0,0,0,0,0,100,0,2100,2300,6900,7300,0,11,3391,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warpwood Shredder - IC - Cast ''Thrash'''),
(7101,0,1,0,0,0,100,0,5900,6000,12800,12900,0,11,13444,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warpwood Shredder - IC - Cast ''Sunder Armor'''),

(7100,0,0,0,4,0,100,0,0,0,0,0,0,11,11922,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warpwood Moss Flayer - On Aggro - Cast ''Entangling Roots'''),

(7098,0,0,0,0,0,100,0,2300,2400,13400,13500,0,11,3589,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ironbeak Screecher - IC - Cast ''Deafening Screech'''),

(7138,0,0,0,2,0,100,1,0,60,0,0,0,11,2091,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Irontree Wanderer - Between 0-60% Health - Cast ''Rejuvenation'' (No Repeat)'),

(7149,0,0,0,0,0,100,0,1900,2000,10100,11200,0,11,5337,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Withered Protector - IC - Cast ''Wither Strike'''),
(7149,0,1,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Withered Protector - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(7136,0,0,0,4,0,100,0,0,0,0,0,0,11,2602,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infernal Sentry - On Aggro - Cast ''Fire Shield IV'''),

(9878,0,0,0,4,0,100,0,0,0,0,0,0,11,15661,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Entropic Beast - On Aggro - Cast ''Immolate'''),

(8960,0,0,0,0,0,100,0,2100,2200,10100,10200,0,11,3604,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felpaw Scavenger - IC - Cast ''Tendon Rip'''),
(8960,0,1,0,2,0,100,1,0,60,0,0,0,11,17230,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felpaw Scavenger - Between 0-60% Health - Cast ''Infected Wound'' (No Repeat)'),

(9516,0,0,0,0,0,100,0,2200,3100,8600,9500,0,11,17399,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lord Banehollow - IC - Cast ''Shadow Shock'''),
(9516,0,1,0,2,0,100,1,0,60,0,0,0,11,16247,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lord Banehollow - Between 0-60% Health - Cast ''Curse of Thorns'' (No Repeat)'),

(9517,0,0,0,0,0,100,0,0,0,7600,7900,0,11,20825,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Shadow Lord Fel''dan - IC - Cast ''Shadow Bolt'''),
(9517,0,1,0,2,0,100,1,0,80,0,0,0,11,9081,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Shadow Lord Fel''dan - Between 0-80% Health - Cast ''Shadow Bolt Volley'' (No Repeat)'),
(9517,0,2,0,2,0,100,1,0,30,0,0,0,11,16583,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Shadow Lord Fel''dan - Between 0-30% Health - Cast ''Shadow Shock'' (No Repeat)'),

(9860,0,0,0,26,0,100,1,0,8,0,0,1,11,13583,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Salia - IC LOS - Cast ''Curse of the Deadwood'' (No Repeat)'),

(9861,0,0,0,0,0,100,0,1700,1900,19700,19900,0,11,11639,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Moora - IC - Cast ''Shadow Word: Pain'''),

(9518,0,0,0,4,0,100,0,0,0,0,0,0,11,17227,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rakaiah - On Aggro - Cast ''Curse of Weakness'''),
(9518,0,1,0,0,0,100,0,2300,2400,9600,10100,0,11,15968,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rakaiah - IC - Cast ''Lash of Pain'''),

(7093,0,0,0,4,0,100,0,0,0,0,0,0,11,21067,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vile Ooze - On Aggro - Cast ''Poison Bolt'''),
(7093,0,1,0,0,0,100,0,2600,2700,6200,7300,0,11,22595,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vile Ooze - IC - Cast ''Poison Shock'''),

(7118,0,0,0,4,0,100,0,0,0,0,0,0,11,11962,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Darkweaver - On Aggro - Cast ''Immolate'''),
(7118,0,1,0,0,0,100,0,2350,2450,7900,8150,0,11,9613,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Darkweaver - IC - Cast ''Shadow Bolt'''),

(9877,0,0,0,4,0,100,0,0,0,0,0,0,11,13578,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Xavalis - On Aggro - Cast ''Jadefire'''),
(9877,0,1,0,0,0,100,0,3500,4500,18500,19500,0,11,11962,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Prince Xavalis - IC - Cast ''Immolate'''),

(9862,0,0,0,0,0,100,0,1400,1800,7800,8400,0,11,10966,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Legionnaire - IC - Cast ''Uppercut'''),

(7114,0,0,0,0,0,100,0,2100,2200,17100,17200,0,11,11977,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Enforcer - IC - Cast ''Rend'''),

(7125,0,0,0,0,0,100,0,2400,3600,9800,11500,0,11,13321,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Hound - IC - Cast ''Mana Burn'''),

(7113,0,0,0,4,0,100,0,0,0,0,0,0,11,3639,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jaedenar Guardian - On Aggro - Cast ''Improved Blocking'''),
(7113,0,1,0,0,0,100,0,3800,4200,9600,9800,0,11,11972,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Guardian - IC - Cast ''Shield Bash'''),

(7112,0,0,0,4,0,100,0,0,0,0,0,0,11,11639,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Cultist - On Aggro - Cast ''Shadow Word: Pain'''),
(7112,0,1,0,0,0,100,0,3100,3200,8600,8900,0,11,20825,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Cultist - IC - Cast ''Shadow Bolt'''),
(7112,0,2,0,2,0,100,1,0,60,0,0,0,11,11980,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Cultist - Between 0-60% Health - Cast ''Curse of Weakness'' (No Repeat)'),

(7115,0,0,0,4,0,100,0,0,0,0,0,0,11,20832,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Adept - On Aggro - Cast ''Fire Blast'''),
(7115,0,1,0,0,0,100,0,3100,3200,8600,8700,0,11,20823,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Adept - IC - Cast ''Fireball'''),
(7115,0,2,0,2,0,100,1,0,60,0,0,0,11,14514,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jaedenar Adept - Between 0-60% Health - Cast ''Blink'' (No Repeat)'),

(7099,0,0,0,0,0,100,0,2400,2600,16200,16400,0,11,13443,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ironbeak Hunter - IC - Cast ''Rend'''),

(9454,0,0,0,0,0,100,0,2200,2400,15400,15600,0,11,13443,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Xavathras - IC - Cast ''Rend'''),
(9454,0,1,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Xavathras - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(7110,0,0,0,25,0,100,1,0,0,0,0,0,11,30991,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jadefire Shadowstalker - On Reset - Cast ''Stealth'' (No Repeat)'),
(7110,0,1,0,4,0,100,0,0,0,0,0,0,11,13578,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Shadowstalker - On Aggro - Cast ''Jadefire'''),
(7110,0,2,0,0,0,100,0,2600,3100,19800,20100,0,11,14897,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Shadowstalker - IC - Cast ''Slowing Poison'''),

(7106,0,0,0,4,0,100,0,0,0,0,0,0,11,13578,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jadefire Rogue - On Aggro - Cast ''Jadefire'''),
(7106,0,1,0,67,0,100,0,9600,10400,0,0,0,11,7159,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Rogue - Is Behind Target - Cast ''Backstab'''),

(7109,0,0,0,4,0,100,0,0,0,0,0,0,11,13578,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jadefire Felsworn - On Aggro - Cast ''Jadefire'''),
(7109,0,1,0,0,0,100,0,2400,2700,7800,8100,0,11,9613,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Felsworn - IC - Cast ''Shadow Bolt'''),
(7109,0,2,0,2,0,100,1,0,30,0,0,0,11,11443,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Felsworn - Between 0-30% Health - Cast ''Cripple'' (No Repeat)'),

(7105,0,0,0,4,0,100,0,0,0,0,0,0,11,13578,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jadefire Satyr - On Aggro - Cast ''Jadefire'''),

(9464,0,0,0,0,0,100,0,1700,1900,6800,6900,0,11,15793,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Overlord Ror - IC - Cast ''Maul'''),
(9464,0,1,0,2,0,100,1,0,60,0,0,0,11,14100,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Overlord Ror - Between 0-60% Health - Cast ''Terrifying Roar'' (No Repeat)'),

(7097,0,0,0,0,0,100,0,1900,2100,8600,9900,0,11,5708,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ironbeak Owl - IC - Cast ''Swoop'''),

(8959,0,0,0,0,0,100,0,2700,3100,24200,26500,0,11,3427,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felpaw Wolf - IC - Cast ''Infected Wound''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
