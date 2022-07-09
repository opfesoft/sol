DELETE FROM `smart_scripts` WHERE `entryorguid` = 29475 AND `source_type` = 0 AND `id` IN (2,3);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 29475 AND `SourceId` = 0;
