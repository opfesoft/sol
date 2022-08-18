-- Stormcrest Eagle, Frostborn Stormrider: Set large
UPDATE `creature_template_addon` SET `isLarge` = 1 WHERE `entry` = 30013;
UPDATE `creature_addon` SET `isLarge` = 1 WHERE `guid` IN (101713,101714,101715,101801);
DELETE FROM `creature_template_addon` WHERE `entry` = 29730;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(29730,0,0,0,1,0,1,NULL);

-- Quest "Pushed Too Far": Needs quests "The Brothers Bronzebeard" and "The Reckoning" to be finished
UPDATE `quest_template_addon` SET `ExclusiveGroup` = -13047 WHERE `id` IN (12973,13047);
UPDATE `quest_template_addon` SET `PrevQuestID` = 13047 WHERE `id` = 12869;

DELETE FROM `vehicle_template_accessory` WHERE `entry` = 29736;
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`)
VALUES
(29736,30401,0,1,'Stormcrest Eagle',8,0);

UPDATE `creature_template` SET `speed_walk` = 1, `speed_run` = 6/7, `spell1` = 0, `spell2` = 0, `VehicleId` = 196 WHERE `entry` = 29736; -- 2 seats, no spells, adjust speed
UPDATE `creature_template` SET `VehicleId` = 216 WHERE `entry` = 30013; -- 1 seat

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 30013;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (30013,29732,29736);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(30013,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stormcrest Eagle - On Respawn - Set Active On'),

(29732,0,0,1,62,0,100,0,9891,0,0,0,0,11,56411,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Fjorlin Frostbrow - On Gossip 0 Selected - Cast ''Forcecast Summon Scripted Eagle'' (Invoker)'),
(29732,0,1,2,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Fjorlin Frostbrow - Linked - Close Gossip'),
(29732,0,2,0,61,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fjorlin Frostbrow - Linked - Reset Orientation'),
(29732,0,3,1,62,0,100,0,9891,1,0,0,0,11,57049,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Fjorlin Frostbrow - On Gossip 1 Selected - Cast ''Forcecast Summon Battle Eagle'' (Invoker)'),

(29736,0,0,1,60,0,100,1,2000,2000,0,0,0,53,1,29736,0,0,5000,0,1,0,0,0,0,0,0,0,0,'Stormcrest Eagle - On Update - Start WP Movement (No Repeat)'),
(29736,0,1,0,61,0,100,0,0,0,0,0,0,75,55971,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stormcrest Eagle - Linked - Add Aura ''Eagle Flight'''),
(29736,0,2,0,27,0,100,0,0,0,0,0,0,81,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Stormcrest Eagle - On Passenger Boarded - Remove NPC Flags (Invoker)'),
(29736,0,3,0,40,0,100,0,3,0,0,0,0,1,0,0,0,0,0,0,19,30401,20,0,0,0,0,0,0,'Stormcrest Eagle - On WP 3 Reached - Say Line 0 (Velog Icebellow)'),
(29736,0,4,0,40,0,100,0,7,0,0,0,0,1,1,0,0,0,0,0,19,30401,20,0,0,0,0,0,0,'Stormcrest Eagle - On WP 7 Reached - Say Line 1 (Velog Icebellow)'),
(29736,0,5,0,40,0,100,0,10,0,0,0,0,1,2,0,0,0,0,0,19,30401,20,0,0,0,0,0,0,'Stormcrest Eagle - On WP 10 Reached - Say Line 2 (Velog Icebellow)'),
(29736,0,6,0,40,0,100,0,13,0,0,0,0,1,3,0,0,0,0,0,19,30401,20,0,0,0,0,0,0,'Stormcrest Eagle - On WP 13 Reached - Say Line 3 (Velog Icebellow)'),
(29736,0,7,0,40,0,100,0,15,0,0,0,0,1,4,0,0,0,0,0,19,30401,20,0,0,0,0,0,0,'Stormcrest Eagle - On WP 15 Reached - Say Line 4 (Velog Icebellow)'),
(29736,0,8,0,40,0,100,0,17,0,0,0,0,1,5,0,0,0,0,0,19,30401,20,0,0,0,0,0,0,'Stormcrest Eagle - On WP 17 Reached - Say Line 5 (Velog Icebellow)'),
(29736,0,9,0,40,0,100,0,19,0,0,0,0,1,6,0,0,0,0,0,19,30401,20,0,0,0,0,0,0,'Stormcrest Eagle - On WP 19 Reached - Say Line 6 (Velog Icebellow)'),
(29736,0,10,0,40,0,100,0,22,0,0,0,0,1,7,0,0,0,0,0,19,30401,20,0,0,0,0,0,0,'Stormcrest Eagle - On WP 22 Reached - Say Line 7 (Velog Icebellow)'),
(29736,0,11,0,40,0,100,0,24,0,0,0,0,1,8,0,0,0,0,0,19,30401,20,0,0,0,0,0,0,'Stormcrest Eagle - On WP 24 Reached - Say Line 8 (Velog Icebellow)'),
(29736,0,12,0,40,0,100,0,28,0,0,0,0,1,9,0,0,0,0,0,19,30401,20,0,0,0,0,0,0,'Stormcrest Eagle - On WP 28 Reached - Say Line 9 (Velog Icebellow)'),
(29736,0,13,0,40,0,100,0,30,0,0,0,0,1,10,0,0,0,0,0,19,30401,20,0,0,0,0,0,0,'Stormcrest Eagle - On WP 30 Reached - Say Line 10 (Velog Icebellow)'),
(29736,0,14,0,40,0,100,0,32,0,0,0,0,1,11,0,0,0,0,0,19,30401,20,0,0,0,0,0,0,'Stormcrest Eagle - On WP 32 Reached - Say Line 11 (Velog Icebellow)'),
(29736,0,15,0,40,0,100,0,34,0,0,0,0,1,12,0,0,0,0,0,19,30401,20,0,0,0,0,0,0,'Stormcrest Eagle - On WP 34 Reached - Say Line 12 (Velog Icebellow)'),
(29736,0,16,0,40,0,100,0,36,0,0,0,0,1,13,0,0,0,0,0,19,30401,20,0,0,0,0,0,0,'Stormcrest Eagle - On WP 36 Reached - Say Line 13 (Velog Icebellow)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 9891;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,9891,0,0,0,47,0,12874,8,0,0,0,0,'Fjorlin Frostbrow - Group 0: Show gossip option 0 if ''Fervor of the Frostborn'' is in progress'),
(15,9891,1,0,0,47,0,12869,8,0,0,0,0,'Fjorlin Frostbrow - Group 0: Show gossip option 1 if ''Pushed Too Far'' is in progress');
