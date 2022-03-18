-- DB update 2022_03_18_01 -> 2022_03_18_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_18_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_18_01 2022_03_18_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1647605720695588128'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1647605720695588128');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (27990,38017);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2799000,2799001,3801700,3801701);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27990,0,0,0,62,0,100,0,10199,0,0,0,0,80,2799000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krasus - On Gossip Option 0 Selected - Call Timed Action List'),
(27990,0,1,0,62,0,100,0,10199,1,0,0,0,80,2799001,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krasus - On Gossip Option 1 Selected - Call Timed Action List'),

(2799000,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krasus - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(2799000,9,1,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,19,26917,10,0,0,0,0,0,0,'Krasus - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'' (Alexstrasza the Life-Binder)'),
(2799000,9,2,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,19,38017,30,0,0,0,0,0,0,'Krasus - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'' (Kalecgos)'),
(2799000,9,3,0,0,0,100,0,2000,2000,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Krasus - On Script - Say Line 0'),
(2799000,9,4,0,0,0,100,0,8000,8000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krasus - On Script - Say Line 1'),
(2799000,9,5,0,0,0,100,0,8000,8000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krasus - On Script - Say Line 2'),
(2799000,9,6,0,0,0,100,0,0,0,0,0,0,45,0,1,0,0,0,0,19,38017,30,0,0,0,0,0,0,'Krasus - On Script - Set Data 0 1 (Kalecgos)'),
(2799000,9,7,0,0,0,100,0,8000,8000,0,0,0,1,3,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Krasus - On Script - Say Line 3'),
(2799000,9,8,0,0,0,100,0,6000,6000,0,0,0,1,0,0,0,0,0,0,19,38017,30,0,0,0,0,0,0,'Krasus - On Script - Say Line 0 (Kalecgos)'),
(2799000,9,9,0,0,0,100,0,6000,6000,0,0,0,1,1,0,0,0,0,0,19,38017,30,0,0,0,0,0,0,'Krasus - On Script - Say Line 1 (Kalecgos)'),
(2799000,9,10,0,0,0,100,0,6000,6000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krasus - On Script - Say Line 4'),
(2799000,9,11,0,0,0,100,0,6000,6000,0,0,0,1,2,0,0,0,0,0,19,38017,30,0,0,0,0,0,0,'Krasus - On Script - Say Line 2 (Kalecgos)'),
(2799000,9,12,0,0,0,100,0,8000,8000,0,0,0,1,0,0,0,0,0,0,19,26917,10,0,0,0,0,0,0,'Krasus - On Script - Say Line 0 (Alexstrasza the Life-Binder)'),
(2799000,9,13,0,0,0,100,0,8000,8000,0,0,0,1,3,0,0,0,0,0,19,38017,30,0,0,0,0,0,0,'Krasus - On Script - Say Line 3 (Kalecgos)'),
(2799000,9,14,0,0,0,100,0,6000,6000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krasus - On Script - Say Line 5'),
(2799000,9,15,0,0,0,100,0,2000,2000,0,0,0,45,0,2,0,0,0,0,19,38017,30,0,0,0,0,0,0,'Krasus - On Script - Set Data 0 2 (Kalecgos)'),
(2799000,9,16,0,0,0,100,0,4000,4000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krasus - On Script - Say Line 6'),
(2799000,9,17,0,0,0,100,0,4000,4000,0,0,0,33,36715,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Krasus - On Script - Quest Credit ''What The Dragons Know'''),
(2799000,9,18,0,0,0,100,0,4000,4000,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krasus - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(2799000,9,19,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,19,26917,10,0,0,0,0,0,0,'Krasus - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'' (Alexstrasza the Life-Binder)'),
(2799000,9,20,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,19,38017,30,0,0,0,0,0,0,'Krasus - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'' (Kalecgos)'),

(2799001,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krasus - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(2799001,9,1,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,19,26917,10,0,0,0,0,0,0,'Krasus - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'' (Alexstrasza the Life-Binder)'),
(2799001,9,2,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,19,38017,30,0,0,0,0,0,0,'Krasus - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'' (Kalecgos)'),
(2799001,9,3,0,0,0,100,0,2000,2000,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Krasus - On Script - Say Line 0'),
(2799001,9,4,0,0,0,100,0,8000,8000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krasus - On Script - Say Line 1'),
(2799001,9,5,0,0,0,100,0,8000,8000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krasus - On Script - Say Line 2'),
(2799001,9,6,0,0,0,100,0,0,0,0,0,0,45,0,1,0,0,0,0,19,38017,30,0,0,0,0,0,0,'Krasus - On Script - Set Data 0 1 (Kalecgos)'),
(2799001,9,7,0,0,0,100,0,8000,8000,0,0,0,1,3,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Krasus - On Script - Say Line 3'),
(2799001,9,8,0,0,0,100,0,6000,6000,0,0,0,1,0,0,0,0,0,0,19,38017,30,0,0,0,0,0,0,'Krasus - On Script - Say Line 0 (Kalecgos)'),
(2799001,9,9,0,0,0,100,0,6000,6000,0,0,0,1,1,0,0,0,0,0,19,38017,30,0,0,0,0,0,0,'Krasus - On Script - Say Line 1 (Kalecgos)'),
(2799001,9,10,0,0,0,100,0,6000,6000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krasus - On Script - Say Line 4'),
(2799001,9,11,0,0,0,100,0,6000,6000,0,0,0,1,2,0,0,0,0,0,19,38017,30,0,0,0,0,0,0,'Krasus - On Script - Say Line 2 (Kalecgos)'),
(2799001,9,12,0,0,0,100,0,8000,8000,0,0,0,1,0,0,0,0,0,0,19,26917,10,0,0,0,0,0,0,'Krasus - On Script - Say Line 0 (Alexstrasza the Life-Binder)'),
(2799001,9,13,0,0,0,100,0,8000,8000,0,0,0,1,3,0,0,0,0,0,19,38017,30,0,0,0,0,0,0,'Krasus - On Script - Say Line 3 (Kalecgos)'),
(2799001,9,14,0,0,0,100,0,6000,6000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krasus - On Script - Say Line 5'),
(2799001,9,15,0,0,0,100,0,2000,2000,0,0,0,45,0,2,0,0,0,0,19,38017,30,0,0,0,0,0,0,'Krasus - On Script - Set Data 0 2 (Kalecgos)'),
(2799001,9,16,0,0,0,100,0,4000,4000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krasus - On Script - Say Line 7'),
(2799001,9,17,0,0,0,100,0,4000,4000,0,0,0,33,36715,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Krasus - On Script - Quest Credit ''What The Dragons Know'''),
(2799001,9,18,0,0,0,100,0,4000,4000,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krasus - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(2799001,9,19,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,19,26917,10,0,0,0,0,0,0,'Krasus - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'' (Alexstrasza the Life-Binder)'),
(2799001,9,20,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,19,38017,30,0,0,0,0,0,0,'Krasus - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'' (Kalecgos)'),

(38017,0,0,0,38,0,100,0,0,1,0,0,0,80,3801700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalecgos - On Data Set 0 1 - Call Timed Action List'),
(38017,0,1,0,38,0,100,0,0,2,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalecgos - On Data Set 0 2 - Evade'),

(3801700,9,0,0,0,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kalecgos - On Script - Set Run Off'),
(3801700,9,1,0,0,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,3538.4,274.073,342.722,0,'Kalecgos - On Script - Move To Position'),
(3801700,9,2,0,0,0,100,0,8000,8000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,3.32875,'Kalecgos - On Script - Set Orientation');

DELETE FROM `waypoints` WHERE `entry` = 38017;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
