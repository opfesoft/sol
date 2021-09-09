-- DB update 2021_09_09_02 -> 2021_09_09_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_09_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_09_02 2021_09_09_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1631192186883962021'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1631192186883962021');

UPDATE `creature_template` SET `ScriptName` = '', `AIName` = 'SmartAI' WHERE `entry` = 5644;
UPDATE `creature_addon` SET `bytes1` = 0 WHERE `guid` = 26987;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 5644;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (564400,564401);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(5644,0,0,1,11,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dalinda Malem - On Respawn - Set ''UNIT_STAND_STATE_KNEEL'''),
(5644,0,1,0,61,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dalinda Malem - Linked - Add ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(5644,0,2,3,19,0,100,0,1440,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Dalinda Malem - On Quest ''Return to Vahlarriel'' Accepted - Store Targetlist ID 1'),
(5644,0,3,0,61,0,100,0,0,0,0,0,0,80,564400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dalinda Malem - Linked - Call Timed Action List'),
(5644,0,4,0,6,0,100,0,0,0,0,0,0,6,1440,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Dalinda Malem - On Death - Fail Quest ''Return to Vahlarriel'''),
(5644,0,5,0,58,0,100,0,0,5644,0,0,0,80,564401,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dalinda Malem - On WP Path Ended - Call Timed Action List'),

(564400,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dalinda Malem - On Script - Set Active On'),
(564400,9,1,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dalinda Malem - On Script - Remove ''UNIT_NPC_FLAG_QUESTGIVER'''),
(564400,9,2,0,0,0,100,0,0,0,0,0,0,2,113,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dalinda Malem - On Script - Set Faction ''Escortee'''),
(564400,9,3,0,0,0,100,0,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dalinda Malem - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(564400,9,4,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dalinda Malem - On Script - Say Line 0'),
(564400,9,5,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dalinda Malem - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(564400,9,6,0,0,0,100,0,5000,5000,0,0,0,53,0,5644,0,0,0,2,1,0,0,0,0,0,0,0,0,'Dalinda Malem - On Script - Start WP Movement'),

(564401,9,0,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dalinda Malem - On Script - Say Line 1'),
(564401,9,1,0,0,0,100,0,0,0,0,0,0,15,1440,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Dalinda Malem - On Script - Complete Quest ''Return to Vahlarriel'''),
(564401,9,2,0,0,0,100,0,8000,8000,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dalinda Malem - On Script - Force Despawn'),
(564401,9,3,0,0,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dalinda Malem - On Script - Set ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(564401,9,4,0,0,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dalinda Malem - On Script - Set Run On'),
(564401,9,5,0,0,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,-474.329,1590.01,94.4982,0,'Dalinda Malem - On Script - Move To Position');

DELETE FROM `script_waypoint` WHERE `entry` = 5644;

DELETE FROM `waypoints` WHERE `entry` = 5644;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(5644,1,-336.44,1762.17,139.519,'Dalinda Malem - Quest ''Return to Vahlarriel'''),
(5644,2,-339.679,1752.04,139.482,NULL),
(5644,3,-334.162,1743.25,139.351,NULL),
(5644,4,-328.957,1734.95,139.327,NULL),
(5644,5,-339.347,1731.18,139.326,NULL),
(5644,6,-350.747,1731.12,139.338,NULL),
(5644,7,-358.508,1735.41,139.378,NULL),
(5644,8,-365.064,1739.04,139.376,NULL),
(5644,9,-371.105,1746.03,139.374,NULL),
(5644,10,-381.722,1739.49,139.307,NULL),
(5644,11,-386.196,1736.74,137.825,NULL),
(5644,12,-390.445,1733.98,136.353,NULL),
(5644,13,-396.678,1729.87,133.007,NULL),
(5644,14,-401.368,1726.77,131.071,NULL),
(5644,15,-409.002,1723.86,130.3,NULL),
(5644,16,-416.016,1721.19,129.807,NULL),
(5644,17,-423.616,1717.1,129.076,NULL),
(5644,18,-431.006,1713.12,127.714,NULL),
(5644,19,-437.139,1709.82,126.342,NULL),
(5644,20,-444.325,1705.71,124.375,NULL),
(5644,21,-449.929,1699.29,121.615,NULL),
(5644,22,-455.146,1693.32,118.915,NULL),
(5644,23,-459.862,1687.92,116.059,NULL),
(5644,24,-460.686,1679.55,111.976,NULL),
(5644,25,-461.485,1670.94,109.033,NULL),
(5644,26,-463.169,1664.86,107.824,NULL),
(5644,27,-465.847,1655.19,105.211,NULL),
(5644,28,-468.53,1645.51,102.811,NULL),
(5644,29,-470.202,1637.28,100.607,NULL),
(5644,30,-472.291,1626.99,98.8838,NULL),
(5644,31,-474.529,1615.97,97.228,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
