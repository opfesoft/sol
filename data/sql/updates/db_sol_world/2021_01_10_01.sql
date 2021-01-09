-- DB update 2021_01_10_00 -> 2021_01_10_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_10_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_10_00 2021_01_10_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610236057228199631'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610236057228199631');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (9318,14621,8444,5843,8283,5833,5856,5857,5854,5852,5855,5858,8279);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (9318,14621,8444,5843,8283,5833,5856,8280,5857,5854,5852,5855,5858,8278,8279) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(9318,0,0,0,0,0,100,1,0,0,0,0,0,11,9275,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Incendosaur - IC - Cast ''Immolate'' (No Repeat)'),
(9318,0,1,0,0,0,100,0,2700,4300,9700,12300,0,11,11985,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Incendosaur - IC - Cast ''Fireball'''),

(14621,0,0,0,0,0,100,1,0,0,0,0,0,11,11639,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Overseer Maltorius - IC - Cast ''Shadow Word: Pain'' (No Repeat)'),
(14621,0,1,0,2,0,100,1,0,60,0,0,0,11,11974,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Overseer Maltorius - Between 0-60% Health - Cast ''Power Word: Shield'' (No Repeat)'),
(14621,0,2,0,0,0,100,0,0,0,9700,13100,0,11,9613,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Overseer Maltorius - IC - Cast ''Shadow Bolt'''),
(14621,0,3,0,2,0,100,1,0,30,0,0,0,11,13323,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Overseer Maltorius - Between 0-30% Health - Cast ''Polymorph'' (No Repeat)'),

(8444,0,0,0,0,0,100,0,0,0,9600,10400,0,11,9053,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Trade Master Kovic - IC - Cast ''Fireball'''),

(5843,0,0,0,0,0,100,0,2900,4700,9900,13700,0,11,11971,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Slave Worker - IC - Cast ''Sunder Armor'''),

(8283,0,0,0,0,0,100,1,0,0,0,0,0,11,6533,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Slave Master Blackheart - IC - Cast ''Net'' (No Repeat)'),
(8283,0,1,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Slave Master Blackheart - Within 5-30 Range - Cast ''Shoot'''),

(5833,0,0,0,4,0,100,0,0,0,0,0,0,11,15595,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Margol the Rager - On Aggro - Cast ''Force of Will'''),
(5833,0,1,0,0,0,100,0,2700,3100,8700,10100,0,11,15549,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Margol the Rager - IC - Cast ''Chained Bolt'''),
(5833,0,2,0,2,0,100,1,0,40,0,0,0,11,8147,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Margol the Rager - Between 0-40% Health - Cast ''Thunderclap'' (No Repeat)'),

(5856,0,0,0,0,0,100,1,0,0,0,0,0,11,745,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Glassweb Spider - IC - Cast ''Web'' (No Repeat)'),
(5856,0,1,0,0,0,100,0,3100,3700,15100,15700,0,11,6751,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Glassweb Spider - IC - Cast ''Weak Poison'''),
(5856,0,2,0,2,0,100,1,0,20,0,0,0,11,744,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Glassweb Spider - Between 0-20% Health - Cast ''Poison'' (No Repeat)'),

(8280,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shleipnarr - On Respawn - Set Active On'),
(8280,0,1,0,0,0,100,0,2700,4200,9700,11200,0,11,13321,2,0,1,0,0,2,0,0,0,0,0,0,0,0,'Shleipnarr - IC - Cast ''Mana Burn'''),
(8280,0,2,0,2,0,100,1,0,30,0,0,0,11,7399,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Shleipnarr - Between 0-30% Health - Cast ''Terrify'' (No Repeat)'),

(5857,0,0,0,0,0,100,1,0,0,0,0,0,11,4167,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Searing Lava Spider - IC - Cast ''Web'' (No Repeat)'),

(5854,0,0,0,0,0,100,0,2900,3700,9700,11900,0,11,5568,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heavy War Golem - IC - Cast ''Trample'''),
(5854,0,1,0,2,0,100,1,0,30,0,0,0,11,12612,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Heavy War Golem - Between 0-30% Health - Cast ''Stomp'' (No Repeat)'),

(5852,0,0,0,2,0,100,1,0,80,0,0,0,11,10733,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Inferno Elemental - Between 0-80% Health - Cast ''Flame Spray'' (No Repeat)'),

(5855,0,0,0,2,0,100,1,0,80,0,0,0,11,11970,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magma Elemental - Between 0-80% Health - Cast ''Fire Nova'' (No Repeat)'),

(5858,0,0,0,0,0,100,0,2700,3400,9700,11400,0,11,11985,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Greater Lava Spider - IC - Cast ''Fireball'''),

(8278,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Smoldar - On Respawn - Set Active On'),
(8278,0,1,0,0,0,100,0,2600,3100,17600,18100,0,11,5213,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Smoldar - IC - Cast ''Molten Metal'''),

(8279,0,0,0,2,0,100,1,0,60,0,0,0,11,9576,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Faulty War Golem - Between 0-60% Health - Cast ''Lock Down'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
