-- DB update 2021_01_15_01 -> 2021_01_18_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_15_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_15_01 2021_01_18_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610928049391389541'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610928049391389541');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 33806;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (33772,33806) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 3377200 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(33772,0,0,1,9,0,100,0,15,90,30000,30000,0,64,1,0,0,0,0,0,17,15,90,1,0,0,0,0,0,'Faceless Horror - Within 15-90 Range - Store Target'),
(33772,0,1,0,61,0,100,0,0,0,0,0,0,80,3377200,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Faceless Horror - Linked - Call Timed Action List'),
(33772,0,2,0,0,0,100,0,3000,8000,7000,12000,0,11,63722,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Faceless Horror - IC - Cast ''Shadow Crash'''),
(33772,0,3,0,4,0,100,0,0,0,0,0,0,11,63703,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Faceless Horror - On Aggro - Cast ''Void Wave'''),
(33772,0,4,0,7,0,100,0,0,0,0,0,0,28,63703,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Faceless Horror - On Evade - Remove Aura ''Void Wave'''),
(33772,0,5,6,2,0,100,1,0,30,0,0,0,11,63710,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Faceless Horror - Between 0-30% Health - Cast ''Void Barrier'' (No Repeat)'),
(33772,0,6,0,61,0,100,0,0,0,0,0,0,11,63708,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Faceless Horror - Linked - Cast ''Summon Void Beast'' (No Repeat)'),

(3377200,9,0,0,0,0,100,0,0,0,0,0,0,11,64429,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Faceless Horror - On Script - Cast ''Death Grip'''),
(3377200,9,1,0,0,0,100,0,0,0,0,0,0,86,64431,0,12,1,0,0,1,0,0,0,0,0,0,0,0,'Faceless Horror - On Script - Cross Cast ''Death Grip'''),

(33806,0,0,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Void Beast - On Just Summoned - Attack Closest Player'),
(33806,0,1,0,6,0,100,0,0,0,0,0,0,28,63710,0,0,0,0,0,19,33772,100,0,0,0,0,0,0,'Void Beast - On Just Died - Remove Aura ''Void Barrier'''),
(33806,0,2,0,1,0,100,0,10000,10000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Void Beast - OOC - Force Despawn'),
(33806,0,3,0,0,0,100,0,10000,15000,20000,40000,0,11,63723,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Void Beast - IC - Cast ''Shadow Nova''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
