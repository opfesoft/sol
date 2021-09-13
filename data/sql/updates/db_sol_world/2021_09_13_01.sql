-- DB update 2021_09_13_00 -> 2021_09_13_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_13_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_13_00 2021_09_13_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1631527351105413175'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1631527351105413175');

UPDATE `creature_addon` SET `auras` = NULL WHERE `guid` IN (67349,67351,67353,67354,67355,67363,67364,67369);

DELETE FROM `smart_scripts` WHERE `entryorguid` = 20248 AND `source_type` = 0 AND `id` = 2;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (18855,20134,20139,19643,20135,19657,20207,19707);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20248,0,2,0,4,0,100,0,0,0,0,0,0,11,35778,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Nethermancer - On Aggro - Cast ''Bloodcrystal Surge'''),

(18855,0,0,0,9,0,100,0,0,30,3400,4800,0,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Magister - Within 0-30 Range - Cast ''Fireball'''),
(18855,0,1,0,4,0,100,0,0,0,0,0,0,11,35778,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Magister - On Aggro - Cast ''Bloodcrystal Surge'''),
(18855,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Magister - Between 0-15% Health - Flee For Assist (No Repeat)'),
(18855,0,3,0,1,0,100,0,10000,20000,15000,30000,0,87,2024800,2024801,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Magister - OOC - Call Random Timed Action List'),

(20134,0,0,0,9,0,100,0,0,30,3400,4800,0,11,34446,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Arcanist - Within 0-30 Range - Cast ''Arcane Missiles'''),
(20134,0,1,0,4,0,100,0,0,0,0,0,0,11,35778,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Arcanist - On Aggro - Cast ''Bloodcrystal Surge'''),
(20134,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Sunfury Arcanist - Between 0-15% Health - Flee For Assist (No Repeat)'),
(20134,0,3,0,1,0,100,0,10000,20000,15000,30000,0,87,2024800,2024801,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Arcanist - OOC - Call Random Timed Action List'),

(20139,0,0,0,9,0,100,0,0,30,3400,4800,0,11,9672,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Conjurer - Within 0-30 Range - Cast ''Frostbolt'''),
(20139,0,1,0,0,0,100,0,9000,14000,12000,16000,0,11,11829,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Sunfury Conjurer - IC - Cast ''Flamestrike'''),
(20139,0,2,0,4,0,100,0,0,0,0,0,0,11,35778,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Conjurer - On Aggro - Cast ''Bloodcrystal Surge'''),
(20139,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Sunfury Conjurer - Between 0-15% Health - Flee For Assist (No Repeat)'),
(20139,0,4,0,1,0,100,0,10000,20000,15000,30000,0,87,2024800,2024801,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Conjurer - OOC - Call Random Timed Action List'),

(19643,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,35917,33,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Astromancer - OOC - Cast ''Fiery Intellect'''),
(19643,0,1,0,9,0,100,0,0,30,3400,4800,0,11,38391,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Astromancer - Within 0-30 Range - Cast ''Scorch'''),
(19643,0,2,0,9,0,100,0,0,30,12000,16000,0,11,35914,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Sunfury Astromancer - Within 0-30 Range - Cast ''Astral Focus'''),

(20135,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,35917,33,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Arch Mage - OOC - Cast ''Fiery Intellect'''),
(20135,0,1,0,9,0,100,0,0,30,3400,4800,0,11,20823,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Arch Mage - Within 0-30 Range - Cast ''Fireball'''),
(20135,0,2,0,9,0,100,0,0,8,11000,15000,1,11,11831,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Arch Mage - Within 0-8 Range - Cast ''Frost Nova'''),

(19657,0,0,0,0,0,100,0,0,0,3400,4800,0,11,19816,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Summoner Kanthin - Within 0-30 Range - Cast ''Fireball'''),
(19657,0,1,0,9,0,100,0,0,8,12000,16000,1,11,11831,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Summoner Kanthin - Within 0-8 Range - Cast ''Frost Nova'''),
(19657,0,2,0,0,0,100,0,10000,14000,18000,21000,0,11,17273,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Summoner Kanthin - IC - Cast ''Pyroblast'''),

(20207,0,0,0,1,0,100,0,5000,5000,10000,70000,0,11,33796,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunfury Bowman - OOC - Cast ''Shoot Bow'''),
(20207,0,1,0,9,0,100,0,5,30,2300,3900,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Bowman - Within 5-30 Range - Cast ''Shoot'''),
(20207,0,2,0,9,0,100,0,10,40,7000,9000,0,11,37847,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Bowman - Within 10-40 Range - Cast ''Immolation Arrow'''),
(20207,0,3,0,9,0,100,0,0,20,12000,15000,0,11,12024,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Bowman - Within 0-20 Range - Cast ''Net'''),
(20207,0,4,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Sunfury Bowman - Between 0-15% Health - Flee For Assist (No Repeat)'),

(19707,0,0,0,9,0,100,0,5,30,2300,3900,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Archer - Within 5-30 Range - Cast ''Shoot'''),
(19707,0,1,0,9,0,100,0,10,40,9000,12000,0,11,37847,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Archer - Within 10-40 Range - Cast ''Immolation Arrow'''),
(19707,0,2,0,9,0,100,0,0,20,12000,15000,0,11,12024,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunfury Archer - Within 0-20 Range - Cast ''Net'''),
(19707,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Sunfury Archer - Between 0-15% Health - Flee For Assist (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
