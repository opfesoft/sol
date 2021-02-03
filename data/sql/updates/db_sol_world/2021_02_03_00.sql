-- DB update 2021_02_02_01 -> 2021_02_03_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_02_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_02_01 2021_02_03_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1612311433968239798'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1612311433968239798');

UPDATE `gameobject` SET `spawntimesecs` = 600, `animprogress` = 100 WHERE `id` = 184850;
UPDATE `gameobject_template` SET `Data3` = 3000 WHERE `entry` = 184850;

DELETE FROM `creature` WHERE `guid` = 96886;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(96886,17889,530,0,0,1,1,0,0,-2143.43,-10692,64.7658,4.93928,300,0,42,0,0,0,0,0,0);

UPDATE `creature` SET `position_x` = -2147.35, `position_y` = -10741.1, `position_z` = 73.9034 WHERE `guid` = 63583;
UPDATE `creature` SET `position_x` = -2128.94, `position_y` = -10726, `position_z` = 66.3358 WHERE `guid` = 63584;
UPDATE `creature` SET `position_x` = -2107.07, `position_y` = -10703, `position_z` = 65.1894 WHERE `guid` = 63585;
UPDATE `creature` SET `position_x` = -2098.62, `position_y` = -10688.5, `position_z` = 65.2181 WHERE `guid` = 63582;

UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` IN (184850,182026);
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 17886;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-63582,-63583,-63584,-63585) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-12164,-12166,-12168,-12173,182026) AND `source_type` = 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-63585,0,0,1,11,0,100,0,0,0,0,0,0,11,31413,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DND]Sunhawk Portal Controller - On Respawn - Cast ''Stabilize Sun Gate III'''),
(-63585,0,1,0,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,14,12173,184850,0,0,0,0,0,0,'[DND]Sunhawk Portal Controller - Linked - Respawn ''Sunhawk Portal Controller'''),

(-63584,0,0,1,11,0,100,0,0,0,0,0,0,11,31412,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DND]Sunhawk Portal Controller - On Respawn - Cast ''Stabilize Sun Gate II'''),
(-63584,0,1,0,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,14,12164,184850,0,0,0,0,0,0,'[DND]Sunhawk Portal Controller - Linked - Respawn ''Sunhawk Portal Controller'''),

(-63583,0,0,1,11,0,100,0,0,0,0,0,0,11,31411,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DND]Sunhawk Portal Controller - On Respawn - Cast ''Stabilize Sun Gate I'''),
(-63583,0,1,0,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,14,12166,184850,0,0,0,0,0,0,'[DND]Sunhawk Portal Controller - Linked - Respawn ''Sunhawk Portal Controller'''),

(-63582,0,0,1,11,0,100,0,0,0,0,0,0,11,31414,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'[DND]Sunhawk Portal Controller - On Respawn - Cast ''Stabilize Sun Gate IV'''),
(-63582,0,1,0,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,14,12168,184850,0,0,0,0,0,0,'[DND]Sunhawk Portal Controller - Linked - Respawn ''Sunhawk Portal Controller'''),

(-12173,1,0,0,70,0,100,0,2,0,0,0,0,41,0,0,0,0,0,0,10,63585,17886,0,0,0,0,0,0,'Sunhawk Portal Controller - On Gameobject State Changed - Force Despawn ([DND]Sunhawk Portal Controller)'),

(-12168,1,0,0,70,0,100,0,2,0,0,0,0,41,0,0,0,0,0,0,10,63582,17886,0,0,0,0,0,0,'Sunhawk Portal Controller - On Gameobject State Changed - Force Despawn ([DND]Sunhawk Portal Controller)'),

(-12166,1,0,0,70,0,100,0,2,0,0,0,0,41,0,0,0,0,0,0,10,63583,17886,0,0,0,0,0,0,'Sunhawk Portal Controller - On Gameobject State Changed - Force Despawn ([DND]Sunhawk Portal Controller)'),

(-12164,1,0,0,70,0,100,0,2,0,0,0,0,41,0,0,0,0,0,0,10,63584,17886,0,0,0,0,0,0,'Sunhawk Portal Controller - On Gameobject State Changed - Force Despawn ([DND]Sunhawk Portal Controller)'),

(182026,1,0,0,60,0,100,0,2000,2000,2000,2000,0,105,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sun Gate - On Update - Set ''UNIT_FLAG_NOT_SELECTABLE'''),
(182026,1,1,0,60,0,100,0,2000,2000,2000,2000,0,106,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sun Gate - On Update - Remove ''UNIT_FLAG_NOT_SELECTABLE''');

UPDATE `conditions` SET `ConditionValue2` = 17889, `ConditionValue3` = 63610 WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 31411;
UPDATE `conditions` SET `ConditionValue2` = 17889, `ConditionValue3` = 96886 WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 31412;
UPDATE `conditions` SET `ConditionValue2` = 17889, `ConditionValue3` = 63611 WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 31413;
UPDATE `conditions` SET `ConditionValue2` = 17889, `ConditionValue3` = 63609 WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 31414;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 182026;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(22,1,182026,1,0,29,1,17886,60,0,0,0,0,'','Sun Gate - Only run SAI if ''[DND]Sunhawk Portal Controller'' is in range'),
(22,2,182026,1,0,29,1,17886,60,0,1,0,0,'','Sun Gate - Only run SAI if ''[DND]Sunhawk Portal Controller'' is not in range');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
