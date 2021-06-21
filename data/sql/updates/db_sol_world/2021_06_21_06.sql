-- DB update 2021_06_21_05 -> 2021_06_21_06
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_21_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_21_05 2021_06_21_06 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624311785775995726'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624311785775995726');

DELETE FROM `spell_target_position` WHERE `ID` = 20682;
INSERT INTO `spell_target_position` (`ID`, `EffectIndex`, `MapID`, `PositionX`, `PositionY`, `PositionZ`, `Orientation`, `VerifiedBuild`)
VALUES
(20682,0,1,-3891.8,-4609.97,9.50106,0.764318,0);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 4968 AND `id` > 2;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 496800;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4968,0,3,0,20,0,100,0,11142,0,0,0,0,80,496800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - On Quest ''Survey Alcaz Island'' Rewarded - Call Timed Action List'),
(4968,0,4,0,4,0,100,0,0,0,0,0,0,4,5882,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - On Aggro - Play Sound ''A_Jaina Proudmoore Aggros'''),
(4968,0,5,0,0,0,100,0,0,0,2000,3500,0,11,20692,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - IC - Cast ''Fireball'''),
(4968,0,6,0,0,0,100,0,4000,5000,45000,55000,0,11,20681,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - IC - Cast ''Summon Water Elementals'''),
(4968,0,7,0,0,0,100,0,5000,9000,15000,17000,0,11,20679,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - IC - Cast ''Fire Blast'''),
(4968,0,8,0,0,0,100,0,8000,12000,25000,28000,0,11,20680,1,0,0,0,0,4,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - IC - Cast ''Blizzard'''),
(4968,0,9,0,2,0,100,0,0,50,14000,21000,0,11,20682,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - Between 0-50% Health - Cast ''Teleport'''),

(496800,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(496800,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - On Script - Set Orientation (Invoker)'),
(496800,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - On Script - Say Line 0'),
(496800,9,3,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - On Script - Say Line 1'),
(496800,9,4,0,0,0,100,0,7000,7000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - On Script - Say Line 2'),
(496800,9,5,0,0,0,100,0,7000,7000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - On Script - Say Line 3'),
(496800,9,6,0,0,0,100,0,8000,8000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - On Script - Say Line 4'),
(496800,9,7,0,0,0,100,0,7000,7000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - On Script - Say Line 5'),
(496800,9,8,0,0,0,100,0,10000,10000,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(496800,9,9,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - On Script - Evade');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
