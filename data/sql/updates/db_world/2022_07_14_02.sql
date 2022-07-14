DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 30886;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(30886,0,0,0,25,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Subjugated Iskalder - On Reset - Set ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(30886,0,1,0,1,0,100,1,2000,2000,0,0,0,29,3,180,0,0,0,0,23,0,0,0,0,0,0,0,0,'Subjugated Iskalder - OOC - Start Follow (Owner) (No Repeat)'),
(30886,0,2,3,1,0,100,0,0,2000,2000,2000,2000,11,25729,0,0,0,0,0,23,0,0,0,1,0,0,0,0,'Subjugated Iskalder - OOC - Cast ''Find the Ancient Hero: Kill Credit'' (Owner) (CONDITION_NEAR_CREATURE)'),
(30886,0,3,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Subjugated Iskalder - Linked - Force Despawn'),
(30886,0,4,0,231,0,100,0,50,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Subjugated Iskalder - On Follow Target Lost - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 30886 AND `SourceId` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,3,30886,0,0,29,1,30232,10,0,0,0,0,'Subjugated Iskalder - Group 0: Execute SAI ID 2 only if near creature ''The Bone Witch''');
