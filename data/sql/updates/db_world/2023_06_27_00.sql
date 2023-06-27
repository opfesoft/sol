UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` IN (17831,17953);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (17831,17953,17955);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1783100,1783101,1783102,1795300);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17831,0,0,1,20,0,100,0,9709,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Quest ''Stealing Back the Mushrooms'' Rewarded - Store Targetlist 1 (Invoker)'),
(17831,0,1,0,61,0,100,0,0,0,0,0,0,80,1783100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Leesa''oh - Linked - Call Timed Action List'),
(17831,0,2,3,40,0,100,0,14,17831,0,0,0,54,50000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Leesa''oh - On WP 14 Reached - Pause WP Movement'),
(17831,0,3,0,61,0,100,0,0,0,0,0,0,80,1783101,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Leesa''oh - Linked - Call Timed Action List'),
(17831,0,4,0,40,0,100,0,27,17831,0,0,0,80,1783102,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Leesa''oh - On WP 27 Reached - Call Timed Action List'),

(1783100,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Set Active On'),
(1783100,9,1,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1783100,9,2,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,19,17953,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Set Active On (Buddy)'),
(1783100,9,3,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Remove NPC Flags'),
(1783100,9,4,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Say Line 1'),
(1783100,9,5,0,0,0,100,0,7000,7000,0,0,0,45,1,1,0,0,0,0,19,17953,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Set Data 1 1 (Buddy)'),
(1783100,9,6,0,0,0,100,0,0,0,0,0,0,53,0,17831,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Start WP Movement'),

(1783101,9,0,0,0,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Say Line 1'),
(1783101,9,1,0,0,0,100,0,2000,2000,0,0,0,11,32618,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Cast ''Cosmetic Nature Cast'''),
(1783101,9,2,0,0,0,100,0,8000,8000,0,0,0,1,2,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Say Line 2'),
(1783101,9,3,0,0,0,100,0,5000,5000,0,0,0,50,182073,21,0,0,0,0,8,0,0,0,0,-293.135,8218.52,22.2616,2.75761,'Watcher Leesa''oh - On Script - Summon GO ''Grown Mushroom'''),
(1783101,9,4,0,0,0,100,0,1000,1000,0,0,0,12,17955,1,30000,0,0,0,8,0,0,0,0,-362.376,8215.58,25.2591,0.379451,'Watcher Leesa''oh - On Script - Summon Creature ''Hungry Boglord'''),
(1783101,9,5,0,0,0,100,0,8000,8000,0,0,0,1,0,0,0,0,0,0,19,17955,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Say Line 0 (Hungry Boglord)'),
(1783101,9,6,0,0,0,100,0,1000,1000,0,0,0,45,2,2,0,0,0,0,19,17953,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Set Data 2 2 (Buddy)'),
(1783101,9,7,0,0,0,100,0,4000,4000,0,0,0,1,3,0,0,1,0,0,12,1,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Say Line 3'),
(1783101,9,8,0,0,0,100,0,9000,9000,0,0,0,1,1,0,0,0,0,0,19,17955,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Say Line 1 (Hungry Boglord)'),
(1783101,9,9,0,0,0,100,0,10000,10000,0,0,0,1,4,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Say Line 4'),

(1783102,9,0,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0.925025,'Watcher Leesa''oh - On Script - Set Orientation'),
(1783102,9,1,0,0,0,100,0,0,0,0,0,0,82,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Reset NPC Flags'),
(1783102,9,2,0,0,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1783102,9,3,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Leesa''oh - On Script - Set Active Off'),

(17953,0,0,0,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Buddy - On Respawn - Disable Event Phase Reset'),
(17953,0,1,2,25,0,100,0,0,0,0,0,0,89,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Buddy - On Reset - Start Random Movement'),
(17953,0,2,3,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Buddy - Linked - Set Event Phase 1'),
(17953,0,3,0,61,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Buddy - Linked - Set Active Off'),
(17953,0,4,0,1,1,100,0,20000,45000,20000,45000,0,80,1795300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Buddy - OOC (Event Phase 1) - Call Timed Action List'),
(17953,0,5,0,4,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Buddy - On Aggro - Set Root Off'),
(17953,0,6,7,38,0,100,0,1,1,0,0,0,29,0,0,0,0,0,0,19,17831,0,0,0,0,0,0,0,'Buddy - On Data Set 1 1 - Start Follow (Watcher Leesa''oh)'),
(17953,0,7,8,61,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Buddy - Linked - Set Event Phase 2'),
(17953,0,8,0,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Buddy - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(17953,0,9,10,38,0,100,0,2,2,0,0,0,29,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Buddy - On Data Set 2 2 - Stop Follow'),
(17953,0,10,11,61,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Buddy - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(17953,0,11,0,61,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Buddy - Linked - Evade'),

(1795300,9,0,0,0,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Buddy - On Script - Set Root On'),
(1795300,9,1,0,0,0,100,0,0,0,0,0,0,5,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Buddy - On Script - Play Emote ''ONESHOT_ATTACKUNARMED'''),
(1795300,9,2,0,0,0,100,0,2000,2000,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Buddy - On Script - Set Root Off'),

(17955,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hungry Boglord - On Just Summoned - Set Active On'),
(17955,0,1,0,61,0,100,0,0,0,0,0,0,53,1,17955,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hungry Boglord - Linked - Start WP Movement'),
(17955,0,2,0,40,0,100,0,11,17955,0,0,0,54,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hungry Boglord - On WP 11 Reached - Pause WP Movement'),
(17955,0,3,0,40,0,100,0,35,17955,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hungry Boglord - On WP 35 Reached - Force Despawn');

DELETE FROM `waypoints` WHERE `entry` IN (17831,17953,17955);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(17831,1,-280.039,8304.79,19.8635,'Watcher Leesa''oh - Quest ''Stealing Back the Mushrooms'''),
(17831,2,-278.778,8298.39,19.8334,NULL),
(17831,3,-277.83,8293.58,19.7434,NULL),
(17831,4,-279.48,8288.97,19.5188,NULL),
(17831,5,-281.247,8284.03,18.2122,NULL),
(17831,6,-283.251,8278.42,17.4363,NULL),
(17831,7,-285.214,8272.93,17.3786,NULL),
(17831,8,-287.375,8266.89,17.4099,NULL),
(17831,9,-289.536,8260.84,17.6448,NULL),
(17831,10,-291.893,8254.25,17.78,NULL),
(17831,11,-292.422,8248.33,17.9392,NULL),
(17831,12,-292.898,8242.99,18.2314,NULL),
(17831,13,-293.346,8237.98,19.169,NULL),
(17831,14,-293.739,8233.57,20.4304,NULL),
(17831,15,-293.346,8237.98,19.169,NULL),
(17831,16,-292.898,8242.99,18.2314,NULL),
(17831,17,-292.422,8248.33,17.9392,NULL),
(17831,18,-291.893,8254.25,17.78,NULL),
(17831,19,-289.536,8260.84,17.6448,NULL),
(17831,20,-287.375,8266.89,17.4099,NULL),
(17831,21,-285.214,8272.93,17.3786,NULL),
(17831,22,-283.251,8278.42,17.4363,NULL),
(17831,23,-281.247,8284.03,18.2122,NULL),
(17831,24,-279.48,8288.97,19.5188,NULL),
(17831,25,-277.83,8293.58,19.7434,NULL),
(17831,26,-278.778,8298.39,19.8334,NULL),
(17831,27,-283.861,8302.74,19.6128,NULL),

(17955,1,-357.332,8216.52,24.766,'Hungry Boglord - Quest ''Stealing Back the Mushrooms'''),
(17955,2,-350.224,8217.85,23.7679,NULL),
(17955,3,-343.403,8219.12,23.6576,NULL),
(17955,4,-338.118,8218.22,23.8555,NULL),
(17955,5,-332.832,8217.31,23.0812,NULL),
(17955,6,-327.775,8216.45,22.3395,NULL),
(17955,7,-323.052,8215.64,22.6559,NULL),
(17955,8,-317.942,8216.1,23.0114,NULL),
(17955,9,-314.317,8216.42,23.2644,NULL),
(17955,10,-308.383,8216.96,22.9442,NULL),
(17955,11,-303.552,8217.39,21.9294,NULL),
(17955,12,-298.632,8218.34,22.2441,NULL),
(17955,13,-293.471,8219.35,22.3635,NULL),
(17955,14,-288.084,8220.39,21.966,NULL),
(17955,15,-282.016,8221.57,21.7854,NULL),
(17955,16,-275.832,8222.77,22.1777,NULL),
(17955,17,-270.546,8223.8,21.4477,NULL),
(17955,18,-265.965,8222.04,20.4643,NULL),
(17955,19,-261.168,8220.2,19.775,NULL),
(17955,20,-257.025,8218.61,20.261,NULL),
(17955,21,-251.712,8216.57,20.2606,NULL),
(17955,22,-248.9,8212.99,20.0848,NULL),
(17955,23,-245.872,8209.14,20.8241,NULL),
(17955,24,-242.485,8204.83,21.3415,NULL),
(17955,25,-239.31,8200.79,21.2526,NULL),
(17955,26,-235.993,8196.57,20.9065,NULL),
(17955,27,-232.55,8192.19,20.4816,NULL),
(17955,28,-231.638,8187.49,20.6713,NULL),
(17955,29,-230.639,8182.34,20.5906,NULL),
(17955,30,-229.549,8176.72,20.3859,NULL),
(17955,31,-228.439,8171,20.4799,NULL),
(17955,32,-227.351,8165.39,20.5881,NULL),
(17955,33,-226.373,8160.35,20.7937,NULL),
(17955,34,-225.062,8153.59,21.3401,NULL),
(17955,35,-223.892,8147.56,20.488,NULL);