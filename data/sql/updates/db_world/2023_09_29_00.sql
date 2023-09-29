UPDATE `creature_template` SET `unit_flags` = 256 | 512 | 33554432, `flags_extra` = 2 WHERE `entry` IN (20553,20564);

UPDATE `creature` SET `position_x` = 3781.87, `position_y` = 2175.34, `position_z` = 141.593, `orientation` = 4.84407, `spawntimesecs` = -1 WHERE `guid` IN (72679,72694);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 72678;

DELETE FROM `creature_addon` WHERE `guid` = 72678;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(72678,726780,0,0,1,0,0,NULL);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (20551,20553,20564);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (20551,20553,20564);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2055100,2055101,2055300,2056400);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20551,0,0,0,34,0,100,0,2,1,0,0,0,80,2055100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Agent Araxes - On WP 2 Reached - Call Timed Action List'),
(20551,0,1,0,34,0,100,0,2,3,0,0,0,80,2055101,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Agent Araxes - On WP 4 Reached - Call Timed Action List'),

(2055100,9,0,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Agent Araxes - On Script - Say Line 0'),
(2055100,9,1,0,0,0,100,0,5000,5000,0,0,0,9,0,0,0,0,0,0,14,25266,184434,1,0,0,0,0,0,'Agent Araxes - On Script - Activate GO (Portable Transponder)'),
(2055100,9,2,0,0,0,100,0,2000,2000,0,0,0,70,0,0,0,0,0,0,10,72679,20553,1,2,0,0,0,0,'Agent Araxes - On Script - Respawn Target (Image of Commander Ameer)'),
(2055100,9,3,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,10,72679,20553,1,1,0,0,0,0,'Agent Araxes - On Script - Say Line 0 (Image of Commander Ameer)'),
(2055100,9,4,0,0,0,100,0,7000,7000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Agent Araxes - On Script - Say Line 1'),
(2055100,9,5,0,0,0,100,0,3000,3000,0,0,0,1,1,0,0,0,0,0,10,72679,20553,1,1,0,0,0,0,'Agent Araxes - On Script - Say Line 1 (Image of Commander Ameer)'),
(2055100,9,6,0,0,0,100,0,3000,3000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Agent Araxes - On Script - Say Line 2'),
(2055100,9,7,0,0,0,100,0,7000,7000,0,0,0,1,2,0,0,0,0,0,10,72679,20553,1,1,0,0,0,0,'Agent Araxes - On Script - Say Line 2 (Image of Commander Ameer)'),
(2055100,9,8,0,0,0,100,0,6000,6000,0,0,0,1,3,0,0,0,0,0,10,72679,20553,1,1,0,0,0,0,'Agent Araxes - On Script - Say Line 3 (Image of Commander Ameer)'),
(2055100,9,9,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,10,72679,20553,1,1,0,0,0,0,'Agent Araxes - On Script - Set Data 1 1 (Image of Commander Ameer)'),
(2055100,9,10,0,0,0,100,0,4000,4000,0,0,0,9,0,0,0,0,0,0,14,25266,184434,1,0,0,0,0,0,'Agent Araxes - On Script - Activate GO (Portable Transponder)'),

(2055101,9,0,0,0,0,100,0,0,0,0,0,0,9,0,0,0,0,0,0,14,25266,184434,1,0,0,0,0,0,'Agent Araxes - On Script - Activate GO (Portable Transponder)'),
(2055101,9,1,0,0,0,100,0,2000,2000,0,0,0,70,0,0,0,0,0,0,10,72694,20564,1,2,0,0,0,0,'Agent Araxes - On Script - Respawn Target (Image of Agent Ya-six)'),
(2055101,9,2,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,10,72694,20564,1,1,0,0,0,0,'Agent Araxes - On Script - Say Line 0 (Image of Agent Ya-six)'),
(2055101,9,3,0,0,0,100,0,10000,10000,0,0,0,1,1,0,0,0,0,0,10,72694,20564,1,1,0,0,0,0,'Agent Araxes - On Script - Say Line 1 (Image of Agent Ya-six)'),
(2055101,9,4,0,0,0,100,0,8000,8000,0,0,0,45,1,1,0,0,0,0,10,72694,20564,1,1,0,0,0,0,'Agent Araxes - On Script - Set Data 1 1 (Image of Agent Ya-six)'),
(2055101,9,5,0,0,0,100,0,4000,4000,0,0,0,9,0,0,0,0,0,0,14,25266,184434,1,0,0,0,0,0,'Agent Araxes - On Script - Activate GO (Portable Transponder)'),

(20553,0,0,0,11,0,100,0,0,0,0,0,0,11,12980,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Commander Ameer - On Respawn - Cast ''Simple Teleport'''),
(20553,0,1,0,38,0,100,0,1,1,0,0,0,80,2055300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Commander Ameer - On Data Set 1 1 - Call Timed Action List'),

(2055300,9,0,0,0,0,100,0,0,0,0,0,0,11,12980,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Commander Ameer - On Script - Cast ''Simple Teleport'''),
(2055300,9,1,0,0,0,100,0,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Commander Ameer - On Script - Force Despawn'),

(20564,0,0,0,11,0,100,0,0,0,0,0,0,11,12980,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Agent Ya-six - On Respawn - Cast ''Simple Teleport'''),
(20564,0,1,0,38,0,100,0,1,1,0,0,0,80,2056400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Agent Ya-six - On Data Set 1 1 - Call Timed Action List'),

(2056400,9,0,0,0,0,100,0,0,0,0,0,0,11,12980,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Agent Ya-six - On Script - Cast ''Simple Teleport'''),
(2056400,9,1,0,0,0,100,0,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Agent Ya-six - On Script - Force Despawn');

DELETE FROM `waypoint_data` WHERE `id` = 726780;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(726780,1,3782.49,2170.66,141.338,1.67552,180000,0,0,0,100,0),
(726780,2,3782.11,2173.55,141.341,NULL,45000,0,0,0,100,0),
(726780,3,3782.49,2170.66,141.338,1.67552,30000,0,0,0,100,0),
(726780,4,3782.49,2170.66,141.338,1.67552,28000,0,0,0,100,0);
