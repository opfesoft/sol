-- DB update 2022_02_20_00 -> 2022_02_20_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_20_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_20_00 2022_02_20_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1645381961961077712'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1645381961961077712');

DELETE FROM `creature_template_addon` WHERE `entry` = 14306;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(14306,0,0,0,0,0,0,'22650');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 14306;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 14306;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14306,0,0,0,0,0,100,0,2000,3000,13000,16000,0,11,3252,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Eskhandar - IC - Cast ''Shred'''),
(14306,0,1,0,67,0,100,0,10000,13000,0,0,0,11,8355,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Eskhandar - Behind Target - Cast ''Exploit Weakness''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
