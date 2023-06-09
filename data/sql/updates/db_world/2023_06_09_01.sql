UPDATE `creature` SET `position_x` = -345.417, `position_y` = 5537.75, `position_z` = 23.0764 WHERE `guid` = 64676;

DELETE FROM `creature_text` WHERE `CreatureId` IN (17900,17901);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(17900,0,0,'We''d do well not to be reckless.  There''s still much to learn about this land and about the enemy.',12,0,100,0,0,0,14568,0,'Ashyen'),
(17900,1,0,'We will act when we know what we need, old friend.  The druids have proven wise and capable of making their own decisions.',12,0,100,0,0,0,14569,0,'Ashyen'),

(17901,0,0,'The wind speaks of our enemies'' movements, Ashyen.  The naga will attack again.',12,0,100,0,0,0,14565,0,'Keleth'),
(17901,1,0,'Prudence should not mean granting our enemy unnecessary advantages.',12,0,100,0,0,0,14566,0,'Keleth'),
(17901,2,0,'Very well.  When that decision is made, I will be ready.  Let us hope it won''t be too late.',12,0,100,0,0,0,14567,0,'Keleth');

DELETE FROM `gossip_menu_option` WHERE `MenuID` IN (7559,7560);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(7559,0,0,'Grant me your mark, wise ancient.',14739,1,1,0,0,0,0,'',0,0),
(7560,0,0,'Grant me your mark, mighty ancient.',14741,1,1,0,0,0,0,'',0,0);

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` IN (17900,17901);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (17900,17901);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1790100;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17900,0,0,5,62,0,100,0,7559,0,0,0,0,11,31808,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ashyen - On Gossip Option 0 Selected - Cast ''Mark of Lore'' (Friendly) (CONDITION_REPUTATION_RANK)'),
(17900,0,1,5,62,0,100,0,7559,0,0,0,0,11,31810,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ashyen - On Gossip Option 0 Selected - Cast ''Mark of Lore'' (Honored) (CONDITION_REPUTATION_RANK)'),
(17900,0,2,5,62,0,100,0,7559,0,0,0,0,11,31811,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ashyen - On Gossip Option 0 Selected - Cast ''Mark of Lore'' (Revered) (CONDITION_REPUTATION_RANK)'),
(17900,0,3,5,62,0,100,0,7559,0,0,0,0,11,31815,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ashyen - On Gossip Option 0 Selected - Cast ''Mark of Lore'' (Exalted) (CONDITION_REPUTATION_RANK)'),
(17900,0,4,5,62,0,100,0,7559,0,0,0,0,33,17900,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ashyen - On Gossip Option 0 Selected - Quest Credit ''Blessings of the Ancients'''),
(17900,0,5,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ashyen - Linked - Close Gossip'),
(17900,0,6,0,38,0,100,0,1,1,0,0,0,66,0,0,0,0,0,0,19,17901,0,0,0,0,0,0,0,'Ashyen - On Data Set 1 1 - Set Orientation (Keleth)'),
(17900,0,7,0,38,0,100,0,2,2,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ashyen - On Data Set 2 2 - Reset Orientation'),

(17901,0,0,5,62,0,100,0,7560,0,0,0,0,11,31807,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Keleth - On Gossip Option 0 Selected - Cast ''Mark of War'' (Friendly) (CONDITION_REPUTATION_RANK)'),
(17901,0,1,5,62,0,100,0,7560,0,0,0,0,11,31814,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Keleth - On Gossip Option 0 Selected - Cast ''Mark of War'' (Honored) (CONDITION_REPUTATION_RANK)'),
(17901,0,2,5,62,0,100,0,7560,0,0,0,0,11,31813,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Keleth - On Gossip Option 0 Selected - Cast ''Mark of War'' (Revered) (CONDITION_REPUTATION_RANK)'),
(17901,0,3,5,62,0,100,0,7560,0,0,0,0,11,31812,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Keleth - On Gossip Option 0 Selected - Cast ''Mark of War'' (Exalted) (CONDITION_REPUTATION_RANK)'),
(17901,0,4,5,62,0,100,0,7560,0,0,0,0,33,17901,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Keleth - On Gossip Option 0 Selected - Quest Credit ''Blessings of the Ancients'''),
(17901,0,5,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Keleth - Linked - Close Gossip'),
(17901,0,6,0,34,0,100,0,2,38,0,0,0,80,1790100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Keleth - On WP 39 Reached - Call Timed Action List'),

(1790100,9,0,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Keleth - On Script - Say Line 0'),
(1790100,9,1,0,0,0,100,0,4000,4000,0,0,0,45,1,1,0,0,0,0,19,17900,0,0,0,0,0,0,0,'Keleth - On Script - Set Data 1 1 (Ashyen)'),
(1790100,9,2,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,19,17900,0,0,0,0,0,0,0,'Keleth - On Script - Say Line 0 (Ashyen)'),
(1790100,9,3,0,0,0,100,0,6000,6000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Keleth - On Script - Say Line 1'),
(1790100,9,4,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,19,17900,0,0,0,0,0,0,0,'Keleth - On Script - Say Line 1 (Ashyen)'),
(1790100,9,5,0,0,0,100,0,8000,8000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Keleth - On Script - Say Line 2'),
(1790100,9,6,0,0,0,100,0,6000,6000,0,0,0,239,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Keleth - On Script - Resume WP Path'),
(1790100,9,7,0,0,0,100,0,2000,2000,0,0,0,45,2,2,0,0,0,0,19,17900,0,0,0,0,0,0,0,'Keleth - On Script - Set Data 2 2 (Ashyen)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (17900,17901);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (7559,7560);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,17900,0,0,5,0,942,16,0,0,0,0,'Creature ''Ashyen'' - Group 0: Execute SAI ID 0 if friendly with Cenarion Expedition'),
(22,2,17900,0,0,5,0,942,32,0,0,0,0,'Creature ''Ashyen'' - Group 0: Execute SAI ID 1 if honored with Cenarion Expedition'),
(22,3,17900,0,0,5,0,942,64,0,0,0,0,'Creature ''Ashyen'' - Group 0: Execute SAI ID 2 if revered with Cenarion Expedition'),
(22,4,17900,0,0,5,0,942,128,0,0,0,0,'Creature ''Ashyen'' - Group 0: Execute SAI ID 3 if exalted with Cenarion Expedition'),
(15,7559,0,0,0,5,0,942,240,0,0,0,0,'Creature ''Ashyen'' - Group 0: Show gossip option 0 if at least friendly with Cenarion Expedition'),

(22,1,17901,0,0,5,0,942,16,0,0,0,0,'Creature ''Keleth'' - Group 0: Execute SAI ID 0 if friendly with Cenarion Expedition'),
(22,2,17901,0,0,5,0,942,32,0,0,0,0,'Creature ''Keleth'' - Group 0: Execute SAI ID 1 if honored with Cenarion Expedition'),
(22,3,17901,0,0,5,0,942,64,0,0,0,0,'Creature ''Keleth'' - Group 0: Execute SAI ID 2 if revered with Cenarion Expedition'),
(22,4,17901,0,0,5,0,942,128,0,0,0,0,'Creature ''Keleth'' - Group 0: Execute SAI ID 3 if exalted with Cenarion Expedition'),
(15,7560,0,0,0,5,0,942,240,0,0,0,0,'Creature ''Keleth'' - Group 0: Show gossip option 0 if at least Friendly with Cenarion Expedition');

DELETE FROM `waypoint_scripts` WHERE `id` IN (72,73);
DELETE FROM `waypoint_data` WHERE `id` = 636140;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(636140,1,-325.369,5505.15,23.669,3.405,300000,0,0,0,100,0),
(636140,2,-319.603,5505.5,23.3013,NULL,0,0,0,0,100,0),
(636140,3,-315.383,5507.76,22.5541,NULL,0,0,0,0,100,0),
(636140,4,-310.342,5510.46,21.6107,NULL,0,0,0,0,100,0),
(636140,5,-303.037,5514.38,21.5151,NULL,0,0,0,0,100,0),
(636140,6,-292.751,5519.89,21.6617,NULL,0,0,0,0,100,0),
(636140,7,-285.962,5523.53,21.8301,NULL,0,0,0,0,100,0),
(636140,8,-280.704,5528.99,22.0621,NULL,0,0,0,0,100,0),
(636140,9,-275.208,5534.71,22.5672,NULL,0,0,0,0,100,0),
(636140,10,-269.06,5541.1,23.369,NULL,0,0,0,0,100,0),
(636140,11,-263.572,5546.81,23.5209,NULL,0,0,0,0,100,0),
(636140,12,-254.661,5546.4,23.7288,NULL,0,0,0,0,100,0),
(636140,13,-244.871,5545.95,23.7554,NULL,0,0,0,0,100,0),
(636140,14,-236.48,5545.57,23.7197,NULL,0,0,0,0,100,0),
(636140,15,-227.89,5545.18,24.4625,NULL,0,0,0,0,100,0),
(636140,16,-223.935,5543.76,25.1325,NULL,0,0,0,0,100,0),
(636140,17,-219.123,5542.04,25.3663,NULL,0,0,0,0,100,0),
(636140,18,-215.175,5540.63,24.7711,NULL,0,0,0,0,100,0),
(636140,19,-209.58,5538.63,23.1734,NULL,0,0,0,0,100,0),
(636140,20,-209.947,5533.4,22.6739,NULL,0,0,0,0,100,0),
(636140,21,-210.364,5527.47,22.3845,NULL,0,0,0,0,100,0),
(636140,22,-210.809,5521.14,22.0375,NULL,0,0,0,0,100,0),
(636140,23,-211.338,5513.62,21.634,NULL,0,0,0,0,100,0),
(636140,24,-211.919,5505.36,21.5218,NULL,0,0,0,0,100,0),
(636140,25,-212.426,5498.14,21.5635,NULL,0,0,0,0,100,0),
(636140,26,-212.931,5490.96,21.7193,NULL,0,0,0,0,100,0),
(636140,27,-219.02,5484.35,22.1507,NULL,0,0,0,0,100,0),
(636140,28,-225.484,5477.33,21.69,NULL,0,0,0,0,100,0),
(636140,29,-225.778,5470.44,21.8787,NULL,0,0,0,0,100,0),
(636140,30,-226.077,5463.45,21.8759,NULL,0,0,0,0,100,0),
(636140,31,-226.386,5456.22,21.8096,NULL,0,0,0,0,100,0),
(636140,32,-226.734,5448.07,21.744,NULL,0,0,0,0,100,0),
(636140,33,-227.008,5441.67,21.4672,NULL,0,0,0,0,100,0),
(636140,34,-227.361,5433.4,21.6412,NULL,0,0,0,0,100,0),
(636140,35,-227.7,5425.46,22.0383,NULL,0,0,0,0,100,0),
(636140,36,-228.028,5417.77,22.1056,NULL,0,0,0,0,100,0),
(636140,37,-228.317,5411.01,22.2099,NULL,0,0,0,0,100,0),
(636140,38,-223.613,5408.2,22.2772,NULL,0,0,0,0,100,0),
(636140,39,-218.911,5405.38,22.6794,5.76538,3600000,0,0,0,100,0),
(636140,40,-223.613,5408.2,22.2772,NULL,0,0,0,0,100,0),
(636140,41,-228.317,5411.01,22.2099,NULL,0,0,0,0,100,0),
(636140,42,-228.028,5417.77,22.1056,NULL,0,0,0,0,100,0),
(636140,43,-227.7,5425.46,22.0383,NULL,0,0,0,0,100,0),
(636140,44,-227.361,5433.4,21.6412,NULL,0,0,0,0,100,0),
(636140,45,-227.008,5441.67,21.4672,NULL,0,0,0,0,100,0),
(636140,46,-226.734,5448.07,21.744,NULL,0,0,0,0,100,0),
(636140,47,-226.386,5456.22,21.8096,NULL,0,0,0,0,100,0),
(636140,48,-226.077,5463.45,21.8759,NULL,0,0,0,0,100,0),
(636140,49,-225.778,5470.44,21.8787,NULL,0,0,0,0,100,0),
(636140,50,-225.484,5477.33,21.69,NULL,0,0,0,0,100,0),
(636140,51,-219.02,5484.35,22.1507,NULL,0,0,0,0,100,0),
(636140,52,-212.931,5490.96,21.7193,NULL,0,0,0,0,100,0),
(636140,53,-212.426,5498.14,21.5635,NULL,0,0,0,0,100,0),
(636140,54,-211.919,5505.36,21.5218,NULL,0,0,0,0,100,0),
(636140,55,-211.338,5513.62,21.634,NULL,0,0,0,0,100,0),
(636140,56,-210.809,5521.14,22.0375,NULL,0,0,0,0,100,0),
(636140,57,-210.364,5527.47,22.3845,NULL,0,0,0,0,100,0),
(636140,58,-209.947,5533.4,22.6739,NULL,0,0,0,0,100,0),
(636140,59,-209.58,5538.63,23.1734,NULL,0,0,0,0,100,0),
(636140,60,-215.175,5540.63,24.7711,NULL,0,0,0,0,100,0),
(636140,61,-219.123,5542.04,25.3663,NULL,0,0,0,0,100,0),
(636140,62,-223.935,5543.76,25.1325,NULL,0,0,0,0,100,0),
(636140,63,-227.89,5545.18,24.4625,NULL,0,0,0,0,100,0),
(636140,64,-236.48,5545.57,23.7197,NULL,0,0,0,0,100,0),
(636140,65,-244.871,5545.95,23.7554,NULL,0,0,0,0,100,0),
(636140,66,-254.661,5546.4,23.7288,NULL,0,0,0,0,100,0),
(636140,67,-263.572,5546.81,23.5209,NULL,0,0,0,0,100,0),
(636140,68,-269.06,5541.1,23.369,NULL,0,0,0,0,100,0),
(636140,69,-275.208,5534.71,22.5672,NULL,0,0,0,0,100,0),
(636140,70,-280.704,5528.99,22.0621,NULL,0,0,0,0,100,0),
(636140,71,-285.962,5523.53,21.8301,NULL,0,0,0,0,100,0),
(636140,72,-292.751,5519.89,21.6617,NULL,0,0,0,0,100,0),
(636140,73,-303.037,5514.38,21.5151,NULL,0,0,0,0,100,0),
(636140,74,-310.342,5510.46,21.6107,NULL,0,0,0,0,100,0),
(636140,75,-315.383,5507.76,22.5541,NULL,0,0,0,0,100,0),
(636140,76,-319.603,5505.5,23.3013,NULL,0,0,0,0,100,0);
