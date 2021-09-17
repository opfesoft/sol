-- DB update 2021_09_17_03 -> 2021_09_17_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_17_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_17_03 2021_09_17_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1631912871034815749'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1631912871034815749');

UPDATE `creature_template` SET `unit_flags` = 0, `dynamicflags` = 0 WHERE `entry` = 36551;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 36551;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(36551,0,0,1,25,0,100,6,0,0,0,0,0,11,69105,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spiteful Apparition - On Reset - Cast ''Soul Horror Visual'' (Dungeon)'),
(36551,0,1,2,61,0,100,6,0,0,0,0,0,11,69136,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spiteful Apparition - Linked - Cast ''Spiteful Apparition Visual'' (Dungeon)'),
(36551,0,2,3,61,0,100,6,0,0,0,0,0,11,41253,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spiteful Apparition - Linked - Cast ''Greater Invisibility'' (Dungeon)'),
(36551,0,3,4,61,0,100,6,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spiteful Apparition - Linked - Set React State ''Defensive'' (Dungeon)'),
(36551,0,4,5,61,0,100,6,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spiteful Apparition - Linked - Disable Auto Attack (Dungeon)'),
(36551,0,5,0,61,0,100,6,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spiteful Apparition - Linked - Set Root Off (Dungeon)'),
(36551,0,6,0,1,0,100,6,0,5000,5000,5000,5000,49,0,0,0,0,0,0,21,20,0,0,0,0,0,0,0,'Spiteful Apparition - OOC - Attack Closest Player (Dungeon)'),
(36551,0,7,0,4,0,100,6,0,0,0,0,0,28,41253,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spiteful Apparition - On Aggro - Remove Aura ''Greater Invisibility'' (Dungeon)'),
(36551,0,8,10,9,0,100,2,0,3,0,0,0,11,68895,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Spiteful Apparition - Within 0-3 Range - Cast ''Spite'' (Normal)'),
(36551,0,9,10,9,0,100,4,0,3,0,0,0,11,70212,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Spiteful Apparition - Within 0-3 Range - Cast ''Spite'' (Heroic)'),
(36551,0,10,11,61,0,100,6,0,0,0,0,0,41,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spiteful Apparition - Linked - Force Despawn (Dungeon)'),
(36551,0,11,0,61,0,100,6,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spiteful Apparition - Linked - Set Root On (Dungeon)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
