-- DB update 2021_08_15_00 -> 2021_08_15_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_15_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_15_00 2021_08_15_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1629033653074441233'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1629033653074441233');

-- Apprentice Mirveda's summoned creature group: Disappear if 30s OOC
UPDATE `creature_summon_groups` SET `summonType` = 4, `summonTime` = 30000 WHERE `summonerId` = 15402;

-- Gharsul the Remorseless, Angershade: Remove obsolete WP path
DELETE FROM `waypoints` WHERE `entry` IN (15656,15958);

UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 15958;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (15402,15656,15958);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1540200,1540201,1540202);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(15402,0,0,0,11,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apprentice Mirveda - On Respawn - Set ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(15402,0,1,0,20,0,100,0,8487,0,0,0,0,80,1540200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apprentice Mirveda - On Quest ''Corrupted Soil'' Rewarded - Call Timed Action List'),
(15402,0,2,3,19,0,100,0,8488,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Apprentice Mirveda - On Quest ''Unexpected Results'' Accepted - Store Targetlist ID 1 (Invoker)'),
(15402,0,3,0,61,0,100,0,0,0,0,0,0,80,1540201,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apprentice Mirveda - Linked - Call Timed Action List'),
(15402,0,4,0,0,0,100,0,0,0,5000,8000,0,11,20811,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Apprentice Mirveda - IC - Cast ''Fireball'''),
(15402,0,5,0,6,0,100,0,0,0,0,0,0,6,8488,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Apprentice Mirveda - On Death - Fail Quest ''Unexpected Results'''),

(1540200,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apprentice Mirveda - On Script - Remove ''UNIT_NPC_FLAG_QUESTGIVER'''),
(1540200,9,1,0,0,0,100,0,10000,10000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apprentice Mirveda - On Script - Say Line 0'),
(1540200,9,2,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apprentice Mirveda - On Script - Set ''UNIT_NPC_FLAG_QUESTGIVER'''),

(1540201,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apprentice Mirveda - On Script - Remove ''UNIT_NPC_FLAG_QUESTGIVER'''),
(1540201,9,1,0,0,0,100,0,0,0,0,0,0,2,232,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apprentice Mirveda - On Script - Set Faction ''Escortee'''),
(1540201,9,2,0,0,0,100,0,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apprentice Mirveda - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1540201,9,3,0,0,0,100,0,0,0,0,0,0,107,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Apprentice Mirveda - On Script - Summon Creature Group 0'),
(1540201,9,4,0,0,0,100,0,2000,2000,0,0,0,49,0,0,0,0,0,0,19,15958,0,0,0,0,0,0,0,'Apprentice Mirveda - On Script - Start Attack (Gharsul the Remorseless)'),
(1540201,9,5,0,0,0,100,0,5000,5000,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apprentice Mirveda - On Script - Set ''UNIT_NPC_FLAG_QUESTGIVER'''),
(1540201,9,6,0,0,0,100,0,0,0,0,0,0,2,1604,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apprentice Mirveda - On Script - Set Faction ''Silvermoon City'''),
(1540201,9,7,0,0,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apprentice Mirveda - On Script - Set ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1540201,9,8,0,0,0,100,0,0,0,0,0,0,15,8488,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Apprentice Mirveda - On Script - Complete Quest ''Unexpected Results'''),

(15656,0,0,1,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Angershade - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),
(15656,0,1,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Angershade - Linked - Say Line 0');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
