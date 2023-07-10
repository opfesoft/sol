UPDATE `creature_template` SET `speed_walk` = 1.125, `speed_run` = 8/7, `faction` = 1807 WHERE `entry` = 20802;

DELETE FROM `creature_text` WHERE `CreatureId` = 20802;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(20802,0,0,'Keep these things off me!',12,0,100,0,0,0,18438,0,'Protectorate Demolitionist'),
(20802,0,1,'I''m under attack! I repeat, I am under attack!',12,0,100,0,0,0,18439,0,'Protectorate Demolitionist'),
(20802,0,2,'I need to find a new line of work.',12,0,100,0,0,0,18440,0,'Protectorate Demolitionist'),
(20802,1,0,'Let''s do this... Just keep me covered and I''ll deliver the package.',12,0,100,1,0,0,18432,0,'Protectorate Demolitionist'),
(20802,2,0,'By the second sun of K''aresh, look at this place! I can only imagine what Salhadaar is planning. Come on, let''s keep going.',12,0,100,1,0,0,18433,0,'Protectorate Demolitionist'),
(20802,3,0,'With this much void waste and run-off, a toxic void horror can''t be too far behind.',12,0,100,0,0,0,18434,0,'Protectorate Demolitionist'),
(20802,4,0,'Look there, fleshling! Salhadaar''s conduits! He''s keeping well fed....',12,0,100,1,0,0,18435,0,'Protectorate Demolitionist'),
(20802,5,0,'Alright, keep me protected while I plant this disruptor. This shouldn''t take very long.',12,0,100,0,0,0,18436,0,'Protectorate Demolitionist'),
(20802,6,0,'Done! Back up! Back up!',12,0,100,0,0,0,18437,0,'Protectorate Demolitionist'),
(20802,7,0,'Looks like my work here is done. Report back to the holo-image of Ameer over at the transponder.',12,0,100,1,0,0,18442,0,'Protectorate Demolitionist');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 20802;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 20474 AND `id` = 0;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2080200,2080201,2080202);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20802,0,0,0,54,0,100,0,0,0,0,0,0,80,2080200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On Just Summoned - Call Timed Action List'),
(20802,0,1,2,4,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On Aggro - Say Line 0'),
(20802,0,2,3,61,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - Linked - Set Home Position'),
(20802,0,3,0,61,0,100,0,0,0,0,0,0,54,2000,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - Linked - Pause WP Movement'),
(20802,0,4,5,40,0,100,0,6,0,0,0,0,54,8000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On WP 6 Reached - Pause WP Movement'),
(20802,0,5,0,61,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - Linked - Say Line 2'),
(20802,0,6,7,40,0,100,0,14,0,0,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On WP 14 Reached - Pause WP Movement'),
(20802,0,7,0,61,0,100,0,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - Linked - Say Line 3'),
(20802,0,8,9,40,0,100,0,28,0,0,0,0,54,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On WP 28 Reached - Pause WP Movement'),
(20802,0,9,0,61,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - Linked - Say Line 4'),
(20802,0,10,11,40,0,100,0,41,0,0,0,0,54,30000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On WP 41 Reached - Pause WP Movement'),
(20802,0,11,0,61,0,100,0,0,0,0,0,0,80,2080201,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - Linked - Call Timed Action List'),
(20802,0,12,13,56,0,100,0,41,0,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On WP Movement Resumed - Say Line 6'),
(20802,0,13,14,61,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - Linked - Set Emote State ''ONESHOT_NONE'''),
(20802,0,14,15,61,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - Linked - Set Run On'),
(20802,0,15,0,61,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - Linked - Set ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(20802,0,16,0,58,0,100,0,0,20802,0,0,0,80,2080202,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On WP Path Ended - Call Timed Action List'),

(2080200,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On Script - Set Active On'),
(2080200,9,1,0,0,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On Script - Set Auto Attack Off'),
(2080200,9,2,0,0,0,100,0,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On Script - Set Combat Movement Off'),
(2080200,9,3,0,0,0,100,0,0,0,0,0,0,11,12980,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On Script - Cast ''Simple Teleport'''),
(2080200,9,4,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On Script - Set Orientation (Summoner)'),
(2080200,9,5,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On Script - Say Line 1'),
(2080200,9,6,0,0,0,100,0,3000,3000,0,0,0,53,0,20802,0,10406,0,1,23,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On Script - Start WP Movement'),

(2080201,9,0,0,0,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On Script - Set React State ''Passive'''),
(2080201,9,1,0,0,0,100,0,0,0,0,0,0,17,469,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On Script - Set Emote State ''STATE_SPELL_CHANNEL_DIRECTED'''),
(2080201,9,2,0,0,0,100,0,0,0,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On Script - Say Line 5'),
(2080201,9,3,0,0,0,100,0,5000,5000,0,0,0,12,20474,4,40000,3,0,0,8,0,0,0,0,3864,2341.1,115.395,5.05922,'Protectorate Demolitionist - On Script - Summon Creature ''Ethereum Nexus-Stalker'''),
(2080201,9,4,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,19,20474,50,0,0,0,0,0,0,'Protectorate Demolitionist - On Script - Say Line 0 (Ethereum Nexus-Stalker)'),
(2080201,9,5,0,0,0,100,0,3000,3000,0,0,0,12,20474,4,40000,3,0,0,8,0,0,0,0,3867,2341.1,115.616,4.97495,'Protectorate Demolitionist - On Script - Summon Creature ''Ethereum Nexus-Stalker'''),
(2080201,9,6,0,0,0,100,0,3000,3000,0,0,0,12,20474,4,40000,3,0,0,8,0,0,0,0,3870,2341.1,116.064,4.88669,'Protectorate Demolitionist - On Script - Summon Creature ''Ethereum Nexus-Stalker'''),

(2080202,9,0,0,0,0,100,0,0,0,0,0,0,66,1,0,0,0,0,0,8,0,0,0,0,0,0,0,4.97604,'Protectorate Demolitionist - On Script - Set Orientation'),
(2080202,9,1,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,11,20755,50,0,0,0,0,0,0,'Protectorate Demolitionist - On Script - Set Data 1 1 (Ethereum Energy Cell)'),
(2080202,9,2,0,0,0,100,0,7000,7000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On Script - Say Line 7'),
(2080202,9,3,0,0,0,100,0,5000,5000,0,0,0,11,12980,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On Script - Cast ''Simple Teleport'''),
(2080202,9,4,0,0,0,100,0,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On Script - Force Despawn'),

(20474,0,0,0,54,0,100,0,0,0,0,0,0,11,36515,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Nexus-Stalker - On Just Summoned - Cast ''Shadowtouched''');

DELETE FROM `waypoints` WHERE `entry` = 20802;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(20802,1,4015.68,2322.49,113.824,'Protectorate Demolitionist - Quest ''Delivering the Message'''),
(20802,2,4011.86,2322.98,113.052,NULL),
(20802,3,4007.58,2323.54,111.426,NULL),
(20802,4,4003.99,2324,111.5,NULL),
(20802,5,3999.59,2324.57,112.943,NULL),
(20802,6,3994.15,2325.28,113.559,NULL),
(20802,7,3988.95,2325.95,113.811,NULL),
(20802,8,3981.07,2326.97,114.081,NULL),
(20802,9,3973,2328.02,114.082,NULL),
(20802,10,3966.59,2328.4,114.033,NULL),
(20802,11,3959.5,2328.81,113.804,NULL),
(20802,12,3953.68,2329.16,113.886,NULL),
(20802,13,3945.75,2329.62,113.589,NULL),
(20802,14,3939.16,2330.01,112.224,NULL),
(20802,15,3932.18,2332.67,110.829,NULL),
(20802,16,3926.41,2334.87,111.676,NULL),
(20802,17,3920.3,2337.2,113.195,NULL),
(20802,18,3915.73,2338.95,113.688,NULL),
(20802,19,3909.96,2341.15,113.942,NULL),
(20802,20,3905.84,2346.07,114.075,NULL),
(20802,21,3901.73,2350.99,114.174,NULL),
(20802,22,3897.69,2355.83,114.299,NULL),
(20802,23,3893.5,2360.84,114.311,NULL),
(20802,24,3889.53,2365.59,114.204,NULL),
(20802,25,3885.56,2370.33,114.131,NULL),
(20802,26,3881.55,2375.13,114.087,NULL),
(20802,27,3877.81,2379.6,113.999,NULL),
(20802,28,3874.4,2383.68,113.784,NULL),
(20802,29,3873.54,2378.95,114.26,NULL),
(20802,30,3872.96,2375.74,114.631,NULL),
(20802,31,3872.05,2370.69,114.467,NULL),
(20802,32,3871.01,2364.95,114.625,NULL),
(20802,33,3870.05,2359.67,115.065,NULL),
(20802,34,3869.22,2355.08,115.894,NULL),
(20802,35,3868.45,2350.79,116.169,NULL),
(20802,36,3867.7,2346.66,116.306,NULL),
(20802,37,3866.8,2341.7,115.65,NULL),
(20802,38,3868.17,2337.24,115.147,NULL),
(20802,39,3869.64,2332.44,114.751,NULL),
(20802,40,3871.45,2326.55,114.868,NULL),
(20802,41,3872.97,2321.61,114.52,NULL),
(20802,42,3871.45,2326.55,114.868,NULL),
(20802,43,3869.64,2332.44,114.751,NULL),
(20802,44,3868.17,2337.24,115.147,NULL),
(20802,45,3866.8,2341.7,115.65,NULL);
