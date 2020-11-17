-- DB update 2020_11_16_00 -> 2020_11_17_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_11_16_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_11_16_00 2020_11_17_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1605653505693114808'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1605653505693114808');

-- Ymirheim Spear Gun: Remove unit flags "UNIT_FLAG_REMOVE_CLIENT_CONTROL", "UNIT_FLAG_IMMUNE_TO_PC", "UNIT_FLAG_IMMUNE_TO_NPC";
-- add extra flag "CREATURE_FLAG_EXTRA_NO_XP_AT_KILL"
UPDATE `creature_template` SET `unit_flags` = 0, `flags_extra` = `flags_extra` | 64 WHERE `entry` = 31280;

-- Kor'kron Suppression Turret & Skybreaker Suppression Turret:
-- Remove unit flag "UNIT_FLAG_IMMUNE_TO_NPC"; add unit flag "UNIT_FLAG_NON_ATTACKABLE"
UPDATE `creature_template` SET `unit_flags` = (`unit_flags` & ~512)|2 WHERE `entry` IN (31884,32227);

-- Ymirheim Spear Gun: Decrease respawn time
UPDATE `creature` SET `spawntimesecs` = 10 WHERE `id` = 31280;

-- Skybreaker Troop Transport: Remove obsolete creature spawn
DELETE FROM `creature` WHERE `id` = 32225;

-- Ymirheim Spear Gun: Remove obsolete conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceGroup` IN (1,2) AND `SourceEntry` = 31280 AND `SourceId` = 0;

-- SAI scripts
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (31280,31834,31882,31881,31808,32222,32225) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3128000,3188200,3188100,3222200,3222500) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(31280,0,0,0,1,1,100,0,1500,1500,1500,1500,0,11,59894,0,0,0,0,0,19,31881,90,0,0,0,0,0,0,'Ymirheim Spear Gun - Out of Combat - Cast ''Launch Spear'' At ''Kor''kron Troop Transport'' (Phase 1)'),
(31280,0,1,0,1,1,100,0,1500,1500,1500,1500,0,11,59894,0,0,0,0,0,19,32225,90,0,0,0,0,0,0,'Ymirheim Spear Gun - Out of Combat - Cast ''Launch Spear'' At ''Skybreaker Troop Transport'' (Phase 1)'),
(31280,0,2,3,8,0,100,0,59880,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ymirheim Spear Gun - On Spellhit ''Suppression Charge'' - Set Event Phase 2'),
(31280,0,3,0,61,0,100,0,59880,0,0,0,0,80,3128000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ymirheim Spear Gun - On Spellhit ''Suppression Charge'' - Call Timed Action List'),
(31280,0,4,5,25,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ymirheim Spear Gun - On Reset - Set Event Phase 1'),
(31280,0,5,6,61,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ymirheim Spear Gun - Linked - Stop Auto Attack'),
(31280,0,6,0,61,0,100,0,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ymirheim Spear Gun - Linked - Stop Combat Movement'),
(31280,0,7,0,6,0,100,0,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ymirheim Spear Gun - On Death - Force Despawn'),

(3128000,9,0,0,0,0,100,0,15000,15000,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ymirheim Spear Gun - On Script - Set Event Phase 1'),

-- Horde
(31834,0,0,0,19,0,100,0,13310,0,0,0,0,12,31881,8,0,0,0,0,8,0,0,0,0,7505.81,1707.04,350.194,1.53589,'Ground Commander Xutjja - On Quest Accept ''Assault by Air'' - Summon Creature ''Kor''kron Troop Transport'''),

(31882,0,0,0,23,0,100,257,46598,0,0,0,0,80,3188200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Infiltrator - On Aura ''Ride Vehicle Hardcoded'' Removed - Call Timed Action List (No Repeat, No Reset)'),

(3188200,9,0,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Infiltrator - On Script - Set Home Position'),
(3188200,9,1,0,0,0,100,0,0,0,0,0,0,11,59977,0,0,0,0,0,21,20,0,0,0,0,0,0,0,'Kor''kron Infiltrator - On Script - Cast ''Horde Air Dropoff Kill Credit'''),
(3188200,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Infiltrator - On Script - Say Line 0'),
(3188200,9,3,0,0,0,100,0,500,500,0,0,0,75,44795,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Infiltrator - On Script - Add Aura ''Parachute'''),
(3188200,9,4,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Infiltrator - On Script - Force Despawn'),

(31881,0,0,0,38,0,100,0,1,0,0,0,0,80,3188100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Troop Transport - On Data Set 1 0 - Call Timed Action List'),
(31881,0,1,0,40,0,100,0,11,31881,0,0,0,11,64631,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Troop Transport - On WP 11 Reached - Cast ''Eject Passenger 3'''),
(31881,0,2,0,40,0,100,0,16,31881,0,0,0,11,64632,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Troop Transport - On WP 16 Reached - Cast ''Eject Passenger 4'''),
(31881,0,3,0,40,0,100,0,19,31881,0,0,0,11,64633,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Troop Transport - On WP 19 Reached - Cast ''Eject Passenger 5'''),
(31881,0,4,0,40,0,100,0,22,31881,0,0,0,11,64634,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Troop Transport - On WP 22 Reached - Cast ''Eject Passenger 6'''),
(31881,0,5,0,40,0,100,0,32,31881,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Troop Transport - On WP 32 Reached - Force Despawn'),
(31881,0,6,0,6,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,11,31882,5,0,0,0,0,0,0,'Kor''kron Troop Transport - On Death - Force Despawn ''Kor''kron Infiltrator'''),
(31881,0,7,0,8,0,100,0,59894,0,0,0,0,232,1,0,0,0,0,0,29,2,0,0,0,0,0,0,0,'Kor''kron Troop Transport - On Spellhit ''Launch Spear'' - Copy Health Percentage To ''Kor''kron Suppression Turret'''),

(3188100,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Troop Transport - On Script - Set Active On'),
(3188100,9,1,0,0,0,100,0,2000,2000,0,0,0,53,1,31881,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Troop Transport - On Script - Start WP Movement'),
(3188100,9,2,0,0,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Troop Transport - On Script - Set React State ''Passive'''),
(3188100,9,3,0,0,0,100,0,0,0,0,0,0,18,131072,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Troop Transport - On Script - Set ''UNIT_FLAG_PACIFIED'''),
(3188100,9,4,0,0,0,100,0,0,0,0,0,0,102,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Troop Transport - On Script - Set Health Regeneration Off'),

-- Alliance
(31808,0,0,0,19,0,100,0,13309,0,0,0,0,12,32225,8,0,0,0,0,8,0,0,0,0,7303.23,1520.81,323.296,3.48084,'Ground Commander Koup - On Quest Accept ''Assault by Air'' - Summon Creature ''Skybreaker Troop Transport'''),

(32222,0,0,0,23,0,100,257,46598,0,0,0,0,80,3222200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Infiltrator - On Aura ''Ride Vehicle Hardcoded'' Removed - Call Timed Action List (No Repeat, No Reset)'),

(3222200,9,0,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Infiltrator - On Script - Set Home Position'),
(3222200,9,1,0,0,0,100,0,0,0,0,0,0,11,60208,0,0,0,0,0,21,20,0,0,0,0,0,0,0,'Skybreaker Infiltrator - On Script - Cast ''Ally Air Dropoff Kill Credit'''),
(3222200,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Infiltrator - On Script - Say Line 0'),
(3222200,9,3,0,0,0,100,0,500,500,0,0,0,75,44795,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Infiltrator - On Script - Add Aura ''Parachute'''),
(3222200,9,4,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Infiltrator - On Script - Force Despawn'),

(32225,0,0,0,38,0,100,0,1,0,0,0,0,80,3222500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Troop Transport - On Data Set 1 0 - Call Timed Action List'),
(32225,0,1,0,40,0,100,0,9,32225,0,0,0,11,64631,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Troop Transport - On WP 9 Reached - Cast ''Eject Passenger 3'''),
(32225,0,2,0,40,0,100,0,13,32225,0,0,0,11,64632,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Troop Transport - On WP 13 Reached - Cast ''Eject Passenger 4'''),
(32225,0,3,0,40,0,100,0,17,32225,0,0,0,11,64633,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Troop Transport - On WP 17 Reached - Cast ''Eject Passenger 5'''),
(32225,0,4,0,40,0,100,0,22,32225,0,0,0,11,64634,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Troop Transport - On WP 22 Reached - Cast ''Eject Passenger 6'''),
(32225,0,5,0,40,0,100,0,34,32225,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Troop Transport - On WP 34 Reached - Force Despawn'),
(32225,0,6,0,6,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,11,32222,5,0,0,0,0,0,0,'Skybreaker Troop Transport - On Death - Force Despawn ''Skybreaker Infiltrator'''),
(32225,0,7,0,8,0,100,0,59894,0,0,0,0,232,1,0,0,0,0,0,29,2,0,0,0,0,0,0,0,'Skybreaker Troop Transport - On Spellhit ''Launch Spear'' - Copy Health Percentage To ''Skybreaker Suppression Turret'''),

(3222500,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Troop Transport - On Script - Set Active On'),
(3222500,9,1,0,0,0,100,0,2000,2000,0,0,0,53,1,32225,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Troop Transport - On Script - Start WP Movement'),
(3222500,9,2,0,0,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Troop Transport - On Script - Set React State ''Passive'''),
(3222500,9,3,0,0,0,100,0,0,0,0,0,0,18,131072,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Troop Transport - On Script - Set ''UNIT_FLAG_PACIFIED'''),
(3222500,9,4,0,0,0,100,0,0,0,0,0,0,102,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Troop Transport - On Script - Set Health Regeneration Off');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
