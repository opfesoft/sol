-- DB update 2021_02_15_01 -> 2021_02_15_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_15_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_15_01 2021_02_15_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1613376134123067876'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1613376134123067876');

DELETE FROM `gameobject` WHERE `guid` = 195629;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 6390;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 104593;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (639000,639001,10459300);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6390,0,0,0,54,0,100,0,0,0,0,0,0,80,639000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ulag the Cleaver - On Just Summoned - Call Timed Action List'),
(6390,0,1,0,34,0,100,0,0,1,0,0,0,80,639001,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ulag the Cleaver - On WP 1 Reached - Call Timed Action List'),

(639000,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ulag the Cleaver - On Script - Set Active On'),
(639000,9,1,0,0,0,100,0,0,0,0,0,0,18,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ulag the Cleaver - On Script - Set ''UNIT_FLAG_NON_ATTACKABLE'''),
(639000,9,2,0,0,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ulag the Cleaver - On Script - Set React State ''Passive'''),
(639000,9,3,0,0,0,100,0,0,0,0,0,0,43,0,10721,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ulag the Cleaver - On Script - Mount Model ID 10721'),
(639000,9,4,0,0,0,100,0,2000,2000,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,2375.29,354.41,38.09,0,'Ulag the Cleaver - On Script - Move To Pos'),

(639001,9,0,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ulag the Cleaver - On Script - Set Home Position'),
(639001,9,1,0,0,0,100,0,0,0,0,0,0,43,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ulag the Cleaver - On Script - Dismount'),
(639001,9,2,0,0,0,100,0,0,0,0,0,0,19,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ulag the Cleaver - On Script - Remove ''UNIT_FLAG_NON_ATTACKABLE'''),
(639001,9,3,0,0,0,100,0,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ulag the Cleaver - On Script - Set React State ''Aggressive'''),
(639001,9,4,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Ulag the Cleaver - On Script - Attack Closest Player'),

(104593,1,0,0,70,0,100,0,2,0,0,0,0,80,10459300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mausoleum Trigger - On GO State Changed - Call Timed Action List'),

(10459300,9,0,0,0,0,100,0,0,0,0,0,0,50,103813,0,0,0,0,0,8,0,0,0,0,2388.808,338.269,37.013,2.242750,'Mausoleum Trigger - On Script - Summon ''Mausoleum Seal'''),
(10459300,9,1,0,0,0,100,0,1000,1000,0,0,0,9,0,0,0,0,0,0,20,103813,50,0,0,0,0,0,0,'Mausoleum Trigger - On Script - Activate GO ''Mausoleum Seal'''),
(10459300,9,2,0,0,0,100,0,3000,3000,0,0,0,9,0,0,0,0,0,0,20,176594,50,0,0,0,0,0,0,'Mausoleum Trigger - On Script - Activate GO ''Doors'''),
(10459300,9,3,0,0,0,100,0,500,500,0,0,0,12,6390,3,180000,0,0,0,8,0,0,0,0,2389.53,337.335,40.01,2.1773,'Mausoleum Trigger - On Script - Summon ''Ulag the Cleaver'''),
(10459300,9,4,0,0,0,100,0,6000,6000,0,0,0,41,0,0,0,0,0,0,20,103813,50,0,0,0,0,0,0,'Mausoleum Trigger - On Script - Delete GO ''Mausoleum Seal''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
