-- DB update 2022_02_10_00 -> 2022_02_12_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_10_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_10_00 2022_02_12_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1644681203419763684'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1644681203419763684');

DELETE FROM `creature_text` WHERE `CreatureId` IN (6182,6180);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(6182,0,0,'To the house! Stay close to me, no matter what! I have my gun and ammo there!',12,0,100,0,0,0,2360,0,'stilwell SAY_DS_START'),
(6182,1,0,'You won''t ruin my lands, you scum!',14,0,100,0,0,0,2359,0,'stilwell SAY_DS_FIRST_ATTACK'),
(6182,2,0,'We showed that one!',12,0,100,0,0,0,5269,0,'stilwell SAY_DS_DOWN_1'),
(6182,3,0,'One more down!',12,0,100,0,0,0,2369,0,'stilwell SAY_DS_DOWN_2'),
(6182,4,0,'The Light is with us this day!',12,0,100,0,0,0,2372,0,'stilwell SAY_DS_DOWN_3'),
(6182,5,0,'Meet me down by the orchard--I just need to put my gun away.',12,0,100,0,0,0,3090,0,'stilwell SAY_DS_PROLOGUE'),

(6180,0,0,'Kill her! Take the farm!',14,0,100,0,0,0,2366,0,'stilwell SAY_DEFIAS_FIRST_ATTACK');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 6180;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6180,0,0,0,0,0,100,0,5000,7500,12500,15000,0,11,25710,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Defias Raider - IC - Cast ''Heroic Strike''');

DELETE FROM `script_waypoint` WHERE `entry` = 6182;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`)
VALUES
(6182,1,-11463,1525.24,50.9379,0,NULL),
(6182,2,-11461,1526.61,50.9387,5000,'pick up rifle'),
(6182,3,-11461,1526.61,50.9387,0,NULL),
(6182,4,-11463,1525.24,50.9379,0,NULL),
(6182,5,-11465.2,1528.34,50.9539,0,NULL),
(6182,6,-11468.4,1535.08,50.3987,15000,'hold, prepare for wave1'),
(6182,7,-11468.4,1535.08,50.3987,15000,'hold, prepare for wave2'),
(6182,8,-11468.4,1535.08,50.3987,10000,'hold, prepare for wave3'),
(6182,9,-11467.9,1532.46,50.3489,0,'we are done'),
(6182,10,-11466.1,1529.86,50.2094,0,NULL),
(6182,11,-11465.2,1528.34,50.9539,0,NULL),
(6182,12,-11463,1525.24,50.9379,0,NULL),
(6182,13,-11461,1526.61,50.9387,5000,'put away rifle'),
(6182,14,-11461,1526.61,50.9387,0,NULL),
(6182,15,-11463,1525.24,50.9379,0,NULL),
(6182,16,-11465.2,1528.34,50.9539,0,NULL),
(6182,17,-11470.3,1537.28,50.3785,0,NULL),
(6182,18,-11473.2,1543.41,50.3961,0,NULL),
(6182,19,-11475.6,1548.68,50.1844,0,'complete quest'),
(6182,20,-11482.3,1557.41,48.6245,0,NULL);

DELETE FROM `waypoint_data` WHERE `id` = 669790;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(669790,1,-11479.7,1555.35,48.71,0,0,0,0,0,100,0),
(669790,2,-11473.4,1557.74,48.65,0,0,0,0,0,100,0),
(669790,3,-11465.3,1565.47,48.5979,0.746925,5000,0,0,1176,100,0),
(669790,4,-11473.2,1563.3,48.5589,3.51938,5000,0,0,1176,100,0),
(669790,5,-11480.7,1573.77,48.5589,2.08603,5000,0,0,1176,100,0),
(669790,6,-11469.5,1580.17,48.8694,0.868665,5000,0,0,1176,100,0),
(669790,7,-11465.4,1566.6,48.8035,0.110752,5000,0,0,1176,100,0),
(669790,8,-11468.5,1557.23,48.9492,0,0,0,0,0,100,0),
(669790,9,-11468.7,1550.04,51.1792,0,0,0,0,0,100,0),
(669790,10,-11467.1,1539.53,50.8706,0,0,0,0,0,100,0),
(669790,11,-11465.7,1530.3,50.1991,0,0,0,0,0,100,0),
(669790,12,-11464.6,1527.82,50.9863,0,0,0,0,0,100,0),
(669790,13,-11461.4,1523.53,50.9375,0,0,0,0,0,100,0),
(669790,14,-11459.6,1519.93,50.9352,0,0,0,0,0,100,0),
(669790,15,-11461.6,1518.22,50.9365,5.27756,60000,0,0,0,100,0),
(669790,16,-11464.6,1517.21,50.9365,0,0,0,0,0,100,0),
(669790,17,-11466.9,1521.15,50.9365,2.02601,5000,0,0,1176,100,0),
(669790,18,-11463.4,1523.59,50.9365,0,0,0,0,0,100,0),
(669790,19,-11464.8,1527.76,50.9913,0,0,0,0,0,100,0),
(669790,20,-11465.6,1529.95,50.1961,0,0,0,0,0,100,0),
(669790,21,-11473.1,1545.59,50.509,0,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
