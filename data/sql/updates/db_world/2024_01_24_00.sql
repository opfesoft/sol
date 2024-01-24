UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (37579,37578,37577,37576,37575,37572,18342,25863,33011);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (37826,37827,37857,37881,37893,37952,37976,38001,8889);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 201937;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (3785700,3789300,3795200,3795201);
DELETE FROM `waypoints` WHERE `entry` IN (37857,37952);
