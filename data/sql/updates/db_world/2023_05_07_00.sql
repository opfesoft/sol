UPDATE `spell_dbc` SET `Effect1` = 28, -- SPELL_EFFECT_SUMMON
`EffectImplicitTargetA1` = 72,         -- TARGET_DEST_CASTER_RANDOM
`EffectRadiusIndex1` = 9,              -- EFFECT_RADIUS_20_YARDS
`EffectMiscValueB1` = 64               -- see SummonProperties.dbc ID 64
WHERE `ID` = 39111;

UPDATE `item_template` SET `ScriptName` = '' WHERE `entry` = 31742;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 39105;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(17,0,39105,0,0,47,0,10832,8,0,0,0,0,'Spell ''Activate Nether-wraith Beacon'' - Group 0: Can cast only if quest ''Becoming a Spellfire Tailor'' is in progress'),
(17,0,39105,0,0,29,0,22408,50,0,1,0,0,'Spell ''Activate Nether-wraith Beacon'' - Group 0: Can cast only if not nearby creature ''Furious Nether-wraith''');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 22408;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 22408;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(22408,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Furious Nether-wraith - On Just Summoned - Set Active On'),
(22408,0,1,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Furious Nether-wraith - Linked - Start Attack (Invoker)'),
(22408,0,2,0,0,0,100,0,0,0,3000,5000,0,11,39337,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Furious Nether-wraith - IC - Cast ''Arcane Bolt'''),
(22408,0,3,0,0,0,100,0,10000,15000,22000,28000,0,11,38205,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Furious Nether-wraith - IC - Cast ''Shadow Blast''');
