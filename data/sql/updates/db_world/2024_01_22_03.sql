UPDATE `creature_template` SET `AIName` = '' WHERE `entry` IN (32365,34735,30641,39371,39372,40681);
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` IN (38334,38335,38336,38337,38338,38339);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (34735,30641,40681);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 34735 AND `SourceId` = 0;
