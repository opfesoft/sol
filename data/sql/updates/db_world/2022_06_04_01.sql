DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 43351;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(17,0,43351,0,0,1,0,61720,0,0,1,0,0,'Spell ''Cleansing Soul'' - Group 0: Can only cast if has no aura ''Recent Meditation''');

-- Spell "Cleansing Soul": Remove linked spell "The Cleansing: Summon Your Inner Turmoil" (handled via spell script)
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = -43351 AND `spell_effect` = 50167;

-- Your Inner Turmoil: Remove obsolete SAI (handled via creature script)
UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 27959;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 27959 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 2795900 AND `source_type` = 9;
