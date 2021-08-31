-- DB update 2021_08_31_03 -> 2021_08_31_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_31_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_31_03 2021_08_31_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1630445349570754512'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1630445349570754512');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (32284,32482,32280,32299,32479,31137,31747,32492,32505,32502,32278,30746,30689,31815,31812,31813,31255,32267,31843);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (32284,32482,32280,32299,32479,31137,31747,32492,32505,32502,32278,30746,30597,30689,31815,31812,31813,31255,32267,31843);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` = 2 AND `entryorguid` = 32149;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` = 1 AND `entryorguid` = 30921;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` = 1 AND `entryorguid` = 30949;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(32284,0,0,0,0,0,100,0,0,0,2500,3000,0,11,60814,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scourge Soulbinder - IC CMC - Cast ''Frost Blast'''),
(32284,0,1,0,0,0,100,0,9000,14000,14000,20000,0,11,22744,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scourge Soulbinder - IC - Cast ''Chains of Ice'''),
(32284,0,2,0,0,0,100,0,12600,25200,16700,32300,0,11,17620,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scourge Soulbinder - IC - Cast ''Drain Life'''),

(32482,0,0,0,0,0,100,0,10000,15000,10000,15000,0,11,28405,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Pustulent Colossus - IC - Cast ''Knockback'''),
(32482,0,1,0,0,0,100,0,5000,10000,10000,15000,0,11,63546,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pustulent Colossus - IC - Cast ''Stomp'''),

(32280,0,0,0,0,0,100,0,10000,10000,20000,25000,0,11,54378,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Corp''rethar Guardian - IC - Cast ''Mortal Wound'''),
(32280,0,1,0,0,0,100,0,5000,5000,20000,25000,0,11,60927,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Corp''rethar Guardian - IC - Cast ''Infected Bite'''),

(32299,0,0,0,0,0,100,0,7000,9000,9000,11000,0,11,32736,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Bone Sentinel - IC - Cast ''Mortal Strike'''),

(32479,0,0,0,0,0,100,0,7000,9000,9000,11000,0,11,32736,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Bone Guard - IC - Cast ''Mortal Strike'''),

(31137,0,0,0,0,0,100,0,4000,7000,10000,20000,0,11,60667,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Frostbrood Skytalon - IC - Cast ''Frost Breath'''),

(31747,0,0,0,0,0,100,0,2000,6000,12000,16000,0,11,25645,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Necrotic Webspinner - IC - Cast ''Poison'''),
(31747,0,1,0,0,0,100,0,1000,3000,10000,15000,0,11,745,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Necrotic Webspinner - IC - Cast ''Web'''),

(32492,0,0,0,0,0,100,0,4000,7000,10000,20000,0,11,60667,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Frostbrood Matriarch - IC - Cast ''Frost Breath'''),

(32505,0,0,0,4,0,100,0,0,0,0,0,0,11,36788,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vargul Wanderer - On Aggro - Cast ''Diminish Soul'''),

(32502,0,0,0,0,0,100,0,2000,5000,7000,11000,0,11,60873,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ravaged Ghoul - IC - Cast ''Festering Bite'''),
(32502,0,1,0,0,0,100,0,6300,15200,16700,22300,0,11,60872,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ravaged Ghoul - IC - Cast ''Ravenous Claw'''),

(32278,0,0,0,0,0,100,0,9250,12500,16500,23000,0,11,18099,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harbinger of Horror - IC - Cast ''Chill Nova'''),
(32278,0,1,0,0,0,100,0,4300,7200,11700,13500,0,11,60924,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Harbinger of Horror - IC - Cast ''Lich Slap'''),
(32278,0,2,0,1,0,100,0,1000,1000,1000,1000,0,11,18100,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harbinger of Horror - OOC - Cast ''Frost Armor'''),
(32278,0,3,0,0,0,100,0,2000,8000,2000,8000,0,11,61747,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Harbinger of Horror - IC - Cast ''Frostbolt'''),
(32278,0,4,0,0,0,100,0,7500,12500,9500,17250,0,11,12096,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Harbinger of Horror - IC - Cast ''Fear'''),

(30746,0,0,0,0,0,100,0,9250,12500,16500,23000,0,11,11831,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Master Summoner Zarod - IC - Cast ''Frost Nova'''),
(30746,0,1,0,0,0,100,0,5300,9200,11700,13500,0,11,28873,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Master Summoner Zarod - IC - Cast ''Lich Slap'''),
(30746,0,2,0,0,0,100,0,2000,5000,2000,5000,0,11,9672,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Master Summoner Zarod - IC - Cast ''Frostbolt'''),

(30597,0,0,0,0,0,100,0,0,0,5000,9000,0,11,60876,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Spiked Ghoul - IC - Cast ''Jagged Spike'''),
(30597,0,1,0,0,0,100,0,2000,3000,5000,7000,0,11,54185,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Spiked Ghoul - IC - Cast ''Claw Slash'''),

(30689,0,0,0,0,0,100,0,4250,7750,9500,13250,0,11,15496,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Chained Abomination - IC - Cast ''Cleave'''),
(30689,0,1,0,0,0,100,0,2500,5000,2500,5000,0,11,50335,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Chained Abomination - IC - Cast ''Scourge Hook'''),

(31815,0,0,0,0,0,100,0,3500,5750,7500,9250,0,11,36405,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bone Giant - IC - Cast ''Stomp'''),

(31812,0,0,0,0,0,100,0,2500,2500,120000,120000,0,11,15716,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Decomposed Ghoul - IC - Cast ''Enrage'''),
(31812,0,1,0,0,0,100,0,5500,7200,11750,17250,0,11,12097,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Decomposed Ghoul - IC - Cast ''Pierce Armor'''),

(31813,0,0,0,0,0,100,0,1000,2000,3000,5000,0,11,20297,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Frostskull Magus - IC - Cast ''Frostbolt'''),

(32149,0,2,0,0,0,100,0,3000,5200,9200,11500,0,11,11976,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Fallen Hero''s Spirit - IC - Cast ''Strike'''),

(31255,0,0,0,0,0,100,0,5200,9500,11750,16250,0,11,60960,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Saronite Shaper - IC - Cast ''War Stomp'''),

(30921,0,1,0,0,0,100,0,3200,7500,9750,13250,0,11,46202,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Skeletal Runesmith - IC - Cast ''Pierce Armor'''),

(32267,0,0,0,0,0,100,0,3200,5500,7750,13250,0,11,48374,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Animated Laborer - IC - Cast ''Puncture Wound'''),

(30949,0,1,0,0,0,100,0,3200,5500,7750,13250,0,11,48374,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Risen Laborer - IC - Cast ''Puncture Wound'''),

(31843,0,0,0,0,0,100,0,3200,5500,7750,13250,0,11,48374,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Reanimated Miner - IC - Cast ''Puncture Wound''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
