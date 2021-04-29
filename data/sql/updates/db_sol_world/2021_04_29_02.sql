-- DB update 2021_04_29_01 -> 2021_04_29_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_04_29_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_04_29_01 2021_04_29_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1619731388026592506'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1619731388026592506');

-- Captured Water Spirit: Add immunity to players
UPDATE `creature` SET `unit_flags` = 256 WHERE `id` = 21029;

-- Earthmender Wilda Trigger: Adjust positions
UPDATE `creature` SET `position_z` = 51.44 WHERE `guid` = 3008824;
UPDATE `creature` SET `position_x` = -2605.25, `position_y` = 1369.3, `position_z` = 48.8 WHERE `guid` = 3008825;

-- Earthmender Wilda: Add inhabit type "air"
UPDATE `creature_template` SET `InhabitType` = 7 WHERE `entry` = 21027;

-- Add / fix several creature texts
DELETE FROM `creature_text` WHERE `CreatureID` IN (21027,21029,21044);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(21027,0,0,'Thank you, kind soul. You have freed me from the watery prison of Coilskar but many more are being held prisoner nearby. Will you assist me in freeing them as well?',12,0,100,0,0,0,18665,0,'wilda SAY_WIL_FREE'),
(21027,1,0,'I sense the tortured spirits, $n. They are this way. Come quickly!',12,0,100,0,0,0,18668,0,'wilda SAY_WIL_START'),
(21027,2,0,'The naga of Coilskar are exceptionally cruel to their prisoners. It is a miracle that I survived inside that watery prison for as long as I did. Earthmother be praised.',12,0,100,0,0,0,18685,0,'wilda SAY_WIL_CHAT1'),
(21027,3,0,'Lady Vashj must answer for these atrocities. She must be brought to justice!',12,0,100,0,0,0,18684,0,'wilda SAY_WIL_CHAT2'),
(21027,4,0,'Grant me protection, $n. I must break through their foul magic!',12,0,100,0,0,0,18669,0,'wilda SAY_WIL_FREE_WATER_SPIRITS'),
(21027,5,0,'The naga torture the spirits of water. They invoke chaos and destruction!',12,0,100,0,0,0,18674,0,'wilda SAY_WIL_CHAT3'),
(21027,6,0,'The tumultuous nature of the great waterways of Azeroth and Draenor are a direct result of tormented water spirits.',12,0,100,0,0,0,18675,0,'wilda SAY_WIL_CHAT4'),
(21027,7,0,'The naga do not respect nature. They twist and corrupt it to meet their needs. They live to agitate the spirits.',12,0,100,0,0,0,18673,0,'wilda SAY_WIL_CHAT5'),
(21027,8,0,'Now we must find the exit.',12,0,100,0,0,0,18670,0,'wilda SAY_WIL_FIND_EXIT'),
(21027,9,0,'It shouldn''t be much further, $n. The exit is just up ahead.',12,0,100,0,0,0,18671,0,'wilda SAY_WIL_JUST_AHEAD'),
(21027,10,0,'Thank you, $n. Please return to my brethren at the Altar of Damnation, near the Hand of Gul''dan, and tell them that Wilda is safe. May the Earthmother watch over you...',12,0,100,0,0,0,18672,0,'wilda SAY_WIL_END'),
(21027,11,0,'Watch out!',12,0,100,0,0,0,32401,0,'wilda SAY_WIL_AGGRO1'),
(21027,11,1,'Naga attackers! Defend yourself!',12,0,100,0,0,0,18688,0,'wilda SAY_WIL_AGGRO2'),

(21029,0,0,'Thank you, earthmender.',12,12,100,0,0,0,18664,0,'wilda SAY_CAPTURED_WATER_SPIRIT'),

(21044,0,0,'Kill them all!',12,0,100,0,0,0,18692,0,'wilda SAY_COILSKAR_ASSASSIN');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (20795,21041);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (20795,21041) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20795,0,0,0,6,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,86832,21027,0,0,0,0,0,0,'Keeper of the Cistern - On Death - Set Data 1 1 (Earthmender Wilda)'),

(21041,0,0,0,1,0,100,0,2000,2000,2000,2000,0,11,35928,0,0,0,0,0,11,21027,12,1,0,0,0,0,0,'Earthmender Wilda Trigger - OOC - Cast ''Watery Prison'' (Earthmender Wilda)');

DELETE FROM `script_waypoint` WHERE `entry` = 21027;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`)
VALUES
(21027,0,-2638.89,1358.96,35.9606,0,''),
(21027,1,-2666.36,1348.22,34.4456,0,''),
(21027,2,-2693.79,1336.96,34.4456,0,'wilda SAY_WIL_CHAT1'),
(21027,3,-2714.14,1328.61,34.4456,0,''),
(21027,4,-2742.53,1314.14,33.6061,0,''),
(21027,5,-2745.08,1311.11,33.6309,0,''),
(21027,6,-2749.86,1302.74,33.4756,0,''),
(21027,7,-2753.64,1294.06,33.3149,0,''),
(21027,8,-2756.8,1285.12,33.3913,0,''),
(21027,9,-2750.04,1273.66,33.1883,0,'wilda SAY_WIL_CHAT2'),
(21027,10,-2740.38,1258.85,33.2125,0,''),
(21027,11,-2733.63,1248.26,33.6406,0,''),
(21027,12,-2726.38,1237.26,33.4618,2000,'wilda SAY_WIL_FREE_WATER_SPIRITS'),
(21027,13,-2726.38,1237.26,33.4618,2000,'wilda SAY_WIL_FIND_EXIT'),
(21027,14,-2736.02,1251.3,33.4847,0,''),
(21027,15,-2746.38,1266.39,33.192,0,'wilda spawn assassin'),
(21027,16,-2758.93,1285.13,33.3417,0,''),
(21027,17,-2761.85,1292.31,33.209,0,''),
(21027,18,-2758.87,1300.68,33.2853,0,'wilda SAY_WIL_CHAT3'),
(21027,19,-2753.93,1307.76,33.4525,0,''),
(21027,20,-2738.61,1316.19,33.483,0,'wilda spawn assassin'),
(21027,21,-2727.9,1320.01,33.3811,0,''),
(21027,22,-2715.65,1317.17,34.432,0,''),
(21027,23,-2704.66,1301.62,32.4633,0,''),
(21027,24,-2700.59,1295.29,33.7504,0,''),
(21027,25,-2691.8,1292.85,33.8526,0,''),
(21027,26,-2685.83,1290.17,33.8551,0,''),
(21027,27,-2661.87,1279.68,26.6868,0,'wilda spawn assassin'),
(21027,28,-2648.94,1270.27,24.1475,0,''),
(21027,29,-2642.51,1262.94,23.5124,0,''),
(21027,30,-2636.98,1252.43,20.4183,0,''),
(21027,31,-2634.2,1247.15,17.8935,0,''),
(21027,32,-2641.14,1230.09,11.0308,0,''),
(21027,33,-2651.15,1211.72,7.52484,0,''),
(21027,34,-2658.39,1200.14,5.49224,0,'wilda SAY_WIL_CHAT4'),
(21027,35,-2663.81,1194.94,5.03991,0,''),
(21027,36,-2672.51,1186.6,3.09405,0,''),
(21027,37,-2681.72,1177.78,5.18571,0,'wilda spawn assassin'),
(21027,38,-2694,1168.89,5.25818,0,''),
(21027,39,-2701.61,1160.03,5.61131,0,''),
(21027,40,-2710.7,1149.76,4.05374,0,''),
(21027,41,-2721.79,1143.13,1.33902,0,''),
(21027,42,-2732.46,1141.68,2.30278,0,'wilda spawn assassin'),
(21027,43,-2741.28,1143.51,2.857,0,''),
(21027,44,-2752.45,1145.82,5.86946,2000,'wilda SAY_WIL_JUST_AHEAD'),
(21027,45,-2763.79,1157.38,6.8399,0,''),
(21027,46,-2772.3,1166.05,6.33181,0,'wilda SAY_WIL_CHAT5'),
(21027,47,-2785.88,1179.68,5.92469,0,''),
(21027,48,-2792.98,1198.32,5.38925,0,''),
(21027,49,-2799.93,1215.51,5.37347,0,''),
(21027,50,-2805.98,1226.9,5.44692,0,''),
(21027,51,-2825.81,1237.57,5.31235,0,'wilda spawn assassin'),
(21027,52,-2840.68,1245.57,6.80886,0,''),
(21027,53,-2848.27,1252.56,7.12975,0,''),
(21027,54,-2851.3,1262.28,7.02656,0,''),
(21027,55,-2849.14,1267.51,7.76912,0,''),
(21027,56,-2841.98,1285.03,8.1085,0,''),
(21027,57,-2845.68,1293.45,6.35259,0,''),
(21027,58,-2871.4,1302.35,6.80733,7500,'');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
