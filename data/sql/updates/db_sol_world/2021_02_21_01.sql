-- DB update 2021_02_21_00 -> 2021_02_21_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_21_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_21_00 2021_02_21_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1613894931276853620'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1613894931276853620');

UPDATE `creature_template` SET `faction` = 35 WHERE `entry` = 19259;

DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1925900;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1925900,9,0,0,0,0,100,0,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infernal Invader - On Script - Set Visibility Off'),
(1925900,9,1,0,0,0,100,0,0,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infernal Invader - On Script - Enable Random Movement'),
(1925900,9,2,0,0,0,100,0,0,10000,0,0,0,12,12999,3,10000,0,0,0,1,0,0,0,0,0,0,10,0,'Infernal Invader - On Script - Summon ''World Invisible Trigger'''),
(1925900,9,3,0,0,0,100,0,4000,4000,0,0,0,86,32785,0,12,1,0,0,1,0,0,0,0,0,0,10,0,'Infernal Invader - On Script - Cross Cast ''Infernal Rain'''),
(1925900,9,4,0,0,0,100,0,1000,1000,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infernal Invader - On Script - Set Visibility On'),
(1925900,9,5,0,0,0,100,0,0,0,0,0,0,2,90,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infernal Invader - On Script - Set Faction 90'),
(1925900,9,6,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,68780,19257,0,0,0,0,0,0,'Infernal Invader - On Script - Set Data 1 1 (Arcanist Torseldori)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
