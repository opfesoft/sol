UPDATE `creature_template_addon` SET `bytes1` = 0, `auras` = '29266' WHERE `entry` = 17768;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 17768;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1776800;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17768,0,0,0,8,0,100,1,31225,0,0,0,0,80,1776800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blood Knight Stillblade - On Spellhit ''Shimmering Vessel'' - Call Timed Action List (No Repeat)'),
(17768,0,1,0,58,0,100,0,0,17768,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blood Knight Stillblade - On WP Path Ended - Force Despawn'),

(1776800,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blood Knight Stillblade - On Script - Set Active On'),
(1776800,9,1,0,0,0,100,0,0,0,0,0,0,28,29266,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blood Knight Stillblade - On Script - Remove Aura ''Permanent Feign Death'''),
(1776800,9,2,0,0,0,100,0,0,0,0,0,0,11,25155,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blood Knight Stillblade - On Script - Cast ''Quest - Self Healing from resurrect'''),
(1776800,9,3,0,0,0,100,0,0,0,0,0,0,33,17768,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Blood Knight Stillblade - On Script - Quest Credit ''Redeeming the Dead'''),
(1776800,9,4,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Blood Knight Stillblade - On Script - Set Orientation (Invoker)'),
(1776800,9,5,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Blood Knight Stillblade - On Script - Say Line 0'),
(1776800,9,6,0,0,0,100,0,10000,10000,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Blood Knight Stillblade - On Script - Say Line 1'),
(1776800,9,7,0,0,0,100,0,12000,12000,0,0,0,53,0,17768,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blood Knight Stillblade - On Script - Start WP Movement');

DELETE FROM `waypoints` WHERE `entry` = 17768;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(17768,1,9674.3,-7375.66,22.8375,'Blood Knight Stillblade'),
(17768,2,9682.09,-7378.19,22.844,NULL),
(17768,3,9689.93,-7378.19,22.8484,NULL),
(17768,4,9698.2,-7378.19,22.8541,NULL),
(17768,5,9702.78,-7376.46,20.9792,NULL),
(17768,6,9706.03,-7370.66,17.4259,NULL),
(17768,7,9704.01,-7365.67,14.4533,NULL),
(17768,8,9698.09,-7364.02,11.9247,NULL),
(17768,9,9687.49,-7366.16,11.9297,NULL),
(17768,10,9683.43,-7364.72,11.9311,NULL);
