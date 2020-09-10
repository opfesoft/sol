-- DB update 2020_09_10_00 -> 2020_09_10_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_09_10_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_09_10_00 2020_09_10_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1599734337397074683'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1599734337397074683');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 27003 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2700300,2700301,2700302) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27003,0,0,1,11,0,100,1,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - On Respawn - Set Active On'),
(27003,0,1,2,61,0,100,0,0,0,0,0,0,19,514,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - Linked - Remove Flags Not Attackable & Immune To NPC''s'),
(27003,0,2,3,61,0,100,0,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - Linked - Set React State ''Aggressive'''),
(27003,0,3,4,61,0,100,0,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - Linked - Enable Auto Attack'),
(27003,0,4,0,61,0,100,0,0,0,0,0,0,53,0,2700300,1,0,0,2,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - Linked - Start WP Movement'),
(27003,0,5,0,4,0,100,1,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - On Aggro - Say Line 0'),
(27003,0,6,0,2,0,100,1,0,50,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - Between 0-50% Health - Say Line 1'),
(27003,0,7,0,2,0,100,0,0,20,0,0,0,80,2700300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - Between 0-20% Health - Run Script'),
(27003,0,8,0,40,0,100,0,10,2700300,0,0,0,54,30000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - On WP 10 Reached - Pause WP Movement'),
(27003,0,9,0,40,0,100,0,33,2700300,0,0,0,80,2700301,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - On WP 33 Reached - Call Timed Action List'),
(27003,0,10,0,40,0,100,0,54,2700300,0,0,0,80,2700302,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - On WP 54 Reached - Call Timed Action List'),

(2700300,9,0,0,0,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - On Script - Set React State ''Passive'''),
(2700300,9,1,0,0,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - On Script - Disable Auto Attack'),
(2700300,9,2,0,0,0,100,0,0,0,0,0,0,18,33346,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - On Script - Set Flags Not Attackable & Immune To NPC''s'),
(2700300,9,3,0,0,0,100,0,0,0,0,0,0,75,48325,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - On Script - Add Aura ''Rune Shield'''),
(2700300,9,4,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - On Script - Say Line 2'),
(2700300,9,5,0,0,0,100,0,14000,14000,0,0,0,11,48028,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - On Script - Cast ''Reclusive Runemaster Quest Complete'''),
(2700300,9,6,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - On Script - Despawn Instant'),

(2700301,9,0,0,0,0,100,0,0,0,0,0,0,54,30000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - On Script - Pause WP Movement'),
(2700301,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,2.06373,'Dregmar Runebrand - On Script - Set Orientation'),

(2700302,9,0,0,0,0,100,0,0,0,0,0,0,54,30000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dregmar Runebrand - On Script - Pause WP Movement'),
(2700302,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,1.64511,'Dregmar Runebrand - On Script - Set Orientation');

DELETE FROM `waypoints` WHERE `entry` = 2700300;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(2700300,1,3717.16,-453.417,161.252,'Dregmar Runebrand'),
(2700300,2,3711.79,-456.766,161.852,NULL),
(2700300,3,3706.73,-459.885,161.837,NULL),
(2700300,4,3703.65,-461.779,164.509,NULL),
(2700300,5,3699.38,-464.406,165.884,NULL),
(2700300,6,3695.41,-466.854,164.927,NULL),
(2700300,7,3691.21,-472.457,163.423,NULL),
(2700300,8,3686.95,-478.159,160.931,NULL),
(2700300,9,3682.23,-484.476,158.518,NULL),
(2700300,10,3678.91,-487.42,158.526,NULL),
(2700300,11,3682.6,-483.621,158.698,NULL),
(2700300,12,3686.3,-478.728,160.689,NULL),
(2700300,13,3690.58,-473.178,163.183,NULL),
(2700300,14,3695.08,-467.355,164.798,NULL),
(2700300,15,3698.85,-464.08,165.849,NULL),
(2700300,16,3702.4,-460.782,164.679,NULL),
(2700300,17,3704.8,-458.554,162.498,NULL),
(2700300,18,3709.73,-453.737,162.086,NULL),
(2700300,19,3714.99,-448.611,160.584,NULL),
(2700300,20,3720.09,-443.646,158.761,NULL),
(2700300,21,3724.68,-435.324,155.187,NULL),
(2700300,22,3728.49,-428.232,152.333,NULL),
(2700300,23,3732.63,-420.523,149.808,NULL),
(2700300,24,3737.26,-411.888,147.334,NULL),
(2700300,25,3740.3,-406.239,145.804,NULL),
(2700300,26,3750.32,-407.497,142.17,NULL),
(2700300,27,3758.54,-408.518,138.829,NULL),
(2700300,28,3767.22,-409.596,135.017,NULL),
(2700300,29,3774.98,-410.56,131.374,NULL),
(2700300,30,3782.16,-411.452,127.943,NULL),
(2700300,31,3788.53,-412.243,124.953,NULL),
(2700300,32,3794.21,-410.146,122.145,NULL),
(2700300,33,3799.74,-407.419,119.778,NULL),
(2700300,34,3794.37,-410.171,122.076,NULL),
(2700300,35,3788.54,-412.262,124.946,NULL),
(2700300,36,3782.62,-413.575,127.829,NULL),
(2700300,37,3776.01,-415.039,131.09,NULL),
(2700300,38,3768.72,-416.655,134.804,NULL),
(2700300,39,3761.77,-418.195,138.924,NULL),
(2700300,40,3756.18,-419.432,142.344,NULL),
(2700300,41,3749.93,-420.818,145.519,NULL),
(2700300,42,3744.57,-422.005,147.603,NULL),
(2700300,43,3738.64,-423.318,149.421,NULL),
(2700300,44,3741.47,-432.202,152.34,NULL),
(2700300,45,3744.01,-439.85,155.71,NULL),
(2700300,46,3746.61,-447.717,159.452,NULL),
(2700300,47,3749.22,-455.583,163.298,NULL),
(2700300,48,3751.35,-462.009,166.224,NULL),
(2700300,49,3761.09,-467.329,167.941,NULL),
(2700300,50,3771.45,-472.944,168.444,NULL),
(2700300,51,3779.04,-477.055,169.04,NULL),
(2700300,52,3787.61,-476.287,168.902,NULL),
(2700300,53,3796.5,-474.34,168.975,NULL),
(2700300,54,3806.76,-469.953,168.992,NULL),
(2700300,55,3795.14,-468.062,168.365,NULL),
(2700300,56,3785.34,-466.507,167.805,NULL),
(2700300,57,3773.93,-464.697,166.985,NULL),
(2700300,58,3764.25,-463.161,166.521,NULL),
(2700300,59,3753.66,-461.479,166.011,NULL),
(2700300,60,3743.86,-459.924,165.079,NULL),
(2700300,61,3729.99,-456.73,162.728,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
