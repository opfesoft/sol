-- DB update 2021_11_17_00 -> 2021_11_18_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_17_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_17_00 2021_11_18_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1637258653694332814'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1637258653694332814');

UPDATE `creature` SET `orientation` = 1.22217 WHERE `guid` = 86049;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16977;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16977,0,0,0,25,0,100,0,0,0,0,0,0,11,33900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arch Mage Xintor - On Reset - Cast ''Shroud of Death'''),
(16977,0,1,0,0,0,100,0,0,0,2400,3800,0,11,20823,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Arch Mage Xintor - IC - Cast ''Fireball'''),
(16977,0,2,0,0,0,50,0,6000,8000,9000,12000,0,11,15735,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Arch Mage Xintor - IC - Cast ''Arcane Missiles'''),
(16977,0,3,0,2,0,100,0,0,50,7000,10000,0,11,33245,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arch Mage Xintor - Between 0-50% Health - Cast ''Ice Barrier'''),
(16977,0,4,0,2,0,100,1,0,15,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Arch Mage Xintor - Between 0-15% Health - Flee For Assist (No Repeat)'),
(16977,0,5,0,4,0,100,0,0,0,0,0,0,92,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arch Mage Xintor - On Aggro - Interrupt Spell'),
(16977,0,6,0,1,0,100,0,5000,30000,15000,30000,0,11,29458,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arch Mage Xintor - OOC - Cast ''Blizzard''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 29458;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,29458,0,0,31,0,3,17060,0,0,0,0,'Spell ''Blizzard'' - Group 0: Implicit Target ''Hellfire Combat Dummy Small''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
