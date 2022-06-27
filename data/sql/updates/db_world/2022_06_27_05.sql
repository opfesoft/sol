-- Defeated Argent Footman: Add UNIT_FLAG_IMMUNE_TO_NPC
UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 512 WHERE `entry` = 28156;

-- Hath'ar Broodmaster: Fix position/movement
UPDATE `creature` SET `position_x` = 5364.31, `position_y` = -3407.42, `position_z` = 299.549 WHERE `guid` = 120209;
UPDATE `creature` SET `position_x` = 5316.92, `position_y` = -3402.62, `position_z` = 297.485, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 120231;

-- Nerubian Cocoon: Add UNIT_FLAG2_DISABLE_TURN, CREATURE_FLAG_EXTRA_NO_DODGE; decrease respawn time; add new spawns
UPDATE `creature_template` SET `unit_flags2` = `unit_flags2` | 32768, `flags_extra` = `flags_extra` | 8388608 WHERE `entry` = 28413;
UPDATE `creature` SET `spawntimesecs` = 60 WHERE `id` = 28413;
DELETE FROM `creature` WHERE `guid` IN (3008964,3008965,3008966,3008967,3008968,3008969,3008970);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3008964,28413,571,0,0,1,1,0,0,5337.62,-3401.26,298.023,0.401426,60,0,1064,0,0,0,0,0,0),
(3008965,28413,571,0,0,1,1,0,0,5295.35,-3393.23,297.568,0.837758,60,0,1064,0,0,0,0,0,0),
(3008966,28413,571,0,0,1,1,0,0,5311.24,-3330.42,295.568,2.23402,60,0,1064,0,0,0,0,0,0),
(3008967,28413,571,0,0,1,1,0,0,5337.05,-3374.5,297.568,2.58309,60,0,1064,0,0,0,0,0,0),
(3008968,28413,571,0,0,1,1,0,0,5349.25,-3429.61,298.118,3.64774,60,0,1064,0,0,0,0,0,0),
(3008969,28413,571,0,0,1,1,0,0,5377.55,-3405.38,299.635,3.89208,60,0,1064,0,0,0,0,0,0),
(3008970,28413,571,0,0,1,1,0,0,5401.85,-3248.23,292.998,1.09956,60,0,1064,0,0,0,0,0,0);

DELETE FROM `creature_text` WHERE `CreatureId` = 28415;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(28415,0,0,'ugh...',12,0,100,0,0,0,27890,0,'Captive Footman'),
(28415,0,1,'Avenge me!',12,0,100,0,0,0,27891,0,'Captive Footman'),
(28415,0,2,'I am... finished.',12,0,100,0,0,0,27892,0,'Captive Footman'),
(28415,0,3,'It''s too late for me.',12,0,100,0,0,0,27894,0,'Captive Footman'),
(28415,1,0,'I''m saved!',12,0,100,71,0,0,27896,0,'Captive Footman'),
(28415,1,1,'I thought I was done for!',12,0,100,71,0,0,27897,0,'Captive Footman'),
(28415,1,2,'Thank you!',12,0,100,71,0,0,27898,0,'Captive Footman'),
(28415,1,3,'I am in your debt, friend.',12,0,100,71,0,0,27899,0,'Captive Footman');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (28413,28415);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2841300,2841301,2841302,2841500,2841501);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(28413,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nerubian Cocoon - On Respawn - Disable Event Phase Reset'),
(28413,0,1,2,61,0,100,0,0,0,0,0,0,30,1,1,2,3,0,0,1,0,0,0,0,0,0,0,0,'Nerubian Cocoon - Linked - Set Random Event Phase'),
(28413,0,2,3,61,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nerubian Cocoon - Linked - Disable Attack'),
(28413,0,3,4,61,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nerubian Cocoon - Linked - Set Root On'),
(28413,0,4,0,61,0,100,0,0,0,0,0,0,116,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nerubian Cocoon - Linked - Set Corpse Delay'),
(28413,0,5,6,6,1,100,0,0,0,0,0,0,12,28415,4,20000,0,0,0,1,0,0,0,0,0,0,0,0,'Nerubian Cocoon - On Death - Summon Creature ''Captive Footman'' (Event Phase 1)'),
(28413,0,6,0,61,0,100,0,0,0,0,0,0,33,28415,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Nerubian Cocoon - Linked - Quest Credit ''Captive Footman'''),
(28413,0,7,0,6,2,100,0,0,0,0,0,0,12,28414,4,20000,0,0,0,1,0,0,0,0,0,0,0,0,'Nerubian Cocoon - On Death - Summon Creature ''Drakkari Captive'' (Event Phase 2)'),

(28415,0,0,0,54,0,100,0,0,0,0,0,0,87,2841500,2841501,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captive Footman - On Just Summoned - Call Random Timed Action List'),

(2841500,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captive Footman - On Script - Say Line 0'),
(2841500,9,1,0,0,0,100,0,0,0,0,0,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captive Footman - On Script - Kill Unit'),

(2841501,9,0,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Captive Footman - On Script - Set Orientation (Closest Player)'),
(2841501,9,1,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captive Footman - On Script - Say Line 1'),
(2841501,9,2,0,0,0,100,0,2000,2000,0,0,0,17,333,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captive Footman - On Script - Set Emote State ''STATE_READY1H''');
