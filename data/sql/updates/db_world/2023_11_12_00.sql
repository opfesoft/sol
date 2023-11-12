UPDATE `smart_scripts` SET `event_type` = 0 WHERE `source_type` = 0 AND `entryorguid` = 2319 AND `id` = 2;
UPDATE `smart_scripts` SET `event_type` = 0 WHERE `source_type` = 0 AND `entryorguid` = 7734 AND `id` = 0;
UPDATE `smart_scripts` SET `event_type` = 0 WHERE `source_type` = 0 AND `entryorguid` = 18995 AND `id` IN (3,4);
UPDATE `smart_scripts` SET `event_type` = 0 WHERE `source_type` = 0 AND `entryorguid` = 25226 AND `id` = 1;
UPDATE `smart_scripts` SET `event_type` = 0 WHERE `source_type` = 0 AND `entryorguid` = 27615 AND `id` = 4;
UPDATE `smart_scripts` SET `event_type` = 0 WHERE `source_type` = 0 AND `entryorguid` = 29851 AND `id` = 9;
UPDATE `smart_scripts` SET `event_type` = 0 WHERE `source_type` = 0 AND `entryorguid` = 30725 AND `id` = 1;
UPDATE `smart_scripts` SET `event_type` = 0 WHERE `source_type` = 0 AND `entryorguid` = 28105 AND `id` = 11;

DELETE FROM `creature_text` WHERE `CreatureId` = 29489 AND `GroupID` = 1;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 29489;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(29489,0,0,0,9,0,100,0,8,25,8000,12000,0,11,27577,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Captain Welsington - Within 8-25 Range - Cast ''Intercept'''),
(29489,0,1,0,0,0,100,0,3000,7000,5000,10000,0,11,16856,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Captain Welsington - IC - Cast ''Mortal Strike'''),
(29489,0,2,0,6,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Welsington - On Death - Say Line 0');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 29489 AND `SourceGroup` = 1;
UPDATE `conditions` SET `SourceGroup` = 3 WHERE `SourceTypeOrReferenceId` = 22 AND `SourceGroup` = 2 AND `SourceEntry` = 29489;
