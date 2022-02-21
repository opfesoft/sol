-- DB update 2022_02_21_02 -> 2022_02_21_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_21_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_21_02 2022_02_21_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1645469084070880711'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1645469084070880711');

-- Ash'ari Crystal: Only apply "UNIT_FLAG_NOT_SELECTABLE", nothing else (otherwise there will be DAMAGE_SHIELD_MISSED_EVADE messages in the combat log after "Ribbon of Souls" is triggered)
UPDATE `creature_template` SET `unit_flags` = 33554432 WHERE `entry` = 10415;

-- Vampiric Mistbat: Adjust position
UPDATE `creature` SET `position_x` = 7212.89, `position_y` = -6666.32, `position_z` = 47.2074 WHERE `guid` = 82767;

-- Deatholme Darkmage: Adjust position/orientation
UPDATE `creature` SET `position_x` = 7173, `position_y` = -6615.69, `position_z` = 63.6587, `orientation` = 2.93215 WHERE `guid` = 82743;

-- Deatholme Darkmage: Disable random movement
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` IN (82656,82665);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (16318,10415);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16318,0,0,0,1,0,100,1,0,5000,0,0,0,11,28729,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deatholme Darkmage - OOC - Cast ''Ribbon of Souls'' (No Repeat)'),
(16318,0,1,0,0,0,100,0,0,0,3000,5000,0,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Deatholme Darkmage - IC - Cast ''Shadow Bolt'''),
(16318,0,2,0,0,0,100,0,7000,11000,32000,36000,0,11,18267,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Deatholme Darkmage - IC - Cast ''Curse of Weakness'''),
(16318,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Deatholme Darkmage - Between 0-15% Health - Flee For Assist (No Repeat)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 28731;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,28731,0,0,31,0,3,10415,0,0,0,0,'Spell ''Ribbon of Souls'' - Group 0: Implicit target ''Ash''ari Crystal''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
