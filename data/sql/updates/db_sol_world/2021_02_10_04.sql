-- DB update 2021_02_10_03 -> 2021_02_10_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_10_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_10_03 2021_02_10_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1612996117675164795'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1612996117675164795');

UPDATE `creature_template` SET `flags_extra` = 2, `unit_flags` = 0, `AIName` = 'SmartAI' WHERE `entry` IN (25258,25259,25260,25261);
DELETE FROM `creature_equip_template` WHERE `CreatureID` IN (25258,25259,25261);

UPDATE `creature` SET `equipment_id` = 0, `spawntimesecs` = 1200 WHERE `guid` IN (85221,85222,85226);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 85221;

UPDATE `creature_addon` SET `path_id` = 8522110 WHERE `guid` = 85221;

DELETE FROM `creature_formations` WHERE `leaderGUID`= 85221;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`)
VALUES
(85221,85221,0,0,0),
(85221,85222,1,55,0),
(85221,85226,1,305,0);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (25258,25259,25260,25261) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2525800,2525801,2525802,2525803) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(25258,0,0,0,34,0,100,0,2,6,0,0,0,80,2525800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Footman Rob - On WP 5 Reached - Call Timed Action List'),
(25258,0,1,0,34,0,100,0,2,11,0,0,0,80,2525801,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Footman Rob - On WP 10 Reached - Call Timed Action List'),
(25258,0,2,0,34,0,100,0,2,12,0,0,0,80,2525802,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Footman Rob - On WP 11 Reached - Call Timed Action List'),
(25258,0,3,0,34,0,100,0,2,19,0,0,0,12,25260,3,180000,0,0,0,8,0,0,0,0,2255.77,5186.26,11.4391,1.47479,'Footman Rob - On WP 18 Reached - Summon Creature ''Footman Mitch'''),
(25258,0,4,0,34,0,100,0,2,20,0,0,0,80,2525803,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Footman Rob - On WP 19 Reached - Call Timed Action List'),
(25258,0,5,0,17,0,100,0,25260,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Footman Rob - On Summoned Unit - Store Target'),

(2525800,9,0,0,0,0,100,0,3000,3000,0,0,0,1,0,6000,0,0,0,0,1,0,0,0,0,0,0,0,0,'Footman Rob - On Script - Say Line 0'),
(2525800,9,1,0,0,0,100,0,6000,6000,0,0,0,1,0,0,0,0,0,0,10,85222,25259,0,0,0,0,0,0,'Footman Rob - On Script - Say Line 0 (Footman George)'),

(2525801,9,0,0,0,0,100,0,4000,4000,0,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0,0,'Footman Rob - On Script - Say Line 1'),
(2525801,9,1,0,0,0,100,0,6000,6000,0,0,0,1,0,6000,0,0,0,0,10,110613,25245,0,0,0,0,0,0,'Footman Rob - On Script - Say Line 0 (James Deacon)'),
(2525801,9,2,0,0,0,100,0,6000,6000,0,0,0,1,2,6000,0,0,0,0,1,0,0,0,0,0,0,0,0,'Footman Rob - On Script - Say Line 2'),
(2525801,9,3,0,0,0,100,0,6000,6000,0,0,0,1,1,6000,0,0,0,0,10,110613,25245,0,0,0,0,0,0,'Footman Rob - On Script - Say Line 1 (James Deacon)'),
(2525801,9,4,0,0,0,100,0,3000,3000,0,0,0,5,397,0,0,0,0,0,10,110613,25245,0,0,0,0,0,0,'Footman Rob - On Script - Play Emote ''ONESHOT_POINT_NOSHEATHE'' (James Deacon)'),
(2525801,9,5,0,0,0,100,0,7000,7000,0,0,0,17,423,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Footman Rob - On Script - Set Emote State ''STATE_EAT_NO_SHEATHE'''),
(2525801,9,6,0,0,0,100,0,0,0,0,0,0,71,0,0,2703,0,0,0,1,0,0,0,0,0,0,0,0,'Footman Rob - On Script - Equip Tankard'),
(2525801,9,7,0,0,0,100,0,0,0,0,0,0,71,0,0,2703,0,0,0,10,85222,25259,0,0,0,0,0,0,'Footman Rob - On Script - Equip Tankard (Footman George)'),
(2525801,9,8,0,0,0,100,0,0,0,0,0,0,71,0,0,2703,0,0,0,10,85226,25261,0,0,0,0,0,0,'Footman Rob - On Script - Equip Tankard (Footman Chuck)'),
(2525801,9,9,0,0,0,100,0,5000,5000,0,0,0,17,423,0,0,0,0,0,10,85222,25259,0,0,0,0,0,0,'Footman Rob - On Script - Set Emote State ''STATE_EAT_NO_SHEATHE'' (Footman George)'),
(2525801,9,10,0,0,0,100,0,0,0,0,0,0,17,423,0,0,0,0,0,10,85226,25261,0,0,0,0,0,0,'Footman Rob - On Script - Set Emote State ''STATE_EAT_NO_SHEATHE'' (Footman Chuck)'),
(2525801,9,11,0,0,0,100,0,22000,22000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Footman Rob - On Script - Set Emote State 0'),
(2525801,9,12,0,0,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,10,85222,25259,0,0,0,0,0,0,'Footman Rob - On Script - Set Emote State 0 (Footman George)'),
(2525801,9,13,0,0,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,10,85226,25261,0,0,0,0,0,0,'Footman Rob - On Script - Set Emote State 0 (Footman Chuck)'),
(2525801,9,14,0,0,0,100,0,0,0,0,0,0,71,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Footman Rob - On Script - Remove Equipment'),
(2525801,9,15,0,0,0,100,0,0,0,0,0,0,71,0,0,0,0,0,0,10,85222,25259,0,0,0,0,0,0,'Footman Rob - On Script - Remove Equipment (Footman George)'),
(2525801,9,16,0,0,0,100,0,0,0,0,0,0,71,0,0,0,0,0,0,10,85226,25261,0,0,0,0,0,0,'Footman Rob - On Script - Remove Equipment (Footman Chuck)'),

(2525802,9,0,0,0,0,100,0,1000,1000,0,0,0,1,3,6000,0,0,0,0,1,0,0,0,0,0,0,0,0,'Footman Rob - On Script - Say Line 3'),
(2525802,9,1,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,10,85222,25259,0,0,0,0,0,0,'Footman Rob - On Script - Set Data 1 1 (Footman George)'),
(2525802,9,2,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,85226,25261,0,0,0,0,0,0,'Footman Rob - On Script - Set Data 1 1 (Footman Chuck)'),
(2525802,9,3,0,0,0,100,0,3000,3000,0,0,0,1,0,6000,0,0,0,0,10,85226,25261,0,0,0,0,0,0,'Footman Rob - On Script - Say Line 0 (Footman Chuck)'),
(2525802,9,4,0,0,0,100,0,6000,6000,0,0,0,5,11,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Footman Rob - On Script - Play Emote ''ONESHOT_LAUGH'''),
(2525802,9,5,0,0,0,100,0,0,0,0,0,0,5,11,0,0,0,0,0,10,85222,25259,0,0,0,0,0,0,'Footman Rob - On Script - Play Emote ''ONESHOT_LAUGH'' (Footman George)'),
(2525802,9,6,0,0,0,100,0,0,0,0,0,0,5,11,0,0,0,0,0,10,85226,25261,0,0,0,0,0,0,'Footman Rob - On Script - Play Emote ''ONESHOT_LAUGH'' (Footman Chuck)'),
(2525802,9,7,0,0,0,100,0,2000,2000,0,0,0,5,274,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Footman Rob - On Script - Play Emote ''ONESHOT_NO(DNR)'''),
(2525802,9,8,0,0,0,100,0,0,0,0,0,0,5,274,0,0,0,0,0,10,85222,25259,0,0,0,0,0,0,'Footman Rob - On Script - Play Emote ''ONESHOT_NO(DNR)'' (Footman George)'),
(2525802,9,9,0,0,0,100,0,0,0,0,0,0,5,274,0,0,0,0,0,10,85226,25261,0,0,0,0,0,0,'Footman Rob - On Script - Play Emote ''ONESHOT_NO(DNR)'' (Footman Chuck)'),

(2525803,9,0,0,0,0,100,0,0,0,0,0,0,41,1000,0,0,0,0,0,10,85222,25259,0,0,0,0,0,0,'Footman Rob - On Script - Force Despawn (Footman George)'),
(2525803,9,1,0,0,0,100,0,0,0,0,0,0,41,1000,0,0,0,0,0,10,85226,25261,0,0,0,0,0,0,'Footman Rob - On Script - Force Despawn (Footman Chuck)'),
(2525803,9,2,0,0,0,100,0,0,0,0,0,0,41,7000,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Footman Rob - On Script - Force Despawn (Footman Mitch)'),
(2525803,9,3,0,0,0,100,0,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Footman Rob - On Script - Force Despawn'),

(25259,0,0,0,38,0,100,0,1,1,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,4.27258,'Footman George - On Data Set 1 1 - Set Orientation 4.27258'),

(25260,0,0,1,63,0,100,0,0,0,0,0,0,1,0,6000,0,0,0,0,1,0,0,0,0,0,0,0,0,'Footman Mitch - On Just Created - Say Line 0'),
(25260,0,1,2,61,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Footman Mitch - Linked - Set Run Off'),
(25260,0,2,0,61,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,2264.94,5221.99,11.2882,4.3713,'Footman Mitch - Linked - Move To Position'),

(25261,0,0,0,38,0,100,0,1,1,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,4.27258,'Footman Chuck - On Data Set 1 1 - Set Orientation 4.28258');

DELETE FROM `waypoint_data` WHERE `id` = 8522110;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(8522110,1,2280.15,5179.14,11.423,0,0,0,0,100,0),
(8522110,2,2277.19,5177.2,11.33,0,0,0,0,100,0),
(8522110,3,2268.98,5175.54,11.166,0,0,0,0,100,0),
(8522110,4,2254.6,5188.9,11.385,0,0,0,0,100,0),
(8522110,5,2256.71,5195.32,11.45,0,0,0,0,100,0),
(8522110,6,2260.67,5200.36,11.3711,0,0,0,0,100,0),
(8522110,7,2264.38,5199.09,11.3676,0,13000,0,0,100,0),
(8522110,8,2268.1,5197.71,11.3988,0,0,0,0,100,0),
(8522110,9,2270.18,5196.94,12.4959,0,0,0,0,100,0),
(8522110,10,2275.23,5194.94,12.49,0,0,0,0,100,0),
(8522110,11,2276.23,5197.58,12.4896,0,0,0,0,100,0),
(8522110,12,2279.08,5206.5,12.494,0,60000,0,0,100,0),
(8522110,13,2278.82,5205.85,12.494,0,16000,0,0,100,0),
(8522110,14,2275.55,5197.84,12.4897,0,0,0,0,100,0),
(8522110,15,2273.06,5196.07,12.4932,0,0,0,0,100,0),
(8522110,16,2270.84,5196.77,12.494,0,0,0,0,100,0),
(8522110,17,2267.51,5197.82,11.3448,0,0,0,0,100,0),
(8522110,18,2265.21,5198.54,11.3533,0,0,0,0,100,0),
(8522110,19,2260.26,5202.83,11.4377,0,0,0,0,100,0),
(8522110,20,2258.98,5205.83,11.322,0,0,0,0,100,0),
(8522110,21,2268.17,5226.07,11.2421,0,5000,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
