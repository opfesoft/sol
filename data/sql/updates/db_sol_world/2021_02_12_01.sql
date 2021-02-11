-- DB update 2021_02_12_00 -> 2021_02_12_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_12_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_12_00 2021_02_12_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1613087297052854570'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1613087297052854570');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 18317;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1831700,1831701);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18317,0,0,0,4,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereal Priest - On Aggro - Say Line 0'),
(18317,0,1,0,14,0,100,2,1000,40,7000,10000,0,11,34945,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ethereal Priest - Friendly At 1000 Health - Cast ''Heal'' (Normal Dungeon)'),
(18317,0,2,0,14,0,100,4,1000,40,7000,10000,0,11,22883,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ethereal Priest - Friendly At 1000 Health - Cast ''Heal'' (Heroic Dungeon)'),
(18317,0,3,0,0,0,100,2,6700,7900,16000,18000,0,11,34944,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereal Priest - IC - Cast ''Holy Nova'' (Normal Dungeon)'),
(18317,0,4,0,0,0,100,4,6700,7900,16000,18000,0,11,37669,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereal Priest - IC - Cast ''Holy Nova'' (Heroic Dungeon)'),
(18317,0,5,0,16,0,100,2,17139,40,7000,10000,0,80,1831700,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereal Priest - Friendly Missing Buff - Cast ''Power Word: Shield'' (Normal Dungeon)'),
(18317,0,6,0,16,0,100,4,35944,40,7000,10000,0,80,1831701,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereal Priest - Friendly Missing Buff - Cast ''Power Word: Shield'' (Heroic Dungeon)'),

(1831700,9,0,0,0,0,100,2,0,0,0,0,0,11,17139,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ethereal Priest - On Script - Cast ''Power Word: Shield'' (Normal Dungeon)'),
(1831701,9,0,0,0,0,100,4,0,0,0,0,0,11,35944,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ethereal Priest - On Script - Cast ''Power Word: Shield'' (Heroic Dungeon)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
