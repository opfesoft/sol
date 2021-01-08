-- DB update 2021_01_07_02 -> 2021_01_08_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_07_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_07_02 2021_01_08_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610094675462845969'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610094675462845969');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (2657,2923,2925,2926,8211,2927,2928,2656,2655,8212,2649,2650,2651,2652,2653,2654,7767,2686,7768,8219,17235,17236,2691,2692,2693,2694,4467,4466,7996,8636,7977,4468,4469,4465,2640,2641,2642,2644,2645,2646,2647,2648,2681,7995,10802,14748);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2657,2923,2925,2926,8211,2927,2928,8210,2656,2655,8212,2649,2650,2651,2652,2653,2654,7767,2686,8218,7768,8219,17235,17236,2691,2692,2693,2694,4467,4466,7996,8636,8216,7977,4468,4469,4465,2640,2641,2642,2644,2645,8217,2646,2647,2648,2681,7995,10802,14748) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2657,0,0,0,0,0,100,0,2000,3000,15000,19000,0,11,3147,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Trained Razorbeak - IC - Cast ''Rend Flesh'''),

(2923,0,0,0,25,0,100,0,0,0,0,0,0,11,11964,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mangy Silvermane - On Reset - Cast ''Fevered Fatigue'''),

(2925,0,0,0,0,0,100,0,2000,4500,12000,13000,0,11,32919,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Silvermane Howler - IC - Cast ''Snarl'''),
(2925,0,1,0,0,0,100,0,6000,9000,18000,22000,0,11,3149,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silvermane Howler - IC - Cast ''Furious Howl'''),

(2926,0,0,0,0,0,100,0,4000,5000,17000,19000,0,11,7367,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Silvermane Stalker - IC - Cast ''Infected Bite'''),
(2926,0,1,0,25,0,100,1,0,0,0,0,0,11,6408,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silvermane Stalker - On Reset - Cast ''Faded'' (No Repeat)'),

(8211,0,0,0,9,0,100,0,0,8,15000,18000,1,11,3264,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Old Cliff Jumper - Within 0-8 Range - Cast ''Blood Howl'''),
(8211,0,1,0,0,0,100,0,2000,3000,20000,25000,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Old Cliff Jumper - IC - Cast ''Tendon Rip'''),

(2927,0,0,0,0,0,100,0,5000,9000,18000,24000,0,11,54663,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vicious Owlbeast - IC - Cast ''Fatal Bite'''),

(2928,0,0,0,0,0,100,0,2000,3000,13000,16000,0,11,3252,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Primitive Owlbeast - IC - Cast ''Shred'''),

(8210,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Razortalon - On Respawn - Set Active On'),
(8210,0,1,0,0,0,100,0,4000,5000,9000,12000,0,11,13584,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Razortalon - IC - Cast ''Strike'''),
(8210,0,2,0,0,0,100,0,2000,3000,20000,25000,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Razortalon - IC - Cast ''Tendon Rip'''),
(8210,0,3,0,0,0,100,0,6000,11000,18000,21000,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Razortalon - IC - Cast ''Rend'''),

(2656,0,0,0,0,0,100,0,4000,6000,16000,18000,0,11,6907,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jade Ooze - IC - Cast ''Diseased Slime'''),

(2655,0,0,0,0,0,100,0,4000,6000,12000,16000,0,11,9459,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Green Sludge - IC - Cast ''Corrosive Ooze'''),

(8212,0,0,0,2,0,100,1,0,80,0,0,0,11,7279,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'The Reak - Between 0-80% Health - Cast ''Black Sludge'' (No Repeat)'),
(8212,0,1,0,0,0,100,0,4000,6000,28000,32000,0,11,21062,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'The Reak - IC - Cast ''Putrid Breath'''),

(2649,0,0,0,9,0,100,0,5,30,2000,3000,1,11,10277,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Witherbark Scalper - Within 5-30 Range - Cast ''Throw'''),
(2649,0,1,0,12,0,100,1,0,20,0,0,0,11,7160,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Witherbark Scalper - Target Between 0-20% Health - Cast ''Execute'' (No Repeat)'),
(2649,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witherbark Scalper - Between 0-15% Health - Flee For Assist (No Repeat)'),

(2650,0,0,0,2,0,100,1,0,30,0,0,0,11,8599,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witherbark Zealot - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(2651,0,0,0,67,0,100,0,5000,9000,0,0,0,11,7159,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Witherbark Hideskinner - Is Behind Target - Cast ''Backstab'''),
(2651,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witherbark Hideskinner - Between 0-15% Health - Flee For Assist (No Repeat)'),

(2652,0,0,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witherbark Venomblood - Between 0-15% Health - Flee For Assist (No Repeat)'),

(2653,0,0,0,25,0,100,0,0,0,0,0,0,11,7165,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witherbark Sadist - On Reset - Cast ''Battle Stance'''),
(2653,0,1,0,0,0,100,0,2000,3000,6000,9000,0,11,25710,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Witherbark Sadist - IC - Cast ''Heroic Strike'''),
(2653,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witherbark Sadist - Between 0-15% Health - Flee For Assist (No Repeat)'),

(2654,0,0,0,0,0,100,0,0,0,3400,4800,0,11,20825,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Witherbark Caller - IC CMC - Cast ''Shadow Bolt'''),
(2654,0,1,0,4,0,100,0,0,0,0,0,0,11,11017,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witherbark Caller - On Aggro - Cast ''Summon Witherbark Felhunter'''),
(2654,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witherbark Caller - Between 0-15% Health - Flee For Assist (No Repeat)'),

(7767,0,0,0,0,0,100,0,2000,3000,8000,14000,0,11,2691,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Witherbark Felhunter - IC - Cast ''Mana Burn'''),
(7767,0,1,0,1,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witherbark Felhunter - OOC - Force Despawn'),

(2686,0,0,0,6,0,100,0,0,0,0,0,0,11,11018,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witherbark Broodguard - On Death - Cast ''Summon Witherbark Bloodlings'''),

(7768,0,0,0,1,0,100,0,5000,5000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witherbark Bloodling - OOC - Force Despawn'),
(7768,0,1,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Witherbark Bloodling - On Just Summoned - Attack Closest Player'),

(8218,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witherheart the Stalker - On Respawn - Set Active On'),
(8218,0,1,0,25,0,100,0,0,0,0,0,0,11,22766,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witherheart the Stalker - On Reset - Cast ''Sneak'''),
(8218,0,2,0,67,0,100,0,5000,9000,0,0,0,11,7159,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Witherheart the Stalker - On Behind Target - Cast ''Backstab'''),

(8219,0,0,0,9,0,100,0,0,30,9000,14000,1,11,17228,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Zul''arek Hatefowler - Within 0-30 Range - Cast ''Shadow Bolt Volley'''),

(17235,0,0,0,0,0,100,0,15000,25000,30000,45000,0,11,5605,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Mai''jin - IC - Cast ''Healing Ward'''),
(17235,0,1,0,0,0,100,0,6000,8000,25000,28000,0,11,8190,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witch Doctor Mai''jin - IC - Cast ''Magma Totem'''),

(17236,0,0,0,6,0,100,0,0,0,0,0,0,11,11018,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tcha''kaz - On Death - Cast ''Summon Witherbark Bloodlings'''),

(2691,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Highvale Outrunner - Within 5-30 Range - Cast ''Shoot'''),
(2691,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highvale Outrunner - Between 0-15% Health - Flee For Assist (No Repeat)'),

(2692,0,0,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highvale Scout - Between 0-15% Health - Flee For Assist (No Repeat)'),

(2693,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Highvale Marksman - Within 5-30 Range - Cast ''Shoot'''),
(2693,0,1,0,9,0,100,0,5,30,9000,13000,1,11,14443,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Highvale Marksman - Within 5-30 Range - Cast ''Multi-Shot'''),
(2693,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highvale Marksman - Between 0-15% Health - Flee For Assist (No Repeat)'),

(2694,0,0,0,0,0,100,0,2000,3000,30000,35000,0,11,6950,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Highvale Ranger - IC - Cast ''Faerie Fire'''),

(4467,0,0,0,0,0,100,0,0,0,3400,4700,0,11,20824,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vilebranch Soothsayer - IC - Cast ''Lightning Bolt'''),
(4467,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Soothsayer - Between 0-15% Health - Flee For Assist (No Repeat)'),
(4467,0,2,0,74,0,100,0,0,40,20000,30000,40,11,10395,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Vilebranch Soothsayer - Friendly At 40% Health - Cast ''Healing Wave'''),

(4466,0,0,0,12,0,100,1,0,20,0,0,0,11,7160,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vilebranch Scalper - Target Between 0-20% Health - Cast ''Execute'' (No Repeat)'),
(4466,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Scalper - Between 0-15% Health - Flee For Assist (No Repeat)'),

(7996,0,0,0,0,0,100,0,0,0,3400,4800,0,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Qiaga the Keeper - IC CMC - Cast ''Shadow Bolt'''),
(7996,0,1,0,0,0,100,0,4200,7700,7100,16200,0,11,11639,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Qiaga the Keeper - IC - Cast ''Shadow Word: Pain'''),
(7996,0,2,0,74,0,100,0,0,40,15000,19000,40,11,11640,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Qiaga the Keeper - Friendly At 40% Health - Cast ''Renew'''),
(7996,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Qiaga the Keeperer - Between 0-15% Health - Flee For Assist (No Repeat)'),

(8636,0,0,0,0,0,100,0,0,0,3400,4800,0,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Morta''gya the Keeper - IC CMC - Cast ''Shadow Bolt'''),
(8636,0,1,0,0,0,100,0,4200,7700,7100,16200,0,11,11639,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Morta''gya the Keeper - IC - Cast ''Shadow Word: Pain'''),
(8636,0,2,0,14,0,100,0,1000,40,15000,19000,0,11,11640,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Morta''gya the Keeper - Friendly At 40% Health - Cast ''Renew'''),
(8636,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Morta''gya the Keeper - Between 0-15% Health - Flee For Assist (No Repeat)'),

(8216,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Retherokk the Berserker - On Respawn - Set Active On'),
(8216,0,1,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Retherokk the Berserker - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),
(8216,0,2,0,0,0,100,0,2000,3000,8000,9000,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Retherokk the Berserker - IC - Cast ''Thrash'''),

(7977,0,0,0,0,0,100,0,2000,3000,45000,45000,0,11,6016,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Gammerita - IC - Cast ''Pierce Armor'''),

(4468,0,0,0,0,0,100,0,2000,3000,15000,29000,0,11,6814,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Jade Sludge - IC - Cast ''Sludge Toxin'''),

(4469,0,0,0,2,0,100,1,0,80,0,0,0,11,8245,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Emerald Ooze - Between 0-80% Health - Cast ''Corrosive Acid'' (No Repeat)'),

(4465,0,0,0,0,0,100,0,2000,3000,5000,9000,0,11,11976,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vilebranch Warrior - IC - Cast ''Strike'''),
(4465,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Warrior - Between 0-15% Health - Flee For Assist (No Repeat)'),

(2640,0,0,0,0,0,100,0,0,0,3400,4800,0,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vilebranch Witch Doctor - IC CMC - Cast ''Shadow Bolt'''),
(2640,0,1,0,74,0,100,0,0,40,13000,17000,40,11,8005,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Vilebranch Witch Doctor - Friendly At 40% Health - Cast ''Healing Wave'''),
(2640,0,2,0,0,0,100,1,9000,13000,22000,28000,0,11,18503,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vilebranch Witch Doctor - IC - Cast ''Hex'''),
(2640,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Witch Doctor - Between 0-15% Health - Flee For Assist (No Repeat)'),

(2641,0,0,0,9,0,100,0,5,30,2000,3000,1,11,10277,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vilebranch Headhunter - Within 5-30 Range - Cast ''Throw'''),
(2641,0,1,0,0,0,100,0,2000,3000,15000,18000,0,11,7357,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vilebranch Headhunter - IC - Cast ''Poisonous Stab'''),
(2641,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Headhunter - Between 0-15% Health - Flee For Assist (No Repeat)'),

(2642,0,0,0,0,0,100,0,0,0,3400,4800,0,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vilebranch Shadowcaster - IC CMC - Cast ''Shadow Bolt'''),
(2642,0,1,0,1,0,100,1,1000,1000,0,0,0,11,12746,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Shadowcaster - Out of Combat - Cast ''Summon Voidwalker'' (No Repeat)'),
(2642,0,2,0,0,0,100,0,2500,10000,35000,40000,0,11,7289,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vilebranch Shadowcaster - IC - Cast ''Shrink'''),
(2642,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Shadowcaster - Between 0-15% Health - Flee For Assist (No Repeat)'),

(2644,0,0,0,67,0,100,0,5000,9000,0,0,0,11,7159,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vilebranch Hideskinner - On Behind Target - Cast ''Backstab'''),
(2644,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Hideskinnerr - Between 0-15% Health - Flee For Assist (No Repeat)'),

(2645,0,0,0,9,0,100,0,5,30,2000,3000,1,11,15547,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vilebranch Shadow Hunter - Within 5-30 Range - Cast ''Shoot'''),
(2645,0,1,0,0,0,100,0,2000,3000,21000,26000,0,11,14032,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vilebranch Shadow Hunter - IC - Cast ''Shadow Word: Pain'''),
(2645,0,2,0,0,0,100,0,4000,9000,15000,21000,0,11,9657,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Shadow Hunter - IC - Cast ''Shadow Shell'''),
(2645,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Shadow Hunter - Between 0-15% Health - Flee For Assist (No Repeat)'),

(8217,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mith''rethis the Enchanter - On Respawn - Set Active On'),
(8217,0,1,0,0,0,100,0,5000,9000,12000,16000,0,11,11436,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mith''rethis the Enchanter - IC - Cast ''Slow'''),
(8217,0,2,0,0,0,100,0,2000,3000,24000,29000,0,11,15654,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mith''rethis the Enchanter - IC - Cast ''Shadow Word: Pain'''),
(8217,0,3,0,0,0,100,0,1000,5000,21000,27000,0,11,3443,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mith''rethis the Enchanter - IC - Cast ''Enchanted Quickness'''),

(2646,0,0,0,9,0,100,0,0,5,7000,15000,1,11,11015,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vilebranch Blood Drinker - Within 0-5 Range - Cast ''Blood Leech'''),
(2646,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Blood Drinker - Between 0-15% Health - Flee For Assist (No Repeat)'),

(2647,0,0,0,0,0,100,0,2000,3000,8000,12000,0,11,11016,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vilebranch Soul Eater - IC - Cast ''Soul Bite'''),
(2647,0,1,0,74,0,100,0,0,40,12000,15000,10,11,7154,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Vilebranch Soul Eater - Friendly At 40% Health - Cast ''Dark Offering'''),
(2647,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Soul Eater - Between 0-15% Health - Flee For Assist (No Repeat)'),

(2648,0,0,0,0,0,100,0,4000,7000,8000,11000,0,11,8242,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vilebranch Aman''zasi Guard - IC - Cast ''Shield Slam'''),
(2648,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Aman''zasi Guard - Between 0-15% Health - Flee For Assist (No Repeat)'),

(2681,0,0,0,0,0,100,0,8000,12000,15000,20000,0,11,3391,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Raiding Wolf - IC - Cast ''Thrash'''),

(7995,0,0,0,0,0,100,0,2000,3000,9000,12000,0,11,11639,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vile Priestess Hexx - IC - Cast ''Shadow Word: Pain'''),
(7995,0,1,0,0,0,100,0,7000,12000,18000,25000,0,11,11641,1,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vile Priestess Hexx - IC - Cast ''Hex'''),
(7995,0,2,0,74,0,100,0,0,40,12000,15000,40,11,11642,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Vile Priestess Hexx - Friendly At 40% Health - Cast ''Heal'''),
(7995,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vile Priestess Hexx - Between 0-15% Health - Flee For Assist (No Repeat)'),

(10802,0,0,0,0,0,100,0,2000,3000,21000,25000,0,11,11639,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Hitah''ya the Keeper - IC - Cast ''Shadow Word: Pain'''),
(10802,0,1,0,0,0,100,0,0,0,3400,4800,0,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hitah''ya the Keeper - IC CMC - Cast ''Shadow Bolt'''),
(10802,0,2,0,74,0,100,0,0,40,12000,18000,40,11,11640,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Hitah''ya the Keeper - Friendly At 40% Health - Cast ''Renew'''),
(10802,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hitah''ya the Keeper - Between 0-15% Health - Flee For Assist (No Repeat)'),

(14748,0,0,0,12,0,100,1,0,20,0,0,0,11,7160,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vilebranch Kidnapper - Target Between 0-20% Health - Cast ''Execute'' (No Repeat)'),
(14748,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Kidnapper - Between 0-15% Health - Flee For Assist (No Repeat)'),
(14748,0,2,0,4,0,100,1,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Kidnapper - On Aggro - Say Line 0');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
