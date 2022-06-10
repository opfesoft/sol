DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 9678; -- Not needed anymore, handled via creature script

DELETE FROM `spell_script_names` WHERE `spell_id` = 51469;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
(51469,'spell_q12573_frenzyhearts_fury');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 51469; -- Not needed anymore, handled via spell script
