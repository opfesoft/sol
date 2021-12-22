-- DB update 2021_12_22_00 -> 2021_12_22_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_22_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_22_00 2021_12_22_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1640198346562346113'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1640198346562346113');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` IN (8530,8531,8532,11064);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (8530,8531,8532,11064);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8530,0,0,0,11,0,100,0,0,0,0,0,0,11,26047,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cannibal Ghoul - On Respawn - Cast ''Birth'''),
(8530,0,1,0,6,0,100,0,0,0,0,0,0,12,11064,3,60000,0,0,0,1,0,0,0,0,0,0,0,0,'Cannibal Ghoul - On Death - Summon Creature ''Darrowshire Spirit'''),

(8531,0,0,0,0,0,100,0,6000,12000,22000,28000,0,11,12889,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gibbering Ghoul - IC - Cast ''Curse of Tongues'''),
(8531,0,1,0,6,0,100,0,0,0,0,0,0,12,11064,3,60000,0,0,0,1,0,0,0,0,0,0,0,0,'Gibbering Ghoul - On Death - Summon Creature ''Darrowshire Spirit'''),

(8532,0,0,0,11,0,100,0,0,0,0,0,0,11,26047,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Diseased Flayer - On Respawn - Cast ''Birth'''),
(8532,0,1,0,6,0,100,0,0,0,0,0,0,12,11064,3,60000,0,0,0,1,0,0,0,0,0,0,0,0,'Diseased Flayer - On Death - Summon Creature ''Darrowshire Spirit'''),

(11064,0,0,1,54,0,100,0,0,0,0,0,0,11,17321,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darrowshire Spirit - On Just Summoned - Cast ''Spirit Spawn-in'''),
(11064,0,1,0,61,0,100,0,0,0,0,0,0,11,17327,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darrowshire Spirit - Linked - Cast ''Spirit Particles'''),
(11064,0,2,3,64,0,100,1,0,0,0,0,0,33,11064,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Darrowshire Spirit - On Gossip Hello - Kill Credit ''Darrowshire Spirit'''),
(11064,0,3,0,61,0,100,1,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darrowshire Spirit - Linked - Despawn after 10 seconds');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
