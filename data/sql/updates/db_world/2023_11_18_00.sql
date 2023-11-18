UPDATE `broadcast_text` SET `MaleText` = `FemaleText` WHERE `ID` IN (13591,13610);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (17226,17230);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1722600,1722601);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17226,0,0,0,20,0,100,0,9483,0,0,0,0,80,1722600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Viera Sunwhisper - On Quest ''Life''s Finer Pleasures'' Rewarded - Call Timed Action List'),
(17226,0,1,2,40,0,100,0,10,17226,0,0,0,54,1000000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Viera Sunwhisper - On WP 10 Reached - Pause WP Movement'),
(17226,0,2,3,61,0,100,0,0,0,0,0,0,66,1,0,0,0,0,0,11,17230,15,0,0,0,0,0,0,'Viera Sunwhisper - Linked - Set Orientation (Twinkle)'),
(17226,0,3,4,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Viera Sunwhisper - Linked - Say Line 1'),
(17226,0,4,0,61,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Viera Sunwhisper - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(17226,0,5,0,8,0,100,0,30077,0,0,0,0,80,1722601,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Viera Sunwhisper - On Spellhit ''Carinda''s Retribution'' - Call Timed Action List'),
(17226,0,6,0,40,0,100,0,4,172260,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Viera Sunwhisper - On WP 4 Reached - Force Despawn'),

(1722600,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Viera Sunwhisper - On Script - Set Active On'),
(1722600,9,1,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Viera Sunwhisper - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1722600,9,2,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Viera Sunwhisper - On Script - Remove NPC Flags'),
(1722600,9,3,0,0,0,100,0,2000,2000,0,0,0,53,0,17226,0,0,0,0,1,0,0,0,0,0,0,0,0,'Viera Sunwhisper - On Script - Start WP Movement'),
(1722600,9,4,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Viera Sunwhisper - On Script - Say Line 0'),
(1722600,9,5,0,0,0,100,0,0,0,0,0,0,91,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Viera Sunwhisper - On Script - Remove ''UNIT_STAND_STATE_SIT'''),
(1722600,9,6,0,0,0,100,0,6500,6500,0,0,0,45,1,1,0,0,0,0,10,61963,17230,0,0,0,0,0,0,'Viera Sunwhisper - On Script - Set Data 1 1 (Twinkle)'),
(1722600,9,7,0,0,0,100,0,0,0,0,0,0,41,180000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Viera Sunwhisper - On Script - Force Despawn'),

(1722601,9,1,0,0,0,100,0,0,0,0,0,0,33,17226,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Viera Sunwhisper - On Script - Quest Credit ''Arelion''s Mistress'''),
(1722601,9,2,0,0,0,100,0,3000,3000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Viera Sunwhisper - On Script - Say Line 2'),
(1722601,9,3,0,0,0,100,0,5000,5000,0,0,0,1,0,0,0,0,0,0,10,61963,17230,0,0,0,0,0,0,'Viera Sunwhisper - On Script - Say Line 0 (Twinkle)'),
(1722601,9,4,0,0,0,100,0,2000,2000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Viera Sunwhisper - On Script - Say Line 3'),
(1722601,9,5,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,10,61963,17230,0,0,0,0,0,0,'Viera Sunwhisper - On Script - Set Data 2 2 (Twinkle)'),
(1722601,9,6,0,0,0,100,0,0,0,0,0,0,53,1,172260,0,0,0,0,1,0,0,0,0,0,0,0,0,'Viera Sunwhisper - On Script - Start WP Movement'),
(1722601,9,7,0,0,0,100,0,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Viera Sunwhisper - On Script - Force Despawn'),

(17230,0,0,1,38,0,100,0,1,1,0,0,0,53,1,17230,0,0,0,0,1,0,0,0,0,0,0,0,0,'Twinkle - On Data Set 1 1 - Start WP Movement'),
(17230,0,1,2,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Twinkle - Linked - Set Active On'),
(17230,0,2,0,61,0,100,0,0,0,0,0,0,41,180000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Twinkle - Linked - Force Despawn'),
(17230,0,3,0,40,0,100,0,13,17230,0,0,0,54,1000000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Twinkle - On WP 13 Reached - Pause WP Movement'),
(17230,0,4,5,38,0,100,0,2,2,0,0,0,53,1,172300,0,0,0,0,1,0,0,0,0,0,0,0,0,'Twinkle - On Data Set 2 2 - Start WP Movement'),
(17230,0,5,0,61,0,100,0,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Twinkle - Linked - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 30077;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(17,0,30077,0,0,31,1,3,17226,0,0,0,0,'Spell ''Carinda''s Retribution'' - Group 0: Can cast if target is creature ''Viera Sunwhisper''');
