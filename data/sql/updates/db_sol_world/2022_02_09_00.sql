-- DB update 2022_02_05_01 -> 2022_02_09_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_05_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_05_01 2022_02_09_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1644446363209222161'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1644446363209222161');

-- Set all trigger creatures immune to PCs and NPCs and not selectable
UPDATE `creature_template` SET `unit_flags` = 33555200 WHERE `entry` IN (16044,16045,16046,16047,16048);

-- Remove obsolete Isalien Trigger spawn (there were 2 of them)
DELETE FROM `creature` WHERE `guid` = 248562;

-- Increase diameter for the spell focus objects used for Lord Valthalak
UPDATE `gameobject_template` SET `data1` = 40 WHERE `entry` = 181050;
UPDATE `gameobject` SET `id` = 181094 WHERE `guid` = 268880;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (16044,16045,16046,16047,16048);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16044,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mor Grayhoof Trigger - On Respawn - Disable Event Phase Reset'),
(16044,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mor Grayhoof Trigger - Linked - Set Event Phase 1'),
(16044,0,2,4,8,1,100,0,27184,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mor Grayhoof Trigger - On Spell Hit ''Summon Mor Grayhoof DND'' - Set Event Phase 2 (Phase 1)'),
(16044,0,3,4,8,1,100,0,27203,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mor Grayhoof Trigger - On Spell Hit ''Summon Various DND'' - Set Event Phase 2 (Phase 1)'),
(16044,0,4,0,61,0,100,0,0,0,0,0,0,12,16080,1,30000,0,0,0,1,0,0,0,0,0,0,0,0,'Mor Grayhoof Trigger - Linked - Summon Creature ''Mor Grayhoof'''),

(16045,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Isalien Trigger - On Respawn - Disable Event Phase Reset'),
(16045,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Isalien Trigger - Linked - Set Event Phase 1'),
(16045,0,2,4,8,1,100,0,27190,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Isalien Trigger - On Spell Hit ''Summon Isalien DND'' - Set Event Phase 2 (Phase 1)'),
(16045,0,3,4,8,1,100,0,27203,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Isalien Trigger - On Spell Hit ''Summon Various DND'' - Set Event Phase 2 (Phase 1)'),
(16045,0,4,0,61,0,100,0,0,0,0,0,0,12,16097,1,30000,0,0,0,1,0,0,0,0,0,0,0,0,'Isalien Trigger - Linked - Summon Creature ''Isalien'''),

(16046,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jarien and Sothos Trigger - On Respawn - Disable Event Phase Reset'),
(16046,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jarien and Sothos Trigger - Linked - Set Event Phase 1'),
(16046,0,2,4,8,1,100,0,27191,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jarien and Sothos Trigger - On Spell Hit ''Summon Jarien and Sothos DND'' - Set Event Phase 2 (Phase 1)'),
(16046,0,3,4,8,1,100,0,27203,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jarien and Sothos Trigger - On Spell Hit ''Summon Various DND'' - Set Event Phase 2 (Phase 1)'),
(16046,0,4,5,61,0,100,1,0,0,0,0,0,12,16101,1,30000,0,0,0,8,0,0,0,0,3426.22,-3054.4,136.499,5.2,'Jarien and Sothos Trigger - Linked - Summon Creature ''Jarien'''),
(16046,0,5,0,61,0,100,1,0,0,0,0,0,12,16102,1,30000,0,0,0,8,0,0,0,0,3420.8,-3057.8,136.499,5.3,'Jarien and Sothos Trigger - Linked - Summon Creature ''Sothos'''),

(16047,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kormok Trigger - On Respawn - Disable Event Phase Reset'),
(16047,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kormok Trigger - Linked - Set Event Phase 1'),
(16047,0,2,4,8,1,100,0,27201,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kormok Trigger - On Spell Hit ''Summon Kormok DND'' - Set Event Phase 2 (Phase 1)'),
(16047,0,3,4,8,1,100,0,27203,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kormok Trigger - On Spell Hit ''Summon Various DND'' - Set Event Phase 2 (Phase 1)'),
(16047,0,4,0,61,0,100,0,0,0,0,0,0,12,16118,1,30000,0,0,0,1,0,0,0,0,0,0,0,0,'Kormok Trigger - Linked - Summon Creature ''Kormok'''),

(16048,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Valthalak Trigger - On Respawn - Disable Event Phase Reset'),
(16048,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Valthalak Trigger - Linked - Set Event Phase 1'),
(16048,0,2,4,8,1,100,0,27202,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Valthalak Trigger - On Spell Hit ''Summon Lord Valthalak DND'' - Set Event Phase 2 (Phase 1)'),
(16048,0,3,4,8,1,100,0,27203,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Valthalak Trigger - On Spell Hit ''Summon Various DND'' - Set Event Phase 2 (Phase 1)'),
(16048,0,4,0,61,0,100,0,0,0,0,0,0,12,16042,1,30000,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Valthalak Trigger - Linked - Summon Creature ''Lord Valthalak''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
