UPDATE `creature_template_addon` SET `emote` = 0 WHERE `entry` = 18671;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (18303,18671) AND `id` = 1;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1833700;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1833700,9,0,0,0,0,100,0,0,0,0,0,0,11,32976,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Priest Kath''mar - On Script - Cast Cinematic - Mind Control'),
(1833700,9,1,0,0,0,100,0,30000,30000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Priest Kath''mar - On Script - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 32976;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,32976,0,0,31,0,3,18303,0,0,0,0,'Spell ''Cinematic - Mind Control'' - Group 0: Implicit target creature ''Lyria Skystrider'''),
(13,1,32976,0,1,31,0,3,18671,0,0,0,0,'Spell ''Cinematic - Mind Control'' - Group 1: Implicit target creature ''Priest Ennas''');
