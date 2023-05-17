UPDATE `creature` SET `position_x` = -829.328, `position_y` = 5338.86, `position_z` = 17.6463 WHERE `guid` = 63945;
UPDATE `creature_template_addon` SET `bytes1` = 0 WHERE `entry` = 17969;

DELETE FROM `creature_text` WHERE `CreatureId` IN (17969,18042);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(17969,0,0,'Is the way clear?  Let''s get out while we can, $n.',12,0,100,0,0,0,14724,0,'Kayra Longmane'),
(17969,1,0,'Looks like we won''t get away so easily.  Get ready!',12,0,100,0,0,0,14725,0,'Kayra Longmane'),
(17969,2,0,'Let''s keep moving.  We''re not safe here!',12,0,100,0,0,0,14726,0,'Kayra Longmane'),
(17969,3,0,'Look out, $n!  Enemies ahead!',12,0,100,0,0,0,14727,0,'Kayra Longmane'),
(17969,4,0,'We''re almost to the refuge!  Let''s go.',12,0,100,0,0,0,14728,0,'Kayra Longmane'),
(17969,5,0,'I can see my fellow druids from here.  Thank you, $n.  I''m sure Ysiel will reward you for your actions!',12,0,100,0,0,0,14729,0,'Kayra Longmane'),

(18042,0,0,'You won''t escape us, druid!',12,0,100,0,0,0,14731,0,'Umbrafen Slavebinder');

DELETE FROM `creature_summon_groups` WHERE `summonerType` = 0 AND `summonerId` = 17969;
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`)
VALUES
(17969,0,0,18042,-916.486,5355.63,18.1698,4.20971,1,60000),
(17969,0,0,18042,-918.929,5358.43,17.9758,4.32321,1,60000),
(17969,0,1,18042,-659.044,5395.29,21.854,3.70164,1,60000),
(17969,0,1,18042,-655.485,5393.69,21.8859,3.58755,1,60000);

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` IN (17969,18042);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (17969,18042);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1796900,1796901,1796902,1796903,1796904,1796905,1804200);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17969,0,0,0,11,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On Respawn - Set ''UNIT_STAND_STATE_KNEEL'''),
(17969,0,1,0,0,0,100,0,8000,16000,8000,16000,0,11,31401,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kayra Longmane - IC - Cast ''Moonfire'''),
(17969,0,2,0,74,1,100,0,0,50,8000,16000,25,11,23381,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Kayra Longmane - On Friendly Between 0-50% Health - Cast ''Healing Touch'' (Phase 1)'),
(17969,0,3,4,19,0,100,0,9752,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On Quest ''Escape from Umbrafen'' Taken - Set Event Phase 1'),
(17969,0,4,0,61,0,100,0,0,0,0,0,0,80,1796900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kayra Longmane - Linked - Call Timed Action List'),
(17969,0,5,0,58,0,100,0,0,1796900,0,0,0,80,1796901,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On WP Path Ended - Call Timed Action List'),
(17969,0,6,0,40,0,100,0,4,1796901,0,0,0,80,1796902,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On WP 4 Reached - Call Timed Action List'),
(17969,0,7,0,58,0,100,0,0,1796901,0,0,0,80,1796903,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On WP Path Ended - Call Timed Action List'),
(17969,0,8,0,40,0,100,0,5,1796902,0,0,0,80,1796904,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On WP 5 Reached - Call Timed Action List'),
(17969,0,9,0,58,0,100,0,0,1796902,0,0,0,80,1796905,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On WP Path Ended - Call Timed Action List'),
(17969,0,10,0,6,0,100,0,0,0,0,0,0,6,9752,0,0,0,0,0,16,0,0,0,0,0,0,0,0,'Kayra Longmane - On Death - Fail Quest ''Escape from Umbrafen'''),
(17969,0,11,0,17,0,100,0,18042,5000,5000,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Umbrafen Slavebinder - On Summoned Unit ''Umbrafen Slavebinder'' - Say Line 0 (Invoker)'),

(1796900,9,1,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Set Active On'),
(1796900,9,2,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Store Targetlist 1 (Invoker)'),
(1796900,9,3,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Say Line 0'),
(1796900,9,4,0,0,0,100,0,0,0,0,0,0,2,495,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Set Faction ''Escortee'''),
(1796900,9,5,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(1796900,9,6,0,0,0,100,0,3000,3000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(1796900,9,7,0,0,0,100,0,0,0,0,0,0,53,0,1796900,0,0,0,2,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Start WP Movement'),

(1796901,9,0,0,0,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Say Line 1'),
(1796901,9,1,0,0,0,100,0,2000,2000,0,0,0,107,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Summon Group 0'),
(1796901,9,2,0,0,0,100,0,10000,10000,0,0,0,53,0,1796901,0,0,0,2,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Start WP Movement'),

(1796902,9,0,0,0,0,100,0,0,0,0,0,0,54,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Pause WP Movement'),
(1796902,9,1,0,0,0,100,0,4000,4000,0,0,0,1,2,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Say Line 2'),
(1796902,9,2,0,0,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Set Run On'),

(1796903,9,0,0,0,0,100,0,3000,3000,0,0,0,1,3,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Say Line 3'),
(1796903,9,1,0,0,0,100,0,2000,2000,0,0,0,107,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Summon Group 1'),
(1796903,9,2,0,0,0,100,0,10000,10000,0,0,0,53,1,1796902,0,0,0,2,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Start WP Movement'),

(1796904,9,0,0,0,0,100,0,0,0,0,0,0,54,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Pause WP Movement'),
(1796904,9,1,0,0,0,100,0,1000,1000,0,0,0,1,4,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Say Line 4'),

(1796905,9,0,0,0,0,100,0,0,0,0,0,0,1,5,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Say Line 5'),
(1796905,9,1,0,0,0,100,0,0,0,0,0,0,26,9752,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Quest Credit ''Escape from Umbrafen'''),
(1796905,9,2,0,0,0,100,0,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Force Despawn'),
(1796905,9,3,0,0,0,100,0,6000,6000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-412.954,5482.02,21.3342,0,'Kayra Longmane - On Script - Move To Point 0'),

(18042,0,0,0,54,0,100,0,0,0,0,0,0,80,1804200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Umbrafen Slavebinder - On Just Summoned - Call Timed Action List'),

(1804200,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kayra Longmane - On Script - Set Active On'),
(1804200,9,1,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Umbrafen Slavebinder - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1804200,9,2,0,0,0,100,0,2000,2000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Umbrafen Slavebinder - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1804200,9,3,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,19,17969,0,0,0,0,0,0,0,'Umbrafen Slavebinder - On Script - Start Attack (Kayra Longmane)');

DELETE FROM `script_waypoint` WHERE `entry` = 17969;
DELETE FROM `waypoints` WHERE `entry` IN (1796900,1796901,1796902);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(1796900,1,-930.049,5288.08,23.8484,'Kayra Longmane - Quest ''Escape from Umbrafen'' - Part 1'),
(1796900,2,-927.671,5292.6,19.9164,NULL),
(1796900,3,-924.297,5299.02,17.7109,NULL),
(1796900,4,-926.419,5308.35,17.5579,NULL),
(1796900,5,-928.39,5317.02,18.2091,NULL),
(1796900,6,-929.464,5323.23,18.5304,NULL),
(1796900,7,-930.621,5329.92,18.7732,NULL),

(1796901,1,-930.785,5335.17,19.1112,'Kayra Longmane - Quest ''Escape from Umbrafen'' - Part 2'),
(1796901,2,-930.954,5340.54,18.2048,NULL),
(1796901,3,-931.246,5349.87,17.8598,NULL),
(1796901,4,-931.49,5357.65,18.0272,NULL),
(1796901,5,-933.636,5365.28,20.4453,NULL),
(1796901,6,-934.778,5369.34,22.278,NULL),
(1796901,7,-935.626,5373.45,22.8854,NULL),
(1796901,8,-936.59,5378.14,22.5167,NULL),
(1796901,9,-937.273,5381.45,22.5676,NULL),
(1796901,10,-938.215,5386.02,23.2554,NULL),
(1796901,11,-939.038,5390.02,23.6196,NULL),
(1796901,12,-940.12,5395.27,23.4293,NULL),
(1796901,13,-941.948,5404.14,22.6697,NULL),
(1796901,14,-936.753,5409.82,22.8857,NULL),
(1796901,15,-931.244,5415.85,23.064,NULL),
(1796901,16,-920.963,5417.39,23.239,NULL),
(1796901,17,-911.043,5418.89,23.5757,NULL),
(1796901,18,-901.498,5420.32,24.2144,NULL),
(1796901,19,-892.568,5419.3,24.205,NULL),
(1796901,20,-883.645,5418.28,24.0451,NULL),
(1796901,21,-874.026,5417.19,23.9442,NULL),
(1796901,22,-866.376,5416.31,23.8032,NULL),
(1796901,23,-860.312,5415.62,23.6709,NULL),
(1796901,24,-853.133,5413.56,23.5667,NULL),
(1796901,25,-845.059,5411.24,23.4257,NULL),
(1796901,26,-836.986,5408.92,23.3443,NULL),
(1796901,27,-827.903,5406.31,23.3033,NULL),
(1796901,28,-818.369,5403.58,23.1696,NULL),
(1796901,29,-809.515,5401.03,23.1196,NULL),
(1796901,30,-801.212,5398.65,23.0409,NULL),
(1796901,31,-793.926,5396.56,23.0196,NULL),
(1796901,32,-785.401,5394.11,23.0461,NULL),
(1796901,33,-777.989,5391.98,23.0018,NULL),
(1796901,34,-771.268,5390.47,22.977,NULL),
(1796901,35,-764.779,5389.02,22.9928,NULL),
(1796901,36,-757.367,5387.36,22.8827,NULL),
(1796901,37,-750.362,5385.79,22.7658,NULL),
(1796901,38,-741.054,5384.16,22.6465,NULL),
(1796901,39,-731.339,5382.45,22.5171,NULL),
(1796901,40,-723.76,5382.29,22.4994,NULL),
(1796901,41,-717.23,5382.15,22.4216,NULL),
(1796901,42,-709.994,5381.99,22.3338,NULL),
(1796901,43,-702.646,5381.84,22.2952,NULL),
(1796901,44,-695.766,5381.69,22.2251,NULL),
(1796901,45,-688.187,5381.53,22.1615,NULL),
(1796901,46,-681.236,5381.38,22.0502,NULL),

(1796902,1,-674.951,5381.81,22.2156,'Kayra Longmane - Quest ''Escape from Umbrafen'' - Part 3'),
(1796902,2,-666.102,5382.41,22.2413,NULL),
(1796902,3,-657.38,5383.01,21.9875,NULL),
(1796902,4,-646.219,5383.77,22.1758,NULL),
(1796902,5,-637.944,5384.34,22.2059,NULL),
(1796902,6,-632.587,5388.85,22.193,NULL),
(1796902,7,-626.335,5394.1,21.9342,NULL),
(1796902,8,-617.849,5401.24,21.8269,NULL),
(1796902,9,-608.954,5408.72,21.6304,NULL),
(1796902,10,-603.634,5411.12,21.5226,NULL),
(1796902,11,-597.605,5413.85,21.4164,NULL),
(1796902,12,-588.492,5416.24,21.3942,NULL),
(1796902,13,-579.635,5418.57,21.2839,NULL),
(1796902,14,-570.138,5421.07,21.1833,NULL),
(1796902,15,-562.032,5422.76,21.311,NULL),
(1796902,16,-553.1,5424.62,21.1929,NULL),
(1796902,17,-546.83,5428.89,21.085,NULL),
(1796902,18,-540.566,5433.16,20.9948,NULL),
(1796902,19,-532.272,5438.82,20.9436,NULL),
(1796902,20,-524.745,5443.95,20.977,NULL),
(1796902,21,-518.014,5444.67,21.306,NULL),
(1796902,22,-510.122,5445.52,21.6851,NULL),
(1796902,23,-502.534,5446.33,22.1506,NULL),
(1796902,24,-495.1,5447.12,22.1792,NULL),
(1796902,25,-487.792,5447.91,22.3984,NULL),
(1796902,26,-479.788,5448.77,22.535,NULL),
(1796902,27,-472.464,5449.55,22.563,NULL),
(1796902,28,-467.288,5452.94,22.6502,NULL),
(1796902,29,-460.748,5457.23,22.6652,NULL),
(1796902,30,-454.533,5461.3,22.6028,NULL);
