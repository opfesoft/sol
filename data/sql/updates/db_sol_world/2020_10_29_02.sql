-- DB update 2020_10_29_01 -> 2020_10_29_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_10_29_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_10_29_01 2020_10_29_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1604012274122055688'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1604012274122055688');

UPDATE `waypoint_data` SET `position_x` = 864.424, `position_y` = -209.125, `position_z` = -43.7035 WHERE `id` = 466130 AND `point` = 1;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-91064,-90884,-48172) AND `source_type` = 0 AND (`action_type` = 1 OR `action_type` = 45);

DELETE FROM `smart_scripts` WHERE `entryorguid` = 9500 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (950000,950001,950002) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(9500,0,0,0,1,0,100,0,200000,200000,550000,600000,0,80,950000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mistress Nagmara - OOC - Call Timed Action List'),
(9500,0,1,0,1,0,100,0,150000,150000,12000,180000,0,80,950001,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mistress Nagmara - OOC - Call Timed Action List'),
(9500,0,2,0,1,0,100,0,30000,30000,55000,60000,0,80,950002,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mistress Nagmara - OOC - Call Timed Action List'),

(950000,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,10,91064,0,0,0,0,0,0,0,'Mistress Nagmara - On Script - Say Line 0 (Guzzling Patron)'),
(950000,9,1,0,0,0,100,0,4000,4000,0,0,0,1,0,0,1,0,0,0,10,91064,0,0,0,0,0,0,0,'Mistress Nagmara - On Script - Say Line 0'),

(950001,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,10,90884,0,0,0,0,0,0,0,'Mistress Nagmara - On Script - Say Line 0 (Guzzling Patron)'),
(950001,9,1,0,0,0,100,0,4000,4000,0,0,0,1,0,0,1,0,0,0,10,90884,0,0,0,0,0,0,0,'Mistress Nagmara - On Script - Say Line 0'),

(950002,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,10,48172,0,0,0,0,0,0,0,'Mistress Nagmara - On Script - Say Line 0 (Grim Patron)'),
(950002,9,1,0,0,0,100,0,4000,4000,0,0,0,1,0,0,1,0,0,0,10,48172,0,0,0,0,0,0,0,'Mistress Nagmara - On Script - Say Line 0');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
