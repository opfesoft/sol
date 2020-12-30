-- DB update 2020_12_30_04 -> 2020_12_30_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_30_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_30_04 2020_12_30_05 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609325006711778100'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609325006711778100');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (744,18690,18682,18677,18679,9462,7149,8960,9517,9860,9861,9862,7114,7125,7099,9454,9464,7097,8959) AND `source_type` = 0 AND `id` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (18694,18692,18689,18681,10648,7111,8961,7101,9518,7118,9877,7113,7112,7115,7109) AND `source_type` = 0 AND `id` = 1;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 7110 AND `source_type` = 0 AND `id` = 2;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 17144 AND `source_type` = 0 AND `id` IN (0,1);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (7108,7107) AND `source_type` = 0 AND `id` IN (1,2);
DELETE FROM `smart_scripts` WHERE `entryorguid` = 1057 AND `source_type` = 0 AND `id` IN (2,3);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(744,0,0,0,0,0,100,0,2500,2500,8500,8500,0,11,15496,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Green Scalebane - IC - Cast ''Cleave'''),

(1057,0,2,0,0,0,100,1,0,0,0,0,0,11,6205,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Dragonmaw Bonewarder - IC - Cast ''Curse of Weakness'' (No Repeat)'),
(1057,0,3,0,0,0,100,0,0,0,17000,19000,0,11,707,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Dragonmaw Bonewarder - IC - Cast ''Immolate'''),

(18694,0,1,0,0,0,100,0,2000,3000,23000,24000,0,11,36414,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Collidus the Warp-Watcher - IC - Cast ''Focused Bursts'''),

(18692,0,1,0,0,0,100,0,2000,3000,7500,9000,0,11,9573,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Hemathion - IC - Cast ''Flame Breath'''),

(18690,0,0,0,0,0,100,0,1500,2000,6000,8500,0,11,35238,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Morcrush - IC - Cast ''War Stomp'''),

(18682,0,0,0,0,0,100,0,2500,3000,7500,9000,0,11,35238,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Bog Lurker - IC - Cast ''War Stomp'''),

(18681,0,1,0,0,0,100,0,0,0,14500,17500,0,11,20297,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Coilfang Emissary - IC - Cast ''Frostbolt'''),

(18689,0,1,0,0,0,100,0,4500,5000,14500,19000,0,11,39214,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Crippler - IC - Cast ''Pierce Armor'''),

(17144,0,0,0,0,0,100,1,0,0,0,0,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Goretooth - IC - Cast ''Tendon Rip'' (No Repeat)'),
(17144,0,1,0,0,0,100,0,1900,2200,17400,18300,0,11,39215,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Goretooth - IC - Cast ''Gushing Wound'''),

(18677,0,0,0,0,0,100,0,3000,3200,7500,8400,0,11,38875,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mekthorg the Wild - IC - Cast ''Pike Vault'''),

(18679,0,0,0,0,0,100,0,1700,2400,15200,16300,0,11,9080,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vorakem Doomspeaker - IC - Cast ''Hamstring'''),

(10648,0,1,0,0,0,100,0,1400,1900,6500,7200,0,11,15496,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Xavaric - IC - Cast ''Cleave'''),

(7111,0,1,0,0,0,100,0,0,0,6400,6700,0,11,20823,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Hellcaller - IC - Cast ''Fireball'''),

(7108,0,1,0,0,0,100,0,1100,1200,16100,16200,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Betrayer - IC - Cast ''Rend'''),
(7108,0,2,0,0,0,100,0,4500,4900,10700,11200,0,11,15496,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Betrayer - IC - Cast ''Cleave'''),

(7107,0,1,0,0,0,100,1,1100,1200,0,0,0,11,13338,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Trickster - IC - Cast ''Curse of Tongues'' (No Repeat)'),
(7107,0,2,0,0,0,100,1,5200,6400,0,0,0,11,11980,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Trickster - IC - Cast ''Curse of Weakness'' (No Repeat)'),

(9462,0,0,0,0,0,100,1,0,0,0,0,0,11,13583,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Chieftain Bloodmaw - IC - Cast ''Curse of the Deadwood'' (No Repeat)'),

(8961,0,1,0,0,0,100,1,6500,6600,0,0,0,11,17230,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Felpaw Ravager - IC - Cast ''Infected Wound'' (No Repeat)'),

(7101,0,1,0,0,0,100,0,5900,6000,12800,12900,0,11,13444,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Warpwood Shredder - IC - Cast ''Sunder Armor'''),

(7149,0,0,0,0,0,100,0,1900,2000,10100,11200,0,11,5337,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Withered Protector - IC - Cast ''Wither Strike'''),

(8960,0,0,0,0,0,100,0,2100,2200,10100,10200,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Felpaw Scavenger - IC - Cast ''Tendon Rip'''),

(9517,0,0,0,0,0,100,0,0,0,7600,7900,0,11,20825,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Shadow Lord Fel''dan - IC - Cast ''Shadow Bolt'''),

(9860,0,0,0,0,0,100,1,0,0,0,0,0,11,13583,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Salia - IC - Cast ''Curse of the Deadwood'' (No Repeat)'),

(9861,0,0,0,0,0,100,0,1700,1900,19700,19900,0,11,11639,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Moora - IC - Cast ''Shadow Word: Pain'''),

(9518,0,1,0,0,0,100,0,2300,2400,9600,10100,0,11,15968,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Rakaiah - IC - Cast ''Lash of Pain'''),

(7118,0,1,0,0,0,100,0,0,0,7900,8150,0,11,9613,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Darkweaver - IC - Cast ''Shadow Bolt'''),

(9877,0,1,0,0,0,100,0,0,0,18500,19500,0,11,11962,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Prince Xavalis - IC - Cast ''Immolate'''),

(9862,0,0,0,0,0,100,0,1400,1800,7800,8400,0,11,10966,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Legionnaire - IC - Cast ''Uppercut'''),

(7114,0,0,0,0,0,100,0,2100,2200,17100,17200,0,11,11977,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Enforcer - IC - Cast ''Rend'''),

(7125,0,0,0,0,0,100,0,2400,3600,9800,11500,0,11,13321,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Hound - IC - Cast ''Mana Burn'''),

(7113,0,1,0,0,0,100,0,3800,4200,9600,9800,0,11,11972,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Guardian - IC - Cast ''Shield Bash'''),

(7112,0,1,0,0,0,100,0,0,0,8600,8900,0,11,20825,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Cultist - IC - Cast ''Shadow Bolt'''),

(7115,0,1,0,0,0,100,0,0,0,8600,8700,0,11,20823,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jaedenar Adept - IC - Cast ''Fireball'''),

(7099,0,0,0,0,0,100,0,2400,2600,16200,16400,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ironbeak Hunter - IC - Cast ''Rend'''),

(9454,0,0,0,0,0,100,0,2200,2400,15400,15600,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Xavathras - IC - Cast ''Rend'''),

(7110,0,2,0,0,0,100,0,2600,3100,19800,20100,0,11,14897,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Shadowstalker - IC - Cast ''Slowing Poison'''),

(7109,0,1,0,0,0,100,0,0,0,7800,8100,0,11,9613,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jadefire Felsworn - IC - Cast ''Shadow Bolt'''),

(9464,0,0,0,0,0,100,0,1700,1900,6800,6900,0,11,15793,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Overlord Ror - IC - Cast ''Maul'''),

(7097,0,0,0,0,0,100,0,1900,2100,8600,9900,0,11,5708,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ironbeak Owl - IC - Cast ''Swoop'''),

(8959,0,0,0,0,0,100,0,2700,3100,24200,26500,0,11,3427,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Felpaw Wolf - IC - Cast ''Infected Wound''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
