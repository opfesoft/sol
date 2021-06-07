-- DB update 2021_06_07_00 -> 2021_06_07_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_07_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_07_00 2021_06_07_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1623099218875247463'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1623099218875247463');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (2060,2061,2062,2063,2064,2065,2066,2067,2068);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (2060,2061,2062,2063,2064,2065,2066,2067,2068);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2060,0,0,1,34,0,100,0,8,1,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Councilman Smithers - On WP 1 Reached - Set React State ''Aggressive'''),
(2060,0,1,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,10,18352,2058,1,0,0,0,0,0,'Councilman Smithers - Linked - Start Attack (Deathstalker Faerleia)'),

(2061,0,0,1,34,0,100,0,8,1,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Councilman Thatcher - On WP 1 Reached - Set React State ''Aggressive'''),
(2061,0,1,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,10,18352,2058,1,0,0,0,0,0,'Councilman Thatcher - Linked - Start Attack (Deathstalker Faerleia)'),

(2062,0,0,1,34,0,100,0,8,1,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Councilman Hendricks - On WP 1 Reached - Set React State ''Aggressive'''),
(2062,0,1,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,10,18352,2058,1,0,0,0,0,0,'Councilman Hendricks - Linked - Start Attack (Deathstalker Faerleia)'),

(2063,0,0,1,34,0,100,0,8,1,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Councilman Wilhelm - On WP 1 Reached - Set React State ''Aggressive'''),
(2063,0,1,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,10,18352,2058,1,0,0,0,0,0,'Councilman Wilhelm - Linked - Start Attack (Deathstalker Faerleia)'),

(2064,0,0,1,34,0,100,0,8,1,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Councilman Hartin - On WP 1 Reached - Set React State ''Aggressive'''),
(2064,0,1,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,10,18352,2058,1,0,0,0,0,0,'Councilman Hartin - Linked - Start Attack (Deathstalker Faerleia)'),

(2065,0,0,1,34,0,100,0,8,1,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Councilman Cooper - On WP 1 Reached - Set React State ''Aggressive'''),
(2065,0,1,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,10,18352,2058,1,0,0,0,0,0,'Councilman Cooper - Linked - Start Attack (Deathstalker Faerleia)'),

(2066,0,0,1,34,0,100,0,8,1,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Councilman Higarth - On WP 1 Reached - Set React State ''Aggressive'''),
(2066,0,1,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,10,18352,2058,1,0,0,0,0,0,'Councilman Higarth - Linked - Start Attack (Deathstalker Faerleia)'),

(2067,0,0,1,34,0,100,0,8,1,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Councilman Brunswick - On WP 1 Reached - Set React State ''Aggressive'''),
(2067,0,1,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,10,18352,2058,1,0,0,0,0,0,'Councilman Brunswick - Linked - Start Attack (Deathstalker Faerleia)'),

(2068,0,0,1,34,0,100,0,8,1,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Mayor Morrison - On WP 1 Reached - Set React State ''Aggressive'''),
(2068,0,1,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,10,18352,2058,1,0,0,0,0,0,'Lord Mayor Morrison - Linked - Start Attack (Deathstalker Faerleia)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
