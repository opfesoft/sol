-- DB update 2020_06_30_01 -> 2020_06_30_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_06_30_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_06_30_01 2020_06_30_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1593549518542185576'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1593549518542185576');

-- Riven Widow Cocoon: Disable turning; no XP; remove SAI and replace with CreatureScript
UPDATE `creature_template` SET `unit_flags2` = `unit_flags2` | 32768, `flags_extra` = `flags_extra` | 64 WHERE `entry` = 24210;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 24210 AND `source_type` = 0;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_riven_widow_cocoon' WHERE `entry` = 24210;

-- Various SAI additions for the creatures summoned by Riven Widow Cocoon
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (24026,24073,24219);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (24211,24026,24073,24219) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 23989 AND `source_type` = 0 AND `id` >= 1;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 23990 AND `source_type` = 0 AND `id` >= 1;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 23991 AND `source_type` = 0 AND `id` >= 1;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 23959 AND `source_type` = 0 AND `id` = 2;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 23661 AND `source_type` = 0 AND `id` = 3;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 23669 AND `source_type` = 0 AND `id` = 4;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 23662 AND `source_type` = 0 AND `id` = 5;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 23666 AND `source_type` = 0 AND `id` = 11;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(24211,0,0,1,54,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Freed Winterhoof Longrunner - On Just Summoned - Say Line 0'),
(24211,0,1,2,61,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Freed Winterhoof Longrunner - Linked - Follow Summoner'),
(24211,0,2,0,61,0,100,0,0,0,0,0,0,41,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Freed Winterhoof Longrunner - Linked - Despawn In 6000 ms'),

(24026,0,0,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Fanggore Worg - On Just Summoned - Attack Summoner'),

(24073,0,0,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Fearsome Horror - On Just Summoned - Attack Summoner'),
(24073,0,1,0,0,0,100,0,2000,6000,7000,10000,0,11,49861,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Fearsome Horror - In Combat - Cast ''Infected Bite'''),

(24219,0,0,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Baby Riven Widow - On Just Summoned - Attack Summoner'),

(23990,0,1,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Gjalerbron Rune-Caster - On Just Summoned - Attack Summoner'),
(23990,0,2,0,0,0,100,0,500,500,8000,15000,0,11,43453,33,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gjalerbron Rune-Caster - In Combat - Cast ''Rune Ward'''),
(23990,0,3,0,0,0,100,0,1000,3500,3000,3000,0,11,9672,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gjalerbron Rune-Caster - In Combat - Cast ''Frostbolt'''),
(23990,0,4,0,0,0,100,0,6000,8000,10000,12000,0,11,34787,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gjalerbron Rune-Caster - In Combat - Cast ''Freezing Circle'''),

(23991,0,1,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Gjalerbron Warrior - On Just Summoned - Attack Summoner'),
(23991,0,2,0,0,0,100,0,4000,10000,35000,45000,0,11,13730,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gjalerbron Warrior - In Combat - Cast ''Demoralizing Shout'''),
(23991,0,3,0,0,0,100,0,7000,10000,17000,20000,0,11,10966,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gjalerbron Warrior - In Combat - Cast ''Uppercut'''),

(23989,0,1,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Gjalerbron Sleep-Watcher - On Just Summoned - Attack Summoner'),
(23989,0,2,0,0,0,100,0,8000,10000,18000,22000,0,11,15970,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gjalerbron Sleep-Watcher - In Combat - Cast ''Sleep'''),

(23959,0,2,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Darkclaw Bat - On Just Summoned - Attack Summoner'),

(23661,0,3,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Winterskorn Tribesman - On Just Summoned - Attack Summoner'),

(23669,0,4,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Winterskorn Oracle - On Just Summoned - Attack Summoner'),

(23662,0,5,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Winterskorn Woodsman - On Just Summoned - Attack Summoner'),

(23666,0,11,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Winterskorn Berserker - On Just Summoned - Attack Summoner');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
