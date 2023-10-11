UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 79750;
UPDATE `creature_addon` SET `bytes2` = 1 WHERE `guid` = 79750;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 6090;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 6090;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (609000,609001);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6090,0,0,0,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - On Respawn - Disable Event Phase Reset'),
(6090,0,1,2,25,0,100,0,0,0,0,0,0,2,84,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - On Reset - Set Faction ''Alliance Generic'''),
(6090,0,2,3,61,0,100,0,0,0,0,0,0,42,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - Linked - Set Invincibility HP 0'),
(6090,0,3,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - Linked - Set Event Phase 1'),
(6090,0,4,5,19,0,100,0,1640,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Bartleby - On Quest ''Beat Bartleby'' Accepted - Store Target 1 (Invoker)'),
(6090,0,5,6,61,0,100,0,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - Linked - Set Invincibility HP 1'),
(6090,0,6,7,61,0,100,0,0,0,0,0,0,2,168,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - Linked - Set Faction ''Enemy'''),
(6090,0,7,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Bartleby - Linked - Start Attack (Stored Target 1)'),
(6090,0,8,9,2,0,100,1,0,15,0,0,0,15,1640,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Bartleby - Between 0-15% Health - Quest Credit ''Beat Bartleby'' (Stored Target 1)'),
(6090,0,9,10,61,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - Linked - Set Home Position'),
(6090,0,10,0,61,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - Linked - Evade'),
(6090,0,11,0,1,2,100,0,10000,20000,10000,20000,0,5,92,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - OOC (Event Phase 2) - Play Emote ''ONESHOT_EAT_NOSHEATHE'' (Phase 1)'),
(6090,0,12,0,34,0,100,0,2,1,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - On WP 2 Reached - Set Event Phase 2'),
(6090,0,13,0,34,0,100,0,2,2,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - On WP 3 Reached - Set Event Phase 1'),
(6090,0,14,0,34,0,100,0,2,3,0,0,0,80,609000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - On WP 4 Reached - Call Timed Action List'),
(6090,0,15,0,34,0,100,0,2,4,0,0,0,90,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - On WP 5 Reached - Set ''UNIT_STAND_STATE_STAND'''),
(6090,0,16,0,34,0,100,0,2,5,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - On WP 6 Reached - Set Event Phase 2'),
(6090,0,17,0,34,0,100,0,2,6,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - On WP 7 Reached - Set Event Phase 1'),
(6090,0,18,0,34,0,100,0,2,7,0,0,0,80,609001,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - On WP 8 Reached - Call Timed Action List'),
(6090,0,19,0,34,0,100,0,2,8,0,0,0,90,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - On WP 9 Reached - Set ''UNIT_STAND_STATE_STAND'''),
(6090,0,20,0,34,0,100,0,2,9,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - On WP 10 Reached - Set Event Phase 2'),
(6090,0,21,0,34,0,100,0,2,10,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bartleby - On WP 11 Reached - Set Event Phase 1'),

(609000,9,0,0,0,0,100,0,1000,1000,0,0,0,9,1,0,0,0,0,0,14,26508,24600,1,0,0,0,0,0,'Bartleby - On Script - Use GO (Wooden Chair)'),

(609001,9,0,0,0,0,100,0,1000,1000,0,0,0,9,1,0,0,0,0,0,14,26486,24627,1,0,0,0,0,0,'Bartleby - On Script - Use GO (Wooden Chair)');

DELETE FROM `waypoint_scripts` WHERE `id` BETWEEN 275 AND 278;
DELETE FROM `waypoint_data` WHERE `id` = 797500;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(797500,1,-8604.47,389.102,102.924,NULL,0,0,0,0,100,0),
(797500,2,-8604.47,389.102,102.924,5.67232,120000,0,0,0,100,0),
(797500,3,-8604.47,389.102,102.924,NULL,0,0,0,0,100,0),
(797500,4,-8612.6,391.836,102.956,NULL,60000,0,0,0,100,0),
(797500,5,-8612.6,391.836,102.956,NULL,0,0,0,0,100,0),
(797500,6,-8610.2,384.804,102.926,5.3346,120000,0,0,0,100,0),
(797500,7,-8610.2,384.804,102.926,NULL,0,0,0,0,100,0),
(797500,8,-8616.21,388.91,102.975,NULL,60000,0,0,0,100,0),
(797500,9,-8616.21,388.91,102.975,NULL,0,0,0,0,100,0),
(797500,10,-8610.27,384.739,102.926,5.3346,120000,0,0,0,100,0),
(797500,11,-8610.27,384.739,102.926,NULL,0,0,0,0,100,0),
(797500,12,-8610.11,388.331,102.925,NULL,0,0,0,0,100,0),
(797500,13,-8607.81,391.101,102.925,NULL,0,0,0,0,100,0);
