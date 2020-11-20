-- DB update 2020_11_18_00 -> 2020_11_21_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_11_18_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_11_18_00 2020_11_21_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1605916100959767493'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1605916100959767493');

-- Remove obsolete spell trigger (handled via SAI)
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 47962;

-- Abandoned Fuel Tank: Disable turning and decrease respawn time
UPDATE `creature_template` SET `unit_flags2` = `unit_flags2` | 32768 WHERE `entry` = 27064;
UPDATE `creature` SET `spawntimesecs` = 30 WHERE `id` = 27064;

-- SAI scripts
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 25469;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (27106,27107,27108,27110,25469,27064) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27106,0,0,1,8,0,100,1,47962,0,0,0,0,85,47967,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Injured Warsong Warrior - On Spell hit - Cast Killcredit on Invoker'),
(27106,0,1,2,61,0,100,0,47962,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Injured Warsong Warrior - Linked - Set Phase 1'),
(27106,0,2,0,61,0,100,0,47962,0,0,0,0,11,46598,0,0,0,0,0,19,25334,5,0,0,0,0,0,0,'Injured Warsong Warrior - Linked - Cast ''Ride Vehicle Hardcoded'' At ''Horde Siege Tank'''),
(27106,0,3,0,23,1,100,0,46598,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Injured Warsong Warrior - On Aura ''Ride Vehicle Hardcoded'' Removed - Force Despawn'),

(27107,0,0,1,8,0,100,1,47962,0,0,0,0,85,47967,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Injured Warsong Mage - On Spell hit - Cast Killcredit on Invoker'),
(27107,0,1,2,61,0,100,0,47962,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Injured Warsong Mage - Linked - Set Phase 1'),
(27107,0,2,0,61,0,100,0,47962,0,0,0,0,11,46598,0,0,0,0,0,19,25334,5,0,0,0,0,0,0,'Injured Warsong Mage - Linked - Cast ''Ride Vehicle Hardcoded'' At ''Horde Siege Tank'''),
(27107,0,3,0,23,1,100,0,46598,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Injured Warsong Mage - On Aura ''Ride Vehicle Hardcoded'' Removed - Force Despawn'),

(27108,0,0,1,8,0,100,1,47962,0,0,0,0,85,47967,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Injured Warsong Shaman - On Spell hit - Cast Killcredit on Invoker'),
(27108,0,1,2,61,0,100,0,47962,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Injured Warsong Shaman - Linked - Set Phase 1'),
(27108,0,2,0,61,0,100,0,47962,0,0,0,0,11,46598,0,0,0,0,0,19,25334,5,0,0,0,0,0,0,'Injured Warsong Shaman - Linked - Cast ''Ride Vehicle Hardcoded'' At ''Horde Siege Tank'''),
(27108,0,3,0,23,1,100,0,46598,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Injured Warsong Shaman - On Aura ''Ride Vehicle Hardcoded'' Removed - Force Despawn'),

(27110,0,0,1,8,0,100,1,47962,0,0,0,0,85,47967,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Injured Warsong Ingenieur - On Spell hit - Cast Killcredit on Invoker'),
(27110,0,1,2,61,0,100,0,47962,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Injured Warsong Ingenieur - Linked - Set Phase 1'),
(27110,0,2,0,61,0,100,0,47962,0,0,0,0,11,46598,0,0,0,0,0,19,25334,5,0,0,0,0,0,0,'Injured Warsong Ingenieur - Linked - Cast ''Ride Vehicle Hardcoded'' At ''Horde Siege Tank'''),
(27110,0,3,0,23,1,100,0,46598,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Injured Warsong Ingenieur - On Aura ''Ride Vehicle Hardcoded'' Removed - Force Despawn'),

(27064,0,0,1,9,0,100,1,0,5,0,0,0,85,47916,2,0,0,0,0,11,25334,5,0,0,0,0,0,0,'Abandoned Fuel Tank - On Range 2yd ''Horde Siege Tank'' - Cast Fuel (No Repeat)'),
(27064,0,1,2,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,19,25334,0,0,0,0,0,0,0,'Abandoned Fuel Tank - Linked - Say Line 0 (''Horde Siege Tank'')'),
(27064,0,2,0,61,0,100,0,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Abandoned Fuel Tank - Linked - Force Despawn'),
(27064,0,3,4,11,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Abandoned Fuel Tank - On Respawn - Disable Auto Attack'),
(27064,0,4,0,61,0,100,0,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Abandoned Fuel Tank - Linked - Disable Combat Movement'),

(25469,0,0,0,11,0,100,0,0,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mindless Aberration - On Respawn - Start Random Movement');

-- Define several conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (27106,27107,27108,27110) AND `SourceId` = 0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceGroup` = 0 AND `SourceEntry` = 47962 AND `SourceId` = 0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceGroup` = 1 AND `SourceEntry` = 50674 AND `SourceId` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(22,1,27106,0,0,151,0,0,0,0,0,0,0,'','Run SAI only if vehicle has an empty seat (used for quest ''The Plains of Nasam'')'),
(22,1,27107,0,0,151,0,0,0,0,0,0,0,'','Run SAI only if vehicle has an empty seat (used for quest ''The Plains of Nasam'')'),
(22,1,27108,0,0,151,0,0,0,0,0,0,0,'','Run SAI only if vehicle has an empty seat (used for quest ''The Plains of Nasam'')'),
(22,1,27110,0,0,151,0,0,0,0,0,0,0,'','Run SAI only if vehicle has an empty seat (used for quest ''The Plains of Nasam'')'),

(17,0,47962,0,0,31,1,3,27106,0,0,0,0,'','Spell requires Injured Warsong Warrior (used for quest ''The Plains of Nasam'') OR'),
(17,0,47962,0,1,31,1,3,27107,0,0,0,0,'','Spell requires Injured Warsong Mage (used for quest ''The Plains of Nasam'') OR'),
(17,0,47962,0,2,31,1,3,27108,0,0,0,0,'','Spell requires Injured Warsong Shaman (used for quest ''The Plains of Nasam'') OR'),
(17,0,47962,0,3,31,1,3,27110,0,0,0,0,'','Spell requires Injured Warsong Engineer (used for quest ''The Plains of Nasam'') OR'),

(13,1,50674,0,0,31,0,3,25469,0,0,0,0,'','Spell only hits Mindless Aberration (used for quest ''The Plains of Nasam'') OR'),
(13,1,50674,0,1,31,0,3,25333,0,0,0,0,'','Spell only hits Undying Aggressor (used for quest ''The Plains of Nasam'') OR'),
(13,1,50674,0,2,31,0,3,25332,0,0,0,0,'','Spell only hits Stitched Warsong Horror (used for quest ''The Plains of Nasam'') OR');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
