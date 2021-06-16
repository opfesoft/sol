-- DB update 2021_06_16_01 -> 2021_06_16_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_16_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_16_01 2021_06_16_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1623859421826202740'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1623859421826202740');

UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 19139;
DELETE FROM `creature` WHERE `guid` = 86753;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (19139,19140,19141);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1914000,1914001,1914002);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19140,0,0,0,1,0,100,0,2000,3000,2000,3000,0,87,1914000,1914000,1914000,1914000,1914001,1914002,1,0,0,0,0,0,0,0,0,'Mag''har Pitfighter - OOC - Call Random Timed Action List'),

(19141,0,0,0,1,0,100,0,2000,3000,2000,3000,0,87,1914000,1914000,1914000,1914000,1914001,1914002,1,0,0,0,0,0,0,0,0,'Kurenai Pitfighter - OOC - Call Random Timed Action List'),

(1914000,9,0,0,0,0,100,0,0,0,0,0,0,5,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mag''har Pitfighter - On Script - Play Emote ''ONESHOT_ATTACKUNARMED'''),
(1914000,9,1,0,0,0,100,0,500,500,0,0,0,5,33,0,0,0,0,0,19,19139,5,0,0,0,0,0,0,'Mag''har Pitfighter - On Script - Play Emote ''ONESHOT_WOUND'' (Nagrand Target Dummy)'),
(1914000,9,2,0,0,0,100,0,0,0,0,0,0,4,1022,0,1,0,0,0,19,19139,5,0,0,0,0,0,0,'Mag''har Pitfighter - On Script - Play Sound ''Unarmed_ShieldWood'' (Nagrand Target Dummy)'),

(1914001,9,0,0,0,0,100,0,0,0,0,0,0,5,54,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mag''har Pitfighter - On Script - Play Emote ''ONESHOT_SPECIALATTACK1H'''),
(1914001,9,1,0,0,0,100,0,500,500,0,0,0,5,34,0,0,0,0,0,19,19139,5,0,0,0,0,0,0,'Mag''har Pitfighter - On Script - Play Emote ''ONESHOT_WOUNDCRITICAL'' (Nagrand Target Dummy)'),
(1914001,9,2,0,0,0,100,0,0,0,0,0,0,4,3720,0,1,0,0,0,19,19139,5,0,0,0,0,0,0,'Mag''har Pitfighter - On Script - Play Sound ''2hMaceHitWood'' (Nagrand Target Dummy)'),

(1914002,9,0,0,0,0,100,0,0,0,0,0,0,5,60,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mag''har Pitfighter - On Script - Play Emote ''ONESHOT_KICK'''),
(1914002,9,1,0,0,0,100,0,500,500,0,0,0,5,33,0,0,0,0,0,19,19139,5,0,0,0,0,0,0,'Mag''har Pitfighter - On Script - Play Emote ''ONESHOT_WOUND'' (Nagrand Target Dummy)'),
(1914002,9,2,0,0,0,100,0,0,0,0,0,0,4,1022,0,1,0,0,0,19,19139,5,0,0,0,0,0,0,'Mag''har Pitfighter - On Script - Play Sound ''Unarmed_ShieldWood'' (Nagrand Target Dummy)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
