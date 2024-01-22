UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 28092;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 28092;
