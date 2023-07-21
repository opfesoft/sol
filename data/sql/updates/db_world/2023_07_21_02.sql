UPDATE `gameobject` SET `id` = 185497, `rotation2` = 0, `rotation3` = 0, `spawntimesecs` = 120, `animprogress` = 0 WHERE `guid` IN (
100304,20940,32794,32790,100227,100311,32725,100306,100401,100402,100229,100231,100232,
100233,20868,100226,100307,100230,100400,20375,100228,20373,32765,100403,100305,20362,
20365,20371,20457,20652,20749,20752,20846,20862,20864,20870,20936,20942,20945,20947,30405,
30413,30415,30425,30427,32641,32712,32714,32721,32727,32767,32770,32788,32792,32798);
DELETE FROM `gameobject` WHERE `id` IN (185499,185500,185502);

DELETE FROM `creature_text` WHERE `CreatureId` = 23104;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(23104,0,0,'The bogblossom explodes, spraying pollen wildly.',16,0,100,0,0,0,20932,0,'Bogblossom Bunny');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 23104;
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 185497;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 23104;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 185497;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 18549700;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(185497,1,0,1,11,0,100,0,0,0,0,0,0,243,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bogblossom - On Respawn - Enable Loot'),
(185497,1,1,0,61,0,100,0,0,0,0,0,0,73,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bogblossom - Linked - Trigger Timed Event 1'),
(185497,1,2,0,59,0,20,0,1,0,0,0,0,80,18549700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bogblossom - On Timed Event 1 Triggered - Call Timed Action List'),
(185497,1,3,4,70,1,100,1,2,0,0,0,0,11,39558,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Bogblossom - On GO State Changed ''GO_ACTIVATED'' - Cast ''Bogblossom Pollen'' (Event Phase 1)'),
(185497,1,4,0,61,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bogblossom - Linked - Despawn GO'),

(18549700,9,0,0,0,0,100,0,0,0,0,0,0,243,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bogblossom - On Script - Disable Loot'),
(18549700,9,1,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bogblossom - On Script - Set Event Phase 1'),

(23104,0,0,1,54,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bogblossom Bunny - On Just Summoned - Say Line 0'),
(23104,0,1,0,61,0,100,0,0,0,0,0,0,11,40532,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bogblossom Bunny - Linked - Cast ''Bogblossom Knockback''');
