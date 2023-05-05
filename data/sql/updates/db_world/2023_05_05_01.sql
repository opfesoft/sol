DELETE FROM `creature_text` WHERE `CreatureId` = 6492 AND `GroupID` = 2;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(6492,2,0,'%s is sucked into the coffer!',16,0,100,0,0,0,2553,0,'Rift Spawn');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 6492 AND `id` > 13;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6492,0,14,15,38,4,100,0,1,0,0,0,0,22,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - On Data Set 1 0 - Set Phase 4 (Phase 3)'),
(6492,0,15,16,61,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - Linked - Say Line 2'),
(6492,0,16,17,61,0,100,0,0,0,0,0,0,11,9010,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - Linked - Cast ''Create Filled Containment Coffer'''),
(6492,0,17,0,61,0,100,0,0,0,0,0,0,41,2500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - Linked - Force Despawn');
