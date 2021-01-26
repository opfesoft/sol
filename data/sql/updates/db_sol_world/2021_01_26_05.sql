-- DB update 2021_01_26_04 -> 2021_01_26_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_26_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_26_04 2021_01_26_05 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1611697958057966136'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1611697958057966136');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 30273 AND `source_type` = 0 AND `id` IN (2,3);
DELETE FROM `smart_scripts` WHERE `entryorguid` = 30268 AND `source_type` = 0 AND `id` IN (1,2);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(30273,0,2,3,25,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Webbed Crusader - On Reset - Set Root On'),
(30273,0,3,0,61,0,100,0,0,0,0,0,0,18,32768,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Webbed Crusader - Linked - Set ''UNIT_FLAG2_DISABLE_TURN'''),

(30268,0,1,2,25,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Webbed Crusader - On Reset - Set Root On'),
(30268,0,2,0,61,0,100,0,0,0,0,0,0,18,32768,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Webbed Crusader - Linked - Set ''UNIT_FLAG2_DISABLE_TURN''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
