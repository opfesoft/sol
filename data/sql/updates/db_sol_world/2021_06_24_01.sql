-- DB update 2021_06_24_00 -> 2021_06_24_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_24_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_24_00 2021_06_24_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624516753251026126'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624516753251026126');

UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 3713;
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 3863;
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 3878;

DELETE FROM `creature_addon` WHERE `guid` IN (3863,3878);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(3863,38630,2404,0,4097,0,0,''),
(3878,38780,2404,0,4097,0,0,'');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = -3878;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-3878,0,0,0,0,0,100,0,1000,3000,12000,16000,0,11,5115,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethergarde Foreman - IC - Cast ''Battle Command'''),
(-3878,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Nethergarde Foreman - Between 0-15% Health - Flee For Assist'),
(-3878,0,2,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethergarde Foreman - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` IN (38630,38780);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(38630,1,-10829,-3048.59,47.1686,0,0,0,0,100,0),
(38630,2,-10833.1,-3041.64,47.632,0,0,0,0,100,0),
(38630,3,-10837.8,-3033.79,48.8728,0,30000,0,0,100,0),
(38630,4,-10833.1,-3041.64,47.632,0,0,0,0,100,0),
(38630,5,-10829,-3048.59,47.1686,0,0,0,0,100,0),
(38630,6,-10824.1,-3056.87,46.8575,0,0,0,0,100,0),
(38630,7,-10818,-3067.1,45.9931,0,0,0,0,100,0),
(38630,8,-10814.5,-3072.99,45.8436,0,0,0,0,100,0),
(38630,9,-10808.3,-3083.32,44.1801,0,0,0,0,100,0),
(38630,10,-10801.4,-3095.06,43.3912,0,0,0,0,100,0),
(38630,11,-10797.1,-3102.29,42.9371,0,0,0,0,100,0),
(38630,12,-10794.3,-3107,42.511,0,30000,0,0,100,0),
(38630,13,-10797.1,-3102.29,42.9371,0,0,0,0,100,0),
(38630,14,-10801.4,-3095.06,43.3912,0,0,0,0,100,0),
(38630,15,-10808.3,-3083.32,44.1801,0,0,0,0,100,0),
(38630,16,-10814.5,-3072.99,45.8436,0,0,0,0,100,0),
(38630,17,-10818,-3067.1,45.9931,0,0,0,0,100,0),
(38630,18,-10824.1,-3056.87,46.8575,0,0,0,0,100,0),

(38780,1,-10652.6,-3194.84,23.4808,2.21996,30000,0,0,100,0),
(38780,2,-10648,-3201.85,23.1075,0,0,0,0,100,0),
(38780,3,-10643.5,-3208.67,22.1845,0,0,0,0,100,0),
(38780,4,-10638.4,-3216.47,21.5425,0,0,0,0,100,0),
(38780,5,-10635.3,-3223.66,20.9822,0,0,0,0,100,0),
(38780,6,-10633.1,-3229.94,20.4327,0,0,0,0,100,0),
(38780,7,-10631.9,-3238.6,19.9126,0,0,0,0,100,0),
(38780,8,-10630.9,-3245.07,19.7624,0,0,0,0,100,0),
(38780,9,-10630,-3251.41,19.8088,0,0,0,0,100,0),
(38780,10,-10629.9,-3259.11,19.8088,0,0,0,0,100,0),
(38780,11,-10629.7,-3267.97,19.8088,0,0,0,0,100,0),
(38780,12,-10628.2,-3277.41,19.6858,0,0,0,0,100,0),
(38780,13,-10626.7,-3286.85,19.3872,0,0,0,0,100,0),
(38780,14,-10625.4,-3295.03,18.9527,0,0,0,0,100,0),
(38780,15,-10625.3,-3306.92,18.5729,0,0,0,0,100,0),
(38780,16,-10625.2,-3316.02,18.7202,0,0,0,0,100,0),
(38780,17,-10625.1,-3323.26,18.082,0,0,0,0,100,0),
(38780,18,-10625,-3331.66,16.681,0,0,0,0,100,0),
(38780,19,-10626.5,-3342.05,13.9063,0,0,0,0,100,0),
(38780,20,-10628,-3351.61,11.0243,0,0,0,0,100,0),
(38780,21,-10627.2,-3361.15,8.29251,0,0,0,0,100,0),
(38780,22,-10626.7,-3366.81,6.61475,0,0,0,0,100,0),
(38780,23,-10626.1,-3374.73,4.23568,0,0,0,0,100,0),
(38780,24,-10626.3,-3382.19,2.77004,0,0,0,0,100,0),
(38780,25,-10626.6,-3390.71,2.15341,0,0,0,0,100,0),
(38780,26,-10626.9,-3400.73,1.9281,0,30000,0,0,100,0),
(38780,27,-10632.9,-3392.62,2.52588,0,0,0,0,100,0),
(38780,28,-10638.1,-3385.5,2.6356,0,0,0,0,100,0),
(38780,29,-10644.6,-3379.96,2.73459,0,0,0,0,100,0),
(38780,30,-10653.1,-3375.72,2.62484,0,0,0,0,100,0),
(38780,31,-10660.3,-3372.06,2.3652,0,0,0,0,100,0),
(38780,32,-10658.2,-3367.93,2.69394,0,0,0,0,100,0),
(38780,33,-10651.8,-3361.86,3.7655,0,0,0,0,100,0),
(38780,34,-10646.5,-3353.44,4.75882,0,0,0,0,100,0),
(38780,35,-10644.2,-3344.15,5.74838,0,0,0,0,100,0),
(38780,36,-10644.1,-3335.87,6.50594,0,0,0,0,100,0),
(38780,37,-10644,-3326.65,7.22809,0,0,0,0,100,0),
(38780,38,-10643.8,-3317.79,7.92306,0,0,0,0,100,0),
(38780,39,-10643.7,-3309.51,8.57249,0,0,0,0,100,0),
(38780,40,-10643.6,-3302.63,9.11265,0,0,0,0,100,0),
(38780,41,-10644.9,-3293.85,9.80848,0,0,0,0,100,0),
(38780,42,-10646.2,-3284.14,10.5779,0,0,0,0,100,0),
(38780,43,-10647.5,-3275.02,11.3013,0,0,0,0,100,0),
(38780,44,-10648.5,-3267.63,11.8871,0,0,0,0,100,0),
(38780,45,-10649,-3260.23,12.5679,0,0,0,0,100,0),
(38780,46,-10649.5,-3252.19,13.4538,0,0,0,0,100,0),
(38780,47,-10649.8,-3245.9,14.3991,0,0,0,0,100,0),
(38780,48,-10652.3,-3239.76,15.519,0,0,0,0,100,0),
(38780,49,-10655.3,-3232.55,17.1393,0,0,0,0,100,0),
(38780,50,-10658.3,-3225.33,19.162,0,0,0,0,100,0),
(38780,51,-10661.4,-3217.9,20.6428,0,0,0,0,100,0),
(38780,52,-10665,-3212.23,21.2346,0,0,0,0,100,0),
(38780,53,-10668.9,-3205.5,21.5442,0,30000,0,0,100,0),
(38780,54,-10660.4,-3199.93,22.4689,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;