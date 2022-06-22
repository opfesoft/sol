DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 23995;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2399500;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23995,0,0,0,34,0,100,0,2,5,0,0,0,80,2399500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Axle - On WP 6 Reached - Call Timed Action List'),
(23995,0,1,2,62,0,100,0,9123,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Axle - On Gossip Option 0 Selected - Close Gossip'),
(23995,0,2,0,61,0,100,0,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Axle - Linked - Invoker Cast ''Trick or Treat'''),

(2399500,9,0,0,0,0,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Axle - On Script - Say Line 0'),
(2399500,9,1,0,0,0,100,0,7000,7000,0,0,0,1,0,0,0,0,0,0,10,18598,23579,0,0,0,0,0,0,'Axle - On Script - Say Line 0 (Brogg)'),
(2399500,9,2,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Axle - On Script - Say Line 1'),
(2399500,9,3,0,0,0,100,0,7000,7000,0,0,0,1,1,0,0,0,0,0,10,18598,23579,0,0,0,0,0,0,'Axle - On Script - Say Line 1 (Brogg)'),
(2399500,9,4,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Axle - On Script - Say Line 2'),
(2399500,9,5,0,0,0,100,0,7000,7000,0,0,0,239,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Axle - On Script - Resume WP Path After 1 Second');

DELETE FROM `waypoints` WHERE `entry` = 23995;
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 18599;
DELETE FROM `creature_addon` WHERE `guid` = 18599;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(18599,185990,0,0,0,0,0,NULL);

DELETE FROM `waypoint_data` WHERE `id` = 185990;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(185990,1,-4629.94,-3176.12,41.2235,NULL,0,0,0,0,100,0),
(185990,2,-4627.79,-3176.21,41.4089,NULL,0,0,0,0,100,0),
(185990,3,-4622.36,-3177.42,38.2056,NULL,0,0,0,0,100,0),
(185990,4,-4617,-3178.6,34.8097,NULL,0,0,0,0,100,0),
(185990,5,-4615.73,-3176.38,34.8117,NULL,0,0,0,0,100,0),
(185990,6,-4618,-3175.21,34.8133,NULL,600000,0,0,0,100,0),
(185990,7,-4615.73,-3176.38,34.8117,NULL,0,0,0,0,100,0),
(185990,8,-4617,-3178.6,34.8097,NULL,0,0,0,0,100,0),
(185990,9,-4622.36,-3177.42,38.2056,NULL,0,0,0,0,100,0),
(185990,10,-4627.79,-3176.21,41.4089,NULL,0,0,0,0,100,0),
(185990,11,-4629.94,-3176.12,41.2235,6.26344,140000,0,0,0,100,0);
