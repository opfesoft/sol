-- DB update 2020_06_12_02 -> 2020_06_12_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_06_12_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_06_12_02 2020_06_12_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1591967789107782227'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1591967789107782227');

-- Tainted Keg: Remove from world as it is spawned via SAI
DELETE FROM `gameobject` WHERE `guid` = 30031;

-- Dusty Rug SAI
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 1728;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 1728 AND `source_type` = 1;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 172800 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1728,1,0,0,20,0,100,0,524,0,0,0,0,80,172800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dusty Rug - On Quest ''Elixir of Agony'' Finished - Run Script'),

(172800,9,0,0,0,0,100,0,0,0,0,0,0,50,1729,120,0,0,0,0,8,0,0,0,0,0.437117,-942.794,61.9384,-2.54818,'Dusty Rug - On Script - Summon Gameobject ''Tainted Keg'''),
(172800,9,1,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,9,2284,0,50,0,0,0,0,0,'Dusty Rug - On Script - Set Data 1 1'),
(172800,9,2,0,0,0,100,0,1000,1000,0,0,0,50,1730,119,0,0,0,0,8,0,0,0,0,0.437117,-942.794,61.9384,-2.54818,'Dusty Rug - On Script - Summon Gameobject ''Tainted Keg Smoke''');

-- Captured Farmer: Decrease spawn time
UPDATE creature SET spawntimesecs = 90 WHERE id = 2284;

-- Captured Farmer SAI
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 2284;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-15891,-15892,-15893) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (228400,228401,228402) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-15891,0,0,0,38,0,100,0,1,1,0,0,0,80,228400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Data Set 1 1 - Run Script'),
(-15892,0,0,0,38,0,100,0,1,1,0,0,0,80,228401,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Data Set 1 1 - Run Script'),
(-15893,0,0,0,38,0,100,0,1,1,0,0,0,80,228402,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Data Set 1 1 - Run Script'),

(228400,9,0,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Say Line 0'),
(228400,9,1,0,0,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,0.426498,-944.53,61.9386,0,'Captured Farmer - On Script - Move To Position'),
(228400,9,2,0,0,0,100,0,3000,3000,0,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Play Emote ''Kneel'''),
(228400,9,3,0,0,0,100,0,1000,1000,0,0,0,5,26,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Play Emote ''Stand'''),
(228400,9,4,0,0,0,100,0,3000,3000,0,0,0,17,418,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Set Emote State ''Eat'''),
(228400,9,5,0,0,0,100,0,6000,6000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Set Emote State ''None'''),
(228400,9,6,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Say Line 2'),
(228400,9,7,0,0,0,100,0,2000,2000,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Kill Self'),

(228401,9,0,0,0,0,100,0,3000,3000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-1.4032,-942.653,61.9,0,'Captured Farmer - On Script - Move To Position'),
(228401,9,1,0,0,0,100,0,3000,3000,0,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Play Emote ''Kneel'''),
(228401,9,2,0,0,0,100,0,1000,1000,0,0,0,5,26,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Play Emote ''Stand'''),
(228401,9,3,0,0,0,100,0,3000,3000,0,0,0,17,418,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Set Emote State ''Eat'''),
(228401,9,4,0,0,0,100,0,6000,6000,0,0,0,17,64,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Set Emote State ''Stun'''),
(228401,9,5,0,0,0,100,0,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Say Line 3'),
(228401,9,6,0,0,0,100,0,4000,4000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Set Emote State ''None'''),
(228401,9,7,0,0,0,100,0,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Kill Self'),

(228402,9,0,0,0,0,100,0,3000,3000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,0.446124,-941.072,61.91,0,'Captured Farmer - On Script - Move To Position'),
(228402,9,1,0,0,0,100,0,3000,3000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Say Line 1'),
(228402,9,2,0,0,0,100,0,0,0,0,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Play Emote ''Kneel'''),
(228402,9,3,0,0,0,100,0,1000,1000,0,0,0,5,26,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Play Emote ''Stand'''),
(228402,9,4,0,0,0,100,0,3000,3000,0,0,0,17,418,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Set Emote State ''Eat'''),
(228402,9,5,0,0,0,100,0,7500,7500,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Set Emote State ''None'''),
(228402,9,6,0,0,0,100,0,500,500,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Say Line 4'),
(228402,9,7,0,0,0,100,0,3000,3000,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Farmer - On Script - Kill Self');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
