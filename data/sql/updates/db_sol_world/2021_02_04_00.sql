-- DB update 2021_02_03_00 -> 2021_02_04_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_03_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_03_00 2021_02_04_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1612436936610304777'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1612436936610304777');

DELETE FROM `creature_text` WHERE `CreatureID` = 19257;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(19257,0,0,'INCOMING! Do not let them through! Focus fire! NOW, NOW, NOW!',14,1,100,0,0,0,16395,0,'Arcanist Torseldori');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (19257,19258,19259);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (19257,19258,19259);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1925900;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19257,0,0,0,0,0,100,0,1000,1000,3000,4000,0,11,15530,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Arcanist Torseldori - IC - Cast ''Frostbolt'''),
(19257,0,1,0,9,0,100,0,0,8,10000,14000,1,11,12674,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Arcanist Torseldori - Within 0-8 Range - Cast ''Frost Nova'''),
(19257,0,2,0,0,0,100,0,10000,15000,13000,24000,0,11,33634,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Arcanist Torseldori - IC - Cast ''Blizzard'''),
(19257,0,3,0,1,0,100,1,2000,5000,2000,5000,0,49,0,0,0,0,0,0,11,19259,70,1,0,0,0,0,0,'Arcanist Torseldori - OOC - Attack ''Infernal Invader'' (No Repeat)'),
(19257,0,4,0,38,0,100,256,1,1,60000,60000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arcanist Torseldori - On Data Set 1 1 - Say Line 0 (No Reset)'),

(19258,0,0,0,0,0,100,0,1000,1000,3000,4000,0,11,15530,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bloodmage - IC - Cast ''Frostbolt'''),
(19258,0,1,0,9,0,100,0,0,8,10000,14000,1,11,12674,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bloodmage - Within 0-8 Range - Cast ''Frost Nova'''),
(19258,0,2,0,0,0,100,0,10000,15000,13000,24000,0,11,33634,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bloodmage - IC - Cast ''Blizzard'''),
(19258,0,3,0,1,0,100,1,2000,5000,2000,5000,0,49,0,0,0,0,0,0,11,19259,70,1,0,0,0,0,0,'Arcanist Torseldori - OOC - Attack ''Infernal Invader'' (No Repeat)'),

(19259,0,0,0,11,0,100,0,0,0,0,0,0,80,1925900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infernal Invader - On Respawn - Call Timed Action List'),
(19259,0,1,0,17,0,100,0,12999,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Infernal Invader - On Summoned Unit - Store Target'),

(1925900,9,0,0,0,0,100,0,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infernal Invader - On Script - Set Visibility Off'),
(1925900,9,1,0,0,0,100,0,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infernal Invader - On Script - Set Faction 35'),
(1925900,9,2,0,0,0,100,0,0,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infernal Invader - On Script - Enable Random Movement'),
(1925900,9,3,0,0,0,100,0,0,10000,0,0,0,12,12999,3,10000,0,0,0,1,0,0,0,0,0,0,10,0,'Infernal Invader - On Script - Summon ''World Invisible Trigger'''),
(1925900,9,4,0,0,0,100,0,4000,4000,0,0,0,86,32785,0,12,1,0,0,1,0,0,0,0,0,0,10,0,'Infernal Invader - On Script - Cross Cast ''Infernal Rain'''),
(1925900,9,5,0,0,0,100,0,1000,1000,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infernal Invader - On Script - Set Visibility On'),
(1925900,9,6,0,0,0,100,0,0,0,0,0,0,2,90,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infernal Invader - On Script - Set Faction 90'),
(1925900,9,7,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,68780,19257,0,0,0,0,0,0,'Infernal Invader - On Script - Set Data 1 1 (Arcanist Torseldori)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
