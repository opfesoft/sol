-- DB update 2021_11_23_02 -> 2021_11_24_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_23_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_23_02 2021_11_24_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1637770346310826337'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1637770346310826337');

DELETE FROM `creature_addon` WHERE `guid` = 50005;

DELETE FROM `creature_text` WHERE `CreatureId` = 7956 AND `GroupID` = 4;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(7956,4,0,'Oh, no! We''ve run out of time. ',12,0,100,0,0,0,5285,0,'Kindal Moonweaver');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (7956,7997);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 143979;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (795600,795601,795602,799700,799701,799702,799703,14397900);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7956,0,0,1,11,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Respawn - Add ''UNIT_STAND_STATE_KNEEL'''),
(7956,0,1,2,61,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - Linked - Remove Timed Event 1'),
(7956,0,2,3,61,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - Linked - Add ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(7956,0,3,4,61,0,100,0,0,0,0,0,0,235,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - Linked - Disable Counter Reset'),
(7956,0,4,5,61,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - Linked - Disable Event Phase Reset'),
(7956,0,5,0,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - Linked - Set Phase 0'),
(7956,0,6,7,4,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Aggro - Say Line 1'),
(7956,0,7,0,61,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - Linked - Set Home Position'),
(7956,0,8,0,19,0,100,0,2969,0,0,0,0,80,795600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Quest ''Freedom for All Creatures'' Accepted - Call Timed Action List'),
(7956,0,9,0,77,1,100,0,1,6,0,0,0,80,795601,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Counter Set 1 6 - Call Timed Action List (Phase 1)'),
(7956,0,10,0,77,1,100,0,2,7,0,0,0,80,795602,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Counter Set 2 7 - Call Timed Action List (Phase 1)'),
(7956,0,11,0,59,0,100,0,1,0,0,0,0,1,4,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Kindal Moonweaver - On Timed Event 1 Triggered - Say Line 4'),
(7956,0,12,0,9,0,100,0,5,30,2300,3900,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kindal Moonweaver - Within 5-30 Range - Cast ''Shoot'''),
(7956,0,13,0,0,0,100,0,5000,7000,8000,11000,0,11,14443,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kindal Moonweaver - IC - Cast ''Multi-Shot'''),
(7956,0,14,0,6,0,100,0,0,0,0,0,0,6,2969,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Kindal Moonweaver - On Death - Fail Quest ''Freedom for All Creatures'''),

(795600,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Set Active On'),
(795600,9,1,0,0,0,100,0,0,0,0,0,0,63,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Reset Counter 1'),
(795600,9,2,0,0,0,100,0,0,0,0,0,0,63,2,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Reset Counter 2'),
(795600,9,3,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Set Phase 1'),
(795600,9,4,0,0,0,100,0,0,0,0,0,0,41,367000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Force Despawn'),
(795600,9,5,0,0,0,100,0,0,0,0,0,0,67,1,360000,360000,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Create Timed Event 1'),
(795600,9,6,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Store Targetlist (Invoker)'),
(795600,9,7,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(795600,9,8,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Set Orientation (Invoker)'),
(795600,9,9,0,0,0,100,0,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Set Faction ''Escortee'''),
(795600,9,10,0,0,0,100,0,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(795600,9,11,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(795600,9,12,0,0,0,100,0,1000,1000,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Say Line 0'),
(795600,9,13,0,0,0,100,0,5000,5000,0,0,0,29,4,180,0,0,0,0,7,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Start Follow (Invoker)'),

(795601,9,0,0,0,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Remove Timed Event 1'),
(795601,9,1,0,0,0,100,0,0,0,0,0,0,1,2,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Say Line 2'),
(795601,9,2,0,0,0,100,0,0,0,0,0,0,26,2969,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Quest Credit ''Freedom for All Creatures'''),
(795601,9,3,0,0,0,100,0,0,0,0,0,0,41,7000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Force Despawn'),

(795602,9,0,0,0,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Remove Timed Event 1'),
(795602,9,1,0,0,0,100,0,0,0,0,0,0,1,3,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Say Line 3'),
(795602,9,2,0,0,0,100,0,0,0,0,0,0,6,2969,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Fail Quest ''Freedom for All Creatures'''),
(795602,9,3,0,0,0,100,0,0,0,0,0,0,41,7000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kindal Moonweaver - On Script - Force Despawn'),

(7997,0,0,1,38,0,100,0,1,1,0,0,0,88,799700,799703,0,0,0,2,1,0,0,0,0,0,0,0,0,'Captured Sprite Darter - On Data Set 1 1 - Call Random Range Timed Action List'),
(7997,0,1,0,61,0,100,0,0,0,0,0,0,2,113,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Sprite Darter - Linked - Set Faction ''Escortee'''),
(7997,0,2,3,58,0,100,0,0,0,0,0,0,63,1,1,0,0,0,0,19,7956,0,0,0,0,0,0,0,'Captured Sprite Darter - On WP Path Ended - Set Counter 1 1 (Kindal Moonweaver)'),
(7997,0,3,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Sprite Darter - Linked - Force Despawn'),
(7997,0,4,0,6,0,100,0,0,0,0,0,0,63,2,1,0,0,0,0,19,7956,0,0,0,0,0,0,0,'Captured Sprite Darter - On Death - Set Counter 2 1 (Kindal Moonweaver)'),

(799700,9,0,0,0,0,100,0,0,0,0,0,0,53,1,799700,0,0,0,2,1,0,0,0,0,0,0,0,0,'Captured Sprite Darter - On Script - Start WP Movement'),
(799701,9,0,0,0,0,100,0,0,0,0,0,0,53,1,799701,0,0,0,2,1,0,0,0,0,0,0,0,0,'Captured Sprite Darter - On Script - Start WP Movement'),
(799702,9,0,0,0,0,100,0,0,0,0,0,0,53,1,799702,0,0,0,2,1,0,0,0,0,0,0,0,0,'Captured Sprite Darter - On Script - Start WP Movement'),
(799703,9,0,0,0,0,100,0,0,0,0,0,0,53,1,799703,0,0,0,2,1,0,0,0,0,0,0,0,0,'Captured Sprite Darter - On Script - Start WP Movement'),

(143979,1,0,0,70,0,100,0,2,0,0,0,0,80,14397900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cage Door - On GO State Changed ''GO_STATE_ACTIVE_ALTERNATIVE'' - Call Timed Action List'),

(14397900,9,0,0,0,0,100,0,10000,10000,0,0,0,45,1,1,0,0,0,0,10,50062,7997,0,0,0,0,0,0,'Cage Door - On Script - Set Data 1 1 (Captured Sprite Darter)'),
(14397900,9,1,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,10,50063,7997,0,0,0,0,0,0,'Cage Door - On Script - Set Data 1 1 (Captured Sprite Darter)'),
(14397900,9,2,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,10,50064,7997,0,0,0,0,0,0,'Cage Door - On Script - Set Data 1 1 (Captured Sprite Darter)'),
(14397900,9,3,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,10,50065,7997,0,0,0,0,0,0,'Cage Door - On Script - Set Data 1 1 (Captured Sprite Darter)'),
(14397900,9,4,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,10,50066,7997,0,0,0,0,0,0,'Cage Door - On Script - Set Data 1 1 (Captured Sprite Darter)'),
(14397900,9,5,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,10,50067,7997,0,0,0,0,0,0,'Cage Door - On Script - Set Data 1 1 (Captured Sprite Darter)'),
(14397900,9,6,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,10,50068,7997,0,0,0,0,0,0,'Cage Door - On Script - Set Data 1 1 (Captured Sprite Darter)'),
(14397900,9,7,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,10,50069,7997,0,0,0,0,0,0,'Cage Door - On Script - Set Data 1 1 (Captured Sprite Darter)'),
(14397900,9,8,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,10,50070,7997,0,0,0,0,0,0,'Cage Door - On Script - Set Data 1 1 (Captured Sprite Darter)'),
(14397900,9,9,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,10,50071,7997,0,0,0,0,0,0,'Cage Door - On Script - Set Data 1 1 (Captured Sprite Darter)'),
(14397900,9,10,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,10,50072,7997,0,0,0,0,0,0,'Cage Door - On Script - Set Data 1 1 (Captured Sprite Darter)'),
(14397900,9,11,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,10,50073,7997,0,0,0,0,0,0,'Cage Door - On Script - Set Data 1 1 (Captured Sprite Darter)');

DELETE FROM `waypoints` WHERE `entry` IN (7956,7997,799700,799701,799702,799703);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(799700,1,-4532.84,808.158,60.024,'Captured Sprite Darter - Path 1'),
(799700,2,-4528.31,802.922,59.5333,NULL),
(799700,3,-4518.08,800.967,59.4521,NULL),
(799700,4,-4505.76,798.409,61.7315,NULL),

(799701,1,-4532.84,808.158,60.024,'Captured Sprite Darter - Path 2'),
(799701,2,-4528.31,802.922,59.5333,NULL),
(799701,3,-4518.08,800.967,59.4521,NULL),
(799701,4,-4507.98,791.168,61.6632,NULL),

(799702,1,-4532.84,808.158,60.024,'Captured Sprite Darter - Path 3'),
(799702,2,-4528.31,802.922,59.5333,NULL),
(799702,3,-4518.08,800.967,59.4521,NULL),
(799702,4,-4508.47,806.899,61.8351,NULL),

(799703,1,-4532.84,808.158,60.024,'Captured Sprite Darter - Path 4'),
(799703,2,-4528.31,802.922,59.5333,NULL),
(799703,3,-4522.24,793.514,59.6818,NULL),
(799703,4,-4517.44,778.767,60.2567,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
