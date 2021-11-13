-- DB update 2021_11_01_01 -> 2021_11_06_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_01_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_01_01 2021_11_06_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1636239554167597722'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1636239554167597722');

UPDATE `creature` SET `spawntimesecs` = 30 WHERE `guid` = 5767;
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 5768;

DELETE FROM `creature_addon` WHERE `guid` = 5768;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(5768,57680,0,0,1,0,0,'');

DELETE FROM `creature_formations` WHERE `leaderGUID` = 5768;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`)
VALUES
(5768,5768,0,0,2),
(5768,5771,3,180,2),
(5768,5772,3,90,2),
(5768,5770,3,0,2),
(5768,5769,3,270,2);

UPDATE `creature_template` SET `AIName` = 'SmartAI', `flags_extra` = 0 WHERE `entry` = 8441;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 8442;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (8441,8442,-5768);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (844100,844101);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8441,0,0,1,11,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raze - On Respawn - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(8441,0,1,0,61,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raze - Linked - Remove Timed Event 1'),
(8441,0,2,0,62,0,100,0,2306,0,0,0,0,80,844100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raze - On Gossip Option 0 Selected - Call Timed Action List'),
(8441,0,3,0,231,0,100,0,50,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raze - On Follow Target Lost - Force Despawn'),
(8441,0,4,0,1,0,100,256,0,0,30000,30000,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raze - OOC - Say Line 1 (No Reset)'),
(8441,0,5,0,38,0,100,1,1,1,0,0,0,80,844101,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raze - On Data Set 1 1 - Call Timed Action List (No Repeat)'),
(8441,0,6,7,59,0,100,0,1,0,0,0,0,1,2,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Raze - On Timed Event 1 Triggered - Say Line 2'),
(8441,0,7,8,61,0,100,0,0,0,0,0,0,41,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raze - Linked - Force Despawn'),
(8441,0,8,0,61,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Raze - Linked - Stop Follow'),
(8441,0,9,0,6,0,100,0,0,0,0,0,0,41,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raze - On Death - Force Despawn'),

(844100,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raze - On Script - Set Active On'),
(844100,9,1,0,0,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Raze - On Script - Close Gossip'),
(844100,9,2,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Raze - On Script - Store Target'),
(844100,9,3,0,0,0,100,0,0,0,0,0,0,57,10464,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Raze - On Script - Remove Item ''Staff of Command'''),
(844100,9,4,0,0,0,100,0,0,0,0,0,0,85,15539,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Raze - On Script - Invoker Cast ''Conjure Staff of Command'''),
(844100,9,5,0,0,0,100,0,0,0,0,0,0,67,1,2700000,2700000,0,0,0,1,0,0,0,0,0,0,0,0,'Raze - On Script - Create Timed Event 1'),
(844100,9,6,0,0,0,100,0,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raze - On Script - Remove ''GOSSIP_OPTION_GOSSIP'''),
(844100,9,7,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,19,8439,0,0,0,0,0,0,0,'Raze - On Script - Say Line 0 (Nilith Lokrav)'),
(844100,9,8,0,0,0,100,0,8000,8000,0,0,0,1,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Raze - On Script - Say Line 0'),
(844100,9,9,0,0,0,100,0,0,0,0,0,0,29,2,180,0,0,0,0,7,0,0,0,0,0,0,0,0,'Raze - On Script - Start Follow (Invoker)'),

(844101,9,0,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raze - On Script - Set Home Position'),
(844101,9,1,0,0,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Raze - On Script - Stop Follow'),
(844101,9,2,0,0,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raze - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(844101,9,3,0,0,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raze - On Script - Remove Timed Event 1'),
(844101,9,4,0,0,0,100,0,0,0,0,0,0,2,113,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raze - On Script - Set Faction ''Escortee'''),
(844101,9,5,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,19,8442,0,0,0,0,0,0,0,'Raze - On Script - Start Attack (Invoker)'),
(844101,9,6,0,0,0,100,0,5000,5000,0,0,0,1,2,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Raze - On Script - Say Line 2'),
(844101,9,7,0,0,0,100,0,0,0,0,0,0,41,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raze - On Script - Force Despawn'),

(8442,0,0,0,8,0,100,0,12347,0,0,0,0,45,1,1,0,0,0,0,19,8441,0,0,0,0,0,0,0,'Shadowsilk Poacher - On Spellhit ''Raze Attack'' - Set Data 1 1 (Raze)'),

(-5768,0,0,0,8,0,100,0,12347,0,0,0,0,45,1,1,0,0,0,0,19,8441,0,0,0,0,0,0,0,'Shadowsilk Poacher - On Spellhit ''Raze Attack'' - Set Data 1 1 (Raze)'),
(-5768,0,1,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shadowsilk Poacher - On Respawn - Set Active On');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 2306;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 8441;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,2306,0,0,0,47,0,3379,8,0,0,0,0,'Raze - Group 0: Show gossip option 0 if quest ''Shadoweaver'' is in progress'),
(22,5,8441,0,0,29,1,8442,20,0,0,0,0,'Raze - Group 0: Execute SAI ID 4 only if near ''Shadowsilk Poacher''');

DELETE FROM `waypoint_data` WHERE `id` = 57680;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(57680,1,-6475.76,-1653.2,296.95,0,0,0,0,100,0),
(57680,2,-6465.92,-1646.94,299.627,0,0,0,0,100,0),
(57680,3,-6456.78,-1641.12,302.886,0,0,0,0,100,0),
(57680,4,-6442.88,-1643.53,307.503,0,0,0,0,100,0),
(57680,5,-6433.85,-1639.7,311.784,0,0,0,0,100,0),
(57680,6,-6430.85,-1624.21,316.06,0,0,0,0,100,0),
(57680,7,-6437.13,-1611.54,317.35,0,0,0,0,100,0),
(57680,8,-6455.35,-1602.83,316.361,0,0,0,0,100,0),
(57680,9,-6472.65,-1602.51,315.38,0,0,0,0,100,0),
(57680,10,-6483.23,-1602.32,313.864,0,0,0,0,100,0),
(57680,11,-6496.4,-1608.36,308.01,0,0,0,0,100,0),
(57680,12,-6508.08,-1613.72,302.94,0,0,0,0,100,0),
(57680,13,-6516.5,-1621.73,299.036,0,0,0,0,100,0),
(57680,14,-6524.63,-1629.45,296.374,0,0,0,0,100,0),
(57680,15,-6535.84,-1632.72,295.789,0,0,0,0,100,0),
(57680,16,-6549.25,-1636.63,296.184,0,0,0,0,100,0),
(57680,17,-6558.26,-1629.93,293.225,0,0,0,0,100,0),
(57680,18,-6564.29,-1623.06,287.738,0,0,0,0,100,0),
(57680,19,-6567.7,-1614.35,284.125,0,0,0,0,100,0),
(57680,20,-6575.18,-1607.62,279.08,0,0,0,0,100,0),
(57680,21,-6584.51,-1599.24,274.318,0,0,0,0,100,0),
(57680,22,-6586.88,-1592.99,273.086,0,0,0,0,100,0),
(57680,23,-6588.67,-1588.55,273.233,0,0,0,0,100,0),
(57680,24,-6591.51,-1581.5,271.734,0,0,0,0,100,0),
(57680,25,-6593.87,-1575.65,272.57,0,0,0,0,100,0),
(57680,26,-6596.43,-1569.3,272.825,0,0,0,0,100,0),
(57680,27,-6595.82,-1562.08,273.317,0,0,0,0,100,0),
(57680,28,-6595.06,-1553.18,273.489,0,0,0,0,100,0),
(57680,29,-6597.79,-1545.04,272.922,0,0,0,0,100,0),
(57680,30,-6600.38,-1537.31,273.269,0,0,0,0,100,0),
(57680,31,-6600.03,-1528.85,273.124,0,0,0,0,100,0),
(57680,32,-6605.06,-1517.05,269.084,0,0,0,0,100,0),
(57680,33,-6606.39,-1507.79,271.175,0,0,0,0,100,0),
(57680,34,-6605.75,-1497.41,270.992,0,0,0,0,100,0),
(57680,35,-6605.02,-1485.74,269.163,0,0,0,0,100,0),
(57680,36,-6600.2,-1474.55,269.11,0,0,0,0,100,0),
(57680,37,-6601.17,-1459.35,267.091,0,0,0,0,100,0),
(57680,38,-6605.02,-1446.92,266.079,0,0,0,0,100,0),
(57680,39,-6609.78,-1431.57,265.835,0,0,0,0,100,0),
(57680,40,-6615.29,-1427.13,265.812,0,0,0,0,100,0),
(57680,41,-6620.73,-1422.76,265.142,0,0,0,0,100,0),
(57680,42,-6628.59,-1423.14,260.498,0,0,0,0,100,0),
(57680,43,-6639.19,-1428.01,252.796,0,0,0,0,100,0),
(57680,44,-6649.86,-1430.2,249.935,0,0,0,0,100,0),
(57680,45,-6666.55,-1429.78,242.738,0,0,0,0,100,0),
(57680,46,-6682.08,-1439.36,240.719,0,0,0,0,100,0),
(57680,47,-6690.03,-1459.6,242.431,0,0,0,0,100,0),
(57680,48,-6691.93,-1468.56,243.017,0,0,0,0,100,0),
(57680,49,-6693.66,-1476.71,242.766,0,0,0,0,100,0),
(57680,50,-6690.98,-1487.92,242.168,0,0,0,0,100,0),
(57680,51,-6688.73,-1497.33,241.983,0,0,0,0,100,0),
(57680,52,-6676.94,-1512.81,242.693,0,0,0,0,100,0),
(57680,53,-6666.39,-1526.66,243.709,0,0,0,0,100,0),
(57680,54,-6662.81,-1540.01,243.462,0,0,0,0,100,0),
(57680,55,-6658.78,-1555.04,243.448,0,0,0,0,100,0),
(57680,56,-6654.96,-1569.3,243.855,0,0,0,0,100,0),
(57680,57,-6650.78,-1584.87,244.454,0,0,0,0,100,0),
(57680,58,-6645.66,-1594.75,244.475,0,0,0,0,100,0),
(57680,59,-6638.87,-1607.86,244.453,0,0,0,0,100,0),
(57680,60,-6631.77,-1621.55,244.224,0,0,0,0,100,0),
(57680,61,-6624.57,-1635.45,244.219,0,0,0,0,100,0),
(57680,62,-6618.43,-1644.07,244.615,0,0,0,0,100,0),
(57680,63,-6612.23,-1652.77,245.724,0,0,0,0,100,0),
(57680,64,-6614.74,-1662.65,245.42,0,0,0,0,100,0),
(57680,65,-6617.72,-1674.4,244.826,0,0,0,0,100,0),
(57680,66,-6615.18,-1688.38,244.405,0,0,0,0,100,0),
(57680,67,-6612.6,-1702.57,244.242,0,0,0,0,100,0),
(57680,68,-6608.79,-1707.23,244.058,0,0,0,0,100,0),
(57680,69,-6603.43,-1707.57,244.598,0,0,0,0,100,0),
(57680,70,-6599.1,-1704.02,247.051,0,0,0,0,100,0),
(57680,71,-6596.95,-1695.69,253.691,0,0,0,0,100,0),
(57680,72,-6588.96,-1690.49,259.114,0,0,0,0,100,0),
(57680,73,-6579.82,-1684.53,266.768,0,0,0,0,100,0),
(57680,74,-6573.25,-1682.6,272.549,0,0,0,0,100,0),
(57680,75,-6567.27,-1680.84,277.013,0,0,0,0,100,0),
(57680,76,-6562.87,-1676.32,279.792,0,0,0,0,100,0),
(57680,77,-6558.48,-1671.8,281.61,0,0,0,0,100,0),
(57680,78,-6552.3,-1666.23,283.006,0,0,0,0,100,0),
(57680,79,-6546.02,-1660.57,284.798,0,0,0,0,100,0),
(57680,80,-6537.22,-1659.66,287.686,0,0,0,0,100,0),
(57680,81,-6527.17,-1658.61,289.643,0,0,0,0,100,0),
(57680,82,-6519.25,-1660.21,291.696,0,0,0,0,100,0),
(57680,83,-6509.38,-1662.2,293.752,0,0,0,0,100,0),
(57680,84,-6499.39,-1664.21,295.044,0,0,0,0,100,0),
(57680,85,-6487.35,-1658.6,295.656,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;