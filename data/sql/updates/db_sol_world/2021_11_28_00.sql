-- DB update 2021_11_26_01 -> 2021_11_28_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_26_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_26_01 2021_11_28_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1638054840754939790'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1638054840754939790');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (9477,9621);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (6556,6557,6559,9477,10290,9621);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 655700;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6556,0,0,0,8,0,100,0,15702,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Muculent Ooze - On Spellhit ''Filling Empty Jar'' - Force Despawn'),
(6556,0,1,0,25,0,100,0,0,0,0,0,0,11,14133,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Muculent Ooze - On Reset - Cast ''Muculent Fever Proc'''),

(6559,0,0,0,8,0,100,0,15702,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Glutinous Ooze - On Spellhit ''Filling Empty Jar'' - Force Despawn'),
(6559,0,1,2,6,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Glutinous Ooze - On Death - Say Line 0'),
(6559,0,2,0,61,0,100,0,0,0,0,0,0,11,14147,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Glutinous Ooze - Linked - Cast ''Acid Slime'''),

(6557,0,0,0,8,0,100,1,15702,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primal Ooze - On Spellhit ''Filling Empty Jar'' - Force Despawn'),
(6557,0,1,0,25,0,100,0,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primal Ooze - On Reset - Enable Attack'),
(6557,0,2,0,8,0,100,0,16031,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primal Ooze - On Spellhit ''Releasing Corrupt Ooze'' - Set Event Phase 2'),
(6557,0,3,4,60,2,100,1,1500,1500,0,0,0,45,0,1,0,0,0,0,19,10290,35,0,0,0,0,0,0,'Primal Ooze - On Update - Set Data 0 1 (Closest Captured Felwood Ooze) (Phase 2, No Repeat)'),
(6557,0,4,0,61,0,100,0,0,0,0,0,0,29,0,0,10290,1,1,0,19,10290,35,0,0,0,0,0,0,'Primal Ooze - Linked - Start Follow (Closest Captured Felwood Ooze)'),
(6557,0,5,0,65,2,100,0,0,0,0,0,0,80,655700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primal Ooze - On Follow Complete - Call Timed Action List (Phase 2)'),
(6557,0,6,7,2,0,100,1,0,30,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primal Ooze - Between 0-30% Health - Say Line 0 (No Repeat)'),
(6557,0,7,0,61,0,100,0,0,0,0,0,0,11,14146,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primal Ooze - Linked - Cast ''Clone'''),

(655700,9,0,0,0,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primal Ooze - On Script - Disable Attack'),
(655700,9,1,0,0,0,100,0,0,0,0,0,0,11,16032,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primal Ooze - On Script - Cast ''Merging Oozes'''),
(655700,9,2,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,19,10290,5,0,0,0,0,0,0,'Primal Ooze - On Script - Force Despawn (Closest Captured Felwood Ooze)'),
(655700,9,3,0,0,0,100,0,1000,1000,0,0,0,12,9621,4,20000,0,0,0,1,0,0,0,0,0,0,0,0,'Primal Ooze - On Script - Summon Creature ''Gargantuan Ooze'''),
(655700,9,4,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primal Ooze - On Script - Force Despawn'),

(10290,0,0,0,38,0,100,0,0,1,0,0,0,29,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Captured Felwood Ooze - On Data Set 0 1 - Start Follow (Invoker)'),

(9477,0,0,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Cloned Ooze - On Just Summoned - Start Attack (Closest Player)'),
(9477,0,1,0,1,0,100,0,30000,30000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cloned Ooze - OOC - Force Despawn'),

(9621,0,0,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Gargantuan Ooze - On Just Summoned - Start Attack (Closest Player)'),
(9621,0,1,0,1,0,100,0,30000,30000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gargantuan Ooze - OOC - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 15702;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(17,0,15702,0,0,31,1,3,6556,0,0,0,0,'Spell ''Filling Empty Jar'' - Group 0: Spell target ''Muculent Ooze'''),
(17,0,15702,0,0,36,1,0,0,0,1,0,0,'Spell ''Filling Empty Jar'' - Group 0: Spell target needs to be dead'),
(17,0,15702,0,1,31,1,3,6557,0,0,0,0,'Spell ''Filling Empty Jar'' - Group 1: Spell target ''Primal Ooze'''),
(17,0,15702,0,1,36,1,0,0,0,1,0,0,'Spell ''Filling Empty Jar'' - Group 1: Spell target needs to be dead'),
(17,0,15702,0,2,31,1,3,6559,0,0,0,0,'Spell ''Filling Empty Jar'' - Group 2: Spell target ''Glutinous Ooze'''),
(17,0,15702,0,2,36,1,0,0,0,1,0,0,'Spell ''Filling Empty Jar'' - Group 2: Spell target needs to be dead');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
