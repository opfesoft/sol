DELETE FROM `creature_equip_template` WHERE `CreatureID` = 19610;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`)
VALUES
(19610,1,1910,0,0,0),
(19610,2,4994,0,0,0),
(19610,3,1903,0,0,0);

UPDATE `creature` SET `equipment_id` = 2 WHERE `guid` = 70030;
UPDATE `creature` SET `equipment_id` = 3, `position_x` = 3015.49, `position_y` = 3681.66, `position_z` = 132.507, `orientation` = 0.000481129, `MovementType` = 0 WHERE `guid` = 70032;
UPDATE `creature` SET `equipment_id` = 1 WHERE `guid` IN (70031,70034,70036);
UPDATE `creature` SET `MovementType` = 0 WHERE `guid` = 70037;
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 70030;

DELETE FROM `creature_addon` WHERE `guid` IN (70032,70037,70030);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(70030,700300,0,0,1,0,0,NULL);

DELETE FROM `creature_text` WHERE `CreatureId` = 19610 AND `GroupID` = 9;
DELETE FROM `creature_text` WHERE `CreatureId` = 19612;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(19610,9,0,'We''ve taken some strange readings from nether ribbons.',12,0,100,1,0,0,17033,0,'Irradiated Worker'),
(19610,9,1,'I''ve got a preliminary report about the gravimetric disruptions.',12,0,100,1,0,0,17034,0,'Irradiated Worker'),
(19610,9,2,'I have another reading from the nether.',12,0,100,1,0,0,17035,0,'Irradiated Worker'),
(19610,9,3,'My quad-corder has detected some anomolous readings from the nether anomolies.',12,0,100,1,0,0,17036,0,'Irradiated Worker'),
(19610,9,4,'I think my gadget is broken, it did manage to pick up some unusual readings.',12,0,100,1,0,0,17037,0,'Irradiated Worker'),
(19610,9,5,'You should take a look at these readings, they are unlike anything we''ve seen before.',12,0,100,1,0,0,17038,0,'Irradiated Worker'),

(19612,0,0,'Let me see what you''ve found.',12,0,100,1,0,0,17040,0,'Irradiated Manager'),
(19612,0,1,'Let''s see what you''ve got.',12,0,100,1,0,0,17041,0,'Irradiated Manager'),
(19612,0,2,'Give me a moment to look over these findings.',12,0,100,1,0,0,17042,0,'Irradiated Manager'),
(19612,0,3,'I''ll be the judge of that.',12,0,100,1,0,0,17043,0,'Irradiated Manager'),
(19612,0,4,'Well hand it over and let''s see what you''ve got!',12,0,100,1,0,0,17045,0,'Irradiated Manager'),

(19612,1,0,'Oh my...',12,0,100,5,0,0,17049,0,'Irradiated Manager'),
(19612,1,1,'Fascinating.',12,0,100,5,0,0,17050,0,'Irradiated Manager'),
(19612,1,2,'Incredible!',12,0,100,5,0,0,17052,0,'Irradiated Manager'),
(19612,1,3,'Impressive... Most impressive.',12,0,100,5,0,0,17053,0,'Irradiated Manager'),
(19612,1,4,'Great Gazlowe!',12,0,100,5,0,0,17056,0,'Irradiated Manager'),

(19612,2,0,'We''ll need to collect more data to substantiate these readings.  Get back in there and collect that data.',12,0,100,1,0,0,17057,0,'Irradiated Manager'),
(19612,2,1,'We need to confirm this data, we don''t want to rip apart any more of our facility.',12,0,100,1,0,0,17058,0,'Irradiated Manager'),
(19612,2,2,'According to these readings, we have nothing to fear.  At least nothing in the near future.  We''ll need more data to be sure.',12,0,100,1,0,0,17059,0,'Irradiated Manager'),
(19612,2,3,'This data will be quite useful for Project Blue Book. Er, I mean, this will be great for my new look.  See if you can gather any more data.',12,0,100,1,0,0,17060,0,'Irradiated Manager'),
(19612,2,4,'Hmmm... this nether radiation could prove to be quite deadly.  But it could be even deadlier to  just ignore it.  I''ll need some more readings to confirm this.',12,0,100,1,0,0,17061,0,'Irradiated Manager');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = -70030;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1961000;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-70030,0,0,0,1,0,100,0,240000,480000,240000,480000,0,239,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Irradiated Worker - OOC - Resume WP Path After 5 Seconds'),
(-70030,0,1,0,34,0,100,0,2,23,0,0,0,80,1961000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Irradiated Worker - On WP 24 Reached - Call Timed Action List'),

(1961000,9,0,0,0,0,100,0,2000,2000,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Irradiated Worker - On Script - Say Line 9'),
(1961000,9,1,0,0,0,100,0,5000,5000,0,0,0,1,0,0,0,0,0,0,19,19612,0,0,0,0,0,0,0,'Irradiated Worker - On Script - Say Line 0 (Irradiated Manager)'),
(1961000,9,2,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,19,19612,0,0,0,0,0,0,0,'Irradiated Worker - On Script - Say Line 1 (Irradiated Manager)'),
(1961000,9,3,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,19,19612,0,0,0,0,0,0,0,'Irradiated Worker - On Script - Say Line 2 (Irradiated Manager)');

DELETE FROM `waypoint_scripts` WHERE `id` IN (216,217,218,219);
DELETE FROM `waypoint_data` WHERE `id` IN (700320,700370,700300);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(700300,1,3018.9,3661.96,130.179,0.20944,900000,0,0,0,100,0),
(700300,2,3018.01,3663.18,130.432,NULL,0,0,0,0,100,0),
(700300,3,3016.51,3665.25,129.995,NULL,0,0,0,0,100,0),
(700300,4,3014.31,3668.26,130.284,NULL,0,0,0,0,100,0),
(700300,5,3012.39,3670.9,130.729,NULL,0,0,0,0,100,0),
(700300,6,3011.16,3672.59,131.088,NULL,0,0,0,0,100,0),
(700300,7,3008.75,3675.89,131.863,NULL,0,0,0,0,100,0),
(700300,8,3009.27,3678.99,133.106,NULL,0,0,0,0,100,0),
(700300,9,3010.02,3683.4,133.973,NULL,0,0,0,0,100,0),
(700300,10,3010.45,3685.93,134.134,NULL,0,0,0,0,100,0),
(700300,11,3010.89,3688.58,135.04,NULL,0,0,0,0,100,0),
(700300,12,3011.52,3692.27,136.277,NULL,0,0,0,0,100,0),
(700300,13,3011.98,3695.01,136.591,NULL,0,0,0,0,100,0),
(700300,14,3009.69,3695.1,136.918,NULL,0,0,0,0,100,0),
(700300,15,3006.78,3695.21,140.377,NULL,0,0,0,0,100,0),
(700300,16,3003.66,3695.33,143.858,NULL,0,0,0,0,100,0),
(700300,17,3002.94,3695.32,143.895,NULL,0,0,0,0,100,0),
(700300,18,3003,3693.26,143.878,NULL,0,0,0,0,100,0),
(700300,19,3003.13,3688.61,143.656,NULL,0,0,0,0,100,0),
(700300,20,3003.23,3684.93,143.657,NULL,0,0,0,0,100,0),
(700300,21,3007.77,3684.88,143.656,NULL,0,0,0,0,100,0),
(700300,22,3012.55,3684.84,143.649,NULL,0,0,0,0,100,0),
(700300,23,3017.8,3684.78,143.643,NULL,0,0,0,0,100,0),
(700300,24,3022.2,3684.74,143.638,0.146172,27000,0,0,0,100,0),
(700300,25,3017.8,3684.78,143.643,NULL,0,0,0,0,100,0),
(700300,26,3012.55,3684.84,143.649,NULL,0,0,0,0,100,0),
(700300,27,3007.77,3684.88,143.656,NULL,0,0,0,0,100,0),
(700300,28,3003.23,3684.93,143.657,NULL,0,0,0,0,100,0),
(700300,29,3003.13,3688.61,143.656,NULL,0,0,0,0,100,0),
(700300,30,3003,3693.26,143.878,NULL,0,0,0,0,100,0),
(700300,31,3002.94,3695.32,143.895,NULL,0,0,0,0,100,0),
(700300,32,3003.66,3695.33,143.858,NULL,0,0,0,0,100,0),
(700300,33,3006.78,3695.21,140.377,NULL,0,0,0,0,100,0),
(700300,34,3009.69,3695.1,136.918,NULL,0,0,0,0,100,0),
(700300,35,3011.98,3695.01,136.591,NULL,0,0,0,0,100,0),
(700300,36,3011.52,3692.27,136.277,NULL,0,0,0,0,100,0),
(700300,37,3010.89,3688.58,135.04,NULL,0,0,0,0,100,0),
(700300,38,3010.45,3685.93,134.134,NULL,0,0,0,0,100,0),
(700300,39,3010.02,3683.4,133.973,NULL,0,0,0,0,100,0),
(700300,40,3009.27,3678.99,133.106,NULL,0,0,0,0,100,0),
(700300,41,3008.75,3675.89,131.863,NULL,0,0,0,0,100,0),
(700300,42,3011.16,3672.59,131.088,NULL,0,0,0,0,100,0),
(700300,43,3012.39,3670.9,130.729,NULL,0,0,0,0,100,0),
(700300,44,3014.31,3668.26,130.284,NULL,0,0,0,0,100,0),
(700300,45,3016.51,3665.25,129.995,NULL,0,0,0,0,100,0),
(700300,46,3018.01,3663.18,130.432,NULL,0,0,0,0,100,0);
