DELETE FROM `spell_script_names` WHERE `spell_id` = 54420;

DELETE FROM `spell_scripts` WHERE `id` = 54420;
INSERT INTO `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(54420,1,0,10,29415,0,-8,7434.62,4213.5,315.326,3.896);

DELETE FROM `creature_text` WHERE `CreatureId` = 29405;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(29405,0,0,'There you go, mon. Your very own bone gryphon Now let''s talk about you takin'' it out to fight the Onslaught!',12,0,100,0,0,0,30116,0,'');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (29415,29405);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (29415,29405);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2940500;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(29415,0,0,1,54,0,100,0,0,0,0,0,0,75,57764,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captured Onslaught Gryphon - On Just Summoned - Add Aura ''Hover (Anim Override)'''),
(29415,0,1,2,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Captured Onslaught Gryphon - Linked - Force Despawn (Summoner)'),
(29415,0,2,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,11,29415,5,0,0,0,0,0,0,'Captured Onslaught Gryphon - Linked - Force Despawn (Captured Onslaught Gryphon)'),

(29405,0,0,0,20,0,100,0,12814,0,0,0,0,80,2940500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Uzo Deathcaller - On Quest ''You''ll Need a Gryphon'' Rewarded - Call Timed Action List'),

(2940500,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Uzo Deathcaller - On Script - Remove ''UNIT_NPC_FLAG_QUESTGIVER'''),
(2940500,9,1,0,0,0,100,0,5000,5000,0,0,0,11,10727,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Uzo Deathcaller - On Script - Cast ''Uzo`s Ritual of Blood'''),
(2940500,9,2,0,0,0,100,0,8300,8300,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Uzo Deathcaller - On Script - Say Line 0'),
(2940500,9,3,0,0,0,100,0,0,0,0,0,0,41,16000,0,0,0,0,0,19,29415,0,0,0,0,0,0,0,'Uzo Deathcaller - On Script - Force Despawn'),
(2940500,9,4,0,0,0,100,0,1000,1000,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Uzo Deathcaller - On Script - Add ''UNIT_NPC_FLAG_QUESTGIVER'''),
(2940500,9,5,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Uzo Deathcaller - On Script - Reset Orientation');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 10727;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,10727,0,0,31,0,3,29415,0,0,0,0,'Spell ''Uzo''s Ritual of Blood'' - Group 0: Implicit target creature ''Captured Onslaught Gryphon''');
