DELETE FROM `creature_template_addon` WHERE `entry` IN (29149,29006,28025,28668,28667,29124,28112,28010,29036);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(29149,0,0,0,1,0,0,'50726'),
(29006,0,0,0,1,0,0,'50503'),
(28025,0,0,0,1,0,0,'50503'),
(28668,0,0,0,1,0,0,'54176'),
(28667,0,0,0,1,0,0,'50726 52119'),
(29124,0,0,0,1,0,0,'53213 54189'),
(28112,0,0,0,1,0,0,'50726'),
(28010,0,0,0,1,0,0,'54913'),
(29036,0,0,0,1,0,0,'52948');

UPDATE `creature_template_addon` SET `auras` = '29266', `bytes1` = 0 WHERE `entry` = 28464;
UPDATE `creature_template_addon` SET `auras` = '52948', `bytes1` = 0 WHERE `entry` = 28320;
UPDATE `creature_template_addon` SET `emote` = 0 WHERE `entry` = 28538;

UPDATE `creature` SET `unit_flags` = 256 | 768 WHERE `guid` IN (40451,40452,40453,40454,40455,40456,40457,40458,40459,40460,40461,40462,40466,40467);
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` IN (40452,40462,40467);
UPDATE `creature` SET `position_x` = 6180.65, `position_y` = 4757.18, `position_z` = 224.714, `orientation` = 1.26187 WHERE `guid` = 40275;

DELETE FROM `creature_addon` WHERE `guid` IN (102744,98348,40271,40273,40276,40278,40451,40452,40453,40454,40455,40456,40457,40458,40459,40460,40461,40462,40466,40467);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(40271,0,0,0,1,69,0,NULL),
(40273,0,0,0,1,69,0,NULL),
(40276,0,0,0,1,69,0,NULL),
(40278,0,0,0,1,69,0,NULL),
(40451,0,0,0,1,0,0,'29266'),
(40452,0,0,0,1,0,0,'52948'),
(40453,0,0,0,1,0,0,'29266'),
(40454,0,0,0,1,0,0,'29266'),
(40455,0,0,0,1,0,0,'29266'),
(40456,0,0,0,1,0,0,'29266'),
(40457,0,0,0,1,0,0,'29266'),
(40458,0,0,0,1,0,0,'29266'),
(40459,0,0,0,1,0,0,'29266'),
(40460,0,0,0,1,0,0,'29266'),
(40461,0,0,0,1,0,0,'29266'),
(40462,0,0,0,1,0,0,'52948'),
(40466,0,0,0,1,0,0,'29266'),
(40467,0,0,0,1,0,0,'52948');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 28443 AND `id` = 3;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(28443,0,3,0,25,0,100,0,0,0,0,0,0,11,51841,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thalgran Blightbringer - On Reset - Cast ''Blightbringer''');
