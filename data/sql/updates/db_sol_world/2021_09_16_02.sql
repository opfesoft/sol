-- DB update 2021_09_16_01 -> 2021_09_16_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_16_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_16_01 2021_09_16_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1631806319143112579'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1631806319143112579');

UPDATE `creature_template` SET `faction` = 1834 WHERE `entry` = 21506;
UPDATE `creature_template_addon` SET `auras` = NULL WHERE `entry` = 21506;

DELETE FROM `creature_text` WHERE `CreatureId` = 21506;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(21506,0,0,'Illidan''s lapdogs!  You will pay for my imprisonment with your lives!',14,0,100,0,0,0,19577,0,'Azaloth');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (21506,21503);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2150600;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(21506,0,0,1,11,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Azaloth - On Respawn - Set React State ''Passive'''),
(21506,0,1,2,61,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Azaloth - Linked - Disable Event Phase Reset'),
(21506,0,2,3,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Azaloth - Linked - Set Phase 1'),
(21506,0,3,0,61,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Azaloth - Linked - Set ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(21506,0,4,0,1,1,100,0,1000,1000,0,0,0,75,37833,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Azaloth - OOC - Add Aura ''Banish'' (Phase 1)'),
(21506,0,5,6,8,1,100,0,37834,0,0,0,0,33,21892,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Azaloth - On Spell Hit ''Unbanish Azaloth'' - Quest Credit ''A Necessary Distraction'''),
(21506,0,6,0,61,0,100,0,0,0,0,0,0,80,2150600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Azaloth - Linked - Call Timed Action List'),
(21506,0,7,0,0,0,100,0,2000,4000,8000,12000,0,11,40504,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Azaloth - IC - Cast ''Cleave'''),
(21506,0,8,0,0,0,100,0,4000,8000,15000,25000,0,11,11443,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Azaloth - IC - Cast ''Cripple'''),
(21506,0,9,0,0,0,100,0,5000,10000,10000,15000,0,11,38741,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Azaloth - IC - Cast ''Rain of Fire'''),
(21506,0,10,0,0,0,100,0,5000,10000,10000,15000,0,11,38750,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Azaloth - IC - Cast ''War Stomp'''),

(2150600,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Azaloth - On Script - Set Active On'),
(2150600,9,1,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Azaloth - On Script - Set Phase 2'),
(2150600,9,2,0,0,0,100,0,0,0,0,0,0,41,300000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Azaloth - On Script - Force Despawn'),
(2150600,9,3,0,0,0,100,0,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Azaloth - On Script - Set React State ''Aggressive'''),
(2150600,9,4,0,0,0,100,0,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Azaloth - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2150600,9,5,0,0,0,100,0,0,0,0,0,0,28,37833,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Azaloth - On Script - Remove Aura ''Banish'''),
(2150600,9,6,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Azaloth - On Script - Say Line 0'),
(2150600,9,7,0,0,0,100,0,0,0,0,0,0,11,38750,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Azaloth - On Script - Cast ''War Stomp'''),

(21503,0,0,0,1,0,100,0,0,0,15000,15000,0,11,38722,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Warlock - OOC - Cast ''Spellbind Azaloth'''),
(21503,0,1,0,0,0,100,0,5000,8000,10000,16000,0,11,32707,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Warlock - IC - Cast ''Incinerate'''),
(21503,0,2,0,9,0,100,0,0,30,3400,4800,0,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Warlock - Within 0-30 Range - Cast ''Shadow Bolt''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 38722;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 21503;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 37834;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,38722,0,0,31,0,3,21506,0,0,0,0,'Spell ''Spellbind Azaloth'' - Implicit Target ''Azaloth'''),
(22,1,21503,0,0,29,1,21506,20,0,0,0,0,'Creature ''Sunfury Warlock'' - Execute SAI only if near ''Azaloth'''),

(17,0,37834,0,0,31,1,3,21506,0,0,0,0,'Spell ''Unbanish Azaloth'' - Requires explicit target ''Azaloth'''),
(17,0,37834,0,0,36,1,0,0,0,0,0,0,'Spell ''Unbanish Azaloth'' - Requires target to be alive'),
(17,0,37834,0,0,1,1,37833,0,0,0,0,0,'Spell ''Unbanish Azaloth'' - Requires target with aura ''Banish''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
