-- DB update 2022_02_19_02 -> 2022_02_19_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_19_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_19_02 2022_02_19_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1645288106493641478'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1645288106493641478');

DELETE FROM `creature_text` WHERE `CreatureId` = 17716;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(17716,0,0,'Defend yourself, youngling! We''ll see if there''s a Blood Knight in you, yet.',14,0,100,0,0,0,14365,0,'Sangrias Stillblade (Quest ''The First Trial'')');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 17716;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17716,0,0,1,54,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sangrias Stillblade - On Just Summoned - Add ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(17716,0,1,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,8051.86,-7543.99,149.698,0,'Sangrias Stillblade - Linked - Move To Position 1'),
(17716,0,2,3,34,0,100,0,8,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sangrias Stillblade - On Position 1 Reached - Say text 0'),
(17716,0,3,4,61,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sangrias Stillblade - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(17716,0,4,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Sangrias Stillblade - Linked - Start Attacking Stored Target 1 (see GameObjectScript ''go_gilded_brazier'')'),
(17716,0,5,0,9,0,100,1,8,25,0,0,0,11,22120,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sangrias Stillblade - Within 8-25 Range - Cast ''Charge'' (No Repeat)'),
(17716,0,6,0,6,0,100,0,0,0,0,0,0,15,9678,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Sangrias Stillblade - On Death - Reward Quest ''The First Trial'' (Stored Target 1)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
