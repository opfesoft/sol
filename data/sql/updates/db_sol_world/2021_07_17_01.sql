-- DB update 2021_07_17_00 -> 2021_07_17_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_07_17_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_07_17_00 2021_07_17_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1626478093761982877'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1626478093761982877');

UPDATE `creature` SET `position_x` = -4218.61, `position_y` = -2339.4, `position_z` = 91.735, `orientation` = 1.93668 WHERE `guid` = 14138;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 3421;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 3421;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 342100;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3421,0,0,0,20,0,100,0,857,0,0,0,0,80,342100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feegly the Exiled - On Quest ''The Tear of the Moons'' Rewarded - Call Timed Action List'),

(342100,9,0,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feegly the Exiled - On Script - Say Line 0'),
(342100,9,1,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feegly the Exiled - On Script - Say Line 1'),
(342100,9,2,0,0,0,100,0,3000,3000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feegly the Exiled - On Script - Say Line 2'),
(342100,9,3,0,0,0,100,0,4000,4000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feegly the Exiled - On Script - Say Line 3'),
(342100,9,4,0,0,0,100,0,2000,2000,0,0,0,5,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feegly the Exiled - On Script - Play Emote ''ONESHOT_ROAR(DNR)'''),
(342100,9,5,0,0,0,100,0,2000,2000,0,0,0,3,0,721,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feegly the Exiled - On Script - Morph To ''Berserk Trogg'''),
(342100,9,6,0,0,0,100,0,0,0,0,0,0,89,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feegly the Exiled - On Script - Start Random Movement'),
(342100,9,7,0,0,0,100,0,10000,10000,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feegly the Exiled - On Script - Die');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
