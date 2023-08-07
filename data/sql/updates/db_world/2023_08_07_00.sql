UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` IN (181579,181580,181581);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (181579,181580,181581);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16927 AND `id` > 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(181579,1,0,0,70,0,100,0,2,0,0,0,0,45,1,1,0,0,0,0,11,16927,70,1,0,0,0,0,0,'Southern Beacon - On GO State Changed ''GO_ACTIVATED'' - Set Data 1 1 (Stonescythe Whelp)'),
(181580,1,0,0,70,0,100,0,2,0,0,0,0,45,1,1,0,0,0,0,11,16927,70,1,0,0,0,0,0,'Central Beacon - On GO State Changed ''GO_ACTIVATED'' - Set Data 1 1 (Stonescythe Whelp)'),
(181581,1,0,0,70,0,100,0,2,0,0,0,0,45,1,1,0,0,0,0,11,16927,70,1,0,0,0,0,0,'Western Beacon - On GO State Changed ''GO_ACTIVATED'' - Set Data 1 1 (Stonescythe Whelp)'),

(16927,0,2,3,38,0,100,0,1,1,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Stonescythe Whelp - On Data Set 1 1 - Store Target 1 (Invoker)'),
(16927,0,3,0,61,0,100,0,0,0,0,0,0,73,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stonescythe Whelp - Linked - Trigger Timed Event 1'),
(16927,0,4,0,59,0,50,0,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stonescythe Whelp - On Timed Event 1 Triggered - Set Event Phase 1'),
(16927,0,5,0,1,1,100,0,5000,5000,5000,5000,0,69,1,0,0,4,0,0,12,1,0,0,0,0,0,0,0,'Stonescythe Whelp - OOC (Event Phase 1) - Move To Point 1 (Stored Target 1)'),
(16927,0,6,0,34,0,100,0,8,1,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stonescythe Whelp - On Point 1 Reached - Set Event Phase 2'),
(16927,0,7,0,1,2,100,0,5000,5000,5000,5000,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stonescythe Whelp - OOC (Event Phase 2) - Evade'),
(16927,0,8,0,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stonescythe Whelp - Linked - Set Event Phase 0');
