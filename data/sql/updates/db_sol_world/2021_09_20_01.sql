-- DB update 2021_09_20_00 -> 2021_09_20_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_20_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_20_00 2021_09_20_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1632134158224820156'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1632134158224820156');

DELETE FROM `creature_summon_groups` WHERE `summonerId` = 4484 AND `groupId` IN (0,1);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`)
VALUES
(4484,0,0,3879,3490.65,204.499,11.5094,3.3,4,30000),
(4484,0,0,3879,3499.85,191.873,9.91306,1.30507,4,30000),
(4484,0,0,3879,3512.69,230.044,12.5799,3.03,4,30000),
(4484,0,0,3879,3489.39,233.419,13.9571,5.50223,4,30000),
(4484,0,1,3893,3768.34,167.626,8.21536,4.30061,4,30000),
(4484,0,1,3893,3761.63,176.663,8.16656,4.39015,4,30000),
(4484,0,1,3893,3738.87,185.199,8.0035,4.98706,4,30000);

UPDATE `smart_scripts` SET `target_type` = 16 WHERE `entryorguid` = 4484 AND `source_type` = 0 AND `id` = 1;
UPDATE `smart_scripts` SET `link` = 7 WHERE `entryorguid` = 4484 AND `source_type` = 0 AND `id` = 6;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 3893;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` IN (2,3) AND `entryorguid` = 3879;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` = 7 AND `entryorguid` = 4484;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (448401,448402);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4484,0,7,0,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feero Ironhand - Linked - Set Active On'),

(448401,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feero Ironhand - On Script - Say Line 0'),
(448401,9,1,0,0,0,100,0,2000,2000,0,0,0,107,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Feero Ironhand - On Script - Summon Group 0'),
(448401,9,2,0,0,0,100,0,15000,15000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feero Ironhand - On Script - Say Line 1'),
(448401,9,3,0,0,0,100,0,1000,1000,0,0,0,53,1,448401,0,0,0,2,1,0,0,0,0,0,0,0,0,'Feero Ironhand - On Script - Start WP Movement'),

(448402,9,0,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feero Ironhand - On Script - Say Line 2'),
(448402,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,2.29806,'Feero Ironhand - On Script - Set Orientation'),
(448402,9,2,0,0,0,100,0,1000,1000,0,0,0,107,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Feero Ironhand - On Script - Summon Group 1'),
(448402,9,3,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,19,3893,0,0,0,0,0,0,0,'Feero Ironhand - On Script - Say Line 0 (Forsaken Scout)'),
(448402,9,4,0,0,0,100,0,15000,15000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feero Ironhand - On Script - Say Line 3'),
(448402,9,5,0,0,0,100,0,1000,1000,0,0,0,53,1,448402,0,0,0,2,1,0,0,0,0,0,0,0,0,'Feero Ironhand - On Script - Start WP Movement');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
