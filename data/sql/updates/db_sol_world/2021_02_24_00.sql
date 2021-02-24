-- DB update 2021_02_23_01 -> 2021_02_24_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_23_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_23_01 2021_02_24_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1614205410891930391'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1614205410891930391');

-- Westguard Defender, Westguard Lumberjack: Adjust positions
UPDATE `creature` SET `position_x` = 1348.19, `position_y` = -3317.97, `position_z` = 175.304 WHERE `guid` = 99046;
UPDATE `creature` SET `position_x` = 1376.8, `position_y` = -3448.27, `position_z` = 177.041 WHERE `guid` = 99153;
UPDATE `creature` SET `position_x` = 1347.36, `position_y` = -3436.98, `position_z` = 177.459 WHERE `guid` = 99152;
UPDATE `creature` SET `position_x` = 1331.4, `position_y` = -3401.49, `position_z` = 181.815 WHERE `guid` = 98412;
UPDATE `creature` SET `position_x` = 1477.68, `position_y` = -3459.51, `position_z` = 171.113 WHERE `guid` = 98423;

-- Westguard Defender: Disable random movement
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` IN (105178,105179);

-- Westguard Lumberjack: Remove obsolete spawns and disable random movement, enable WP movement
DELETE FROM `creature` WHERE `guid` IN (98403,98410,98413,98422);
DELETE FROM `creature_addon` WHERE `guid` IN (98403,98410,98413,98422);
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 2 WHERE `id` = 23836;

-- Westguard Lumberjack: Add WP paths, remove emote state (handled via SAI)
UPDATE `creature_addon` SET `path_id` = 984190, `emote` = 0 WHERE `guid` = 98419;
UPDATE `creature_addon` SET `path_id` = 984230, `emote` = 0 WHERE `guid` = 98423;
UPDATE `creature_addon` SET `path_id` = 984140, `emote` = 0 WHERE `guid` = 98414;
UPDATE `creature_addon` SET `path_id` = 984110, `emote` = 0 WHERE `guid` = 98411;
UPDATE `creature_addon` SET `path_id` = 984080, `emote` = 0 WHERE `guid` = 98408;
UPDATE `creature_addon` SET `path_id` = 984180, `emote` = 0 WHERE `guid` = 98418;
UPDATE `creature_addon` SET `path_id` = 984120, `emote` = 0 WHERE `guid` = 98412;
UPDATE `creature_addon` SET `path_id` = 984090, `emote` = 0 WHERE `guid` = 98409;

-- Westguard Worker, Jhet Ironbeard: Add missing work emotes
UPDATE `creature_addon` SET `emote` = 233 WHERE `guid` IN (104814,105173,105156);
UPDATE `creature_addon` SET `emote` = 234 WHERE `guid` IN (105155,105157,105172,105180);

-- Innkeeper Celeste Goodhutch: Sheath weapon
DELETE FROM `creature_addon` WHERE `guid` = 107673;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(107673,0,0,0,0,0,0,NULL);

-- Add several missing creature texts for random talk
DELETE FROM `creature_text` WHERE `CreatureID` IN (23773,23860,24283,24333,23937);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(23773,0,0,'Lissan! Lissan White! Where is that girl?',12,7,100,396,0,0,23198,0,'Chef Kettleblack - Random Talk'),
(23773,0,1,'You just can''t get good help these days!',12,7,100,396,0,0,23199,0,'Chef Kettleblack - Random Talk'),
(23773,0,2,'Lissan! I bet that girl is daydreaming at the well again!',12,7,100,396,0,0,23200,0,'Chef Kettleblack - Random Talk'),

(23860,0,0,'%s hums a melody over the well.',16,7,100,0,0,0,22355,0,'Lissan White - Random Talk'),
(23860,0,1,'Dropping a coin down the well, Lissan looks around to see if anyone noticed.',16,7,100,0,0,0,22358,0,'Lissan White - Random Talk'),
(23860,0,2,'%s whistles while she works.',16,7,100,0,0,0,30328,0,'Lissan White - Random Talk'),
(23860,0,3,'%s daydreams about princes and far off places.',16,7,100,0,0,0,30329,0,'Lissan White - Random Talk'),

(24283,0,0,'Hey, bartender, another round!',12,7,100,396,0,0,23186,0,'Peppy Wrongnozzle - Random Talk To Bartender Jason Goodhutch'),
(24283,1,0,'You done cleaning that mug yet ...hic?',12,7,100,396,0,0,23187,0,'Peppy Wrongnozzle - Random Talk To Bartender Jason Goodhutch'),
(24283,2,0,'I can whip up better than thish, Jashon.',12,7,100,396,0,0,23188,0,'Peppy Wrongnozzle - Random Talk To Bartender Jason Goodhutch'),
(24283,3,0,'You should... you should send thish shtuff over to Petrov for his bombs!',12,7,100,396,0,0,23189,0,'Peppy Wrongnozzle - Random Talk To Bartender Jason Goodhutch'),
(24283,4,0,'That''s a pretty dressh, Celeste. You''re sho pretty. I love you guys ...hic!',12,7,100,396,0,0,23190,0,'Peppy Wrongnozzle - Talk To Innkeeper Celeste Goodhutch'),
(24283,5,0,'Right, that should do it. I think ...hic.',12,7,100,396,0,0,23086,0,'Peppy Wrongnozzle - Talk To Player (Quest ''Mission: Forsaken Intel'')'),

(24333,0,0,'Who''s that talking? I can barely see the top of your head. Are you sure that you''re old enough to be drinking?',12,7,100,396,0,0,23193,0,'Bartender Jason Goodhutch - Random Talk To Peppy Wrongnozzle'),
(24333,1,0,'Uh huh.',12,7,100,0,0,0,23192,0,'Bartender Jason Goodhutch - Random Talk To Peppy Wrongnozzle'),
(24333,2,0,'Peppy, I swear you could drink a dwarf under the table.',12,7,100,396,0,0,23194,0,'Bartender Jason Goodhutch - Random Talk To Peppy Wrongnozzle'),
(24333,3,0,'I think you''ve had just about enough.',12,7,100,396,0,0,23191,0,'Bartender Jason Goodhutch - Random Talk To Peppy Wrongnozzle'),

(23937,0,0,'Thank you, sweety. We love you, too.',12,7,100,396,0,0,23205,0,'Innkeeper Celeste Goodhutch - Talk To Peppy Wrongnozzle');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (23773,23860,24283,24333,23836);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (23773,23860,24283,23836);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2428300,2428301,2428302,2428303,2428304,2428305);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23773,0,0,0,1,0,100,0,60000,120000,60000,120000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chef Kettleblack - OOC - Say Line 0'),

(23860,0,0,0,1,0,100,0,60000,120000,60000,120000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lissan White - OOC - Say Line 0'),

(24283,0,0,0,25,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - On Respawn - Set Event Phase 1'),
(24283,0,1,0,1,1,100,0,10000,20000,10000,20000,0,5,92,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - OOC - Play Emote ''ONESHOT_EAT_NOSHEATHE'' (Phase 1)'),
(24283,0,2,0,1,1,100,0,60000,120000,60000,120000,0,88,2428300,2428304,0,0,0,0,1,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - OOC - Call Range Timed Action List (Phase 1)'),
(24283,0,3,0,20,1,100,0,11328,0,0,0,0,80,2428305,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - On Reward Quest ''Mission: Forsaken Intel'' - Call Timed Action List (Phase 1)'),

(2428300,9,0,0,0,1,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Say Line 0 (Phase 1)'),
(2428300,9,1,0,0,1,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,10,97632,24333,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Say Line 0 (Bartender Jason Goodhutch) (Phase 1)'),

(2428301,9,0,0,0,1,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Say Line 1 (Phase 1)'),
(2428301,9,1,0,0,1,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,10,97632,24333,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Say Line 1 (Bartender Jason Goodhutch) (Phase 1)'),

(2428302,9,0,0,0,1,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Say Line 2 (Phase 1)'),
(2428302,9,1,0,0,1,100,0,4000,4000,0,0,0,1,2,0,0,0,0,0,10,97632,24333,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Say Line 2 (Bartender Jason Goodhutch) (Phase 1)'),

(2428303,9,0,0,0,1,100,0,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Say Line 3 (Phase 1)'),
(2428303,9,1,0,0,1,100,0,4000,4000,0,0,0,1,3,0,0,0,0,0,10,97632,24333,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Say Line 3 (Bartender Jason Goodhutch) (Phase 1)'),

(2428304,9,0,0,0,1,100,0,0,0,0,0,0,66,0,0,0,0,0,0,10,107673,23937,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Set Orientation (Innkeeper Celeste Goodhutch) (Phase 1)'),
(2428304,9,1,0,0,1,100,0,2000,2000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Say Line 4 (Phase 1)'),
(2428304,9,2,0,0,1,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,10,107673,23937,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Say Line 0 (Innkeeper Celeste Goodhutch) (Phase 1)'),
(2428304,9,3,0,0,1,100,0,4000,4000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Reset Orientation (Phase 1)'),

(2428305,9,0,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Set Event Phase 2'),
(2428305,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Set Orientation (Invoker)'),
(2428305,9,2,0,0,0,100,0,0,0,0,0,0,71,0,0,2200,3698,0,0,1,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Equip Items 2200 (Slot 1) & 3698 (Slot 2)'),
(2428305,9,3,0,0,0,100,0,2000,2000,0,0,0,17,133,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Set Emote State ''STATE_USESTANDING_NOSHEATHE'''),
(2428305,9,4,0,0,0,100,0,5000,5000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Set Emote State ''ONESHOT_NONE'''),
(2428305,9,5,0,0,0,100,0,2000,2000,0,0,0,71,0,0,2705,0,0,0,1,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Equip Item 2705 (Slot 1) & Unequip Slot 2'),
(2428305,9,6,0,0,0,100,0,0,0,0,0,0,1,5,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Say Line 5'),
(2428305,9,7,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - On Script - Set Event Phase 1'),
(2428305,9,8,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Peppy Wrongnozzle - On On Script - Reset Orientation'),

(23836,0,0,1,34,0,100,0,2,1,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Westguard Lumberjack - On WP 2 Reached - Ready Melee Weapon'),
(23836,0,1,0,61,0,100,0,0,0,0,0,0,17,234,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Westguard Lumberjack - Linked - Set Emote State ''STATE_WORK_CHOPWOOD'''),
(23836,0,2,3,34,0,100,0,2,2,0,0,0,40,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Westguard Lumberjack - On WP 3 Reached - Sheath Melee Weapon'),
(23836,0,3,0,61,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Westguard Lumberjack - Linked - Set Emote State ''ONESHOT_NONE'''),
(23836,0,4,0,34,0,100,0,2,3,0,0,0,3,0,89,0,0,0,0,1,0,0,0,0,0,0,0,0,'Westguard Lumberjack - On WP 4 Reached - Morph Model'),
(23836,0,5,0,34,0,100,0,2,5,0,0,0,3,0,20488,0,0,0,0,1,0,0,0,0,0,0,0,0,'Westguard Lumberjack - On WP 6 Reached - Morph Model');

DELETE FROM `waypoint_data` WHERE `id` IN (992080,990470,1051630,984190,984230,984140,984110,984080,984180,984120,984090);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
-- Westguard Officer
(992080,1,1360.12,-3181.52,161.788,0,0,0,0,100,0),
(992080,2,1363.06,-3188.99,162.821,0,0,0,0,100,0),
(992080,3,1373.35,-3208.48,162.823,0,6000,0,0,100,0),
(992080,4,1363.06,-3188.59,162.821,0,0,0,0,100,0),
(992080,5,1352.99,-3182.98,161.79,0,0,0,0,100,0),
(992080,6,1346.18,-3186.27,162.82,0,0,0,0,100,0),
(992080,7,1337.91,-3190.36,162.812,0,0,0,0,100,0),
(992080,8,1329.99,-3190.6,163.274,0,0,0,0,100,0),
(992080,9,1323.15,-3177.85,170.935,0,0,0,0,100,0),
(992080,10,1322.56,-3175.37,170.935,0,0,0,0,100,0),
(992080,11,1338.27,-3163.68,170.931,0,0,0,0,100,0),
(992080,12,1340.69,-3149.64,172.175,0,5000,0,1159,100,0),
(992080,13,1361.78,-3151.52,170.933,0,0,0,0,100,0),
(992080,14,1375.42,-3148.13,170.934,0,0,0,0,100,0),
(992080,15,1376.78,-3150.71,170.361,0,0,0,0,100,0),
(992080,16,1383.01,-3162.59,163.275,0,0,0,0,100,0),
(992080,17,1376.28,-3169.54,162.816,0,0,0,0,100,0),
(992080,18,1370.36,-3172.97,162.82,0,0,0,0,100,0),
-- Westguard Defender
(990470,1,1352.6,-3317.14,175.753,0,0,0,0,100,0),
(990470,2,1361.35,-3331.92,174.286,0,0,0,0,100,0),
(990470,3,1368.77,-3335.16,174.379,0,0,0,0,100,0),
(990470,4,1376.59,-3327.17,172.631,0,0,0,0,100,0),
(990470,5,1380.99,-3318.09,169.706,0,0,0,0,100,0),
(990470,6,1385.99,-3309.84,167.956,0,0,0,0,100,0),
(990470,8,1390.92,-3297.65,165.572,0,0,0,0,100,0),
(990470,9,1388.19,-3282.56,164.068,0,0,0,0,100,0),
(990470,10,1382.13,-3267.18,162.571,0,0,0,0,100,0),
(990470,11,1378.13,-3258.18,162.071,0,0,0,0,100,0),
(990470,12,1376.57,-3255.34,161.375,0,0,0,0,100,0),
(990470,13,1372.2,-3242.19,161.244,0,0,0,0,100,0),
(990470,14,1374.13,-3234.52,161.098,0,0,0,0,100,0),
(990470,15,1378.75,-3225.88,160.958,0,0,0,0,100,0),
(990470,16,1385.11,-3220.81,160.757,0,0,0,0,100,0),
(990470,17,1394.13,-3217.73,161.115,0,0,0,0,100,0),
(990470,18,1403.86,-3222.57,161.44,0,0,0,0,100,0),
(990470,19,1414.67,-3236.51,162.323,0,0,0,0,100,0),
(990470,20,1414.77,-3252.42,163.273,0,0,0,0,100,0),
(990470,21,1413.73,-3262.42,164.662,0,0,0,0,100,0),
(990470,22,1413.23,-3265.92,165.412,0,0,0,0,100,0),
(990470,23,1411.23,-3269.42,165.912,0,0,0,0,100,0),
(990470,24,1405.78,-3279.36,166.621,0,0,0,0,100,0),
(990470,25,1404.78,-3288.36,167.121,0,0,0,0,100,0),
(990470,26,1403.41,-3298.71,167.534,0,0,0,0,100,0),
(990470,27,1408.81,-3303.58,167.627,0,0,0,0,100,0),
(990470,28,1410.74,-3309.67,167.986,0,0,0,0,100,0),
(990470,29,1409.18,-3320.22,168.6,0,0,0,0,100,0),
(990470,30,1401.82,-3329.68,169.52,0,0,0,0,100,0),
(990470,31,1394.71,-3333.88,171.898,0,0,0,0,100,0),
(990470,32,1388.46,-3336.38,174.148,0,0,0,0,100,0),
(990470,33,1382.82,-3337.92,174.762,0,0,0,0,100,0),
(990470,34,1364.67,-3338.77,175.134,0,0,0,0,100,0),
(990470,35,1350.59,-3331.22,173.968,0,0,0,0,100,0),
(990470,36,1341.32,-3326.25,174.525,0,0,0,0,100,0),
(990470,37,1330.71,-3317.2,174.408,0,0,0,0,100,0),
(990470,38,1327.48,-3307.69,174.297,0,0,0,0,100,0),
(990470,39,1335.48,-3296.6,174.757,0,0,0,0,100,0),
(990470,40,1345.07,-3297.62,175.08,0,0,0,0,100,0),
(990470,41,1348.57,-3303.37,175.33,0,0,0,0,100,0),
(990470,42,1350.79,-3310.97,176.116,0,0,0,0,100,0),
-- Westguard Worker
(1051630,1,1314.03,-3284.9,177.286,0,0,0,0,100,0),
(1051630,2,1320.64,-3287.88,177.298,0,0,0,0,100,0),
(1051630,3,1323.48,-3286.75,177.294,5.12979,5000,0,0,100,0),
(1051630,4,1322.87,-3284.39,177.294,0,0,0,0,100,0),
(1051630,5,1320.1,-3282.03,177.303,0,0,0,0,100,0),
(1051630,6,1319.96,-3278.6,177.119,0,0,0,0,100,0),
(1051630,7,1326,-3272.98,177.25,0,0,0,0,100,0),
(1051630,8,1328.25,-3273.73,178,0,0,0,0,100,0),
(1051630,9,1331.89,-3274.85,176.472,0,0,0,0,100,0),
(1051630,10,1334.27,-3278.16,175.052,0,0,0,0,100,0),
(1051630,11,1335.35,-3285.6,174.743,0,0,0,0,100,0),
(1051630,12,1332.49,-3294.85,174.58,0,0,0,0,100,0),
(1051630,13,1326.07,-3300.93,174.396,0,0,0,0,100,0),
(1051630,14,1320.8,-3299.68,173.971,1.19337,5000,0,0,100,0),
(1051630,15,1313.78,-3294.92,174.272,0,0,0,0,100,0),
(1051630,16,1306.2,-3291.01,174.135,0,0,0,0,100,0),
(1051630,17,1301.45,-3287.75,174.323,0,0,0,0,100,0),
(1051630,18,1298.33,-3283.44,174.349,0,0,0,0,100,0),
(1051630,19,1298.58,-3278.19,174.349,0,0,0,0,100,0),
(1051630,20,1299.33,-3275.44,178.099,0,0,0,0,100,0),
(1051630,21,1301.3,-3275.39,177.635,0,0,0,0,100,0),
(1051630,22,1301.8,-3272.64,177.635,0,0,0,0,100,0),
(1051630,24,1302.55,-3268.98,177.281,0,0,0,0,100,0),
(1051630,25,1304.05,-3266.8,176.625,5.44905,5000,0,0,100,0),
(1051630,26,1308.03,-3262.96,176.056,0,0,0,0,100,0),
(1051630,27,1314.18,-3259.36,176.238,0,0,0,0,100,0),
(1051630,28,1318.63,-3256.96,176.193,0,0,0,0,100,0),
(1051630,29,1323.13,-3258.46,175.693,0,0,0,0,100,0),
(1051630,30,1327.65,-3259.72,175.631,0,0,0,0,100,0),
(1051630,31,1331.81,-3262.3,175.769,0,0,0,0,100,0),
(1051630,32,1333.77,-3263.52,176.202,4.09734,5000,0,0,100,0),
(1051630,33,1335.77,-3266.77,175.702,0,0,0,0,100,0),
(1051630,34,1337.68,-3270.59,175.114,0,0,0,0,100,0),
(1051630,35,1335.98,-3273.27,175.155,0,0,0,0,100,0),
(1051630,36,1331.09,-3271.94,177.654,0,0,0,0,100,0),
(1051630,37,1329.34,-3271.44,178.154,0,0,0,0,100,0),
(1051630,38,1328.09,-3271.19,178.154,0,0,0,0,100,0),
(1051630,39,1322.76,-3270.06,177.234,0,0,0,0,100,0),
(1051630,40,1315.75,-3279.15,177.068,0,0,0,0,100,0),
(1051630,42,1310.16,-3278.08,177.287,2.47513,5000,0,0,100,0),
(1051630,43,1308.6,-3281.32,177.048,0,0,0,0,100,0),
-- Westguard Lumberjack 1
(984190,1,1450.52,-3394.27,181.044,0,0,0,0,100,0),
(984190,2,1450.52,-3394.27,181.044,0.244346,22000,0,0,100,0),
(984190,3,1450.52,-3394.27,181.044,0,2000,0,0,100,0),
(984190,4,1450.52,-3394.27,181.044,0,0,0,0,100,0),
(984190,5,1452.23,-3407.06,177.21,0,0,0,0,100,0),
(984190,6,1463.77,-3428.01,172.944,0,2000,0,0,100,0),
(984190,7,1452.23,-3407.06,177.21,0,0,0,0,100,0),
-- Westguard Lumberjack 2
(984230,1,1477.68,-3459.51,171.113,0,0,0,0,100,0),
(984230,2,1477.68,-3459.51,171.113,6.16101,27000,0,0,100,0),
(984230,3,1477.68,-3459.51,171.113,0,2000,0,0,100,0),
(984230,4,1477.68,-3459.51,171.113,0,0,0,0,100,0),
(984230,5,1472.19,-3446.48,171.481,0,0,0,0,100,0),
(984230,6,1468.75,-3438.3,172.203,0,2000,0,0,100,0),
(984230,7,1472.19,-3446.48,171.481,0,0,0,0,100,0),
-- Westguard Lumberjack 3
(984140,1,1426.04,-3417.19,180.968,0,0,0,0,100,0),
(984140,2,1426.04,-3417.19,180.968,4.34587,25000,0,0,100,0),
(984140,3,1426.04,-3417.19,180.968,0,2000,0,0,100,0),
(984140,4,1426.04,-3417.19,180.968,0,0,0,0,100,0),
(984140,5,1446.66,-3425.24,175.868,0,0,0,0,100,0),
(984140,6,1462.24,-3431.33,173.437,0,2000,0,0,100,0),
(984140,7,1446.66,-3425.24,175.868,0,0,0,0,100,0),
-- Westguard Lumberjack 4
(984110,1,1482.02,-3407.08,171.082,0,0,0,0,100,0),
(984110,2,1482.02,-3407.08,171.082,0.471239,21000,0,0,100,0),
(984110,3,1482.02,-3407.08,171.082,0,2000,0,0,100,0),
(984110,4,1482.02,-3407.08,171.082,0,0,0,0,100,0),
(984110,5,1476.21,-3416.79,173.134,0,0,0,0,100,0),
(984110,6,1469.14,-3428.61,171.607,0,2000,0,0,100,0),
(984110,7,1476.21,-3416.79,173.134,0,0,0,0,100,0),
-- Westguard Lumberjack 5
(984080,1,1380.09,-3415.5,181.272,0,0,0,0,100,0),
(984080,2,1380.09,-3415.5,181.272,3.82227,29000,0,0,100,0),
(984080,3,1380.09,-3415.5,181.272,0,2000,0,0,100,0),
(984080,4,1380.09,-3415.5,181.272,0,0,0,0,100,0),
(984080,5,1383.85,-3417.74,181.07,0,0,0,0,100,0),
(984080,6,1388.45,-3420.49,180.699,0,2000,0,0,100,0),
(984080,7,1383.85,-3417.74,181.07,0,0,0,0,100,0),
-- Westguard Lumberjack 6
(984180,1,1387.38,-3433.1,179.279,0,0,0,0,100,0),
(984180,2,1387.38,-3433.1,179.279,5.65401,20000,0,0,100,0),
(984180,3,1387.38,-3433.1,179.279,0,2000,0,0,100,0),
(984180,4,1387.38,-3433.1,179.279,0,0,0,0,100,0),
(984180,5,1388.74,-3429.21,180.178,0,0,0,0,100,0),
(984180,6,1389.83,-3426.12,180.545,0,2000,0,0,100,0),
(984180,7,1388.74,-3429.21,180.178,0,0,0,0,100,0),
-- Westguard Lumberjack 7
(984120,1,1331.4,-3401.49,181.816,0,0,0,0,100,0),
(984120,2,1331.4,-3401.49,181.816,1.52115,23000,0,0,100,0),
(984120,3,1331.4,-3401.49,181.816,0,2000,0,0,100,0),
(984120,4,1331.4,-3401.49,181.816,0,0,0,0,100,0),
(984120,5,1323.9,-3407.98,180.792,0,0,0,0,100,0),
(984120,6,1317.02,-3413.94,179.355,0,2000,0,0,100,0),
(984120,7,1323.9,-3407.98,180.792,0,0,0,0,100,0),
-- Westguard Lumberjack 8
(984090,1,1325.48,-3431.05,176.714,0,0,0,0,100,0),
(984090,2,1325.48,-3431.05,176.714,4.93928,26000,0,0,100,0),
(984090,3,1325.48,-3431.05,176.714,0,2000,0,0,100,0),
(984090,4,1325.48,-3431.05,176.714,0,0,0,0,100,0),
(984090,5,1320.58,-3424.95,178.8,0,0,0,0,100,0),
(984090,6,1316.41,-3419.77,178.567,0,2000,0,0,100,0),
(984090,7,1320.58,-3424.95,178.8,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
