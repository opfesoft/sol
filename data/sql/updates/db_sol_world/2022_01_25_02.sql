-- DB update 2022_01_25_01 -> 2022_01_25_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_25_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_25_01 2022_01_25_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1643120630772832797'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1643120630772832797');

DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (-9104,-42666);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
-- Alcaz Island Lighthouse
(-9104,1,0,0,11,0,100,0,0,0,0,0,0,67,1,0,0,120000,120000,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Respawn - Create Timed Event 1'),
(-9104,1,1,0,59,0,100,0,1,0,0,0,0,4,7197,1,0,0,0,0,18,150,0,0,0,0,0,0,0,'Alliance Bell - On Timed Event 1 Triggered - Play Direct Sound ''LightHouseFogHorn'' (All Players Within 150y)'),
-- Westfall Lighthouse
(-42666,1,0,0,11,0,100,0,0,0,0,0,0,67,1,0,0,120000,120000,0,1,0,0,0,0,0,0,0,0,'Alliance Bell - On Respawn - Create Timed Event 1'),
(-42666,1,1,0,59,0,100,0,1,0,0,0,0,4,7197,1,0,0,0,0,18,150,0,0,0,0,0,0,0,'Alliance Bell - On Timed Event 1 Triggered - Play Direct Sound ''LightHouseFogHorn'' (All Players Within 150y)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
