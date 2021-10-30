-- DB update 2021_10_29_00 -> 2021_10_30_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_29_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_29_00 2021_10_30_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1635601570625717201'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1635601570625717201');

UPDATE `creature_template` SET `speed_walk` = 1, `AIName` = 'SmartAI', `InhabitType` = 3, `flags_extra` = `flags_extra` | 512 WHERE `entry` IN (1492,5361,4686,4687,5359,5360,5466,5467,6143,6144);

UPDATE `creature_template_addon` SET `isLarge` = 1 WHERE `entry` IN (5360,5361,5466,6143,6144);

UPDATE `creature_addon` SET `bytes2` = 1, `isLarge` = 1 WHERE `guid` IN (27937,27938,23118);

UPDATE `creature` SET `position_x` = -5315.45, `position_y` = 2265.59, `position_z` = -7.23335 WHERE `guid` = 51710;
UPDATE `creature` SET `position_x` = -4132.78, `position_y` = 2646.02, `position_z` = -4.31677 WHERE `guid` = 51716;
UPDATE `creature` SET `position_x` = 3414.58, `position_y` = -6417.66, `position_z` = -17.2844 WHERE `guid` = 36524;
UPDATE `creature` SET `position_x` = 3918.86, `position_y` = -6416.54, `position_z` = -18.1213 WHERE `guid` = 36532;
UPDATE `creature` SET `position_x` = 3942.77, `position_y` = -6163.46, `position_z` = -4.53835 WHERE `guid` = 35102;
UPDATE `creature` SET `position_x` = 2878.73, `position_y` = -7104.65, `position_z` = -10.1894, `wander_distance` = 10, `spawntimesecs` = 600 WHERE `guid` = 36527;
UPDATE `creature` SET `position_x` = 2838.23, `position_y` = -7232.91, `position_z` = -14.0414, `wander_distance` = 10, `spawntimesecs` = 600 WHERE `guid` = 36530;
UPDATE `creature` SET `position_x` = 2985.29, `position_y` = -7069.85, `position_z` = -15.1031, `wander_distance` = 10, `spawntimesecs` = 600 WHERE `guid` = 36531;
UPDATE `creature` SET `position_x` = -8944.06, `position_y` = -4753.35, `position_z` = -52.4271, `wander_distance` = 25, `MovementType` = 1 WHERE `guid` = 23118;
UPDATE `creature` SET `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 35097;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (4686,5466,5467,6143);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (1492,5361,4687,5359,5360,6144) AND `id` > 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1492,0,1,0,25,0,100,0,0,0,0,0,0,61,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gorlash - On Reset - Set Swim Off'),

(5361,0,1,0,25,0,100,0,0,0,0,0,0,61,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wave Strider - On Reset - Set Swim Off'),

(4686,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deepstrider Giant - On Respawn - Set Active On'),
(4686,0,1,0,25,0,100,0,0,0,0,0,0,61,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deepstrider Giant - On Reset - Set Swim Off'),

(4687,0,1,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deepstrider Searcher - On Respawn - Set Active On'),
(4687,0,2,0,25,0,100,0,0,0,0,0,0,61,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deepstrider Searcher - On Reset - Set Swim Off'),

(5359,0,1,0,25,0,100,0,0,0,0,0,0,61,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shore Strider - On Reset - Set Swim Off'),

(5360,0,1,0,25,0,100,0,0,0,0,0,0,61,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deep Strider - On Reset - Set Swim Off'),

(5466,0,0,0,25,0,100,0,0,0,0,0,0,61,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Coast Strider - On Reset - Set Swim Off'),

(5467,0,0,0,25,0,100,0,0,0,0,0,0,61,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deep Dweller - On Reset - Set Swim Off'),

(6143,0,0,0,25,0,100,0,0,0,0,0,0,61,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Arkkoroc - On Reset - Set Swim Off'),

(6144,0,1,0,25,0,100,0,0,0,0,0,0,61,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Son of Arkkoroc - On Reset - Set Swim Off');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
