UPDATE `gameobject_template` SET `AIName` = '' WHERE `entry` = 188422;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 188422 AND `source_type` = 1;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 18842200 AND `source_type` = 9;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 188422;
