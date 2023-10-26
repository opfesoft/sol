UPDATE `gameobject` SET `id` = 176582, `spawntimesecs` = 180 WHERE `guid` IN (32670,32674,32679,32681,32784);

UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 176582;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 176582;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 17658200;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(176582,1,0,1,11,0,100,0,0,0,0,0,0,243,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shellfish Trap - On Respawn - Enable Loot'),
(176582,1,1,0,61,0,100,0,0,0,0,0,0,73,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shellfish Trap - Linked - Trigger Timed Event 1'),
(176582,1,2,0,59,0,30,0,1,0,0,0,0,80,17658200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shellfish Trap - On Timed Event 1 Triggered - Call Timed Action List'),
(176582,1,3,4,70,1,100,1,2,0,0,0,0,12,11562,1,10000,2,3,3,1,0,0,0,0,0,0,0,0,'Shellfish Trap - On GO State Changed ''GO_ACTIVATED'' - Summon Creature ''Drysnap Crawler'' (Event Phase 1)'),
(176582,1,4,0,61,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shellfish Trap - Linked - Despawn GO'),

(17658200,9,0,0,0,0,100,0,0,0,0,0,0,243,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shellfish Trap - On Script - Disable Loot'),
(17658200,9,1,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shellfish Trap - On Script - Set Event Phase 1');
