-- DB update 2021_06_16_00 -> 2021_06_16_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_16_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_16_00 2021_06_16_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1623843664869041564'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1623843664869041564');

UPDATE `creature_addon` SET `mount` = 19085 WHERE `guid` IN (94309,94325);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (24976,-94309,-94325,-94400);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(24976,0,0,0,2,0,100,0,1,40,15000,25000,0,11,13952,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dawnblade Blood Knight - Between 1-40% Health - Cast ''Holy Light'''),
(24976,0,1,0,14,0,100,0,250,30,5000,12000,0,11,13952,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Dawnblade Blood Knight - Friendly At 250 Health - Cast ''Holy Light'''),
(24976,0,2,0,0,0,100,0,8000,18000,25000,36000,0,11,45337,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Blood Knight - IC - Cast ''Judgement of Wrath'''),
(24976,0,3,0,0,0,100,0,3000,17000,14000,48750,0,11,45095,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dawnblade Blood Knight - IC - Cast ''Seal of Wrath'''),

(-94309,0,0,0,2,0,100,0,1,40,15000,25000,0,11,13952,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dawnblade Blood Knight - Between 1-40% Health - Cast ''Holy Light'''),
(-94309,0,1,0,14,0,100,0,250,30,5000,12000,0,11,13952,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Dawnblade Blood Knight - Friendly At 250 Health - Cast ''Holy Light'''),
(-94309,0,2,0,0,0,100,0,8000,18000,25000,36000,0,11,45337,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Blood Knight - IC - Cast ''Judgement of Wrath'''),
(-94309,0,3,0,0,0,100,0,3000,17000,14000,48750,0,11,45095,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dawnblade Blood Knight - IC - Cast ''Seal of Wrath'''),
(-94309,0,4,5,34,0,100,0,2,1,0,0,0,5,34,0,0,0,0,0,19,25225,5,0,0,0,0,0,0,'Dawnblade Blood Knight - On WP 2 Reached - Play Emote ''ONESHOT_WOUNDCRITICAL'' (Practice Dummy)'),
(-94309,0,5,0,61,0,100,0,0,0,0,0,0,4,3720,0,1,0,0,0,19,25225,5,0,0,0,0,0,0,'Dawnblade Blood Knight - Linked - Play Sound ''2hMaceHitWood'' (Practice Dummy)'),

(-94325,0,0,0,2,0,100,0,1,40,15000,25000,0,11,13952,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dawnblade Blood Knight - Between 1-40% Health - Cast ''Holy Light'''),
(-94325,0,1,0,14,0,100,0,250,30,5000,12000,0,11,13952,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Dawnblade Blood Knight - Friendly At 250 Health - Cast ''Holy Light'''),
(-94325,0,2,0,0,0,100,0,8000,18000,25000,36000,0,11,45337,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Blood Knight - IC - Cast ''Judgement of Wrath'''),
(-94325,0,3,0,0,0,100,0,3000,17000,14000,48750,0,11,45095,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dawnblade Blood Knight - IC - Cast ''Seal of Wrath'''),
(-94325,0,4,5,34,0,100,0,2,1,0,0,0,5,34,0,0,0,0,0,19,25225,5,0,0,0,0,0,0,'Dawnblade Blood Knight - On WP 2 Reached - Play Emote ''ONESHOT_WOUNDCRITICAL'' (Practice Dummy)'),
(-94325,0,5,0,61,0,100,0,0,0,0,0,0,4,3720,0,1,0,0,0,19,25225,5,0,0,0,0,0,0,'Dawnblade Blood Knight - Linked - Play Sound ''2hMaceHitWood'' (Practice Dummy)'),

(-94400,0,0,0,2,0,100,0,1,40,15000,25000,0,11,13952,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dawnblade Blood Knight - Between 1-40% Health - Cast ''Holy Light'''),
(-94400,0,1,0,14,0,100,0,250,30,5000,12000,0,11,13952,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Dawnblade Blood Knight - Friendly At 250 Health - Cast ''Holy Light'''),
(-94400,0,2,0,0,0,100,0,8000,18000,25000,36000,0,11,45337,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Blood Knight - IC - Cast ''Judgement of Wrath'''),
(-94400,0,3,0,0,0,100,0,3000,17000,14000,48750,0,11,45095,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dawnblade Blood Knight - IC - Cast ''Seal of Wrath'''),
(-94400,0,4,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dawnblade Blood Knight - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` IN (943090,943250,944000);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(943090,1,12690.7,-6635.47,4.71367,0,0,1,447,100,0),
(943090,2,12734.2,-6630.01,2.51197,0,0,1,0,100,0),
(943090,3,12737.7,-6629.93,2.2892,0,0,1,0,100,0),
(943090,4,12737.2,-6632.37,2.10811,0,0,1,0,100,0),
(943090,5,12688.5,-6639.19,4.75524,0,0,0,0,100,0),
(943090,6,12690.7,-6635.47,4.71367,0.124874,30000,0,0,100,0),

(943250,1,12696.7,-6648.05,4.07282,0,0,1,449,100,0),
(943250,2,12732.6,-6647.13,1.11172,0,0,1,0,100,0),
(943250,3,12735.9,-6647.03,0.809907,0,0,1,0,100,0),
(943250,4,12735.6,-6643.55,1.20219,0,0,1,0,100,0),
(943250,5,12693.8,-6645.64,4.37057,0,0,0,0,100,0),
(943250,6,12696.7,-6648.05,4.07282,0.0257424,30000,0,0,100,0),

(944000,1,12745,-6780.58,5.42392,0,0,0,0,100,0),
(944000,2,12745,-6774.24,5.19983,0,0,0,0,100,0),
(944000,3,12744.9,-6763.55,3.87162,0,0,0,0,100,0),
(944000,4,12744.8,-6753.19,2.28029,0,0,0,0,100,0),
(944000,5,12744.7,-6742.67,0.374358,0,0,0,0,100,0),
(944000,6,12739,-6727.62,0.0611075,0,0,0,0,100,0),
(944000,7,12732.9,-6711.6,0.0611075,0,0,0,0,100,0),
(944000,8,12725.4,-6691.73,0.183397,0,0,0,0,100,0),
(944000,9,12717.7,-6671.36,-0.073843,0,0,0,0,100,0),
(944000,10,12707.4,-6669.96,0.566335,0,0,0,0,100,0),
(944000,11,12694.8,-6668.25,2.86799,0,0,0,0,100,0),
(944000,12,12687.5,-6667.27,3.88784,0,0,0,0,100,0),
(944000,13,12680.6,-6668.02,4.28131,0,0,0,0,100,0),
(944000,14,12671.6,-6669,4.4795,0,0,0,0,100,0),
(944000,15,12663.5,-6669.88,4.54454,0,0,0,0,100,0),
(944000,16,12651.9,-6675.38,4.57013,0,0,0,0,100,0),
(944000,17,12650.2,-6688.43,4.56084,0,0,0,0,100,0),
(944000,18,12652,-6702.04,4.56085,0,0,0,0,100,0),
(944000,19,12653.9,-6715.84,4.56085,0,0,0,0,100,0),
(944000,20,12655.5,-6727.74,4.57296,0,0,0,0,100,0),
(944000,21,12660.3,-6737.96,4.57297,0,0,0,0,100,0),
(944000,22,12666.1,-6750.24,4.57332,0,0,0,0,100,0),
(944000,23,12671.9,-6762.62,4.58709,0,0,0,0,100,0),
(944000,24,12678.6,-6776.74,4.59928,0,0,0,0,100,0),
(944000,25,12689.9,-6772.38,4.60084,0,0,0,0,100,0),
(944000,26,12700.4,-6768.35,4.62427,0,0,0,0,100,0),
(944000,27,12709.6,-6769.54,4.85954,0,0,0,0,100,0),
(944000,28,12720.5,-6771.77,5.40016,0,0,0,0,100,0),
(944000,29,12728.5,-6782.06,5.42838,0,0,0,0,100,0),
(944000,30,12737,-6793.05,5.42356,0,0,0,0,100,0),
(944000,31,12742.9,-6788.73,5.42356,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
