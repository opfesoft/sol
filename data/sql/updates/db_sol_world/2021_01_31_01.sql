-- DB update 2021_01_31_00 -> 2021_01_31_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_31_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_31_00 2021_01_31_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1612105938016665945'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1612105938016665945');

UPDATE `smart_scripts` SET `action_param1` = 1 WHERE `entryorguid` = -109655 AND `source_type` = 0 AND `id` = 8;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (-109653,-109652);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-109653,0,0,0,11,0,100,0,0,0,0,0,0,53,0,2523400,1,0,0,0,1,0,0,0,0,0,0,0,0,'Stormfleet Deckhand - On Respawn - Start WP Movement'),
(-109653,0,1,2,40,0,100,0,6,2523400,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stormfleet Deckhand - On WP 6 Reached - Pause WP Movement'),
(-109653,0,2,0,61,0,100,0,0,0,0,0,0,80,2523400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stormfleet Deckhand - Linked - Call Timed Action List'),
(-109653,0,3,4,40,0,100,0,13,2523400,0,0,0,54,21000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stormfleet Deckhand - On WP 13 Reached - Pause WP Movement'),
(-109653,0,4,5,61,0,100,0,0,0,0,0,0,66,1,0,0,0,0,0,8,0,0,0,0,0,0,0,5.79449,'Stormfleet Deckhand - Linked - Set Orientation'),
(-109653,0,5,0,61,0,100,0,0,0,0,0,0,80,2523401,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stormfleet Deckhand - Linked - Call Timed Action List'),

(-109652,0,0,0,11,0,100,0,0,0,0,0,0,53,0,2523402,1,0,0,0,1,0,0,0,0,0,0,0,0,'Stormfleet Deckhand - On Respawn - Start WP Movement'),
(-109652,0,1,2,40,0,100,0,24,2523402,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stormfleet Deckhand - On WP 24 Reached - Pause WP Movement'),
(-109652,0,2,0,61,0,100,0,0,0,0,0,0,80,2523400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stormfleet Deckhand - Linked - Call Timed Action List'),
(-109652,0,3,4,40,0,100,0,12,2523402,0,0,0,54,21000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stormfleet Deckhand - On WP 12 Reached - Pause WP Movement'),
(-109652,0,4,0,61,0,100,0,0,0,0,0,0,80,2523401,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stormfleet Deckhand - Linked - Call Timed Action List');

DELETE FROM `waypoints` WHERE `entry` IN (2523400,2523402);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(2523400,1,2263.9,5310.75,23.2891,NULL),
(2523400,2,2261.97,5306.51,23.4361,NULL),
(2523400,3,2261.39,5305.25,21.6508,NULL),
(2523400,4,2260.5,5293.5,19.7533,NULL),
(2523400,5,2260,5287,15.4909,NULL),
(2523400,6,2257.71,5281.93,12.0934,NULL),
(2523400,7,2259.82,5284.43,13.8148,NULL),
(2523400,8,2261.76,5286.73,15.7673,NULL),
(2523400,9,2262.36,5293.11,19.7255,NULL),
(2523400,10,2263.46,5304.82,21.7292,NULL),
(2523400,11,2263.67,5306.56,23.4059,NULL),
(2523400,12,2264.68,5311.02,23.2787,NULL),
(2523400,13,2265.7,5314.69,22.4381,NULL),

(2523402,1,2212.3,5281.93,10.8259,NULL),
(2523402,2,2211.7,5275.36,10.8259,NULL),
(2523402,3,2214.94,5273.51,11.2623,NULL),
(2523402,4,2222.43,5269.23,7.16162,NULL),
(2523402,5,2232.36,5265.75,7.16047,NULL),
(2523402,6,2236.66,5264.24,9.46374,NULL),
(2523402,7,2240.84,5263.2,11.7469,NULL),
(2523402,8,2246.5,5261.79,11.8076,NULL),
(2523402,9,2248.37,5259.46,11.7849,NULL),
(2523402,10,2247.78,5252.42,11.9668,NULL),
(2523402,11,2246.38,5249.14,15.5344,NULL),
(2523402,12,2243.87,5243.42,21.4974,NULL),
(2523402,13,2245.98,5248.25,16.5162,NULL),
(2523402,14,2248.01,5252.96,11.9478,NULL),
(2523402,15,2248.44,5255.79,11.8694,NULL),
(2523402,16,2248.4,5261.32,11.747,NULL),
(2523402,17,2240.59,5263.68,11.7386,NULL),
(2523402,18,2231.98,5266.28,7.1609,NULL),
(2523402,19,2222.66,5270.77,7.16181,NULL),
(2523402,20,2218.9,5272.58,9.18419,NULL),
(2523402,21,2214.91,5274.5,11.2657,NULL),
(2523402,22,2213.56,5283.1,10.8259,NULL),
(2523402,23,2218.24,5291.42,10.7009,NULL),
(2523402,24,2224.21,5293.65,10.8259,NULL),
(2523402,25,2220.03,5292.01,10.7009,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
