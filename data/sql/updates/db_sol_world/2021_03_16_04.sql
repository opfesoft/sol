-- DB update 2021_03_16_03 -> 2021_03_16_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_03_16_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_03_16_03 2021_03_16_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1615900765788444704'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1615900765788444704');

-- Delete obsolete creature text
DELETE FROM `creature_text` WHERE `CreatureID` IN (6224,6222) AND `GroupID` = 0 AND `ID` BETWEEN 1 AND 3;

-- Conditions for spells "Supercharge" and "Tune Up"
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (10732,10348);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (6224,6222);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,7,10732,0,1,31,0,3,6230,0,0,0,0,'Spell ''Supercharge'' (Leprous Machinesmith) - Implicit Target ''Peacekeeper Security Suit'''),
(13,7,10732,0,2,31,0,3,6233,0,0,0,0,'Spell ''Supercharge'' (Leprous Machinesmith) - Implicit Target ''Mechanized Sentry'''),
(13,7,10732,0,3,31,0,3,6234,0,0,0,0,'Spell ''Supercharge'' (Leprous Machinesmith) - Implicit Target ''Mechanized Guardian'''),
(13,7,10732,0,4,31,0,3,6225,0,0,0,0,'Spell ''Supercharge'' (Leprous Machinesmith) - Implicit Target ''Mechano-Tank'''),
(13,7,10732,0,5,31,0,3,6226,0,0,0,0,'Spell ''Supercharge'' (Leprous Machinesmith) - Implicit Target ''Mechano-Flamewalker'''),
(13,7,10732,0,6,31,0,3,6227,0,0,0,0,'Spell ''Supercharge'' (Leprous Machinesmith) - Implicit Target ''Mechano-Frostwalker'''),

(13,7,10348,0,1,31,0,3,6230,0,0,0,0,'Spell ''Tune Up'' (Leprous Machinesmith / Technician) - Implicit Target ''Peacekeeper Security Suit'''),
(13,7,10348,0,2,31,0,3,6233,0,0,0,0,'Spell ''Tune Up'' (Leprous Machinesmith / Technician) - Implicit Target ''Mechanized Sentry'''),
(13,7,10348,0,3,31,0,3,6234,0,0,0,0,'Spell ''Tune Up'' (Leprous Machinesmith / Technician) - Implicit Target ''Mechanized Guardian'''),
(13,7,10348,0,4,31,0,3,6225,0,0,0,0,'Spell ''Tune Up'' (Leprous Machinesmith / Technician) - Implicit Target ''Mechano-Tank'''),
(13,7,10348,0,5,31,0,3,6226,0,0,0,0,'Spell ''Tune Up'' (Leprous Machinesmith / Technician) - Implicit Target ''Mechano-Flamewalker'''),
(13,7,10348,0,6,31,0,3,6227,0,0,0,0,'Spell ''Tune Up'' (Leprous Machinesmith / Technician) - Implicit Target ''Mechano-Frostwalker'''),

(22,1,6224,0,1,29,1,6230,10,0,0,0,0,'Leprous Machinesmith - Execute SAI only if near ''Peacekeeper Security Suit'''),
(22,1,6224,0,2,29,1,6233,10,0,0,0,0,'Leprous Machinesmith - Execute SAI only if near ''Mechanized Sentry'''),
(22,1,6224,0,3,29,1,6234,10,0,0,0,0,'Leprous Machinesmith - Execute SAI only if near ''Mechanized Guardian'''),
(22,1,6224,0,4,29,1,6225,10,0,0,0,0,'Leprous Machinesmith - Execute SAI only if near ''Mechano-Tank'''),
(22,1,6224,0,5,29,1,6226,10,0,0,0,0,'Leprous Machinesmith - Execute SAI only if near ''Mechano-Flamewalker'''),
(22,1,6224,0,6,29,1,6227,10,0,0,0,0,'Leprous Machinesmith - Execute SAI only if near ''Mechano-Frostwalker'''),

(22,3,6224,0,1,29,1,6230,5,0,0,0,0,'Leprous Machinesmith - Execute SAI only if near ''Peacekeeper Security Suit'''),
(22,3,6224,0,2,29,1,6233,5,0,0,0,0,'Leprous Machinesmith - Execute SAI only if near ''Mechanized Sentry'''),
(22,3,6224,0,3,29,1,6234,5,0,0,0,0,'Leprous Machinesmith - Execute SAI only if near ''Mechanized Guardian'''),
(22,3,6224,0,4,29,1,6225,5,0,0,0,0,'Leprous Machinesmith - Execute SAI only if near ''Mechano-Tank'''),
(22,3,6224,0,5,29,1,6226,5,0,0,0,0,'Leprous Machinesmith - Execute SAI only if near ''Mechano-Flamewalker'''),
(22,3,6224,0,6,29,1,6227,5,0,0,0,0,'Leprous Machinesmith - Execute SAI only if near ''Mechano-Frostwalker'''),

(22,3,6222,0,1,29,1,6230,5,0,0,0,0,'Leprous Technician - Execute SAI only if near ''Peacekeeper Security Suit'''),
(22,3,6222,0,2,29,1,6233,5,0,0,0,0,'Leprous Technician - Execute SAI only if near ''Mechanized Sentry'''),
(22,3,6222,0,3,29,1,6234,5,0,0,0,0,'Leprous Technician - Execute SAI only if near ''Mechanized Guardian'''),
(22,3,6222,0,4,29,1,6225,5,0,0,0,0,'Leprous Technician - Execute SAI only if near ''Mechano-Tank'''),
(22,3,6222,0,5,29,1,6226,5,0,0,0,0,'Leprous Technician - Execute SAI only if near ''Mechano-Flamewalker'''),
(22,3,6222,0,6,29,1,6227,5,0,0,0,0,'Leprous Technician - Execute SAI only if near ''Mechano-Frostwalker''');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (6224,6222) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6224,0,0,0,0,0,100,0,4000,5000,20000,25000,0,11,10732,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Leprous Machinesmith - IC - Cast ''Supercharge'''),
(6224,0,1,0,0,0,100,0,2000,5000,4000,6000,0,11,13398,64,0,0,0,0,21,30,0,0,0,0,0,0,0,'Leprous Machinesmith - IC CMC - Cast ''Throw Wrench'''),
(6224,0,2,0,1,0,100,0,10000,45000,30000,70000,0,11,10348,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Leprous Machinesmith - OOC - Cast ''Tune Up'''),
(6224,0,3,0,8,0,100,0,9798,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Leprous Machinesmith - On Spellhit ''Radiation'' - Say Line 0'),
(6224,0,4,0,4,0,20,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Leprous Machinesmith - On Aggro - Say Line 1'),

(6222,0,0,0,4,0,100,0,0,0,0,0,0,11,12024,64,0,0,0,0,7,0,0,0,0,0,0,0,0,'Leprous Technician - On Aggro CMC - Cast ''Net'''),
(6222,0,1,0,0,0,100,0,2000,5000,6000,8000,0,11,13398,64,0,0,0,0,21,30,0,0,0,0,0,0,0,'Leprous Technician - IC CMC - Cast ''Throw Wrench'''),
(6222,0,2,0,1,0,100,0,10000,45000,30000,70000,0,11,10348,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Leprous Technician - OOC - Cast ''Tune Up'''),
(6222,0,3,0,8,0,100,0,9798,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Leprous Technician - On Spellhit ''Radiation'' - Say Line 0'),
(6222,0,4,0,4,0,20,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Leprous Technician - On Aggro - Say Line 1');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
