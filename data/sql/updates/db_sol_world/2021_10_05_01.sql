-- DB update 2021_10_05_00 -> 2021_10_05_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_05_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_05_00 2021_10_05_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1633446118767104802'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1633446118767104802');

UPDATE `gameobject_template` SET `Data3` = 180000 WHERE `entry` = 179910;

DELETE FROM `event_scripts` WHERE `id` = 8605;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(8605,2,10,14748,60000,-4,393.601,-4831.62,3.23327,0.682843),
(8605,6,10,14748,60000,-4,396.799,-4805.92,11.8856,5.32062),
(8605,4,10,14748,60000,-4,421.357,-4806.02,11.9031,4.16216);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 14748 AND `id` > 2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14748,0,3,4,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vilebranch Kidnapper - On Just Summoned - Set Active On'),
(14748,0,4,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Vilebranch Kidnapper - Linked - Attack Closest Player');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
