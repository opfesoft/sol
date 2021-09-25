-- DB update 2021_09_23_02 -> 2021_09_25_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_23_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_23_02 2021_09_25_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1632575240340910679'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1632575240340910679');

-- Use better comments for the existing spell conditions
UPDATE `conditions` SET `Comment` = 'Spell ''Cannon'' - Group 0: Implicit Target ''Steam Tonk''' WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 24933 AND `ConditionTypeOrReference` = 31;
UPDATE `conditions` SET `Comment` = 'Spell ''Detonation'' - Group 0: Implicit Target ''Steam Tonk''' WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 25099 AND `ConditionTypeOrReference` = 31;
UPDATE `conditions` SET `Comment` = 'Spell ''Explosion'' - Group 0: Implicit Target ''Steam Tonk''' WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 27745 AND `ConditionTypeOrReference` = 31;

-- Add condition for "Cannon" in order to not target the caster itself
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 24933 AND `ConditionTypeOrReference` = 33;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,24933,0,0,33,1,0,0,0,1,0,0,'Spell ''Cannon'' - Group 0: Implicit Target: Not Self');

-- Steam Tonk: Update spells and remove power regeneration
UPDATE `creature_template` SET `unit_flags2` = `unit_flags2` & ~2048, `spell1` = 24933, `spell2` = 25003, `spell3` = 25024, `spell4` = 27746 WHERE `entry` = 19405;

-- Tonk Control Console: Set state "ready" and disable respawn time
UPDATE `gameobject` SET `spawntimesecs` = 0, `animprogress` = 0, `state` = 1 WHERE `id` = 180524;

UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 180524;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 15368;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 180524;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(15368,0,0,1,60,0,100,1,3000,3000,100,100,0,11,25099,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tonk Mine - On Update - Cast ''Detonation'''),
(15368,0,1,0,61,0,100,0,0,0,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tonk Mine - Linked - Force Despawn'),

(180524,1,0,0,70,0,100,0,2,0,0,0,0,11,45440,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Tonk Control Console - On GO State Changed - Cast ''Steam Tonk Controller''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
