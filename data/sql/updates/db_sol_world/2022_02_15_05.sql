-- DB update 2022_02_15_04 -> 2022_02_15_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_15_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_15_04 2022_02_15_05 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1644965105800131620'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1644965105800131620');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (11878,12208);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(11878,0,0,0,9,0,100,0,5,30,2300,3900,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Nathanos Blightcaller - Within 5-30 Range - Cast ''Shoot'''),
(11878,0,1,0,0,0,100,0,4000,6000,8000,11000,0,11,18651,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Nathanos Blightcaller - IC - Cast ''Multi-Shot'''),
(11878,0,2,0,9,0,100,0,0,5,7000,9000,0,11,6253,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Nathanos Blightcaller - Within 0-5 Range - Cast ''Backhand'''),
(11878,0,3,0,0,0,100,0,10000,12500,13000,15000,0,11,13704,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nathanos Blightcaller - IC - Cast ''Psychic Scream'''),
(11878,0,4,0,0,0,100,0,0,0,6000,8000,0,11,18649,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Nathanos Blightcaller - IC - Cast ''Shadow Shot'''),
(11878,0,5,0,0,0,100,0,9000,11000,9000,11000,0,11,19096,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nathanos Blightcaller - IC - Cast ''Summon Conquered Soul'''),
(11878,0,6,0,4,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Nathanos Blightcaller - On Aggro - Say Line 0'),
(11878,0,7,0,5,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nathanos Blightcaller - On Killed Unit - Say Line 1'),
(11878,0,8,9,19,0,100,0,6148,0,0,0,0,215,0,0,0,0,0,0,8,0,0,0,0,1610.96,-5527.11,0,0,'Nathanos Blightcaller - On Quest ''The Scarlet Oracle, Demetria'' Accepted - Load Grid (Demetria Position)'),
(11878,0,9,0,61,0,100,0,0,0,0,0,0,112,87,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Nathanos Blightcaller - Linked - Start Game Event ''Demetria - The Scarlet Oracle'''),

(12208,0,0,0,0,0,100,0,1000,3000,9000,12000,0,11,18328,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Conquered Soul of the Blightcaller - IC - Cast ''Incapacitating Shout'''),
(12208,0,1,0,1,0,100,0,60000,60000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Conquered Soul of the Blightcaller - OOC - Force Despawn'),
(12208,0,2,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,0,'Conquered Soul of the Blightcaller - On Just Summoned - Attack Closest Player');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
