DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_item_collect_rookery_egg';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
(15958,'spell_item_collect_rookery_egg');

UPDATE `conditions` SET `ConditionValue2` = 2, `ConditionValue3` = 1 WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 15958;
