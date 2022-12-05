UPDATE `creature` SET `MovementType` = 0 WHERE `guid` = 57793;
DELETE FROM `creature_addon` WHERE `guid` = 57793;
DELETE FROM `waypoint_data` WHERE `id` = 577930;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceGroup` = 1 AND `SourceEntry` = 19656;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 16790;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 19656 AND `id` = 0;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16790;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 181582;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (18158200,18158201,1679000);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(181582,1,0,0,70,0,100,0,2,0,0,0,0,87,18158200,18158201,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaliri Nest - On State Changed - Call Random Timed Action List'),

(18158200,9,0,0,0,0,100,0,0,0,0,0,0,12,17034,1,120000,0,0,0,1,0,0,0,0,0,0,0,0,'Kaliri Nest - On Script - Summon Creature ''Female Kaliri Hatchling'''),
(18158200,9,1,0,0,0,100,0,3000,3000,0,0,0,233,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaliri Nest - On Script - Despawn GO'),

(18158201,9,0,0,0,0,100,0,0,0,0,0,0,12,17039,1,120000,0,0,0,1,0,0,0,0,0,0,0,0,'Kaliri Nest - On Script - Summon Creature ''Male Kaliri Hatchling'''),
(18158201,9,1,0,0,0,100,0,3000,3000,0,0,0,233,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaliri Nest - On Script - Despawn GO'),

(16790,0,0,0,20,0,100,0,9397,0,0,0,0,80,1679000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falconer Drenna Riverwind - On Quest ''Birds of a Feather'' Rewarded - Call Timed Action List'),

(1679000,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falconer Drenna Riverwind - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(1679000,9,1,0,0,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falconer Drenna Riverwind - On Script - Set Run Off'),
(1679000,9,2,0,0,0,100,0,1000,1000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-597.806,4110.68,90.848,0,'Falconer Drenna Riverwind - On Script - Move To Position'),
(1679000,9,3,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,1.63576,'Falconer Drenna Riverwind - On Script - Set Orientation'),
(1679000,9,4,0,0,0,100,0,1000,1000,0,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falconer Drenna Riverwind - On Script - Play Emote ''ONESHOT_KNEEL'''),
(1679000,9,5,0,0,0,100,0,2000,2000,0,0,0,12,17262,1,20000,0,0,0,8,0,0,0,0,-597.427,4112.11,90.7267,1.83384,'Falconer Drenna Riverwind - On Script - Summon Creature ''Captive Female Kaliri'''),
(1679000,9,6,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Falconer Drenna Riverwind - On Script - Say Line 0'),
(1679000,9,7,0,0,0,100,0,4000,4000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-596.347,4108.47,91.0061,0,'Falconer Drenna Riverwind - On Script - Move To Position'),
(1679000,9,8,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falconer Drenna Riverwind - On Script - Reset Orientation'),
(1679000,9,9,0,0,0,100,0,2000,2000,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falconer Drenna Riverwind - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER''');
