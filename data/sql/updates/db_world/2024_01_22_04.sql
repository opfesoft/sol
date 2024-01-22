UPDATE `creature_template` SET `AIName` = '' WHERE `entry` IN (28539,28535,28536,28540);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (28539,28535,28536,28540);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (190635,190636);
