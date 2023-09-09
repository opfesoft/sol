UPDATE `creature_template` SET `unit_flags` = `unit_flags` & ~768, `flags_extra` = `flags_extra` & ~2 WHERE `entry` = 22441;

UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 74471;
UPDATE `creature` SET `position_z` = -11.8803 WHERE `guid` = 76746;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (-76742,22441,21242);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2244100,2244101);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-76742,0,0,0,38,0,100,0,1,1,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Auchenai Death-Spirit - On Data Set 1 1 - Set Event Phase 1'),
(-76742,0,1,0,38,0,100,0,2,2,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Auchenai Death-Spirit - On Data Set 2 2 - Set Event Phase 2'),
(-76742,0,2,0,60,1,100,0,400,6000,4000,8000,0,11,38155,2,1,0,0,0,11,21967,100,0,0,0,0,0,0,'Auchenai Death-Spirit - On Update (Event Phase 1) - Cast ''Strength of Death'' (Random Auchenai Death-Spirit)'),
(-76742,0,3,0,8,0,100,0,39259,0,0,0,0,45,1,1,0,0,0,0,10,247237,22441,1,0,0,0,0,0,'Auchenai Death-Spirit - On Spell Hit ''Quest - Dustin''s Undead Dragon Visual aura'' - Set Data 1 1 (Teribus the Cursed)'),

(22441,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - On Respawn - Disable Event Phase Reset'),
(22441,0,1,2,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - Linked - Set Event Phase 1'),
(22441,0,2,3,61,0,100,0,0,0,0,0,0,60,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - Linked - Set Fly On'),
(22441,0,3,0,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(22441,0,4,5,38,1,100,0,1,1,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - On Data Set 1 1 (Event Phase 1) - Set Active On'),
(22441,0,5,6,61,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,8,0,0,0,0,0,0,0,0,'Teribus the Cursed - Linked - Set Event Phase 2'),
(22441,0,6,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,-3398.96,4466.33,-11.18,0,'Teribus the Cursed - Linked - Move To Point 1'),
(22441,0,7,0,34,0,100,0,8,1,0,0,0,80,2244100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - On Point 1 Reached - Call Timed Action List'),
(22441,0,8,0,1,2,100,0,60000,60000,0,0,0,80,2244101,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - OOC (Event Phase 2) - Call Timed Action List'),
(22441,0,9,10,34,0,100,0,8,2,0,0,0,101,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - On Point 2 Reached - Reset Home Position'),
(22441,0,10,11,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - Linked - Set Event Phase 1'),
(22441,0,11,12,61,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - Linked - Set Active Off'),
(22441,0,12,0,61,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - Linked - Evade'),

(2244100,9,0,0,0,0,100,0,0,0,0,0,0,5,293,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - On Script - Play Emote ''ONESHOT_LAND'''),
(2244100,9,1,0,0,0,100,0,0,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - On Script - Set Fly Off'),
(2244100,9,2,0,0,0,100,0,0,0,0,0,0,204,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - On Script - Set ''MOVEMENTFLAG_NONE'''),
(2244100,9,3,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - On Script - Set Home Position'),
(2244100,9,4,0,0,0,100,0,3000,3000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2244100,9,5,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,70,0,0,0,0,0,0,0,'Teribus the Cursed - On Script - Start Attack (Closest Player)'),

(2244101,9,0,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2244101,9,1,0,0,0,100,0,0,0,0,0,0,5,254,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - On Script - Play Emote ''ONESHOT_LAND'''),
(2244101,9,2,0,0,0,100,0,3000,3000,0,0,0,60,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - On Script - Set Fly On'),
(2244101,9,3,0,0,0,100,0,0,0,0,0,0,204,1024,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Teribus the Cursed - On Script - Set ''MOVEMENTFLAG_DISABLE_GRAVITY'''),
(2244101,9,4,0,0,0,100,0,0,0,0,0,0,69,2,0,0,0,0,0,8,0,0,0,0,-3400.86,4665.3,99.6544,0,'Teribus the Cursed - On Script - Move To Point 2'),

(21242,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,13787,33,0,0,0,0,1,0,0,0,0,0,0,0,0,'Auchenai Death-Speaker - OOC - Cast ''Demon Armor'''),
(21242,0,1,0,0,0,100,0,1000,2400,2400,3800,0,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Auchenai Death-Speaker - IC - Cast ''Shadow Bolt'''),
(21242,0,2,0,0,0,100,0,3000,5000,35000,40000,0,11,18267,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Auchenai Death-Speaker - IC - Cast ''Curse of Weakness'''),
(21242,0,3,0,2,0,100,0,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Auchenai Death-Speaker - Between 0-15% Health - Flee For Assist'),
(21242,0,4,0,1,0,100,0,5000,5000,5000,5000,0,11,38159,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Auchenai Death-Speaker - OOC - Cast ''Auchanei Channeling (no duration)'' (CONDITION_OBJECT_ENTRY_GUID)'),
(21242,0,5,0,1,0,100,0,5000,5000,5000,5000,0,45,1,1,0,0,0,0,10,76742,21967,0,0,0,0,0,0,'Auchenai Death-Speaker - OOC - Set Data 1 1 (Auchenai Death-Spirit) (CONDITION_OBJECT_ENTRY_GUID)'),
(21242,0,6,0,4,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,10,76742,21967,0,0,0,0,0,0,'Auchenai Death-Speaker - On Aggro - Set Data 2 2 (Auchenai Death-Spirit) (CONDITION_OBJECT_ENTRY_GUID)'),
(21242,0,7,0,6,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,10,76742,21967,0,0,0,0,0,0,'Auchenai Death-Speaker - On Death - Set Data 2 2 (Auchenai Death-Spirit) (CONDITION_OBJECT_ENTRY_GUID)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 21242;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,5,21242,0,0,31,1,3,0,74465,0,0,0,'Creature ''Auchenai Death-Speaker'' - Group 0: Execute SAI ID 4 if has GUID 74465'),
(22,5,21242,0,1,31,1,3,0,74466,0,0,0,'Creature ''Auchenai Death-Speaker'' - Group 1: Execute SAI ID 4 if has GUID 74466'),
(22,5,21242,0,2,31,1,3,0,74467,0,0,0,'Creature ''Auchenai Death-Speaker'' - Group 2: Execute SAI ID 4 if has GUID 74467'),
(22,5,21242,0,3,31,1,3,0,74468,0,0,0,'Creature ''Auchenai Death-Speaker'' - Group 3: Execute SAI ID 4 if has GUID 74468'),

(22,6,21242,0,0,31,1,3,0,74465,0,0,0,'Creature ''Auchenai Death-Speaker'' - Group 0: Execute SAI ID 5 if has GUID 74465'),
(22,6,21242,0,1,31,1,3,0,74466,0,0,0,'Creature ''Auchenai Death-Speaker'' - Group 1: Execute SAI ID 5 if has GUID 74466'),
(22,6,21242,0,2,31,1,3,0,74467,0,0,0,'Creature ''Auchenai Death-Speaker'' - Group 2: Execute SAI ID 5 if has GUID 74467'),
(22,6,21242,0,3,31,1,3,0,74468,0,0,0,'Creature ''Auchenai Death-Speaker'' - Group 3: Execute SAI ID 5 if has GUID 74468'),

(22,7,21242,0,0,31,1,3,0,74465,0,0,0,'Creature ''Auchenai Death-Speaker'' - Group 0: Execute SAI ID 6 if has GUID 74465'),
(22,7,21242,0,1,31,1,3,0,74466,0,0,0,'Creature ''Auchenai Death-Speaker'' - Group 1: Execute SAI ID 6 if has GUID 74466'),
(22,7,21242,0,2,31,1,3,0,74467,0,0,0,'Creature ''Auchenai Death-Speaker'' - Group 2: Execute SAI ID 6 if has GUID 74467'),
(22,7,21242,0,3,31,1,3,0,74468,0,0,0,'Creature ''Auchenai Death-Speaker'' - Group 3: Execute SAI ID 6 if has GUID 74468'),

(22,8,21242,0,0,31,1,3,0,74465,0,0,0,'Creature ''Auchenai Death-Speaker'' - Group 0: Execute SAI ID 7 if has GUID 74465'),
(22,8,21242,0,1,31,1,3,0,74466,0,0,0,'Creature ''Auchenai Death-Speaker'' - Group 1: Execute SAI ID 7 if has GUID 74466'),
(22,8,21242,0,2,31,1,3,0,74467,0,0,0,'Creature ''Auchenai Death-Speaker'' - Group 2: Execute SAI ID 7 if has GUID 74467'),
(22,8,21242,0,3,31,1,3,0,74468,0,0,0,'Creature ''Auchenai Death-Speaker'' - Group 3: Execute SAI ID 7 if has GUID 74468');
