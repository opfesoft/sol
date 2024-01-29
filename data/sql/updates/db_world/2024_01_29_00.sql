DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 48268;

UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 256 | 512 | 33554432, `AIName` = 'SmartAI' WHERE `entry` = 27276;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (27276,-102199,27203);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 27202 AND `id` > 6;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (27206,27207) AND `id` > 0;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 27211 AND `id` > 1;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2727600;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27276,0,0,1,54,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Let Them Not Rise! Rat - On Just Summoned - Store Target 1 (Invoker)'),
(27276,0,1,0,61,0,100,0,0,0,0,0,0,69,1,0,0,1,0,0,12,1,0,0,0,0,0,0,0.0001,'Let Them Not Rise! Rat - Linked - Move To Point 1 (Stored Target 1)'),
(27276,0,2,0,34,0,100,0,8,1,0,0,0,80,2727600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Let Them Not Rise! Rat - Point 1 Reached - Call Timed Action List'),

(2727600,9,0,0,0,0,100,0,0,0,0,0,0,17,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Let Them Not Rise! Rat - On Script - Set Emote State ''ONESHOT_ATTACKUNARMED'''),
(2727600,9,1,0,0,0,100,0,0,0,0,0,0,75,49852,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Let Them Not Rise! Rat - On Script - Add Aura ''Bloody Explosion'' (Stored Target 1)'),
(2727600,9,2,0,0,0,100,0,5000,5000,0,0,0,3,0,9786,0,0,0,0,12,1,0,0,0,0,0,0,0,'Let Them Not Rise! Rat - On Script - Morph Model ''Skeleton'' (Stored Target 1)'),
(2727600,9,3,0,0,0,100,0,0,0,0,0,0,28,49852,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Let Them Not Rise! Rat - On Script - Remove Aura ''Bloody Explosion'' (Stored Target 1)'),
(2727600,9,4,0,0,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Let Them Not Rise! Rat - On Script - Set Emote State ''ONESHOT_NONE'''),

(27203,0,0,0,4,0,30,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Footman - On Aggro - Say Line 0'),
(27203,0,1,0,11,0,100,0,0,0,0,0,0,71,0,0,12944,12932,2551,0,1,0,0,0,0,0,0,0,0,'Onslaught Footman - On Respawn - Equip Items'),
(27203,0,2,0,1,0,100,0,4000,8000,4000,8000,0,125,1,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Footman - OOC - Trigger Random Ranged Timed Event'),
(27203,0,3,0,59,0,100,0,1,0,0,0,0,11,45425,0,0,0,0,0,10,103612,27222,0,0,0,0,0,0,'Onslaught Footman - On Timed Event 1 Triggered - Cast ''Shoot'''),
(27203,0,4,0,59,0,100,0,2,0,0,0,0,11,45425,0,0,0,0,0,10,103768,27223,0,0,0,0,0,0,'Onslaught Footman - On Timed Event 2 Triggered - Cast ''Shoot'''),
(27203,0,5,6,8,0,100,0,48268,0,0,0,0,11,48272,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Footman - On Spellhit ''Container of Rats'' - Cast ''Let Them Not Rise!: Summon Rat'''),
(27203,0,6,0,61,0,100,0,0,0,0,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Footman - Linked - Set ''UNIT_FLAG_NOT_SELECTABLE'''),
(27203,0,7,0,11,0,100,0,0,0,0,0,0,19,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Footman - On Respawn - Remove ''UNIT_FLAG_NOT_SELECTABLE'''),

(27202,0,7,8,8,0,100,0,48268,0,0,0,0,11,48272,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Raven Priest - On Spellhit ''Container of Rats'' - Cast ''Let Them Not Rise!: Summon Rat'''),
(27202,0,8,0,61,0,100,0,0,0,0,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Raven Priest - Linked - Set ''UNIT_FLAG_NOT_SELECTABLE'''),
(27202,0,9,0,11,0,100,0,0,0,0,0,0,19,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Raven Priest - On Respawn - Remove ''UNIT_FLAG_NOT_SELECTABLE'''),

(27206,0,1,2,8,0,100,0,48268,0,0,0,0,11,48272,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Knight - On Spellhit ''Container of Rats'' - Cast ''Let Them Not Rise!: Summon Rat'''),
(27206,0,2,0,61,0,100,0,0,0,0,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Knight - Linked - Set ''UNIT_FLAG_NOT_SELECTABLE'''),
(27206,0,3,0,11,0,100,0,0,0,0,0,0,19,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Knight - On Respawn - Remove ''UNIT_FLAG_NOT_SELECTABLE'''),

(27207,0,1,2,8,0,100,0,48268,0,0,0,0,11,48272,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Workman - On Spellhit ''Container of Rats'' - Cast ''Let Them Not Rise!: Summon Rat'''),
(27207,0,2,0,61,0,100,0,0,0,0,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Workman - Linked - Set ''UNIT_FLAG_NOT_SELECTABLE'''),
(27207,0,3,0,11,0,100,0,0,0,0,0,0,19,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Workman - On Respawn - Remove ''UNIT_FLAG_NOT_SELECTABLE'''),

(27211,0,2,3,8,0,100,0,48268,0,0,0,0,11,48272,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Executioner - On Spellhit ''Container of Rats'' - Cast ''Let Them Not Rise!: Summon Rat'''),
(27211,0,3,0,61,0,100,0,0,0,0,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Executioner - Linked - Set ''UNIT_FLAG_NOT_SELECTABLE'''),
(27211,0,4,0,11,0,100,0,0,0,0,0,0,19,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Executioner - On Respawn - Remove ''UNIT_FLAG_NOT_SELECTABLE''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 27203;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,2,27203,0,0,31,1,3,0,102199,0,0,0,'Creature ''Onslaught Footman'' - Group 0: Execute SAI ID 1 if has GUID 102199'),
(22,3,27203,0,0,31,1,3,0,102199,0,0,0,'Creature ''Onslaught Footman'' - Group 0: Execute SAI ID 2 if has GUID 102199');

UPDATE `waypoint_data` SET `orientation` = 1.83768, `delay` = 10000 WHERE `id` = 1022130 AND `point` = 5;
