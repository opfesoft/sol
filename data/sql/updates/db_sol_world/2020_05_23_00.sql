-- DB update 2020_05_20_00 -> 2020_05_23_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_05_20_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_05_20_00 2020_05_23_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1590186417797857921'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1590186417797857921');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-68311,-68312,-68313,-68314) AND `source_type` = 0 AND `id` = 12;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-68314,0,12,0,11,0,100,0,0,0,0,0,0,41,900000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wrath Master - On Respawn - Despawn After 15 Minutes'),
(-68313,0,12,0,11,0,100,0,0,0,0,0,0,41,900000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wrath Master - On Respawn - Despawn After 15 Minutes'),
(-68312,0,12,0,11,0,100,0,0,0,0,0,0,41,900000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wrath Master - On Respawn - Despawn After 15 Minutes'),
(-68311,0,12,0,11,0,100,0,0,0,0,0,0,41,900000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wrath Master - On Respawn - Despawn After 15 Minutes');

UPDATE `smart_scripts` SET `action_param2` = 3, `action_param3` = 900000 WHERE `entryorguid` IN (1900500,1900501,1900502,1900503) AND `source_type` = 9 AND `action_type` = 12 AND `action_param1` = 18944;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
