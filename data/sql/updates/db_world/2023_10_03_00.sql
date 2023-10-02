UPDATE `creature` SET `spawntimesecs` = -1 WHERE `guid` IN (74522,74523,74524);

DELETE FROM `creature_addon` WHERE `guid` IN (74522,74523,74524);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(74522,0,0,0,0,0,0,NULL),
(74523,0,0,0,0,0,0,NULL),
(74524,0,0,0,0,0,0,NULL);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (19217,19482,-74522,-74523,-74524);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1921700,1921701,1921702);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19217,0,0,1,1,0,100,0,420000,600000,420000,600000,0,70,0,0,0,0,0,0,10,74522,19610,1,2,0,0,0,0,'Ravandwyr - OOC - Respawn Target (Irradiated Worker)'),
(19217,0,1,2,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,74523,19610,1,2,0,0,0,0,'Ravandwyr - Linked - Respawn Target (Irradiated Worker)'),
(19217,0,2,0,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,74524,19610,1,2,0,0,0,0,'Ravandwyr - Linked - Respawn Target (Irradiated Worker)'),
(19217,0,3,0,38,0,100,0,1,1,0,0,0,87,1921700,1921701,1921702,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Data Set 1 1 - Call Random Timed Action List'),
(19217,0,4,5,62,0,100,0,7981,0,0,0,0,85,35378,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ravandwyr - On Gossip Option 0 Selected - Invoker Cast ''Summon Archmages Staff'''),
(19217,0,5,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ravandwyr - Linked - Close Gossip'),

(1921700,9,0,0,0,0,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Say Line 0'),
(1921700,9,1,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Say Line 1'),
(1921700,9,2,0,0,0,100,0,3000,3000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Say Line 3'),
(1921700,9,3,0,0,0,100,0,2000,2000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Say Line 4'),
(1921700,9,4,0,0,0,100,0,2000,2000,0,0,0,11,34326,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Cast ''Frost Nova'''),
(1921700,9,5,0,0,0,100,0,2000,2000,0,0,0,45,3,3,0,0,0,0,10,74523,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Set Data 3 3 (Irradiated Worker)'),
(1921700,9,6,0,0,0,100,0,3000,3000,0,0,0,1,3,0,0,0,0,0,10,74523,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Say Line 3 (Irradiated Worker)'),
(1921700,9,7,0,0,0,100,0,1000,1000,0,0,0,5,11,0,0,0,0,0,9,19610,0,20,0,0,0,0,0,'Ravandwyr - On Script - Play Emote ''ONESHOT_LAUGH'''),
(1921700,9,8,0,0,0,100,0,3000,3000,0,0,0,1,4,0,0,0,0,0,10,74524,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Say Line 4 (Irradiated Worker)'),
(1921700,9,9,0,0,0,100,0,4000,4000,0,0,0,5,11,0,0,0,0,0,9,19610,0,20,0,0,0,0,0,'Ravandwyr - On Script - Play Emote ''ONESHOT_LAUGH'''),
(1921700,9,10,0,0,0,100,0,1000,1000,0,0,0,1,5,0,0,0,0,0,10,74522,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Say Line 5 (Irradiated Worker)'),
(1921700,9,11,0,0,0,100,0,4000,4000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Say Line 5'),
(1921700,9,12,0,0,0,100,0,4000,4000,0,0,0,5,4,0,0,0,0,0,9,19610,0,20,0,0,0,0,0,'Ravandwyr - On Script - Play Emote ''ONESHOT_CHEER(DNR)'' (Irradiated Worker)'),
(1921700,9,13,0,0,0,100,0,4000,4000,0,0,0,1,6,0,0,0,0,0,10,74524,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Say Line 6 (Irradiated Worker)'),
(1921700,9,14,0,0,0,100,0,4000,4000,0,0,0,45,2,2,0,0,0,0,10,74524,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Set Data 2 2 (Irradiated Worker)'),
(1921700,9,15,0,0,0,100,0,1000,1000,0,0,0,45,2,2,0,0,0,0,10,74523,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Set Data 2 2 (Irradiated Worker)'),
(1921700,9,16,0,0,0,100,0,1000,1000,0,0,0,45,2,2,0,0,0,0,10,74522,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Set Data 2 2 (Irradiated Worker)'),

(1921701,9,0,0,0,0,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Say Line 0'),
(1921701,9,1,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Say Line 1'),
(1921701,9,2,0,0,0,100,0,3000,3000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Say Line 3'),
(1921701,9,3,0,0,0,100,0,2000,2000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Say Line 2'),
(1921701,9,4,0,0,0,100,0,4000,4000,0,0,0,11,34656,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Cast ''Arcane Explosion (Cosmetic)'''),
(1921701,9,5,0,0,0,100,0,1000,1000,0,0,0,45,1,1,0,0,0,0,19,19482,0,0,0,0,0,0,0,'Ravandwyr - On Script - Set Data 1 1 (Sagan)'),
(1921701,9,6,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,10,74524,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Say Line 0 (Irradiated Worker)'),
(1921701,9,7,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,10,74523,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Say Line 1 (Irradiated Worker)'),
(1921701,9,8,0,0,0,100,0,5000,5000,0,0,0,45,2,2,0,0,0,0,19,19482,0,0,0,0,0,0,0,'Ravandwyr - On Script - Set Data 2 2 (Sagan)'),
(1921701,9,9,0,0,0,100,0,2000,2000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Say Line 5'),
(1921701,9,10,0,0,0,100,0,4000,4000,0,0,0,5,4,0,0,0,0,0,9,19610,0,20,0,0,0,0,0,'Ravandwyr - On Script - Play Emote ''ONESHOT_CHEER(DNR)'' (Irradiated Worker)'),
(1921701,9,11,0,0,0,100,0,4000,4000,0,0,0,1,6,0,0,0,0,0,10,74524,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Say Line 6 (Irradiated Worker)'),
(1921701,9,12,0,0,0,100,0,4000,4000,0,0,0,45,2,2,0,0,0,0,10,74524,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Set Data 2 2 (Irradiated Worker)'),
(1921701,9,13,0,0,0,100,0,1000,1000,0,0,0,45,2,2,0,0,0,0,10,74523,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Set Data 2 2 (Irradiated Worker)'),
(1921701,9,14,0,0,0,100,0,1000,1000,0,0,0,45,2,2,0,0,0,0,10,74522,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Set Data 2 2 (Irradiated Worker)'),

(1921702,9,0,0,0,0,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Say Line 0'),
(1921702,9,1,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Say Line 1'),
(1921702,9,2,0,0,0,100,0,3000,3000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Say Line 3'),
(1921702,9,3,0,0,0,100,0,2000,2000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Say Line 6'),
(1921702,9,4,0,0,0,100,0,4000,4000,0,0,0,11,29389,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Cast ''Firebreathing'''),
(1921702,9,5,0,0,0,100,0,2000,2000,0,0,0,1,7,0,0,0,0,0,10,74523,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Say Line 7 (Irradiated Worker)'),
(1921702,9,6,0,0,0,100,0,5000,5000,0,0,0,1,8,0,0,0,0,0,10,74524,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Say Line 8 (Irradiated Worker)'),
(1921702,9,7,0,0,0,100,0,2000,2000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravandwyr - On Script - Say Line 5'),
(1921702,9,8,0,0,0,100,0,4000,4000,0,0,0,5,4,0,0,0,0,0,9,19610,0,20,0,0,0,0,0,'Ravandwyr - On Script - Play Emote ''ONESHOT_CHEER(DNR)'' (Irradiated Worker)'),
(1921702,9,9,0,0,0,100,0,4000,4000,0,0,0,1,6,0,0,0,0,0,10,74524,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Say Line 6 (Irradiated Worker)'),
(1921702,9,10,0,0,0,100,0,4000,4000,0,0,0,45,2,2,0,0,0,0,10,74524,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Set Data 2 2 (Irradiated Worker)'),
(1921702,9,11,0,0,0,100,0,1000,1000,0,0,0,45,2,2,0,0,0,0,10,74523,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Set Data 2 2 (Irradiated Worker)'),
(1921702,9,12,0,0,0,100,0,1000,1000,0,0,0,45,2,2,0,0,0,0,10,74522,19610,1,1,0,0,0,0,'Ravandwyr - On Script - Set Data 2 2 (Irradiated Worker)'),

(19482,0,0,1,38,0,100,0,1,1,0,0,0,11,34718,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sagan - On Data Set 1 1 - Cast ''Transform Sagan (Skunk)'''),
(19482,0,1,0,61,0,100,0,0,0,0,0,0,53,0,19482,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sagan - Linked - Start WP Movement'),
(19482,0,2,3,38,0,100,0,2,2,0,0,0,28,34718,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sagan - On Data Set 2 2 - Remove Aura ''Transform Sagan (Skunk)'''),
(19482,0,3,4,61,0,100,0,0,0,0,0,0,101,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sagan - Linked - Reset Home Position'),
(19482,0,4,0,61,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sagan - Linked - Evade'),

(-74522,0,0,0,11,0,100,0,0,0,0,0,0,53,0,1961000,0,0,0,0,1,0,0,0,0,0,0,0,0,'Irradiated Worker - On Respawn - Start WP Movement'),
(-74522,0,1,2,58,0,100,0,0,1961000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Irradiated Worker - On WP Path Ended - Say Line 2'),
(-74522,0,2,3,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,19217,0,0,0,0,0,0,0,'Irradiated Worker - Linked - Set Data 1 1 (Ravandwyr)'),
(-74522,0,3,0,61,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,19,19217,0,0,0,0,0,0,0,'Irradiated Worker - Linked - Set Orientation (Ravandwyr)'),
(-74522,0,4,0,38,0,100,0,2,2,0,0,0,53,0,1961003,0,0,0,0,1,0,0,0,0,0,0,0,0,'Irradiated Worker - On Data Set 2 2 - Start WP Movement'),
(-74522,0,5,0,58,0,100,0,0,1961003,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Irradiated Worker - On WP Path Ended - Force Despawn'),

(-74523,0,0,0,11,0,100,0,0,0,0,0,0,53,0,1961001,0,0,0,0,1,0,0,0,0,0,0,0,0,'Irradiated Worker - On Respawn - Start WP Movement'),
(-74523,0,1,0,58,0,100,0,0,1961001,0,0,0,66,1,0,0,0,0,0,19,19217,0,0,0,0,0,0,0,'Irradiated Worker - On WP Path Ended - Set Orientation (Ravandwyr)'),
(-74523,0,2,0,38,0,100,0,2,2,0,0,0,53,0,1961003,0,0,0,0,1,0,0,0,0,0,0,0,0,'Irradiated Worker - On Data Set 2 2 - Start WP Movement'),
(-74523,0,3,0,58,0,100,0,0,1961003,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Irradiated Worker - On WP Path Ended - Force Despawn'),
(-74523,0,4,0,38,0,100,0,3,3,0,0,0,11,34973,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Irradiated Worker - On Data Set 3 3 - Cast ''Ravandwyr''s Ice Block'''),

(-74524,0,0,0,11,0,100,0,0,0,0,0,0,53,0,1961002,0,0,0,0,1,0,0,0,0,0,0,0,0,'Irradiated Worker - On Respawn - Start WP Movement'),
(-74524,0,1,0,58,0,100,0,0,1961002,0,0,0,66,0,0,0,0,0,0,19,19217,0,0,0,0,0,0,0,'Irradiated Worker - On WP Path Ended - Set Orientation (Ravandwyr)'),
(-74524,0,2,0,38,0,100,0,2,2,0,0,0,53,0,1961003,0,0,0,0,1,0,0,0,0,0,0,0,0,'Irradiated Worker - On Data Set 2 2 - Start WP Movement'),
(-74524,0,3,0,58,0,100,0,0,1961003,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Irradiated Worker - On WP Path Ended - Force Despawn');

DELETE FROM `waypoints` WHERE `entry` = 1961002;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(1961002,1,2982.5,3702.58,142.551,'Irradiated Worker'),
(1961002,2,2980.36,3706.58,142.434,NULL),
(1961002,3,2978.38,3710.3,142.372,NULL),
(1961002,4,2976.68,3713.48,142.338,NULL),
(1961002,5,2980.42,3715.11,142.352,NULL),
(1961002,6,2984.27,3716.79,142.455,NULL),
(1961002,7,2987.91,3718.37,142.755,NULL),
(1961002,8,2991.18,3719.8,143.075,NULL),
(1961002,9,2992.78,3723.03,143.378,NULL),
(1961002,10,2994.69,3726.9,143.77,NULL),
(1961002,11,2996.11,3729.78,143.984,NULL);
