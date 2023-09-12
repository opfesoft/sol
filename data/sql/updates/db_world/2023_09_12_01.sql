DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = -52010;

DELETE FROM `spell_script_names` WHERE `spell_id` IN (51966,51971,52010);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
(51966,'spell_scourge_disguise'),
(51971,'spell_scourge_disguise_instability'),
(52010,'spell_scourge_disguise_expiring');
