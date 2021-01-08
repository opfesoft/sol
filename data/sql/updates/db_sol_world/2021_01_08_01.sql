-- DB update 2021_01_08_00 -> 2021_01_08_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_08_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_08_00 2021_01_08_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610098506130505396'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610098506130505396');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (4011,4263,4264,2171,2186,2183,7016,4001,4002,11912,4021,4030,4016);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (4011,4263,4264,2172,2170,2171,2186,2183,7016,2175,4001,4002,11912,4021,4030,4016) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4011,0,0,0,0,0,100,0,5000,8000,12000,18000,0,11,744,32,0,1,0,0,2,0,0,0,0,0,0,0,0,'Young Pridewing - IC - Cast ''Poison'''),

(4263,0,0,0,2,0,50,1,0,30,0,0,0,11,6536,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deepmoss Hatchling - Between 0-30% Health - Cast ''Summon Deepmoss Matriarch'' (No Repeat)'),

(4264,0,0,0,1,0,100,0,5000,5000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deepmoss Matriarch - OOC - Force Despawn'),
(4264,0,1,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Deepmoss Matriarch - On Just Summoned - Attack Closest Player'),

(2172,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strider Clutchmother - On Respawn - Set Active On'),
(2172,0,1,0,0,0,100,0,7000,11000,12000,14000,0,11,7272,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strider Clutchmother - IC - Cast ''Dust Cloud'''),
(2172,0,2,0,0,0,100,0,2000,3000,15000,17000,0,11,6607,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Strider Clutchmother - IC - Cast ''Lash'''),
(2172,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strider Clutchmother - Between 0-15% Health - Flee For Assist (No Repeat)'),

(2170,0,0,0,74,0,100,0,0,40,18000,21000,40,11,1058,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Blackwood Ursa - Friendly At 40% Health - Cast ''Rejuvenation'''),

(2171,0,0,0,0,0,100,0,1000,2000,3000,3400,0,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Blackwood Shaman - IC CMC - Cast ''Lightning Bolt'''),
(2171,0,1,0,0,0,100,0,9000,14000,11000,15000,0,11,2606,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Blackwood Shaman - IC - Cast ''Shock'''),
(2171,0,2,0,74,0,100,0,0,40,16000,21000,40,11,913,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Blackwood Shaman - Friendly At 40% Health - Cast ''Healing Wave'''),

(2186,0,0,0,25,0,100,0,0,0,0,0,0,75,8876,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Carnivous the Breaker - On Respawn - Cast ''Thrash'''),
(2186,0,1,0,0,0,100,0,2000,3000,15000,20000,0,11,6016,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Carnivous the Breaker - IC - Cast ''Pierce Armor'''),

(2183,0,0,0,0,0,100,0,4000,8000,10000,12000,0,11,3248,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stormscale Warrior - IC - Cast ''Improved Blocking'''),

(7016,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lady Vespira - Within 5-30 Range - Cast ''Shoot'''),
(7016,0,1,0,0,0,100,0,2000,3000,9000,14000,0,11,11428,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lady Vespira - IC - Cast ''Knockdown'''),
(7016,0,2,0,0,0,100,0,11000,15000,14000,17000,0,11,12549,65,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lady Vespira - IC CMC - Cast ''Forked Lightning'''),

(2175,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shadowclaw - On Respawn - Set Active On'),
(2175,0,1,0,0,0,100,0,2000,3000,12000,15000,0,11,17227,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Shadowclaw - IC - Cast ''Curse of Weakness'''),

(4001,0,0,0,0,0,100,0,4000,11000,7000,15000,0,11,8139,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Windshear Tunnel Rat - IC - Cast ''Fevered Fatigue'''),

(4002,0,0,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Windshear Stonecutter - Between 0-15% Health - Flee For Assist (No Repeat)'),

(11912,0,0,0,4,0,100,0,0,0,0,0,0,11,6268,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimtotem Brute - On Aggro - Cast ''Rushing Charge'''),
(11912,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimtotem Brute - Between 0-15% Health - Flee For Assist (No Repeat)'),

(4021,0,0,0,0,0,100,0,2000,3000,5000,11000,0,11,3396,32,0,1,0,0,2,0,0,0,0,0,0,0,0,'Corrosive Sap Beast - IC - Cast ''Corrosive Poison'''),

(4030,0,0,0,0,0,100,0,2000,3000,17000,25000,0,11,6909,32,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vengeful Ancient - IC - Cast ''Curse of Thorns'''),

(4016,0,0,0,0,0,100,1,0,0,0,0,0,11,7994,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Fey Dragon - IC - Cast ''Nullify Mana'' (No Repeat)');

DELETE FROM `creature` WHERE `guid` IN (36898,36904,36907,36924,36938,36942,36943,36944,36957,36956,36958);

UPDATE `creature` SET `position_x` = 6594.56, `position_y` =  313.645, `position_z` = 28.3839 WHERE `guid` = 36643;
UPDATE `creature` SET `position_x` = 4424.85, `position_y` =  422.488, `position_z` = 56.4554 WHERE `guid` = 36794;
UPDATE `creature` SET `position_x` = 7742.69, `position_y` = -1067.14, `position_z` = 38.1206 WHERE `guid` = 36959;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
