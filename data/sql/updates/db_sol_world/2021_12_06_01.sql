-- DB update 2021_12_06_00 -> 2021_12_06_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_06_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_06_00 2021_12_06_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1638829310039539647'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1638829310039539647');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 19250;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,19250,0,0,31,0,3,12256,0,0,0,0,'Spell ''Placing Smokey''s Explosives'' - Group 0: Implicit target ''Mark of Detonation (SE)'''),
(13,1,19250,0,1,31,0,3,12255,0,0,0,0,'Spell ''Placing Smokey''s Explosives'' - Group 1: Implicit target ''Mark of Detonation (NE)'''),
(13,1,19250,0,2,31,0,3,12254,0,0,0,0,'Spell ''Placing Smokey''s Explosives'' - Group 2: Implicit target ''Mark of Detonation (NESH)'''),
(13,1,19250,0,3,31,0,3,12253,0,0,0,0,'Spell ''Placing Smokey''s Explosives'' - Group 3: Implicit target ''Mark of Detonation (CSH)'''),
(13,1,19250,0,4,31,0,3,12252,0,0,0,0,'Spell ''Placing Smokey''s Explosives'' - Group 4: Implicit target ''Mark of Detonation (CRS)'''),
(13,1,19250,0,5,31,0,3,12251,0,0,0,0,'Spell ''Placing Smokey''s Explosives'' - Group 5: Implicit target ''Mark of Detonation (CLS)'''),
(13,1,19250,0,6,31,0,3,12249,0,0,0,0,'Spell ''Placing Smokey''s Explosives'' - Group 6: Implicit target ''Mark of Detonation (SW)'''),
(13,1,19250,0,7,31,0,3,12244,0,0,0,0,'Spell ''Placing Smokey''s Explosives'' - Group 7: Implicit target ''Mark of Detonation (NW)''');

UPDATE `gameobject` SET `spawntimesecs` = 180 WHERE `id` = 177668;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 177672 AND `source_type` = 1;
UPDATE `gameobject_template` SET `AIName` = '' WHERE `entry` = 177672;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (12244,12249,12251,12252,12253,12254,12255,12256);
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 177668;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (12244,12249,12251,12252,12253,12254,12255,12256);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 177668;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(12244,0,0,1,8,0,100,0,19250,0,5000,5000,0,33,12247,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mark of Detonation (NW) - On Spellhit ''Placing Smokey''s Explosives'' - Kill Credit ''Scourge Structure'' (Invoker)'),
(12244,0,1,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,20,177668,0,0,0,0,0,0,0,'Mark of Detonation (NW) - Linked - Set Data 1 1 (Mark of Detonation)'),

(12249,0,0,1,8,0,100,0,19250,0,5000,5000,0,33,12247,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mark of Detonation (SW) - On Spellhit ''Placing Smokey''s Explosives'' - Kill Credit ''Scourge Structure'' (Invoker)'),
(12249,0,1,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,20,177668,0,0,0,0,0,0,0,'Mark of Detonation (SW) - Linked - Set Data 1 1 (Mark of Detonation)'),

(12251,0,0,1,8,0,100,0,19250,0,5000,5000,0,33,12247,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mark of Detonation (CLS) - On Spellhit ''Placing Smokey''s Explosives'' - Kill Credit ''Scourge Structure'' (Invoker)'),
(12251,0,1,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,20,177668,0,0,0,0,0,0,0,'Mark of Detonation (CLS) - Linked - Set Data 1 1 (Mark of Detonation)'),

(12252,0,0,1,8,0,100,0,19250,0,5000,5000,0,33,12247,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mark of Detonation (CRS) - On Spellhit ''Placing Smokey''s Explosives'' - Kill Credit ''Scourge Structure'' (Invoker)'),
(12252,0,1,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,20,177668,0,0,0,0,0,0,0,'Mark of Detonation (CRS) - Linked - Set Data 1 1 (Mark of Detonation)'),

(12253,0,0,1,8,0,100,0,19250,0,5000,5000,0,33,12247,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mark of Detonation (CSH) - On Spellhit ''Placing Smokey''s Explosives'' - Kill Credit ''Scourge Structure'' (Invoker)'),
(12253,0,1,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,20,177668,0,0,0,0,0,0,0,'Mark of Detonation (CSH) - Linked - Set Data 1 1 (Mark of Detonation)'),

(12254,0,0,1,8,0,100,0,19250,0,5000,5000,0,33,12247,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mark of Detonation (NESH) - On Spellhit ''Placing Smokey''s Explosives'' - Kill Credit ''Scourge Structure'' (Invoker)'),
(12254,0,1,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,20,177668,0,0,0,0,0,0,0,'Mark of Detonation (NESH) - Linked - Set Data 1 1 (Mark of Detonation)'),

(12255,0,0,1,8,0,100,0,19250,0,5000,5000,0,33,12247,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mark of Detonation (NE) - On Spellhit ''Placing Smokey''s Explosives'' - Kill Credit ''Scourge Structure'' (Invoker)'),
(12255,0,1,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,20,177668,0,0,0,0,0,0,0,'Mark of Detonation (NE) - Linked - Set Data 1 1 (Mark of Detonation)'),

(12256,0,0,1,8,0,100,0,19250,0,5000,5000,0,33,12247,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mark of Detonation (SE) - On Spellhit ''Placing Smokey''s Explosives'' - Kill Credit ''Scourge Structure'' (Invoker)'),
(12256,0,1,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,20,177668,0,0,0,0,0,0,0,'Mark of Detonation (SE) - Linked - Set Data 1 1 (Mark of Detonation)'),

(177668,1,0,1,38,0,100,0,1,1,0,0,0,67,1,3000,3000,0,0,0,1,0,0,0,0,0,0,0,0,'Mark of Detonation - On Data Set 1 1 - Create Timed Event 1'),
(177668,1,1,0,61,0,100,0,0,0,0,0,0,9,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mark of Detonation - Linked - Activate GO'),
(177668,1,2,0,59,0,100,0,1,0,0,0,0,233,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mark of Detonation - On Timed Event 1 Triggered - Despawn GO');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
