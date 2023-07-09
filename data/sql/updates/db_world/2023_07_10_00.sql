UPDATE `creature_template` SET `faction` = 1794 WHERE `entry` = 20763;
UPDATE `creature_template` SET `faction` = 1823 WHERE `entry` IN (20452,20727);

DELETE FROM `creature_text` WHERE `CreatureId` = 20763 AND `GroupID` > 2;
DELETE FROM `creature_text` WHERE `CreatureId` IN (20452,20854);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(20763,3,0,'For the Protectorate! DIE ETHEREUM FILTH!',12,0,100,0,0,0,18561,0,'Captured Protectorate Vanguard'),
(20763,4,0,'Thanks, friend. Will you help me get out of here?',12,0,100,0,0,0,18562,0,'Captured Protectorate Vanguard'),

(20452,0,0,'Bring out the gladiator!',12,0,100,0,0,0,18378,0,'Ethereum Assassin'),

(20854,0,0,'Send it out!',12,0,100,0,0,0,18560,0,'Ethereum Gladiator'),
(20854,1,0,'Is this the best you can throw at me, Salhadaar??',14,0,100,0,0,0,18557,0,'Ethereum Gladiator'),
(20854,1,1,'Time for the pain!',14,0,100,0,0,0,18558,0,'Ethereum Gladiator'),
(20854,1,2,'Another pitiful contender...',14,0,100,0,0,0,18559,0,'Ethereum Gladiator');

UPDATE `creature` SET `spawntimesecs` = -1, `MovementType` = 0 WHERE `guid` IN (86833,86834);
DELETE FROM `creature_addon` WHERE `guid` IN (86833,86834);
DELETE FROM `waypoint_data` WHERE `id` IN (868330,868340);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 20858;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (20858,20763,20854);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2085800,2076300,2076301);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20858,0,0,0,1,0,100,0,0,0,600000,600000,0,80,2085800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arena Event Controller - OOC - Call Timed Action List'),

(2085800,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,19,20452,35,0,0,0,0,0,0,'Arena Event Controller - On Script - Say Line 0 (Ethereum Assassin)'),
(2085800,9,1,0,0,0,100,0,3000,3000,0,0,0,70,0,0,0,0,0,0,11,20854,35,0,0,0,0,0,0,'Arena Event Controller - On Script - Respawn Target (Ethereum Gladiator)'),

(20763,0,0,0,11,0,100,0,0,0,0,0,0,80,2076300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - On Respawn - Call Timed Action List'),
(20763,0,1,2,38,0,100,0,1,1,0,0,0,82,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - On Data Set 1 1 - Reset NPC Flags'),
(20763,0,2,3,61,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - Linked - Say Line 4'),
(20763,0,3,4,61,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - Linked - Set Home Position'),
(20763,0,4,0,61,0,100,0,0,0,0,0,0,67,1,60000,60000,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - Linked - Create Timed Event 1'),
(20763,0,5,0,59,0,100,0,1,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - On Timed Event 1 Triggered - Force Despawn'),
(20763,0,6,7,19,0,100,0,10425,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - On Quest ''Escape from the Staging Grounds'' Accepted - Store Targetlist 1 (Invoker)'),
(20763,0,7,8,61,0,100,0,0,0,0,0,0,2,1807,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - Linked - Set Faction ''Protectorate'''),
(20763,0,8,9,61,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - Linked - Remove Timed Event 1'),
(20763,0,9,10,61,0,100,0,0,0,0,0,0,53,0,20763,0,0,0,2,1,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - Linked - Start WP Movement'),
(20763,0,10,11,61,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - Linked - Say Line 0'),
(20763,0,11,0,61,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - Linked - Remove NPC Flags'),
(20763,0,12,13,40,0,100,0,54,20763,0,0,0,15,10425,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - On WP 54 Reached - Quest Credit ''Escape from the Staging Grounds'''),
(20763,0,13,0,61,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - Linked - Say Line 1'),
(20763,0,14,0,40,0,100,0,57,20763,0,0,0,80,2076301,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - On WP 57 Reached - Call Timed Action List'),
(20763,0,15,16,6,0,100,0,0,0,0,0,0,6,10425,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - On Death - Fail Quest ''Escape from the Staging Grounds'''),
(20763,0,16,0,61,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,19,20854,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - Linked - Force Despawn (Ethereum Gladiator)'),

(2076300,9,0,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - On Script - Remove NPC Flags'),
(2076300,9,1,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - On Script - Set Active On'),
(2076300,9,2,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,19,20854,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - On Script - Start Attack (Ethereum Gladiator)'),
(2076300,9,3,0,0,0,100,0,2000,2000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - On Script - Say Line 3'),

(2076301,9,0,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - On Script - Say Line 2'),
(2076301,9,1,0,0,0,100,0,3000,3000,0,0,0,11,35517,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - On Script - Cast ''Teleport'''),
(2076301,9,2,0,0,0,100,0,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Protectorate Vanguard - On Script - Force Despawn'),

(20854,0,0,1,11,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Gladiator - On Respawn - Set ''UNIT_FLAG_IMMUNE_TO_PC'''),
(20854,0,1,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,4054.66,2320.46,112.497,0,'Ethereum Gladiator - Linked - Move To Point 1'),
(20854,0,2,3,34,0,100,0,8,1,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Gladiator - On Point 1 Reached - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),
(20854,0,3,4,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Gladiator - Linked - Say Line 0'),
(20854,0,4,5,61,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Gladiator - Linked - Set Home Position'),
(20854,0,5,0,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,11,20763,35,0,0,0,0,0,0,'Ethereum Gladiator - Linked - Respawn Target (Captured Protectorate Vanguard)'),
(20854,0,6,0,4,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Gladiator - On Aggro - Say Line 1'),
(20854,0,7,0,0,0,100,0,1700,2500,6700,8500,0,11,15284,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ethereum Gladiator - IC - Cast ''Cleave'''),
(20854,0,8,0,0,0,100,0,7000,9000,9000,11000,0,11,16856,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ethereum Gladiator - IC - Cast ''Mortal Strike'''),
(20854,0,9,0,0,0,100,0,2300,3500,12300,14500,0,11,31553,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ethereum Gladiator - IC - Cast ''Hamstring'''),
(20854,0,10,0,6,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,20763,0,0,0,0,0,0,0,'Ethereum Gladiator - On Death - Set Data 1 1 (Captured Protectorate Vanguard)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 20858 AND `SourceId` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,20858,0,0,29,1,0,60,0,0,0,0,'Creature ''Arena Event Controller'' - Group 0: Execute SAI ID 0 if nearby player');

DELETE FROM `waypoints` WHERE `entry` = 20763;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(20763,1,4069.28,2302.56,111.927,'Captured Protectorate Vanguard - Quest ''Escape from the Staging Grounds'''),
(20763,2,4075.45,2299.5,111.428,NULL),
(20763,3,4082.46,2296.03,110.589,NULL),
(20763,4,4089.11,2295.99,109.531,NULL),
(20763,5,4095.76,2295.96,108.318,NULL),
(20763,6,4103,2295.93,106.919,NULL),
(20763,7,4110,2295.89,106.286,NULL),
(20763,8,4116.53,2295.86,105.446,NULL),
(20763,9,4122.95,2295.83,104.61,NULL),
(20763,10,4129.36,2295.8,103.974,NULL),
(20763,11,4136.25,2295.77,103.193,NULL),
(20763,12,4142.31,2295.74,102.833,NULL),
(20763,13,4148.72,2295.71,102.442,NULL),
(20763,14,4155.93,2297.64,102.255,NULL),
(20763,15,4163.71,2299.73,102.91,NULL),
(20763,16,4169.34,2301.24,104.383,NULL),
(20763,17,4174.97,2302.75,106.366,NULL),
(20763,18,4182.3,2302.17,109.038,NULL),
(20763,19,4188.58,2301.67,111.265,NULL),
(20763,20,4195.1,2301.15,113.811,NULL),
(20763,21,4200.39,2299.33,115.928,NULL),
(20763,22,4206.58,2297.21,118.54,NULL),
(20763,23,4213.18,2296.45,121.165,NULL),
(20763,24,4218.63,2295.82,123.288,NULL),
(20763,25,4224.08,2295.19,125.098,NULL),
(20763,26,4229.42,2294.57,126.94,NULL),
(20763,27,4234.17,2294.03,128.417,NULL),
(20763,28,4238.11,2293.57,129.233,NULL),
(20763,29,4242.41,2293.08,129.6,NULL),
(20763,30,4247.05,2292.67,129.367,NULL),
(20763,31,4251.58,2292.27,128.73,NULL),
(20763,32,4256.69,2291.83,127.611,NULL),
(20763,33,4261.11,2291.44,126.764,NULL),
(20763,34,4265.52,2291.05,126.076,NULL),
(20763,35,4266.19,2286.2,126.376,NULL),
(20763,36,4266.82,2281.57,127.306,NULL),
(20763,37,4267.41,2277.3,127.905,NULL),
(20763,38,4268.08,2272.45,127.657,NULL),
(20763,39,4268.7,2267.95,127.385,NULL),
(20763,40,4269.32,2263.44,127.785,NULL),
(20763,41,4266.36,2256.97,129.215,NULL),
(20763,42,4263.99,2251.78,130.702,NULL),
(20763,43,4261.56,2246.48,132.187,NULL),
(20763,44,4259.09,2241.07,133.647,NULL),
(20763,45,4256.86,2236.19,134.898,NULL),
(20763,46,4254.62,2231.31,135.431,NULL),
(20763,47,4252.05,2225.69,136.54,NULL),
(20763,48,4252.13,2218.22,137.132,NULL),
(20763,49,4252.18,2213.32,137.564,NULL),
(20763,50,4252.23,2208.07,137.527,NULL),
(20763,51,4252.28,2202.58,137.202,NULL),
(20763,52,4252.34,2197.33,136.761,NULL),
(20763,53,4252.4,2191.38,136.818,NULL),
(20763,54,4252.46,2185.55,137.07,NULL),
(20763,55,4252.52,2179.36,137.305,NULL),
(20763,56,4252.56,2175.32,137.985,NULL),
(20763,57,4252.6,2170.89,137.678,NULL);
