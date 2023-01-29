UPDATE `creature` SET `orientation` = 3.47446, `MovementType` = 0 WHERE `guid` = 67880;
UPDATE `creature` SET `orientation` = 0.332864, `MovementType` = 0 WHERE `guid` = 68273;
UPDATE `creature_addon` SET `path_id` = 0 WHERE `guid` IN (67880,68273);
DELETE FROM `waypoint_data` WHERE `id` IN (678800,682730);
DELETE FROM `waypoint_scripts` WHERE `id` IN (157,158,159,167,168,169);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 18907 AND `id` > 1;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` BETWEEN 1890700 AND 1890703;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18907,0,2,0,1,0,100,0,5000,15000,5000,15000,0,87,1890700,1890701,1890702,1890703,0,0,1,0,0,0,0,0,0,0,0,'Innkeeper Coryth Stoktron - OOC - Call Random Action List'),

(1890700,9,0,0,0,0,100,0,0,0,0,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Innkeeper Coryth Stoktron - On Script - Play Emote ''ONESHOT_TALK(DNR)'''),
(1890701,9,0,0,0,0,100,0,0,0,0,0,0,5,1,0,0,0,0,0,10,68273,18993,0,0,0,0,0,0,'Innkeeper Coryth Stoktron - On Script - Play Emote ''ONESHOT_TALK(DNR)'' (Naka)'),
(1890702,9,0,0,0,0,100,0,0,0,0,0,0,5,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Innkeeper Coryth Stoktron - On Script - Play Emote ''ONESHOT_QUESTION'''),
(1890703,9,0,0,0,0,100,0,0,0,0,0,0,5,6,0,0,0,0,0,10,68273,18993,0,0,0,0,0,0,'Innkeeper Coryth Stoktron - On Script - Play Emote ''ONESHOT_QUESTION'' (Naka)');
