UPDATE `creature` SET `spawntimesecs` = 1800 WHERE `guid` = 85322;

DELETE FROM `creature_text` WHERE `CreatureId` = 27210 AND `GroupID` = 1;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(27210,1,0,'You''ve come to test the might of the Onslaught?',14,0,100,6,0,14188,27596,0,'High General Abbendis'),
(27210,1,1,'Deal with this intrusion quickly. I don''t have time for this!',14,0,100,5,0,14189,27597,0,'High General Abbendis'),
(27210,1,2,'You may want to rethink your actions, fool.',14,0,100,25,0,14190,27598,0,'High General Abbendis'),
(27210,1,3,'Am I going to have to deal with this intrusion myself?',14,0,100,6,0,14191,27599,0,'High General Abbendis');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 27202 AND `id` = 17;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 27203 AND `id` = 12;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (27210,27951);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2795100,2795101,2795102);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27202,0,17,0,4,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,27210,0,0,0,0,0,0,0,'Onslaught Raven Priest - On Aggro - Set Data 1 1 (High General Abbendis) (CONDITION_OBJECT_ENTRY_GUID)'),

(27203,0,12,0,4,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,27210,0,0,0,0,0,0,0,'Onslaught Footman - On Aggro - Set Data 1 1 (High General Abbendis) (CONDITION_OBJECT_ENTRY_GUID)'),

(27210,0,0,1,11,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,85322,27951,1,2,0,0,0,0,'High General Abbendis - On Respawn - Respawn Target (Admiral Barean Westwind)'),
(27210,0,1,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,27951,0,0,0,0,0,0,0,'High General Abbendis - Linked - Set Data 1 1 (Admiral Barean Westwind)'),
(27210,0,2,3,4,0,100,0,0,0,0,0,0,11,50908,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'High General Abbendis - On Aggro - Cast ''Seal of Onslaught'''),
(27210,0,3,0,61,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,19,27951,0,0,0,0,0,0,0,'High General Abbendis - Linked - Set Data 2 2 (Admiral Barean Westwind)'),
(27210,0,4,0,0,0,100,0,4000,7000,19000,23000,0,11,50915,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'High General Abbendis - IC - Cast ''Raging Consecration'''),
(27210,0,5,0,0,0,100,0,9000,12000,20000,23000,0,11,50905,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'High General Abbendis - IC - Cast ''Judgement of Onslaught'''),
(27210,0,6,7,2,0,100,0,0,20,0,0,0,11,50920,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'High General Abbendis - On Health Between 0-20% - Cast ''Reckless Onslaught'''),
(27210,0,7,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'High General Abbendis - Linked - Say Line 0'),
(27210,0,8,0,6,0,100,0,0,0,0,0,0,45,3,3,0,0,0,0,10,85322,27951,1,1,0,0,0,0,'High General Abbendis - On Death - Set Data 3 3 (Admiral Barean Westwind)'),
(27210,0,9,0,21,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,27951,0,0,0,0,0,0,0,'High General Abbendis - On Reached Home - Set Data 1 1 (Admiral Barean Westwind)'),
(27210,0,10,0,38,0,100,0,1,1,10000,10000,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'High General Abbendis - On Data Set 1 1 - Say Line 1'),

(27951,0,0,0,11,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Respawn - Remove Timed Event 1'),
(27951,0,1,2,25,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Reset - Set React State ''Passive'''),
(27951,0,2,3,61,0,100,0,0,0,0,0,0,117,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - Linked - Disable Evade'),
(27951,0,3,0,61,0,100,0,0,0,0,0,0,42,0,25,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - Linked - Set Invincibility HP Level'),
(27951,0,4,5,38,0,100,0,1,1,0,0,0,28,50161,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Data Set 1 1 - Remove Aura Protection Sphere'),
(27951,0,5,0,61,0,100,0,0,0,0,0,0,27,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - Linked - Stop Combat'),
(27951,0,6,7,32,0,100,0,1,0,0,0,0,49,19,27210,0,0,0,0,7,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Damaged - Start Attack ''High General Abbendis'' (Invoker)'),
(27951,0,7,0,61,0,100,0,0,0,0,0,0,11,50161,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - Linked - Cast ''Protection Sphere'''),
(27951,0,8,7,38,0,100,0,2,2,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Data Set 2 2 - Say Line 0'),
(27951,0,9,0,38,0,100,0,3,3,0,0,0,80,2795100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Data Set 3 3 - Call Timed Action List'),
(27951,0,10,0,34,0,100,0,8,1,0,0,0,80,2795101,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Point 1 Reached - Call Timed Action List'),
(27951,0,11,0,34,0,100,0,2,3,0,0,0,80,2795102,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On WP 3 Reached - Call Timed Action List'),
(27951,0,12,0,59,0,100,0,1,0,0,0,0,80,2795102,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Timed Event 1 Triggered - Call Timed Action List'),

(2795100,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Script - Set Active On'),
(2795100,9,1,0,0,0,100,0,0,0,0,0,0,67,1,150000,150000,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Script - Create Timed Event 1'),
(2795100,9,2,0,0,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Script - Set Run Off'),
(2795100,9,3,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Script - Say Line 1'),
(2795100,9,4,0,0,0,100,0,5000,5000,0,0,0,69,1,0,0,1,0,0,19,27210,60,1,0,0,0,0,0.0001,'Admiral Barean Westwind - On Script - Move To Point 1 (High General Abbendis)'),

(2795101,9,0,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,19,27210,5,1,0,0,0,0,0,'Admiral Barean Westwind - On Script - Set Orientation (High General Abbendis)'),
(2795101,9,1,0,0,0,100,0,1000,1000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(2795101,9,2,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Script - Say Line 2'),
(2795101,9,3,0,0,0,100,0,6000,6000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(2795101,9,4,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0.139626,'Admiral Barean Westwind - On Script - Set Orientation'),
(2795101,9,5,0,0,0,100,0,1000,1000,0,0,0,5,11,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Script - Play Emote ''ONESHOT_LAUGH'''),
(2795101,9,6,0,0,0,100,0,3000,3000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Script - Say Line 3'),
(2795101,9,7,0,0,0,100,0,0,0,0,0,0,238,853220,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Script - Load WP Path'),

(2795102,9,0,0,0,0,100,0,0,0,0,0,0,11,34427,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Script - Cast ''Ethereal Teleport'''),
(2795102,9,1,0,0,0,100,0,0,0,0,0,0,238,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Script - Unload WP Path'),
(2795102,9,2,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Barean Westwind - On Script - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceGroup` = 18 AND `SourceEntry` = 27202 AND `SourceId` = 0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceGroup` = 13 AND `SourceEntry` = 27203 AND `SourceId` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,18,27202,0,0,31,1,3,0,102088,0,0,0,'Creature ''Onslaught Raven Priest'' - Group 0: Execute SAI ID 17 if has GUID 102088'),

(22,13,27203,0,0,31,1,3,0,102193,0,0,0,'Creature ''Onslaught Footman'' - Group 0: Execute SAI ID 12 if has GUID 102193'),
(22,13,27203,0,1,31,1,3,0,102194,0,0,0,'Creature ''Onslaught Footman'' - Group 1: Execute SAI ID 12 if has GUID 102194');

DELETE FROM `waypoints` WHERE `entry` = 27951;
DELETE FROM `waypoint_data` WHERE `id` = 853220;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(853220,1,2718.2,-351.358,141.217,NULL,0,0,1,0,100,0),
(853220,2,2721.99,-358.182,141.217,NULL,0,0,0,0,100,0),
(853220,3,2738.1,-355.936,141.217,NULL,900000,0,0,0,100,0);
