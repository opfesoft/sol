-- DB update 2021_06_30_01 -> 2021_07_01_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_30_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_30_01 2021_07_01_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1625176787614595543'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1625176787614595543');

DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 208000;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(208000,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(208000,9,1,0,0,0,100,0,100,100,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Denalan - On Script - Say Line 0'),
(208000,9,2,0,0,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Set Run Off'),
(208000,9,3,0,0,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,9505.41,718.983,1256.22,0,'Denalan - On Script - Move To Position'),
(208000,9,4,0,0,0,100,0,3000,3000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,2.71669,'Denalan - On Script - Set Orientation'),
(208000,9,5,0,0,0,100,0,1000,1000,0,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Play Emote ''ONESHOT_KNEEL'''),
(208000,9,6,0,0,0,100,0,5000,5000,0,0,0,233,60,0,0,0,0,0,15,7510,10,0,0,0,0,0,0,'Denalan - On Script - Respawn GO ''Sprouted Frond'''),
(208000,9,7,0,0,0,100,0,5000,5000,0,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Denalan - On Script - Set Orientation (Invoker)'),
(208000,9,8,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Denalan - On Script - Say Line 1'),
(208000,9,9,0,0,0,100,0,5000,5000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,9506.92,713.766,1255.89,0,'Denalan - On Script - Move To Position'),
(208000,9,10,0,0,0,100,0,3000,3000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0.279253,'Denalan - On Script - Set Orientation'),
(208000,9,11,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Add ''GOSSIP_OPTION_QUESTGIVER'''),
(208000,9,12,0,0,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Set Run On');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
