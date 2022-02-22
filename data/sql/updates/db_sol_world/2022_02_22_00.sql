-- DB update 2022_02_21_03 -> 2022_02_22_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_21_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_21_03 2022_02_22_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1645546463731693350'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1645546463731693350');

DELETE FROM `gameobject` WHERE `guid` IN (3009023,3009024);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3009023,182092,530,0,0,1,1,9326.8,-7894.62,161.72,5.86431,0,0,-0.207912,0.978148,300,100,1,0),
(3009024,182092,530,0,0,1,1,9347.3,-7892.57,161.727,0.174532,0,0,0.0871553,0.996195,300,100,1,0);

UPDATE `creature` SET `spawntimesecs` = 30 WHERE `id` = 17984;
DELETE FROM `creature` WHERE `guid` IN (3008949,3008950,3008951);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3008949,17984,530,0,0,1,1,0,0,9336.03,-7884.33,161.585,6.03884,30,0,57,0,0,0,0,0,0),
(3008950,17984,530,0,0,1,1,0,0,9347.22,-7892.33,161.811,2.52099,30,0,57,0,0,0,0,0,0),
(3008951,17984,530,0,0,1,1,0,0,9326.99,-7894.44,161.651,0.84171,30,0,57,0,0,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` IN (63692,63696);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 17984;
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` IN (180916,180919,180920);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (17984,-63692,-3008949,-63696);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (180916,180919,180920);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17984,0,0,0,38,0,100,1,1,1,0,0,0,11,31628,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Power Source Invisible Bunny - On Data Set 1 1 - Cast ''Green Beam'' (CONDITION_SOURCE_TYPE_SPELL_IMPLICIT_TARGET) (No Repeat)'),

(-63692,0,0,1,1,0,100,0,5000,5000,5000,5000,0,45,1,1,0,0,0,0,10,63690,17984,0,0,0,0,0,0,'Power Source Invisible Bunny - OOC - Set Data 1 1 (Power Source Invisible Bunny)'),
(-63692,0,1,2,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,63693,17984,0,0,0,0,0,0,'Power Source Invisible Bunny - OOC - Set Data 1 1 (Power Source Invisible Bunny)'),
(-63692,0,2,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,63694,17984,0,0,0,0,0,0,'Power Source Invisible Bunny - OOC - Set Data 1 1 (Power Source Invisible Bunny)'),

(-3008949,0,0,1,1,0,100,0,5000,5000,5000,5000,0,45,1,1,0,0,0,0,10,63691,17984,0,0,0,0,0,0,'Power Source Invisible Bunny - OOC - Set Data 1 1 (Power Source Invisible Bunny)'),
(-3008949,0,1,2,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,3008950,17984,0,0,0,0,0,0,'Power Source Invisible Bunny - OOC - Set Data 1 1 (Power Source Invisible Bunny)'),
(-3008949,0,2,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,3008951,17984,0,0,0,0,0,0,'Power Source Invisible Bunny - OOC - Set Data 1 1 (Power Source Invisible Bunny)'),

(-63696,0,0,1,1,0,100,0,5000,5000,5000,5000,0,45,1,1,0,0,0,0,10,63695,17984,0,0,0,0,0,0,'Power Source Invisible Bunny - OOC - Set Data 1 1 (Power Source Invisible Bunny)'),
(-63696,0,1,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,63697,17984,0,0,0,0,0,0,'Power Source Invisible Bunny - OOC - Set Data 1 1 (Power Source Invisible Bunny)'),

(180916,1,0,1,70,0,100,0,2,0,0,0,0,41,0,0,0,0,0,0,10,63692,17984,0,0,0,0,0,0,'Duskwither Spire Power Source - On GO State Changed ''GO_ACTIVATED'' - Force Despawn (Power Source Invisible Bunny)'),
(180916,1,1,2,61,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,10,63690,17984,0,0,0,0,0,0,'Duskwither Spire Power Source - Linked - Force Despawn (Power Source Invisible Bunny)'),
(180916,1,2,3,61,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,10,63693,17984,0,0,0,0,0,0,'Duskwither Spire Power Source - Linked - Force Despawn (Power Source Invisible Bunny)'),
(180916,1,3,0,61,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,10,63694,17984,0,0,0,0,0,0,'Duskwither Spire Power Source - Linked - Force Despawn (Power Source Invisible Bunny)'),

(180919,1,0,1,70,0,100,0,2,0,0,0,0,41,0,0,0,0,0,0,10,3008949,17984,0,0,0,0,0,0,'Duskwither Spire Power Source - On GO State Changed ''GO_ACTIVATED'' - Force Despawn (Power Source Invisible Bunny)'),
(180919,1,1,2,61,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,10,63691,17984,0,0,0,0,0,0,'Duskwither Spire Power Source - Linked - Force Despawn (Power Source Invisible Bunny)'),
(180919,1,2,3,61,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,10,3008950,17984,0,0,0,0,0,0,'Duskwither Spire Power Source - Linked - Force Despawn (Power Source Invisible Bunny)'),
(180919,1,3,0,61,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,10,3008951,17984,0,0,0,0,0,0,'Duskwither Spire Power Source - Linked - Force Despawn (Power Source Invisible Bunny)'),

(180920,1,0,1,70,0,100,0,2,0,0,0,0,41,0,0,0,0,0,0,10,63696,17984,0,0,0,0,0,0,'Duskwither Spire Power Source - On GO State Changed ''GO_ACTIVATED'' - Force Despawn (Power Source Invisible Bunny)'),
(180920,1,1,2,61,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,10,63695,17984,0,0,0,0,0,0,'Duskwither Spire Power Source - Linked - Force Despawn (Power Source Invisible Bunny)'),
(180920,1,2,0,61,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,10,63697,17984,0,0,0,0,0,0,'Duskwither Spire Power Source - Linked - Force Despawn (Power Source Invisible Bunny)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 31628;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
-- 1st floor
(13,1,31628,0,0,31,0,3,17984,63692,0,0,0,'Spell ''Green Beam'' - Group 0: Implicit target ''Power Source Invisible Bunny'' GUID 63692'),
(13,1,31628,0,0,31,0,3,17984,63690,1,0,0,'Spell ''Green Beam'' - Group 0: Implicit target not ''Power Source Invisible Bunny'' GUID 63690'),
(13,1,31628,0,0,31,0,3,17984,63693,1,0,0,'Spell ''Green Beam'' - Group 0: Implicit target not ''Power Source Invisible Bunny'' GUID 63693'),
(13,1,31628,0,0,31,0,3,17984,63694,1,0,0,'Spell ''Green Beam'' - Group 0: Implicit target not ''Power Source Invisible Bunny'' GUID 63694'),
(13,1,31628,0,0,31,1,3,17984,3008949,1,0,0,'Spell ''Green Beam'' - Group 0: Implicit caster not ''Power Source Invisible Bunny'' GUID 3008949'),
(13,1,31628,0,0,31,1,3,17984,63691,1,0,0,'Spell ''Green Beam'' - Group 0: Implicit caster not ''Power Source Invisible Bunny'' GUID 63691'),
(13,1,31628,0,0,31,1,3,17984,3008950,1,0,0,'Spell ''Green Beam'' - Group 0: Implicit caster not ''Power Source Invisible Bunny'' GUID 3008950'),
(13,1,31628,0,0,31,1,3,17984,3008951,1,0,0,'Spell ''Green Beam'' - Group 0: Implicit caster not ''Power Source Invisible Bunny'' GUID 3008951'),
-- 2nd floor
(13,1,31628,0,1,31,0,3,17984,3008949,0,0,0,'Spell ''Green Beam'' - Group 1: Implicit target ''Power Source Invisible Bunny'' GUID 3008949'),
(13,1,31628,0,1,31,0,3,17984,63691,1,0,0,'Spell ''Green Beam'' - Group 1: Implicit target not ''Power Source Invisible Bunny'' GUID 63691'),
(13,1,31628,0,1,31,0,3,17984,3008950,1,0,0,'Spell ''Green Beam'' - Group 1: Implicit target not ''Power Source Invisible Bunny'' GUID 3008950'),
(13,1,31628,0,1,31,0,3,17984,3008951,1,0,0,'Spell ''Green Beam'' - Group 1: Implicit target not ''Power Source Invisible Bunny'' GUID 3008951'),
(13,1,31628,0,1,31,1,3,17984,63692,1,0,0,'Spell ''Green Beam'' - Group 1: Implicit caster not ''Power Source Invisible Bunny'' GUID 63692'),
(13,1,31628,0,1,31,1,3,17984,63690,1,0,0,'Spell ''Green Beam'' - Group 1: Implicit caster not ''Power Source Invisible Bunny'' GUID 63690'),
(13,1,31628,0,1,31,1,3,17984,63693,1,0,0,'Spell ''Green Beam'' - Group 1: Implicit caster not ''Power Source Invisible Bunny'' GUID 63693'),
(13,1,31628,0,1,31,1,3,17984,63694,1,0,0,'Spell ''Green Beam'' - Group 1: Implicit caster not ''Power Source Invisible Bunny'' GUID 63694'),
-- 3rd floor
(13,1,31628,0,2,31,0,3,17984,63696,0,0,0,'Spell ''Green Beam'' - Group 2: Implicit target ''Power Source Invisible Bunny'' GUID 63696'),
(13,1,31628,0,2,31,0,3,17984,63695,1,0,0,'Spell ''Green Beam'' - Group 2: Implicit target not ''Power Source Invisible Bunny'' GUID 63695'),
(13,1,31628,0,2,31,0,3,17984,63697,1,0,0,'Spell ''Green Beam'' - Group 2: Implicit target not ''Power Source Invisible Bunny'' GUID 63697');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
