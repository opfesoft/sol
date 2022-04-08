-- DB update 2022_04_07_01 -> 2022_04_08_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_07_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_07_01 2022_04_08_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1649397233216311862'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1649397233216311862');

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 61976;
UPDATE `creature` SET `position_x` = -4706.17, `position_y` = -12397.4, `position_z` = 14.2515, `orientation` = 3.8304 WHERE `guid` = 62081;

DELETE FROM `creature_addon` WHERE `guid` = 61976;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(61976,619760,0,0,0,0,0,NULL);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 17246;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1724600,1724601,1724602,1724603);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17246,0,0,0,34,0,100,0,2,1,0,0,0,80,1724600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Waypoint 2 Reached - Call Timed Action List'),
(17246,0,1,0,34,0,100,0,2,2,0,0,0,80,1724601,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Waypoint 3 Reached - Call Timed Action List'),
(17246,0,2,0,34,0,100,0,2,4,0,0,0,80,1724602,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Waypoint 5 Reached - Call Timed Action List'),
(17246,0,3,0,34,0,100,0,2,8,0,0,0,80,1724603,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Waypoint 9 Reached - Call Timed Action List'),
(17246,0,4,0,34,0,100,0,2,11,0,0,0,80,1724602,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Waypoint 12 Reached - Call Timed Action List'),
(17246,0,5,0,34,0,100,0,2,16,0,0,0,80,1724602,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Waypoint 17 Reached - Call Timed Action List'),
(17246,0,6,7,54,0,100,0,0,0,0,0,0,17,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Just Summoned - Emote State ''STATE_DANCE'''),
(17246,0,7,0,61,0,100,0,0,0,0,0,0,83,211,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - Linked - Remove NPC Flags'),

(1724600,9,0,0,0,0,100,0,1000,1000,0,0,0,45,1,1,0,0,0,0,19,17240,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Set Data 1 1 (Admiral Odesyus)'),
(1724600,9,1,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,19,17240,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Say Line 0 (Admiral Odesyus)'),
(1724600,9,2,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,19,17240,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Set Orientation (Admiral Odesyus)'),

(1724601,9,0,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Say Line 0'),
(1724601,9,1,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Say Line 1'),
(1724601,9,2,0,0,0,100,0,9000,9000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Say Line 2'),
(1724601,9,3,0,0,0,100,0,9000,9000,0,0,0,1,1,0,0,0,0,0,19,17240,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Say Line 1 (Admiral Odesyus)'),
(1724601,9,4,0,0,0,100,0,9000,9000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Say Line 3'),
(1724601,9,5,0,0,0,100,0,2000,2000,0,0,0,64,1,0,0,0,0,0,19,620,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Store Target 1 (Chicken)'),
(1724601,9,6,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Set Orientation (Stored Target 1)'),
(1724601,9,7,0,0,0,100,0,1000,1000,0,0,0,11,30221,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Cast ''Shoot'' (Stored Target 1)'),
(1724601,9,8,0,0,0,100,0,3000,3000,0,0,0,66,0,0,0,0,0,0,19,17240,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Set Orientation (Admiral Odesyus)'),
(1724601,9,9,0,0,0,100,0,1000,1000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Say Line 4'),
(1724601,9,10,0,0,0,100,0,4000,4000,0,0,0,1,2,0,0,0,0,0,19,17240,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Say Line 2 (Admiral Odesyus)'),
(1724601,9,11,0,0,0,100,0,3000,3000,0,0,0,45,2,2,0,0,0,0,19,17240,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Set Data 2 2 (Admiral Odesyus)'),

(1724602,9,0,0,0,0,100,0,2000,2000,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Set Emote State ''STATE_USESTANDING'''),
(1724602,9,1,0,0,0,100,0,28000,28000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Set Emote State ''ONESHOT_NONE'''),

(1724603,9,0,0,0,0,100,0,1000,1000,0,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Cookie" McWeaksauce - On Script - Play Emote ''ONESHOT_KNEEL''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 17246;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,17246,0,0,29,1,17240,100,0,0,0,0,'"Cookie" McWeaksauce - Group 0: Execute SAI ID 0 only if ''Admiral Odesyus'' is nearby'),
(22,2,17246,0,0,29,1,17240,100,0,0,0,0,'"Cookie" McWeaksauce - Group 0: Execute SAI ID 1 only if ''Admiral Odesyus'' is nearby');

DELETE FROM `waypoints` WHERE `entry` = 17246;

DELETE FROM `waypoint_data` WHERE `id` = 619760;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(619760,1,-4708.59,-12400.3,11.8799,0.957318,25000,0,0,0,100,0),
(619760,2,-4708.59,-12400.3,11.8799,0.957318,6000,0,0,0,100,0),
(619760,3,-4703.46,-12406.8,12.299,5.16542,48000,0,0,0,100,0),
(619760,4,-4708.59,-12400.3,11.8799,0.957318,30000,0,0,0,100,0),
(619760,5,-4708.59,-12400.3,11.8799,0.957318,30000,0,0,0,100,0),
(619760,6,-4705.94,-12401.1,11.982,0,0,0,0,0,100,0),
(619760,7,-4703.38,-12400,11.6844,0,0,0,0,0,100,0),
(619760,8,-4701.18,-12397.9,11.6291,0,0,0,0,0,100,0),
(619760,9,-4701.26,-12395.3,11.6269,3.7387,5000,0,0,0,100,0),
(619760,10,-4703.86,-12392.2,11.6306,0,0,0,0,0,100,0),
(619760,11,-4707.93,-12392.1,11.7552,0,0,0,0,0,100,0),
(619760,12,-4710.58,-12394,11.8418,5.07388,30000,0,0,0,100,0),
(619760,13,-4713.87,-12395.3,11.8126,0,0,0,0,0,100,0),
(619760,14,-4714.78,-12398.2,11.8794,0,0,0,0,0,100,0),
(619760,15,-4715.03,-12401.5,11.9805,0,0,0,0,0,100,0),
(619760,16,-4712.59,-12403,11.9891,0,0,0,0,0,100,0),
(619760,17,-4711.21,-12400.2,11.8114,2.2111,30000,0,0,0,100,0),
(619760,18,-4708.59,-12400.3,11.8799,0.957318,300000,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
