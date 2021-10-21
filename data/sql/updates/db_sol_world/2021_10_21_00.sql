-- DB update 2021_10_20_02 -> 2021_10_21_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_20_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_20_02 2021_10_21_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1634796073815620750'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1634796073815620750');

-- Set previous quest "Guarded Thunderbrew Barrel" for "Distracting Jarven"
UPDATE `quest_template_addon` SET `PrevQuestID` = 403 WHERE `ID` = 308;

-- Unguarded Thunder Ale Barrel: Set same position/orientation/rotation as Guarded Thunder Ale Barrel
UPDATE `gameobject` SET `position_x` = -5607.24, `position_y` = -547.934, `position_z` = 392.985, `orientation` = 0.471239, `rotation2` = 0.233445, `rotation3` = 0.97237 WHERE `guid` = 35875;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 1373;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 137300;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1373,0,0,1,20,0,100,0,308,0,0,0,0,53,0,1373,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jarven Thunderbrew - On Quest ''Distracting Jarven'' Rewarded - Start WP Movement'),
(1373,0,1,2,61,0,100,0,308,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jarven Thunderbrew - Linked - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(1373,0,2,0,61,0,100,0,308,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jarven Thunderbrew - Linked - Say Line 0'),
(1373,0,3,4,40,0,100,0,2,1373,0,0,0,233,600,0,0,0,0,0,14,1037,269,0,0,0,0,0,0,'Jarven Thunderbrew - On WP 2 Reached - Despawn GO ''Guarded Thunder Ale Barrel'''),
(1373,0,4,0,61,0,100,0,0,0,0,0,0,70,600,0,0,0,0,0,14,35875,270,0,0,0,0,0,0,'Jarven Thunderbrew - Linked - Respawn GO ''Unguarded Thunder Ale Barrel'''),
(1373,0,5,6,40,0,100,0,11,1373,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jarven Thunderbrew - On WP 11 Reached - Pause WP Movement'),
(1373,0,6,7,61,0,100,0,0,0,0,0,0,66,1,0,0,0,0,0,8,0,0,0,0,0,0,0,5.6724,'Jarven Thunderbrew - Linked - Set Orientation'),
(1373,0,7,0,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jarven Thunderbrew - Linked - Say Line 1'),
(1373,0,8,9,40,0,100,0,19,1373,0,0,0,233,0,0,0,0,0,0,14,35875,270,0,0,0,0,0,0,'Jarven Thunderbrew - On WP 19 Reached - Despawn GO ''Unguarded Thunder Ale Barrel'''),
(1373,0,9,0,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,14,1037,269,0,0,0,0,0,0,'Jarven Thunderbrew - Linked - Respawn GO ''Guarded Thunder Ale Barrel'''),
(1373,0,10,0,40,0,100,0,20,1373,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jarven Thunderbrew - On WP 20 Reached - Say Line 2'),
(1373,0,11,12,58,0,100,0,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jarven Thunderbrew - On WP Ended - Say Line 3'),
(1373,0,12,13,61,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jarven Thunderbrew - Linked - Add ''GOSSIP_OPTION_QUESTGIVER'''),
(1373,0,13,14,61,0,100,0,0,0,0,0,0,101,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jarven Thunderbrew - Linked - Reset Home Position'),
(1373,0,14,0,61,0,100,0,0,0,0,0,0,66,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jarven Thunderbrew - Linked - Reset Orientation');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` = 308;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(19,0,308,0,0,47,0,311,1,0,0,0,0,'Quest ''Distracting Jarven'' - Group 0: Can accept the quest only if quest ''Return to Marleth'' is not taken'),
(20,0,308,0,0,47,0,311,1,0,0,0,0,'Quest ''Distracting Jarven'' - Group 0: Show quest mark only if quest ''Return to Marleth'' is not taken');

DELETE FROM `waypoints` WHERE `entry` = 1373;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(1373,1,-5601.64,-541.38,392.42,'Jarven Thunderbrew - Quest ''Distracting Jarven'''),
(1373,2,-5597.94,-542.04,392.42,NULL),
(1373,3,-5597.95,-547.885,395.485,NULL),
(1373,4,-5599.31,-549.285,395.485,NULL),
(1373,5,-5605.31,-549.33,399.09,NULL),
(1373,6,-5607.55,-546.63,399.09,NULL),
(1373,7,-5597.52,-538.75,399.09,NULL),
(1373,8,-5597.58,-533.5,399.09,NULL),
(1373,9,-5597.6,-532.17,399.652,NULL),
(1373,10,-5597.62,-530.24,399.65,NULL),
(1373,11,-5603.67,-529.91,399.65,NULL),
(1373,12,-5597.62,-530.24,399.65,NULL),
(1373,13,-5597.6,-532.17,399.652,NULL),
(1373,14,-5597.58,-533.5,399.09,NULL),
(1373,15,-5597.52,-538.75,399.09,NULL),
(1373,16,-5607.55,-546.63,399.09,NULL),
(1373,17,-5605.31,-549.33,399.09,NULL),
(1373,18,-5599.31,-549.285,395.485,NULL),
(1373,19,-5597.95,-547.885,395.485,NULL),
(1373,20,-5597.94,-542.04,392.42,NULL),
(1373,21,-5601.64,-541.38,392.42,NULL),
(1373,22,-5605.96,-544.45,392.43,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
