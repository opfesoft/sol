UPDATE `creature_template` SET `speed_walk` = 1 WHERE `entry` = 27247;
UPDATE `gameobject_template` SET `Data3` = 15000 WHERE `entry` = 188713;
UPDATE `creature` SET `spawntimesecs` = 30 WHERE `guid` IN (106200,106201);

DELETE FROM `creature_text` WHERE `CreatureId` = 27202 AND `GroupID` = 4;
DELETE FROM `creature_text` WHERE `CreatureId` IN (27247,27245);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(27202,4,0,'A member of the priesthood whom I''ve never seen before.',12,0,100,1,0,0,26638,0,'Onslaught Raven Priest'),

(27247,0,0,'Yes, your eminence. Come on!',12,0,100,2,0,0,26609,0,'Devout Bodyguard'),
(27247,1,0,'Hey, who rang the bell?',12,0,100,6,0,0,26610,0,'Devout Bodyguard'),
(27247,2,0,'The bodyguard grunts.',16,0,100,0,0,0,26611,0,'Devout Bodyguard'),

(27245,0,0,'Boys, go see who''s doing that.',12,0,100,1,0,0,26608,0,'High Abbot Landgren');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 9532;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,9532,0,0,0,1,0,48756,0,0,1,0,0,'Creature ''High Abbot Landgren'' - Show gossip option 0 if player has no aura ''A Fall from Grace: Ring Kissed Dummy Aura'''),
(15,9532,0,0,0,29,0,27247,10,0,1,0,0,'Creature ''High Abbot Landgren'' - Show gossip option 0 if not near creature ''Devout Bodyguard'''),
(15,9532,0,0,0,48,0,12274,0,1,0,0,0,'Creature ''High Abbot Landgren'' - Show gossip option 0 if objective ID 0 of quest ''A Fall From Grace'' is finished'),
(15,9532,0,0,0,47,0,12274,8,0,0,0,0,'Creature ''High Abbot Landgren'' - Show gossip option 0 if quest ''A Fall From Grace'' is in progress');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 27202 AND `id` > 14;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (27247,27245,27439);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 188713;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (18871300,2720200,2720201,2724700,2724701,2743900);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(188713,1,0,1,70,0,100,0,2,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Abbey Bell Rope - On GO State Changed ''GO_ACTIVATED'' - Store Target 1 (Invoker)'),
(188713,1,1,2,61,0,100,0,0,0,0,0,0,80,18871300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Abbey Bell Rope - Linked - Call Timed Action List'),
(188713,1,2,3,61,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,10,102082,27202,0,0,0,0,0,0,'Abbey Bell Rope - Linked - Send Target 1 (Onslaught Raven Priest)'),
(188713,1,3,4,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,102082,27202,0,0,0,0,0,0,'Abbey Bell Rope - Linked - Set Data 1 1 (Onslaught Raven Priest)'),
(188713,1,4,5,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,106200,27247,0,0,0,0,0,0,'Abbey Bell Rope - Linked - Set Data 1 1 (Devout Bodyguard)'),
(188713,1,5,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,105877,27245,0,0,0,0,0,0,'Abbey Bell Rope - Linked - Set Data 1 1 (High Abbot Landgren)'),

(18871300,9,0,0,0,0,100,0,0,0,0,0,0,4,7256,1,0,0,0,0,18,150,0,0,0,0,0,0,0,'Abbey Bell Rope - On Script - Play Direct Sound ''NsabbeyBell'' (All Players Within 150y)'),
(18871300,9,1,0,0,0,100,0,3000,3000,0,0,0,4,7256,1,0,0,0,0,18,150,0,0,0,0,0,0,0,'Abbey Bell Rope - On Script - Play Direct Sound ''NsabbeyBell'' (All Players Within 150y)'),
(18871300,9,2,0,0,0,100,0,3000,3000,0,0,0,4,7256,1,0,0,0,0,18,150,0,0,0,0,0,0,0,'Abbey Bell Rope - On Script - Play Direct Sound ''NsabbeyBell'' (All Players Within 150y)'),

(27202,0,15,0,38,0,100,0,1,1,0,0,0,80,2720200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Raven Priest - On Data Set 1 1 - Call Timed Action List'),
(27202,0,16,0,38,0,100,0,2,2,0,0,0,80,2720201,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Raven Priest - On Data Set 2 2 - Call Timed Action List'),

(2720200,9,0,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Onslaught Raven Priest - On Script - Set Orientation (Stored Target 1)'),
(2720200,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Onslaught Raven Priest - On Script - Say Line 0'),
(2720200,9,2,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Raven Priest - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(2720200,9,3,0,0,0,100,0,3000,3000,0,0,0,5,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Raven Priest - On Script - Play Emote ''ONESHOT_QUESTION'''),
(2720200,9,4,0,0,0,100,0,10000,10000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Raven Priest - On Script - Reset Orientation'),
(2720200,9,5,0,0,0,100,0,1000,1000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Raven Priest - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),

(2720201,9,0,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Onslaught Raven Priest - On Script - Set Orientation (Invoker)'),
(2720201,9,1,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Raven Priest - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(2720201,9,2,0,0,0,100,0,2000,2000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Raven Priest - On Script - Say Line 4'),
(2720201,9,3,0,0,0,100,0,11000,11000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Raven Priest - On Script - Reset Orientation'),
(2720201,9,4,0,0,0,100,0,1000,1000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Raven Priest - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),

(27247,0,0,0,0,0,100,0,4000,7000,10000,15000,0,11,38256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Devout Bodyguard - Cast ''Piercing Howl'''),
(27247,0,1,0,38,0,100,1,1,1,0,0,0,80,2724700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Devout Bodyguard - On Data Set 1 1 (No Repeat) - Call Timed Action List'),
(27247,0,2,0,38,0,100,0,2,2,0,0,0,53,1,2724701,0,0,0,0,1,0,0,0,0,0,0,0,0,'Devout Bodyguard - On Data Set 2 2 - Start WP Movement'),
(27247,0,3,0,58,0,100,0,0,2724700,0,0,0,80,2724701,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Devout Bodyguard - On WP Path Ended - Call Timed Action List'),

(2724700,9,0,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,19,27245,0,0,0,0,0,0,0,'Devout Bodyguard - On Script - Set Orientation (High Abbot Landgren)'),
(2724700,9,1,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Devout Bodyguard - On Script - Say Line 0'),
(2724700,9,2,0,0,0,100,0,3000,3000,0,0,0,53,1,2724700,0,0,0,0,1,0,0,0,0,0,0,0,0,'Devout Bodyguard - On Script - Start WP Movement'),
(2724700,9,3,0,0,0,100,0,1000,1000,0,0,0,45,2,2,0,0,0,0,10,106201,27247,0,0,0,0,0,0,'Devout Bodyguard - On Script - Set Data 2 2 (Devout Bodyguard)'),

(2724701,9,0,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Devout Bodyguard - On Script - Say Line 1'),
(2724701,9,1,0,0,0,100,0,1000,1000,0,0,0,45,2,2,0,0,0,0,10,102082,27202,0,0,0,0,0,0,'Devout Bodyguard - On Script - Set Data 2 2 (Onslaught Raven Priest)'),
(2724701,9,2,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Devout Bodyguard - On Script - Say Line 2'),
(2724701,9,3,0,0,0,100,0,20000,20000,0,0,0,41,0,0,0,0,0,0,10,106201,27247,0,0,0,0,0,0,'Devout Bodyguard - On Script - Force Despawn (Devout Bodyguard)'),
(2724701,9,4,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Devout Bodyguard - On Script - Force Despawn'),

(27245,0,0,0,38,0,100,0,1,1,60000,60000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'High Abbot Landgren - On Data Set 1 1 - Say Line 0'),
(27245,0,1,0,62,0,100,0,9536,0,0,0,0,11,48756,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'High Abbot Landgren - On Gossip Option 0 Selected - Cast ''A Fall from Grace: Ring Kissed Dummy Aura'''),

(27439,0,0,0,54,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'High Abbot Landgren - On Just Summoned - Set ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(27439,0,1,0,60,0,100,1,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'High Abbot Landgren - On Update (No Repeat) - Say Line 0'),
(27439,0,2,0,60,0,100,1,4000,4000,0,0,0,53,0,27439,0,0,0,0,1,0,0,0,0,0,0,0,0,'High Abbot Landgren - On Update (No Repeat) - Start WP Movement'),
(27439,0,3,0,58,0,100,0,0,27439,0,0,0,80,2743900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'High Abbot Landgren - On WP Path Ended - Call Timed Action List'),

(2743900,9,0,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,1.05,'High Abbot Landgren - On Script - Set Orientation'),
(2743900,9,1,0,0,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,23,0,0,0,0,0,0,0,0,'High Abbot Landgren - On Script - Say Line 1'),
(2743900,9,2,0,0,0,100,0,6000,6000,0,0,0,1,2,0,1,0,0,0,23,0,0,0,0,0,0,0,0,'High Abbot Landgren - On Script - Say Line 2'),
(2743900,9,3,0,0,0,100,0,6000,6000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'High Abbot Landgren - On Script - Say Line 3'),
(2743900,9,4,0,0,0,100,0,8000,8000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'High Abbot Landgren - On Script - Say Line 4'),
(2743900,9,5,0,0,0,100,0,7000,7000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'High Abbot Landgren - On Script - Say Line 5'),
(2743900,9,6,0,0,0,100,0,0,0,0,0,0,11,48771,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'High Abbot Landgren - On Script - Cast ''A Fall from Grace: Kill Credit'''),
(2743900,9,7,0,0,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'High Abbot Landgren - On Script - Force Despawn'),
(2743900,9,8,0,0,0,100,0,0,0,0,0,0,97,20,20,0,0,0,0,1,0,0,0,0,2711,-562,15,4.1,'High Abbot Landgren - On Script - Jump To Position');

UPDATE `waypoints` SET `entry` = 2724700 WHERE `entry` = 27247;
DELETE FROM `waypoints` WHERE `entry` = 2724701;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(2724701,1,2802.79,-493.201,119.617,NULL),
(2724701,2,2805.71,-489.88,119.617,NULL),
(2724701,3,2805.63,-485.681,119.617,NULL),
(2724701,4,2803.38,-482.561,119.617,NULL),
(2724701,5,2800.21,-478.971,119.617,NULL),
(2724701,6,2804.42,-474.927,119.617,NULL),
(2724701,7,2810.49,-469.102,119.615,NULL),
(2724701,8,2815.06,-465.838,119.616,NULL),
(2724701,9,2818.89,-469.552,119.842,NULL),
(2724701,10,2823,-471.411,124.31,NULL),
(2724701,11,2827.5,-472.139,128.522,NULL),
(2724701,12,2830.89,-471.426,131.572,NULL),
(2724701,13,2834.82,-469.685,135.201,NULL),
(2724701,14,2839.76,-462.89,135.363,NULL),
(2724701,15,2838.14,-452.877,135.363,NULL),
(2724701,16,2831.41,-448.48,135.363,NULL),
(2724701,17,2823.73,-448.069,135.363,NULL),
(2724701,18,2817.5,-453.122,135.363,NULL),
(2724701,19,2815.11,-460.489,135.363,NULL),
(2724701,20,2818.22,-470.048,135.359,NULL),
(2724701,21,2822.93,-471.575,140.076,NULL),
(2724701,22,2824.93,-472.218,142.183,NULL),
(2724701,23,2828.06,-472.535,145.044,NULL),
(2724701,24,2830.79,-471.943,147.541,NULL),
(2724701,25,2834.41,-470.538,150.757,NULL),
(2724701,26,2837.1,-467.819,150.837,NULL),
(2724701,27,2833.17,-464.993,150.836,NULL);
