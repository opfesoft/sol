DELETE FROM `creature_equip_template` WHERE `CreatureID` = 17056 AND `ID` = 2;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`)
VALUES
(17056,2,2202,0,0,0);

-- Remove Firework Guys (those are summoned by the Firework spells)
DELETE FROM `creature` WHERE `id` IN (15882,15883);

UPDATE `creature` SET `equipment_id` = 0 WHERE `id` = 17056;
UPDATE `creature` SET `orientation` = 1.98683 WHERE `guid` = 59449;
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 59444;

DELETE FROM `creature_addon` WHERE `guid` IN (59434,59435,59436,59438,59439,59448);
UPDATE `creature_addon` SET `path_id` = 594440 WHERE `guid` = 59444;

-- Firework Launcher: SAI not needed anymore
UPDATE `gameobject_template` SET `AIName` = '' WHERE `entry` = 180771;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (-21159,-21160,-21161,-21162);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` BETWEEN 18077100 AND 18077111;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (16366,16367);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (17056,-59434,-59444,16366,16367);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1705600,1705601,1705602,1705603,1705604,1705605,1705606,1705607,1705608,1705609,1705610,1705611,1705612,1705613,1705614,1705615);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17056,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Respawn - Disable Event Phase Reset'),
(17056,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - Linked - Set Event Phase 1'),
(17056,0,2,0,1,1,100,0,7000,15000,7000,15000,0,87,1705600,1705600,1705600,1705601,1705602,1705603,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - OOC - Call Random Timed Action List (Event Phase 1)'),
(17056,0,3,0,59,0,100,0,1,0,0,0,0,88,1705604,1705615,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Timed Event 1 Triggered - Call Random Range Timed Action List'),

(1705600,9,0,0,0,0,100,0,0,0,0,0,0,10,1,5,6,11,273,274,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Play Random Emote'),

(1705601,9,0,0,0,0,100,0,0,0,0,0,0,124,1,0,2,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Load Random Equipment (1-2)'),
(1705601,9,1,0,0,0,100,0,1000,1000,0,0,0,5,92,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Play Emote ''ONESHOT_EAT_NOSHEATHE'''),
(1705601,9,2,0,0,0,100,0,4000,4000,0,0,0,124,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Unload Equipment'),

(1705602,9,0,0,0,0,100,0,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Increase Event Phase'),
(1705602,9,1,0,0,0,100,0,0,0,0,0,0,17,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Set Emote State ''STATE_DANCE'''),
(1705602,9,2,0,0,0,100,0,20000,40000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Set Emote State ''ONESHOT_NONE'''),
(1705602,9,3,0,0,0,100,0,5000,5000,0,0,0,23,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Decrease Event Phase'),

(1705603,9,0,0,0,0,100,0,0,0,0,0,0,67,1,1000,1000,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Create Timed Event 1'),

(1705604,9,0,0,0,0,100,0,0,0,0,0,0,11,26291,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Cast ''Small Blue Rocket'''),
(1705605,9,0,0,0,0,100,0,0,0,0,0,0,11,26292,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Cast ''Small Green Rocket'''),
(1705606,9,0,0,0,0,100,0,0,0,0,0,0,11,26293,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Cast ''Small Purple Rocket'''),
(1705607,9,0,0,0,0,100,0,0,0,0,0,0,11,26286,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Cast ''Small Red Rocket'''),
(1705608,9,0,0,0,0,100,0,0,0,0,0,0,11,26294,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Cast ''Small White Rocket'''),
(1705609,9,0,0,0,0,100,0,0,0,0,0,0,11,26295,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Cast ''Small Yellow Rocket'''),
(1705610,9,0,0,0,0,100,0,0,0,0,0,0,11,26333,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Cast ''Large Blue Rocket'''),
(1705611,9,0,0,0,0,100,0,0,0,0,0,0,11,26334,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Cast ''Large Green Rocket'''),
(1705612,9,0,0,0,0,100,0,0,0,0,0,0,11,26335,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Cast ''Large Purple Rocket'''),
(1705613,9,0,0,0,0,100,0,0,0,0,0,0,11,26336,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Cast ''Large Red Rocket'''),
(1705614,9,0,0,0,0,100,0,0,0,0,0,0,11,26337,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Cast ''Large White Rocket'''),
(1705615,9,0,0,0,0,100,0,0,0,0,0,0,11,26338,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Script - Cast ''Large Yellow Rocket'''),

(-59444,0,0,0,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Respawn - Disable Event Phase Reset'),
(-59444,0,1,8,34,0,100,0,2,1,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On WP 2 Reached - Set Event Phase 1'),
(-59444,0,2,8,34,0,100,0,2,2,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On WP 3 Reached - Set Event Phase 1'),
(-59444,0,3,8,34,0,100,0,2,5,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On WP 6 Reached - Set Event Phase 1'),
(-59444,0,4,8,34,0,100,0,2,7,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On WP 8 Reached - Set Event Phase 1'),
(-59444,0,5,8,34,0,100,0,2,8,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On WP 9 Reached - Set Event Phase 1'),
(-59444,0,6,0,1,1,100,0,7000,15000,7000,15000,0,87,1705600,1705600,1705600,1705601,1705602,1705603,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - OOC - Call Random Timed Action List (Event Phase 1)'),
(-59444,0,7,0,59,0,100,0,1,0,0,0,0,88,1705604,1705615,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Timed Event 1 Triggered - Call Random Range Timed Action List'),
(-59444,0,8,0,61,0,100,0,0,0,0,0,0,67,2,60000,120000,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - Linked - Create Timed Event 2'),
(-59444,0,9,10,59,0,100,0,2,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Timed Event 2 Triggered - Set Event Phase 3'),
(-59444,0,10,0,61,0,100,0,0,0,0,0,0,67,3,45000,45000,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - Linked - Create Timed Event 3'),
(-59444,0,11,0,59,0,100,0,3,0,0,0,0,239,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Timed Event 3 Triggered - Resume WP Path After 1 Second'),

(-59434,0,0,0,11,0,100,0,0,0,0,0,0,90,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eversong Partygoer - On Respawn - Set ''UNIT_STAND_STATE_SLEEP'''),

(16366,0,0,0,1,0,100,0,7000,15000,7000,15000,0,10,1,5,6,11,273,274,1,0,0,0,0,0,0,0,0,'Sempstress Ambershine - OOC - Play Random Emote'),

(16367,0,0,0,1,0,100,0,7000,15000,7000,15000,0,10,1,5,6,11,273,274,1,0,0,0,0,0,0,0,0,'Botanist Tyniarrel - OOC - Play Random Emote');

DELETE FROM `gossip_menu` WHERE `MenuID` = 7346 AND `TextID` = 8760;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(7346,8760);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 7346;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,7346,8759,0,0,47,0,9067,64,0,1,0,0,'Eversong Partygoer - Group 0: Show gossip menu text 8759 if quest ''The Party Never Ends'' is not rewarded'),
(14,7346,8760,0,0,47,0,9067,64,0,0,0,0,'Eversong Partygoer - Group 0: Show gossip menu text 8760 if quest ''The Party Never Ends'' is rewarded');

DELETE FROM `waypoint_data` WHERE `id` = 594440;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(594440,1,8675.36,-6334.15,55.9307,NULL,0,0,0,0,100,0),
(594440,2,8675.36,-6334.15,55.9307,3.12414,400000,0,0,0,100,0),
(594440,3,8680.05,-6343.11,55.9115,0.567654,400000,0,0,0,100,0),
(594440,4,8679.73,-6340.44,55.9278,NULL,0,0,0,0,100,0),
(594440,5,8686.75,-6337.42,55.9446,NULL,0,0,0,0,100,0),
(594440,6,8687.83,-6338.87,55.9397,4.50251,400000,0,0,0,100,0),
(594440,7,8689.28,-6332.24,55.9556,NULL,0,0,0,0,100,0),
(594440,8,8690.97,-6332.29,55.959,5.0955,400000,0,0,0,100,0),
(594440,9,8680.98,-6329.37,55.9465,2.51546,400000,0,0,0,100,0);
