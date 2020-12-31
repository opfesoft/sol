-- DB update 2020_12_31_01 -> 2020_12_31_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_31_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_31_01 2020_12_31_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609410955047470689'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609410955047470689');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (4388,16072,15591,4370,4364,4366,4371,4374,23679,23590,23591,23589,4397,4361,4362,23841,4385,4377,4346,4414,4834,4387,4347,23881,23594,4389,4390,4401,4404,23687,4324,5057,4348);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (4388,16072,15591,4370,4364,4366,4371,4374,23679,23590,23591,23589,4397,4361,4362,23841,4385,4377,4346,4414,4834,4387,4347,23881,23594,4389,4390,4401,4404,23687,4324,5057,4348) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4388,0,0,0,0,0,100,0,2400,3600,9800,12400,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Young Murk Thresher - In Combat - Cast ''Thrash'''),

(16072,0,0,0,0,0,100,0,2100,2300,18100,18300,0,11,16509,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Tidelord Rrurgaz - In Combat - Cast ''Rend'''),
(16072,0,1,0,0,0,100,1,5000,7000,0,0,0,11,16244,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tidelord Rrurgaz - In Combat - Cast ''Demoralizing Shout'' (No Repeat)'),
(16072,0,2,0,2,0,100,1,0,60,0,0,0,11,15588,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tidelord Rrurgaz - Between 0-60% Health - Cast ''Thunderclap'' (No Repeat)'),
(16072,0,3,0,2,0,100,1,0,25,0,0,0,11,17207,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tidelord Rrurgaz - Between 0-25% Health - Cast ''Whirlwind'' (No Repeat)'),

(15591,0,0,0,0,0,100,0,2400,3200,12900,14600,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Minion of Weavil - In Combat - Cast ''Thrash'''),

(4370,0,0,0,0,0,100,1,0,0,0,0,0,11,15499,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Strashaz Sorceress - IC - Cast ''Frost Shock'' (No Repeat)'),
(4370,0,1,0,0,0,100,0,0,0,7700,8900,0,11,15043,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Strashaz Sorceress - In Combat - Cast ''Frostbolt'''),
(4370,0,2,0,2,0,100,1,0,60,0,0,0,11,15532,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strashaz Sorceress - Between 0-60% Health - Cast ''Frost Nova'' (No Repeat)'),

(4364,0,0,0,0,0,100,1,2500,3000,0,0,0,11,9080,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Strashaz Warrior - In Combat - Cast ''Hamstring'' (No Repeat)'),
(4364,0,1,0,0,0,100,0,6800,9900,17800,20400,0,11,16856,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Strashaz Warrior - In Combat - Cast ''Mortal Strike'''),

(4366,0,0,0,0,0,100,1,2500,3000,0,0,0,11,16509,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Strashaz Serpent Guard - In Combat - Cast ''Rend'' (No Repeat)'),
(4366,0,1,0,0,0,100,0,5400,6200,10500,13600,0,11,12057,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Strashaz Serpent Guard - In Combat - Cast ''Strike'''),
(4366,0,2,0,2,0,100,1,0,25,0,0,0,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Strashaz Serpent Guard - Between 0-25% Health - Cast ''Disarm'' (No Repeat)'),

(4371,0,0,0,0,0,100,1,0,0,0,0,0,11,15654,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Strashaz Siren - IC - Cast ''Shadow Word: Pain'' (No Repeat)'),
(4371,0,1,0,0,0,100,0,2300,2600,6700,9700,0,11,15587,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Strashaz Siren - In Combat - Cast ''Mind Blast'''),

(4374,0,0,0,0,0,100,1,2500,3000,0,0,0,11,16128,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Strashaz Hydra - In Combat - Cast ''Infected Bite'' (No Repeat)'),
(4374,0,1,0,0,0,100,0,6200,7400,13400,16800,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strashaz Hydra - In Combat - Cast ''Thrash'''),

(23679,0,0,0,25,0,100,0,0,0,0,0,0,11,43124,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Garn Mathers - On Reset - Cast ''Lifesteal'''),

(23590,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12544,34,0,0,0,0,1,0,0,0,0,0,0,0,0,'Defias Conjuror - OOC - Cast ''Frost Armor'''),
(23590,0,1,0,0,0,100,0,0,0,7900,8900,0,11,9053,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Defias Conjuror - In Combat - Cast ''Fireball'''),

(23591,0,0,0,0,0,100,1,0,0,0,0,0,11,43107,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Defias Diver - IC - Cast ''Spear Throw'' (No Repeat)'),

(23589,0,0,0,0,0,100,1,0,0,0,0,0,11,38557,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Defias Rummager - IC - Cast ''Throw'' (No Repeat)'),

(4397,0,0,0,25,0,100,0,0,0,0,0,0,11,9464,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mudrock Spikeshell - On Reset - Cast ''Barbs'''),

(4361,0,0,0,0,0,100,1,0,0,0,0,0,11,6278,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mirefin Muckdweller - IC - Cast ''Creeping Mold'' (No Repeat)'),
(4361,0,1,0,2,0,100,1,0,60,0,0,0,11,9462,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mirefin Muckdweller - Between 0-60% Health - Cast ''Mirefin Fungus'' (No Repeat)'),

(4362,0,0,0,0,0,100,0,2100,3100,8100,9100,0,11,37988,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mirefin Coastrunner - In Combat - Cast ''Ancient Fire'''),

(23841,0,0,0,0,0,100,0,2100,2400,17100,17400,0,11,12054,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Razorspine - In Combat - Cast ''Rend'''),

(4385,0,0,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Withervine Rager - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(4377,0,0,0,1,0,100,0,30000,30000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darkmist Hatchling - OOC - Force Despawn'),

(4346,0,0,0,0,0,100,0,2100,2600,12100,12600,0,11,43132,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Noxious Flayer - In Combat - Cast ''Poison Burst'''),

(4414,0,0,0,0,0,100,1,0,0,0,0,0,11,7951,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Darkfang Venomspitter - IC - Cast ''Toxic Spit'' (No Repeat)'),

(4834,0,0,0,25,0,100,0,0,0,0,0,0,11,22766,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Infiltrator - On Reset - Cast ''Sneak'''),

(4387,0,0,0,2,0,100,1,0,60,0,0,0,11,5337,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Withervine Mire Beast - Between 0-60% Health - Cast ''Wither Strike'' (No Repeat)'),

(4347,0,0,0,0,0,100,0,2100,2300,32100,32300,0,11,744,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Noxious Reaver - In Combat - Cast ''Poison'''),
(4347,0,1,0,2,0,100,1,0,60,0,0,0,11,5708,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Noxious Reaver - Between 0-60% Health - Cast ''Swoop'' (No Repeat)'),

(23881,0,0,0,25,0,100,0,0,0,0,0,0,11,10022,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apothecary Cylla - On Reset - Cast ''Deadly Poison'''),
(23881,0,1,0,2,0,100,1,0,60,0,0,0,11,35204,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apothecary Cylla - Between 0-60% Health - Cast ''Toxic Fumes'' (No Repeat)'),

(23594,0,0,0,2,0,100,1,0,80,0,0,0,11,11876,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimtotem Destroyer - Between 0-80% Health - Cast ''War Stomp'' (No Repeat)'),

(4389,0,0,0,0,0,100,0,2300,2600,12300,12600,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Murk Thresher - In Combat - Cast ''Thrash'''),

(4390,0,0,0,0,0,100,0,2900,3100,15300,15600,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Elder Murk Thresher - In Combat - Cast ''Thrash'''),

(4401,0,0,0,0,0,100,0,2100,2500,10100,10500,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Muckshell Clacker - In Combat - Cast ''Tendon Rip'''),

(4404,0,0,0,0,0,100,0,2100,2300,9600,9900,0,11,9532,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Muckshell Scrabbler - In Combat - Cast ''Lightning Bolt'''),
(4404,0,1,0,2,0,100,1,0,40,0,0,0,11,8005,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Muckshell Scrabbler - Between 0-40% Health - Cast ''Healing Wave'' (No Repeat)'),

(23687,0,0,0,0,0,100,0,2400,2900,11500,12000,0,11,8873,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scorchscale Drake - In Combat - Cast ''Flame Breath'''),

(4324,0,0,0,0,0,100,0,2400,2600,9400,9600,0,11,11021,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Searing Whelp - In Combat - Cast ''Flamespit'''),

(5057,0,0,0,0,0,100,0,2100,3200,15100,15900,0,11,14873,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Theramore Deserter - In Combat - Cast ''Sinister Strike'''),

(4348,0,0,0,0,0,100,0,2100,2300,32100,32300,0,11,744,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Noxious Shredder - In Combat - Cast ''Poison'''),
(4348,0,1,0,0,0,100,0,4500,5000,15000,15500,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noxious Shredder - In Combat - Cast ''Thrash''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
