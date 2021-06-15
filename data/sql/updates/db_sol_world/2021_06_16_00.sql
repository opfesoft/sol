-- DB update 2021_06_15_00 -> 2021_06_16_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_15_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_15_00 2021_06_16_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1623794685425744847'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1623794685425744847');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 4951;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 4951;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (495100,495101);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4951,0,0,0,25,0,100,0,0,0,0,0,0,17,333,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Practicing Guard - On Reset - Set Emote State ''STATE_READY1H'''),
(4951,0,1,0,1,0,100,0,2000,3000,2000,3000,0,87,495100,495100,495100,495100,495100,495101,1,0,0,0,0,0,0,0,0,'Theramore Practicing Guard - OOC - Call Random Timed Action List'),

(495100,9,0,0,0,0,100,0,0,0,0,0,0,5,36,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Practicing Guard - On Script - Play Emote ''ONESHOT_ATTACK1H'''),
(495100,9,1,0,0,0,100,0,500,500,0,0,0,5,33,0,0,0,0,0,19,4952,5,0,0,0,0,0,0,'Theramore Practicing Guard - On Script - Play Emote ''ONESHOT_WOUND'' (Theramore Combat Dummy)'),
(495100,9,2,0,0,0,100,0,0,0,0,0,0,4,151,0,1,0,0,0,19,4952,5,0,0,0,0,0,0,'Theramore Practicing Guard - On Script - Play Sound ''Sword1H_ShieldWood'' (Theramore Combat Dummy)'),

(495101,9,0,0,0,0,100,0,0,0,0,0,0,5,54,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Practicing Guard - On Script - Play Emote ''ONESHOT_SPECIALATTACK1H'''),
(495101,9,1,0,0,0,100,0,500,500,0,0,0,5,34,0,0,0,0,0,19,4952,5,0,0,0,0,0,0,'Theramore Practicing Guard - On Script - Play Emote ''ONESHOT_WOUNDCRITICAL'' (Theramore Combat Dummy)'),
(495101,9,2,0,0,0,100,0,0,0,0,0,0,4,151,0,1,0,0,0,19,4952,5,0,0,0,0,0,0,'Theramore Practicing Guard - On Script - Play Sound ''Sword1H_ShieldWood'' (Theramore Combat Dummy)');

-- Theramore Combat Dummy: Add missing CreatureScript; adjust "mechanic_immune_mask" and "flags_extra" according to similar training dummies
UPDATE `creature_template` SET `mechanic_immune_mask` = 32, `flags_extra` = 262144, `ScriptName` = 'npc_training_dummy' WHERE `entry` = 4952;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
