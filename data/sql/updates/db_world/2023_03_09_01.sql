DELETE FROM `gameobject_addon` WHERE `guid` = 25598;
INSERT INTO `gameobject_addon` (`guid`, `invisibilityType`, `invisibilityValue`, `useRotation`)
VALUES
(25598,0,0,1);

UPDATE `creature` SET `position_x` = -4543.69, `position_y` = 1022.35, `position_z` = 9.97904, `orientation` = 3.87463 WHERE `guid` = 86139;
UPDATE `creature_template_addon` SET `auras` = NULL WHERE `entry` = 21877;
UPDATE `creature_text` SET `Type` = 12 WHERE `CreatureID` = 21797 AND `GroupID` = 0;
UPDATE `creature_template` SET `modelid2` = 0 WHERE `entry` = 21871;
UPDATE `creature_equip_template` SET `ItemID1` = 13722 WHERE `CreatureID` = 21867;

DELETE FROM `creature_text` WHERE `CreatureId` = 21877 AND `GroupID` = 2;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(21877,2,0,'Let this be a lesson to those that would do evil to our lands!',14,0,100,0,0,0,19505,0,'Karsius the Ancient Watcher when Teron Dies');

UPDATE `event_scripts` SET `datalong2` = 300000, `dataint` = -3 WHERE `id` = 14092;
UPDATE `spell_dbc` SET `AttributesEx4` = `AttributesEx4` | 4 WHERE `Id` = 37782;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 21872;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (21797,21877,21876,21872);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2179700,2179701,2187700,2187200,2187201);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(21797,0,0,0,19,0,100,0,10645,0,0,0,0,80,2179700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Quest ''Teron Gorefiend, I am...'' Accepted - Call Timed Action List'),
(21797,0,1,0,19,0,100,0,10639,0,0,0,0,80,2179700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Quest ''Teron Gorefiend, I am...'' Accepted - Call Timed Action List'),
(21797,0,2,0,38,0,100,0,1,1,0,0,0,80,2179701,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Data Set 1 1 - Call Timed Action List'),
(21797,0,3,0,40,0,100,0,3,21867,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On WP 3 Reached - Force Despawn'),
(21797,0,4,5,6,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,19,21872,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Death - Set Data 2 2 (The Voice of Gorefiend)'),
(21797,0,5,6,61,0,100,0,0,0,0,0,0,28,37782,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - Linked - Remove Aura ''Disembodied Spirit'' (Stored Target 1)'),
(21797,0,6,0,61,0,100,0,0,0,0,0,0,28,37748,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - Linked - Remove Aura ''Teron Gorefiend'' (Stored Target 1)'),
(21797,0,7,8,17,0,100,0,21877,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Summoned Unit ''Karsius the Ancient Watcher'' - Send Target 1 (Invoker)'),
(21797,0,8,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - Linked - Set Data 1 1 (Invoker)'),

(2179700,9,0,0,0,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'''),
(2179700,9,1,0,0,0,100,0,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Remove NPC Flags'),
(2179700,9,2,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Store Target 1 (Invoker)'),
(2179700,9,3,0,0,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,19,21872,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Send Target 1 (The Voice of Gorefiend)'),
(2179700,9,4,0,0,0,100,0,1400,1400,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Set Orientation (Stored Target 1)'),
(2179700,9,5,0,0,0,100,0,2000,2000,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Say Line 0'),
(2179700,9,6,0,0,0,100,0,4000,4000,0,0,0,36,21867,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Update Template ''Teron Gorefiend'''),
(2179700,9,7,0,0,0,100,0,1000,1000,0,0,0,75,37782,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Add Aura ''Disembodied Spirit'' (Stored Target 1)'),
(2179700,9,8,0,0,0,100,0,0,0,0,0,0,85,37769,2,0,0,0,0,12,1,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Invoker Cast ''Teron Gorefiend'' (Stored Target 1)'),
(2179700,9,9,0,0,0,100,0,0,0,0,0,0,11,37789,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Cast ''Teron Freed'''),
(2179700,9,10,0,0,0,100,0,0,0,0,0,0,41,300000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Force Despawn'),
(2179700,9,11,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Set Active On'),
(2179700,9,12,0,0,0,100,0,2000,2000,0,0,0,12,21877,3,300000,0,0,0,8,0,0,0,0,-4535.79,1029.28,8.83636,3.78736,'Ancient Shadowmoon Spirit - On Script - Summon Creature ''Karsius the Ancient Watcher'''),
(2179700,9,13,0,0,0,100,0,9000,9000,0,0,0,45,3,3,0,0,0,0,19,21872,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Set Data 3 3 (The Voice of Gorefiend)'),

(2179701,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Set Active On'),
(2179701,9,1,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Evade'),
(2179701,9,2,0,0,0,100,0,3000,3000,0,0,0,43,0,10720,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Mount Model ID 10720'),
(2179701,9,3,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Say Line 0'),
(2179701,9,4,0,0,0,100,0,3000,3000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Say Line 1'),
(2179701,9,5,0,0,0,100,0,5000,5000,0,0,0,75,47600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Add Aura ''Speed Burst'''),
(2179701,9,6,0,0,0,100,0,0,0,0,0,0,53,1,21867,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Shadowmoon Spirit - On Script - Start WP Movement'),

(21877,0,0,0,11,0,100,0,0,0,0,0,0,80,2187700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karsius the Ancient Watcher - On Respawn - Call Timed Action List'),
(21877,0,1,0,4,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,11,21876,100,0,0,0,0,0,0,'Karsius the Ancient Watcher - On Aggro - Set Data 1 1 (Chain of Shadows)'),
(21877,0,2,0,6,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,21872,0,0,0,0,0,0,0,'Karsius the Ancient Watcher - On Just Died - Set Data 1 1 (The Voice of Gorefiend)'),
(21877,0,3,0,38,0,100,0,1,1,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Karsius the Ancient Watcher - On Data Set 1 1 - Say Line 0'),

(2187700,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karsius the Ancient Watcher - On Script - Set Active On'),
(2187700,9,1,0,0,0,100,0,0,0,0,0,0,17,333,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karsius the Ancient Watcher - On Script - Set Emote State ''STATE_READY1H'''),
(2187700,9,2,0,0,0,100,0,3000,3000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karsius the Ancient Watcher - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2187700,9,3,0,0,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,19,21867,0,0,0,0,0,0,0,'Karsius the Ancient Watcher - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'' (Teron Gorefiend)'),

(21876,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chain of Shadows - On Respawn - Set Active On'),
(21876,0,1,2,61,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chain of Shadows - Linked - Disable Event Phase Reset'),
(21876,0,2,0,61,0,100,0,0,0,0,0,0,11,37761,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chain of Shadows - Linked - Cast ''Ancient Draenei Warden'''),
(21876,0,3,0,60,1,50,0,8000,21000,8000,21000,0,11,37784,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chain of Shadows - On Update (Event Phase 1) - Cast ''Enforced Submission'''),
(21876,0,4,5,38,0,100,0,1,1,0,0,0,11,37784,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chain of Shadows - On Data Set 1 1 - Cast ''Enforced Submission'''),
(21876,0,5,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chain of Shadows - Linked - Set Event Phase 1'),

(21872,0,0,0,38,0,100,0,1,1,0,0,0,80,2187200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Voice of Gorefiend - On Data Set 1 1 - Call Timed Action List'),
(21872,0,1,0,38,0,100,0,2,2,0,0,0,80,2187201,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Voice of Gorefiend - On Data Set 2 2 - Call Timed Action List'),
(21872,0,2,0,38,0,100,0,3,3,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'The Voice of Gorefiend - On Data Set 3 3 - Say Line 0'),

(2187200,9,0,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,19,21877,0,1,0,0,0,0,0,'The Voice of Gorefiend - On Script - Say Line 1 (Karsius the Ancient Watcher)'),
(2187200,9,1,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,11,21876,100,0,0,0,0,0,0,'The Voice of Gorefiend - On Script - Force Despawn (Chain of Shadows)'),
(2187200,9,2,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,21867,0,0,0,0,0,0,0,'The Voice of Gorefiend - On Script - Set Data 1 1 (Teron Gorefiend)'),
(2187200,9,3,0,0,0,100,0,0,0,0,0,0,28,37782,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'The Voice of Gorefiend - On Script - Remove Aura ''Disembodied Spirit'' (Stored Target 1)'),
(2187200,9,4,0,0,0,100,0,0,0,0,0,0,28,37748,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'The Voice of Gorefiend - On Script - Remove Aura ''Teron Gorefiend'' (Stored Target 1)'),
(2187200,9,5,0,0,0,100,0,0,0,0,0,0,28,37748,0,0,0,0,0,19,21867,0,0,0,0,0,0,0,'The Voice of Gorefiend - On Script - Remove Aura ''Teron Gorefiend'' (Teron Gorefiend)'),
(2187200,9,6,0,0,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,11,21877,100,0,0,0,0,0,0,'The Voice of Gorefiend - On Script - Force Despawn (Karsius the Ancient Watcher)'),

(2187201,9,0,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,19,21877,0,0,0,0,0,0,0,'The Voice of Gorefiend - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'' (Karsius the Ancient Watcher)'),
(2187201,9,1,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,19,21877,0,0,0,0,0,0,0,'The Voice of Gorefiend - On Script - Say Line 2 (Karsius the Ancient Watcher)'),
(2187201,9,2,0,0,0,100,0,0,0,0,0,0,41,1200,0,0,0,0,0,11,21876,100,0,0,0,0,0,0,'The Voice of Gorefiend - On Script - Force Despawn (Chain of Shadows)'),
(2187201,9,3,0,0,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,11,21797,100,0,0,0,0,0,0,'The Voice of Gorefiend - On Script - Force Despawn (Ancient Shadowmoon Spirit)'),
(2187201,9,4,0,0,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,11,21867,100,0,0,0,0,0,0,'The Voice of Gorefiend - On Script - Force Despawn (Teron Gorefiend)'),
(2187201,9,5,0,0,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,11,21877,100,0,0,0,0,0,0,'The Voice of Gorefiend - On Script - Force Despawn (Karsius the Ancient Watcher)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 21867;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` IN (10634,10635,10636,10645,10639);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(19,0,10634,0,0,47,0,10644,64,0,0,0,0,'Quest ''Divination: Gorefiend''s Armor'' - Group 0: Can accept the quest only if quest ''Teron Gorefiend - Lore and Legend (Alliance)'' is rewarded'),
(19,0,10634,0,1,47,0,10633,64,0,0,0,0,'Quest ''Divination: Gorefiend''s Armor'' - Group 1: Can accept the quest only if quest ''Teron Gorefiend - Lore and Legend (Horde)'' is rewarded'),
(20,0,10634,0,0,47,0,10644,64,0,0,0,0,'Quest ''Divination: Gorefiend''s Armor'' - Group 0: Show quest mark only if quest ''Teron Gorefiend - Lore and Legend (Alliance)'' is rewarded'),
(20,0,10634,0,1,47,0,10633,64,0,0,0,0,'Quest ''Divination: Gorefiend''s Armor'' - Group 1: Show quest mark only if quest ''Teron Gorefiend - Lore and Legend (Horde)'' is rewarded'),

(19,0,10635,0,0,47,0,10644,64,0,0,0,0,'Quest ''Divination: Gorefiend''s Cloak'' - Group 0: Can accept the quest only if quest ''Teron Gorefiend - Lore and Legend (Alliance)'' is rewarded'),
(19,0,10635,0,1,47,0,10633,64,0,0,0,0,'Quest ''Divination: Gorefiend''s Cloak'' - Group 1: Can accept the quest only if quest ''Teron Gorefiend - Lore and Legend (Horde)'' is rewarded'),
(20,0,10635,0,0,47,0,10644,64,0,0,0,0,'Quest ''Divination: Gorefiend''s Cloak'' - Group 0: Show quest mark only if quest ''Teron Gorefiend - Lore and Legend (Alliance)'' is rewarded'),
(20,0,10635,0,1,47,0,10633,64,0,0,0,0,'Quest ''Divination: Gorefiend''s Cloak'' - Group 1: Show quest mark only if quest ''Teron Gorefiend - Lore and Legend (Horde)'' is rewarded'),

(19,0,10636,0,0,47,0,10644,64,0,0,0,0,'Quest ''Divination: Gorefiend''s Truncheon'' - Group 0: Can accept the quest only if quest ''Teron Gorefiend - Lore and Legend (Alliance)'' is rewarded'),
(19,0,10636,0,1,47,0,10633,64,0,0,0,0,'Quest ''Divination: Gorefiend''s Truncheon'' - Group 1: Can accept the quest only if quest ''Teron Gorefiend - Lore and Legend (Horde)'' is rewarded'),
(20,0,10636,0,0,47,0,10644,64,0,0,0,0,'Quest ''Divination: Gorefiend''s Truncheon'' - Group 0: Show quest mark only if quest ''Teron Gorefiend - Lore and Legend (Alliance)'' is rewarded'),
(20,0,10636,0,1,47,0,10633,64,0,0,0,0,'Quest ''Divination: Gorefiend''s Truncheon'' - Group 1: Show quest mark only if quest ''Teron Gorefiend - Lore and Legend (Horde)'' is rewarded'),

(19,0,10645,0,0,47,0,10634,64,0,0,0,0,'Quest ''Teron Gorefiend, I am... (Alliance)'' - Group 0: Can accept the quest only if quest ''Divination: Gorefiend''s Armor'' is rewarded'),
(19,0,10645,0,0,47,0,10635,64,0,0,0,0,'Quest ''Teron Gorefiend, I am... (Alliance)'' - Group 0: Can accept the quest only if quest ''Divination: Gorefiend''s Cloak'' is rewarded'),
(19,0,10645,0,0,47,0,10636,64,0,0,0,0,'Quest ''Teron Gorefiend, I am... (Alliance)'' - Group 0: Can accept the quest only if quest ''Divination: Gorefiend''s Truncheon'' is rewarded'),
(20,0,10645,0,0,47,0,10634,64,0,0,0,0,'Quest ''Teron Gorefiend, I am... (Alliance)'' - Group 0: Show quest mark only if quest ''Divination: Gorefiend''s Armor'' is rewarded'),
(20,0,10645,0,0,47,0,10635,64,0,0,0,0,'Quest ''Teron Gorefiend, I am... (Alliance)'' - Group 0: Show quest mark only if quest ''Divination: Gorefiend''s Cloak'' is rewarded'),
(20,0,10645,0,0,47,0,10636,64,0,0,0,0,'Quest ''Teron Gorefiend, I am... (Alliance)'' - Group 0: Show quest mark only if quest ''Divination: Gorefiend''s Truncheon'' is rewarded'),

(19,0,10639,0,0,47,0,10634,64,0,0,0,0,'Quest ''Teron Gorefiend, I am... (Horde)'' - Group 0: Can accept the quest only if quest ''Divination: Gorefiend''s Armor'' is rewarded'),
(19,0,10639,0,0,47,0,10635,64,0,0,0,0,'Quest ''Teron Gorefiend, I am... (Horde)'' - Group 0: Can accept the quest only if quest ''Divination: Gorefiend''s Cloak'' is rewarded'),
(19,0,10639,0,0,47,0,10636,64,0,0,0,0,'Quest ''Teron Gorefiend, I am... (Horde)'' - Group 0: Can accept the quest only if quest ''Divination: Gorefiend''s Truncheon'' is rewarded'),
(20,0,10639,0,0,47,0,10634,64,0,0,0,0,'Quest ''Teron Gorefiend, I am... (Horde)'' - Group 0: Show quest mark only if quest ''Divination: Gorefiend''s Armor'' is rewarded'),
(20,0,10639,0,0,47,0,10635,64,0,0,0,0,'Quest ''Teron Gorefiend, I am... (Horde)'' - Group 0: Show quest mark only if quest ''Divination: Gorefiend''s Cloak'' is rewarded'),
(20,0,10639,0,0,47,0,10636,64,0,0,0,0,'Quest ''Teron Gorefiend, I am... (Horde)'' - Group 0: Show quest mark only if quest ''Divination: Gorefiend''s Truncheon'' is rewarded');
